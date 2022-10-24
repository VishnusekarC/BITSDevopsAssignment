pipeline {
    agent any

    tools {
          maven 'M2_HOME'
          jdk 'JAVA_HOME'
    }
    parameters {
         string(name: 'tomcat_staging', defaultValue: '54.210.39.94', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '18.207.196.102', description: 'Production Server')
         choice(name: 'Environment', choices: ['tomcat_staging', 'tomcat_prod'], description: 'Choose environment')
    }
    environment {
        EMAIL_APPROVER = '2022ht66017@wilp.bits-pilani.ac.in'
        VM_EMAIL_FROM = 'admin@jenkins'
        DEPLOY_CREDENTIALS = credentials('deployer_user')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving starts here...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deploy to Staging environment'){
            steps {
                sshagent(['login_user']){
                    echo "Deploying with ${DEPLOY_CREDENTIALS}"
                    sh "scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@$params.tomcat_staging:/opt/tomcat/webapps"
                }
            }
            post {
                success {
                    echo "Deployed successfully on Stage. See results in http://$params.tomcat_staging:8080/webapp/"
                }
            }
        }
        //stage('Approval') {
                    // no agent, so executors are not used up when waiting for approvals
                    //when { changeset "vm-management/create-vm/**"}
                    //agent none
                    //steps {
                    //    script {
                    //        mail from: "$VM_EMAIL_FROM", to: "$VM_SUPPORT_EMAIL", subject: "APPROVAL REQUIRED FOR $JOB_NAME" , body: """Build $BUILD_NUMBER required an approval. Go to $BUILD_URL for more info."""
                    //        def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                    //        sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
                    //    }
                    //}
                //}
            //}
        stage ("Deploy to Production environment"){
            steps {
                input {
                    message "Proceed with Deployment on Production?"
                }
                sshagent(['login_user']){
                    echo "Deploying with ${DEPLOY_CREDENTIALS}"
                    sh "scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@$params.tomcat_prod:/opt/tomcat/webapps"
                }
            }
            post {
                success {
                    echo "Deployed successfully on Prod. See results in http://$params.tomcat_prod:8080/webapp/"
                }
            }
        }           
    }
}
