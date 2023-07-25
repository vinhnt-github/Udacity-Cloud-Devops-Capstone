pipeline {
	
	agent any

	environment {
    	DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  	}

	stages {
		
		stage("Lint HTML file") {
			steps {
				sh 'tidy -q -e ./app/*.html'
			}
		}
		stage("Run Script Permissions") {
			steps {
				sh '''
					cd ./app
					chmod +x ./build-docker.sh
					chmod +x ./upload-docker.sh
					chmod +x ./remove-docker.sh
					chmod +x ./app-deployment.yaml
					chmod +x ./app-service.yaml
				'''
			}
		}
		stage("Build Docker Images") {
			parallel {
				stage("Build Blue Image") {
					steps {
						sh 'echo " ---- Building Blue Image --- "'
						sh '''
							echo $BUILD_ID
							cd ./app
							./build-docker.sh
						'''						
					}
				}
			}
		}
		
		stage("Push Docker Images to DockerHub") {
			parallel {
				stage("Push Blue Image") {
					steps {
						sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
						sh '''
							cd ./app
							./upload-docker.sh
						'''
					}
				}
			}
		}
		
		stage ("Remove Docker Images") {
			parallel {
				stage("Remove Blue Image") {
					steps {
						sh 'echo " ---- Removing Blue Image --- "'
						sh '''
							cd ./app
							./remove-docker.sh
						'''
					}
				}
			}
		}
		stage("Create Kubernetes Cluster") {
			steps {
				withAWS(region:'us-east-1',credentials:'aws-jenkins') {
					sh 'eksctl create cluster --name capstone-project --version 1.26 --region us-east-1 --nodegroup-name project-udacity --node-type t3.micro --nodes 4 --nodes-min 2 --nodes-max 4 --managed'
				}
			}
		}
		stage("Update K8s Cluster Context") {
			steps {
				withAWS(region:'us-east-1',credentials:'aws-jenkins') {
					sh 'aws eks --region us-east-1 update-kubeconfig --name capstone-project '
				}
			}
		}
		stage("Deploy to AWS EKS cluster") {
			parallel {
				stage("Deploy Blue Application Container") {
					steps {
						withAWS(region:'us-east-1',credentials:'aws-jenkins') {
							sh '''
								cd ./app
								kubectl apply -f app-deployment.yaml
							'''
						}
					}
				}
			}
		}
		stage("Run Application") {
			steps {
				withAWS(region:'us-east-1',credentials:'aws-jenkins') {
					sh '''
						cd ./app
						kubectl apply -f app-service.yaml
					'''
				}
			}
		}
		stage("View all resources") {
			steps {
				withAWS(region:'us-east-1',credentials:'aws-jenkins') {
					sleep time: 1, unit: 'MINUTES'
					sh 'kubectl get nodes,deploy,svc,pod'
					sh 'kubectl get all -o wide'
					sleep time: 1, unit: 'MINUTES'
				}
			}
		}
		stage("Rollout Deployment") {
			steps {
				withAWS(region:'us-east-1',credentials:'aws-jenkins') {
					sleep time: 1, unit: 'MINUTES'
					sh 'kubectl rollout restart deployment/capstone'
					sh 'kubectl get all -o wide'
					sleep time: 1, unit: 'MINUTES'
				}
			}
		}
	}
}