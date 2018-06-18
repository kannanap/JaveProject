node{
   stage('SCM Checkout'){
     git credentialsId: '94e6862e-a136-4850-b3e3-e167852a1cdb', url: 'https://github.com/kannanap/JaveProject.git'
   }
   stage('Compile-Package'){
      // Get maven home path
      def mvnHome = tool name: 'Maven_3_5_3', type: 'maven'
      def mvnCMD  = "${mvnHome}/bin/mvn"
      sh "${mvnCMD} clean package"
       }
   
  stage('Build Docker Image'){
     //Building the Docker Images 
     sh 'docker build -t kannanacn/webapp:1.0.0 .'
      }
       
   stage('Deploy Docker Image'){
       //Deploy the Docker Images 
     withCredentials([string(credentialsId: 'dockerloginPWD', variable: 'dockerloginPWD')]) {
      sh "docker login -u kannanacn -p ${dockerloginPWD}"
     }
    sh 'docker push kannanacn/webapp:1.0.0'
   }
   stage('DeployContainer on Dev Server'){
   def dockerRun = 'docker run -p 8080:8080 -d --name myapp kannanacn/webapp:1.0.0'
   sshagent(['Dev-Server']) {
   sh "ssh -o StrictHostKeyChecking=no ec2-user@ec2-13-127-223-235 ${dockerRun}"
     // some block
     }
    }
   }
