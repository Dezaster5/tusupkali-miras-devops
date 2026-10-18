pipelineJob('Tusupkali_Miras_DevOps') {
    description('Individual DevOps laboratory: Miras Tusupkali, IT2-2312, Student ID 38366')
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('git@github.com:Dezaster5/tusupkali-miras-devops.git')
                        credentials('github-readonly')
                    }
                    branch('*/main')
                }
            }
            scriptPath('Jenkinsfile')
            lightweight(true)
        }
    }
}
