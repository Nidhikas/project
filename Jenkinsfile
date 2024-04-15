
pipeline {
	agent any
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/opt/apache-maven-3.6.3/mvn install'
	                 }}
			stage('Docker build'){
		    steps {
			sh 'docker build -t nidhikashyap18/dockerimage-nginx .'
			}}
			stage('Container creation'){
		    steps {
			sh 'docker run -it -d --name=con-project nidhikashyap18/dockerimage-nginx /bin/bash'
			}}
			stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin"
                    }
                    
                    // Tag the Docker image
                    sh 'docker tag nidhikashyap18/dockerimage-nginx nidhikashyap18/dockerimage-nginx'
                    
                    // Push the Docker image to Docker Hub
                    sh 'docker push nidhikashyap18/dockerimage-nginx'
                }
            }
        }		


}}
