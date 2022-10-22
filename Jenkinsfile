pipeline {
    agent any

    tools {
          maven 'M2_HOME'
          jdk 'JAVA_HOME'
    }
    parameters {
         string(name: 'Tomcat Staging', defaultValue: '54.210.39.94', description: 'Staging Server')
         string(name: 'Tomcat Prod', defaultValue: '44.211.217.14', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                bat 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving starts here...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging environment'){
                    steps {
                        echo 'Deployed in Stage'
                    }
                }

                stage ("Deploy to Production environment"){
                    steps {
                        echo 'Deployed in Prod'
                    }
                }
            }
        }
    }
}