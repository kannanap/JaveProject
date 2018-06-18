node { 
 stage('SCM Checkout')  
         { 
         https://github.com/kannanap/JaveProject.git'   
         } 
   
//   stage('Compile-Package') 
//   { 
// Get maven home path   
// def mvnHome =  tool name: 'Maven_3_5_3', type: 'maven'    
//sh "${mvnHome}/bin/mvn package"  
//     }

stage('Mvn Packaging')
     { 
    def mvnHome =  tool name: 'Maven_3_5_3', type: 'maven'    
     def mvnCMD = "${mvnHome}/bin/mvn" 
     sh "${mvnCMD} clean package"
      }
  }  
