flask hello-world project

Build and deploy a simple flask application using jenkins and K8s

# Prerequisites

* Python
* Flask
* Docker
* Git and GitHub
* Jenkins
* K8s

# Steps in the CI/CD pipeline

1. Create a "Hello-world" Flask application
2. Dockerize the application
3. Create a GitHub repository and push code to it
4. Test the code locally by building docker image and running it
5. Write and run unit tests using pytest
6. Start Jenkins server on a host
7. Using ngrok to get an IP for Jenkins and use webhook trigger with GitHub
8. Write Jenkins pipeline to build and push the docker image to Docker
9. Set up K8s on a host using Minikube
10. Create a K8s deployment and service for the application
11. Create a K8s Ingress to expose the Flask service externally
12. Use Jenkins to deploy the application on K8s

# Project structure

* app.py - Flask application which will print "Hello World" when you run it
* test_app.py - Contains unit tests for Flask application using pytest
* requirements.txt - Contains dependencies for the project
* Dockerfile - Contains commands to build and run the docker image
* Jenkinsfile - contains the pipeline script for build , push and deploy
* flask.yaml - K8s deployment and service file for the application
* flask-secret.yaml - K8s secret file
* flask-configmap.yaml - K8s configmap file
* postgres.yaml - K8s deployment and service file for postgres DB
* ingress.yaml - K8s Ingress file to expose Flask service externally

# Conclusion

* In this project, I build a very simple CI/CD pipeline using Jenkins and K8s
* Don't forget to use ngrok in terminal and keep the terminal open so you can use the webhook .
* Unit tests are implemented using `pytest` in `test_app.py`.
* I used credentials for Docker Hub and K8s, after deploy the application, run `minikube service flask-service` to access it in browser
* Or you can use ingress by run `minikube tunnel` to access it , But if you use this method, you should also update your hosts file