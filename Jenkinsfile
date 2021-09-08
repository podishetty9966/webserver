node{
   stage('SCM Checkout'){
       git credentialsId: 'git-creds', url: 'https://github.com/podishetty9966/my-app.git'
   }
    stage('Mvn Package'){
     def mvnHome = tool name: 'maven-3', type: 'maven'
     def mvnCMD = "${mvnHome}/bin/mvn"
     sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image'){
     sh 'docker build -t premsgr6/my-app:2.0.0 .'
   }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u premsgr6 -p ${dockerHubPwd}"
     }
     sh 'docker push premsgr6/my-app:1.0.0'
   }
   stage('Run Container on Dev Server'){
     def dockerRun = 'docker run -p 8080:8080 -d --name my-app premsgr6/my-app:1.0.0'
     sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.29.47 ${dockerRun}"
     }
   }
}
