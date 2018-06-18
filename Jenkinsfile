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
     
   }
