# Base role
class role::logserver inherits role {
  notify { 'role::logserver': }

  class { 'profile::java_setup': } ->
  class { 'profile::elasticsearch_setup': }
}