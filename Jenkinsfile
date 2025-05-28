pipeline
{
    agent any
    stages
    {
        stage('Cont-Download')
        {
            steps
            {
                git 'https://github.com/sai-kadinti/intelliQ-MavenJava.git'
            }
        }
        stage('Cont-Build')
        {
            steps
            {
                sh 'mvn package'
            }
        }
        stage('Cont-Deployent')
        {
            steps
            {
                sh 'scp /var/lib/jenkins/workspace/New-Own/webapp/target/webapp.war ubuntu@172.31.87.13:/var/lib/tomcat10/webapps/own3.war'
            }
        }
        stage ('Cont-Testing')
        {
            steps
            {
                git 'https://github.com/sai-kadinti/FunctionalTesting.git'
                sh 'java -jar /var/lib/jenkins/workspace/New-Own/testing.jar'
            }
        }
        stage ('Cont-Delivery')
        {
            steps
            {
                input message: 'Please approve the deployment', submitter: 'sai-aws'
                sh 'scp /var/lib/jenkins/workspace/New-Own/webapp/target/webapp.war ubuntu@172.31.92.132:/var/lib/tomcat10/webapps/ownprod1.war'
            }
        }
        stage('Post-Build')
        {
            steps
            {
                sh 'echo "Succeed"'
            }
        }
    }
}
