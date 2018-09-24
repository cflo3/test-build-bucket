
// A Jenkinsfile drives a pipeline job.
// This is Groovy langauge file.

node {
    // This will get turned into a shared library as some point
    def branch = "${BRANCH_NAME}"
    if(branch =~ "PR-[0-9]{1,}") {
        branch = branch.toLowerCase().replaceAll("-", "/")
    }

    // More info at https://github.com/jenkinsci/aws-codebuild-plugin
    stage("codebuild") {
        awsCodeBuild(
            buildSpecFile: 'buildspec.yml',  // Must match codebuild project
            credentialsType: 'keys',         // Don't change; Jenkins will inherit keys from AWS role
            envParameters: '',               // Environment vars to pass into CodeBuild
            envVariables: '',                // Environment vars to pass into CodeBuild
            gitCloneDepthOverride: '1',      // 1 for shallow clone | full for full clone
            projectName: 'test-build-bucket',  // Must match codebuild project
            region: 'us-west-2',             // Should not change
            sourceControlType: 'project',    // Tell CodeBuild to get the code itself
            sourceVersion: "${branch}"       // Use the branch name to build
        )
    }
}