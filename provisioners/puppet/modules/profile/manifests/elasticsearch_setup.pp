class profile::elasticsearch_setup {
  notify { 'profile::elasticsearch_setup': }

  class { 'elasticsearch':
    # Get debian repository from here: https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb
    # More info on http://www.elasticsearch.org/overview/elkdownloads/
    package_url => 'puppet:///modules/profile/elasticsearch-1.0.1.deb',
    config      => {
      'cluster'   => {
        'name'      => 'analysis-cluster-e3b0c4',
      },
      'node'      => {
        'name'      => $::fqdn
      },
    }
  }
  
  elasticsearch::plugin{ 'royrusso/elasticsearch-HQ': 
    module_dir => 'hq',
  }

  elasticsearch::plugin{ 'polyfractal/elasticsearch-segmentspy': 
    module_dir => 'segmentspy',
  }

  elasticsearch::plugin{ 'polyfractal/elasticsearch-inquisitor':
    module_dir => 'inquisitor',
  }
}