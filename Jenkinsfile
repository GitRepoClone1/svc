podTemplate(
    label: 'mypod', 
    inheritFrom: 'default',
    containers: [
        containerTemplate(
            name: 'base', 
            image: 'jenkinsxio/builder-base:0.1.175',
            ttyEnabled: true,
            command: 'cat'
        )
    ],
    volumes: [
        hostPathVolume(
            hostPath: '/var/run/docker.sock',
            mountPath: '/var/run/docker.sock'
        )
    ]
) 
{
    node('mypod') {
        stage ('Deploy') {
            container ('base') {
                sh "git clone https://github.com/jawlitkp/consul-svc.git"
                // sh "ls -la"
                // sh "./consul-svc/install.sh"
            }
        }
    }
}

