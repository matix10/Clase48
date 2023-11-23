
pipeline{
    agent 
        {   docker {
                    image 'matiasolivar/acceleration-dv:v1.0'
    }
        }
   

        stage ('Build'){
            steps{
               checkout scm
               sh 'echo "pipeline finalizado"';
            }

        }

        
    }



