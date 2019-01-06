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
) {
    node('mypod') {
        stage ('Deploy') {
            container ('base') {
                sh "kubectl --namespace kube-system create sa tiller"
                sh "helm init --client-only --skip-refresh"               
                sh "helm init --client-only --skip-refresh"
                sh "kubectl get pods"
                sh "helm install --name my-release stable/consul"
            }
        }
    }
}
