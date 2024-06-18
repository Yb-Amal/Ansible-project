pipeline {
    agent any
    stages {
        stage('transferring files') {
            steps {
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'agent-jenkins', 
                            transfers: [
                            sshTransfer(
                                    cleanRemote: false,
                                    excludes: '', 
                                    execCommand: 'ls', 
                                    execTimeout: 120000, 
                                    flatten: false, 
                                    makeEmptyDirs: false, 
                                    noDefaultExcludes: false, 
                                    patternSeparator: '[, ]+', 
                                    remoteDirectory: '', 
                                    remoteDirectorySDF: false, 
                                    removePrefix: '', 
                                    sourceFiles: '**/*.yml,**/*.cfg')], 
                                    usePromotionTimestamp: false,
                                    useWorkspaceInPromotion: false, 
                                    verbose: false)])
            }
        }
        stage('zip the file'){
            steps {
                sh 'zip ansible-${BUILD_ID}.zip * -- exclude Jenkinsfile'
                

                    
                    
            }
    }
    stage('upload artifacts to jfrog'){
        steps{
            sh 'curl -uAdmin:AP7PiztS2DAyLrs79WGQQ6Jo5Ms -T ansible-${BUILD_ID}.zip "http://3.90.153.78:8081//artifactory/ansible-${BUILD_ID}/"'
        }
    }
        
}




}     