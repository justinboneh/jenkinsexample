pipeline {
  agent {
    dockerfile {
      filename 'linux-x86.dockerfile'
    }

  }
  stages {
    stage('Build') {
      steps {
        cmake(installation: 'cmake-3.14.2-autoinstall', workingDir: '_build', arguments: '.. -DCMAKE_MAKE_PROGRAM=make')
        cmakeBuild(buildType: 'Release', cleanBuild: true, installation: 'cmake-3.14.2-autoinstall', steps: [[withCmake: true]], buildDir: '_build')
      }
    }
    stage('Test') {
      when {
        environment name: 'RUN_TESTS', value: 'true'
      }
      steps {
        ctest(installation: 'cmake-3.14.2-autoinstall', workingDir: '_test', arguments: '..')
      }
    }
    stage('Analyse') {
      when {
        environment name: 'RUN_ANALYSIS', value: 'true'
      }
      steps {
        sh(returnStatus: true, script: 'cppcheck . --xml --language=c++ --suppressions-list=suppressions.txt 2> cppcheck-result.xml')
        publishCppcheck(allowNoReport: true, ignoreBlankFiles: true, pattern: '**/cppcheck-result.xml')
      }
    }
    stage('Deploy') {
      when {
        environment name: 'DEPLOY', value: 'true'
      }
      steps {
        sh(returnStatus: true, script: '''cp jenkinsexample ~
                cp test/testPro ~''')
      }
    }
  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }
  parameters {
    booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run Tests?')
    booleanParam(name: 'RUN_ANALYSIS', defaultValue: true, description: 'Run Static Code Analysis?')
    booleanParam(name: 'DEPLOY', defaultValue: true, description: 'Deploy Artifacts?')
  }
}