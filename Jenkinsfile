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
        stage('jfrog')
            steps {
                sh '''
                    zip zipfile.zip *
                    curl -uAdmin:AP7PiztS2DAyLrs79WGQQ6Jo5Ms \
                    -T agentfile.zip \
                     "http://54.81.30.199:8081/artifactory/yml.file/<yml.file"
            }       '''
    }
}




      