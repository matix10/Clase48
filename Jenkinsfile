
pipeline{
    agent 
        {   docker {
                    image 'matiasolivar/acceleration-dv:v1.0'
    }
        }
   
    stages{
        stage ('Build'){
            steps{
               checkout scm
               sh 'echo "pipeline finalizado"';
            }

        }
    }
        
}



