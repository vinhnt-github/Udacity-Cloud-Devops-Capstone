# Udacity Cloud DevOpsCapstone Project 

## Project Overview

Capstone project for Udacity's "Cloud DevOps Engineer" Nanodegree Program.



## Objectives

- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working eksclt to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines
- Using rollout Deployment


## Tools Used

- Git & GitHub
- AWS & AWS-CLI
- Jenkins
- Kubernetes CLI (kubectl)
- eksclt

## Project Steps

- Launch  EC2
- Install Jenkins, kubectl, Docker, Kubernetes, lint, Aws-cli, eksctl
- Install BlueOcean, CloudBee And Aws Steps Plugin for Jenkins
- Integrate GitHub Repository to Jenkins Project
- Integrate dockerhub to Jenkins



## Project Specification
|                        | CRITERIA                                                       | MEETS SPECIFICATIONS                                                                                                                                                                                               |
|------------------------|----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| __Set Up Pipeline__        | Create Github repository with project code                     | All project code is stored in a GitHub repository and a link to the repository has been provided for reviewers.                                                                                                    |
|                        | Use image repository to store Docker images                    | The project uses a centralized image repository to manage images built in the project. After a clean build, images are pushed to the repository.                                                                   |
| __Build Docker Container__ | Execute linting step in code pipeline                          | Code is checked against a linter as part of a Continuous Integration step (demonstrated w/ two screenshots).                                                                                                        |
|                        | Build a Docker container in a pipeline                         | The project takes a Dockerfile and creates a Docker container in the pipeline.                                                                                                                                     |
| __Successful Deployment__  | The Docker container is deployed to a Kubernetes cluster       | The cluster is deployed with CloudFormation or Ansible. This should be in the source code of the student’s submission.                                                                                             |
|                        | Use Blue/Green Deployment or a Rolling Deployment successfully | The project performs the correct steps to do a blue/green or a rolling deployment into the environment selected. Student demonstrates the successful completion of chosen deployment methodology with screenshots. |


## License
Project licensed under the terms of the MIT License. See the `LICENSE` file for details.