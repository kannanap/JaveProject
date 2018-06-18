node{
   stage('SCM CHECKOUT'){
     git credentialsId: '94e6862e-a136-4850-b3e3-e167852a1cdb', url: 'https://github.com/kannanap/JaveProject.git'
   }
   stage('COMPILE AND PACKAGING'){
      // Get maven home path
      def mvnHome = tool name: 'Maven_3_5_3', type: 'maven'
      def mvnCMD  = "${mvnHome}/bin/mvn"
      sh "${mvnCMD} clean package"
       }
   
  stage('BUILD DCOKER IMAGE'){
     //Building the Docker Images 
     sh 'docker build -t kannanacn/webapp:1.0.2.'
      }
       
   stage('PUSH DOCKER IMAGE'){
       //Deploy the Docker Images 
     withCredentials([string(credentialsId: 'dockerloginPWD', variable: 'dockerloginPWD')]) {
      sh "docker login -u kannanacn -p ${dockerloginPWD}"
     }
    sh 'docker push kannanacn/webapp:1.0.2'
   }
   stage('DEPLOY TO CONTAINER'){
   def dockerRun = 'docker run -p 8080:8080 -d --name myapp001 kannanacn/webapp:1.0.2'
   sshagent(['dev-serverdeployment']) {
   sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-13-127-178-47.ap-south-1.compute.amazonaws.com ${dockerRun}"
     // some block
            
     }
    }
   }
