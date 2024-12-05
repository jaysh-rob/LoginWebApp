pipeline{

	agent any

	triggers{
		pollSCM('H/1 * * * 1-7')
	}

	parameters{
		choice(name:'ENV',choices:['QA','SIT'],description:'Pick Environment value')
	}

	stages{

		stage("clone"){

			steps{

				checkout scm
			}
		}
	}

	stage("Build"){

		steps{

			sh '/home/jay/jenkinsserver/apache-maven-3.8.1/bin/mvn install'
		}

	}

	stage("Deploye"){

		steps{
		
		scrip{
			if(ENV == 'QA'){
		
			sh 'sshpass -p "hesoyam" scp target/LoginWebApp.war jay@172.17.0.2:/home/jay/apache-tomcat-9.0.58/webapps'

			sh 'sshpass -p "hesoyam" ssh -o StrictHostKeyChecking=no jay@172.17.0.2  "JAVA_HOME=/home/jay/Jenkinsserver/jdk1.8.0_281" "/home/jay/apache-tomcat-9.0.58/bin/startup.sh"'
			echo "Hello ${params.ENV}"
		}

			else if(ENV == 'SIT'){

			sh 'sshpass -p "hesoyam" scp target/LoginWebApp.war jay@172.17.0.3:/home/jay/apache-tomcat-9.0.58/webapps'
			
			sh 'sshpass -p "hesoyam" ssh -o StrictHostKeyChecking=no jay@172.17.0.3  "JAVA_HOME=/home/jay/Jenkinsserver/jdk1.8.0_281" "/home/jay/apache-tomcat-9.0.58/bin/startup.sh"'
			echo "Hello ${parames.ENV}"
	}

	else

	{

	echo "Wrong choice"



}}}

}

}

Post

{

always

{

emailext attachLog:true,body:'The job has been build', subject:'LoginWebApp Build',to:'scriptbashmail@gmail.com'

}
}


