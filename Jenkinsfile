26node{
   stage('SCM CHECKOUT'){
      println ".................Code Checkin and Checkout...................."
     git credentialsId: '94e6862e-a136-4850-b3e3-e167852a1cdb', url: 'https://github.com/kannanap/JaveProject.git'
   }
   stage('COMPILE AND PACKAGING'){
      // Get maven home path
      println ".................Maven Compile and Packaging...................."
      def mvnHome = tool name: 'Maven_3_5_3', type: 'maven'
      def mvnCMD  = "${mvnHome}/bin/mvn"
      sh "${mvnCMD} clean package"
       }
   
  stage('BUILD DCOKER IMAGE'){
     //Building the Docker Images 
     println ".................Building the Image...................."
     sh 'docker build -t kannanacn/webapp:1.0.7 .'
      }
       
   stage('PUSH DOCKER IMAGE'){
       //Deploy the Docker Images 
      println ".................Pushing the Images into the Container...................."
     withCredentials([string(credentialsId: 'dockerloginPWD', variable: 'dockerloginPWD')]) {
      sh "docker login -u kannanacn -p ${dockerloginPWD}"
     }
    sh 'docker push kannanacn/webapp:1.0.7'
   }
   stage('DEPLOY TO CONTAINER'){
      println ".................Deploying the Images...................."
   def dockerRun = 'docker run -p 8080:8080 -d --name myappli kannanacn/webapp:1.0.7'
        sshagent(['dev-serverdeployment1']) {
   sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-13-127-197-79.ap-south-1.compute.amazonaws.com ${dockerRun}"
     // some block
            
     }
    }
   }
