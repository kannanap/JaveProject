node { 
2   stage('SCM Checkout')  
3         { 
4         git 'https://github.com/kannanap/MavanProject.git'   
5         } 
6    
7   stage('Compile-Package') 
8     { 
9     // Get maven home path   
10     def mvnHome =  tool name: 'Maven_3_5_3', type: 'maven'    
11     sh "${mvnHome}/bin/mvn package"  
12     } 
13 }  
