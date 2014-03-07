class profile::java_setup {
  notify { 'profile::java_setup': }

  class { 'java': 
    # distribution => 'oracle-jdk',
  }
}