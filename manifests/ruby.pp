$user = "ubuntu"
$main_ruby = "2.0.0-p353"
$main_ruby_location = "/home/$user/.rbenv/versions/$main_ruby"


user { "$user":
  ensure => present,
  home => "/home/$user",
  managehome => true,
  shell => "/bin/bash"
}

rbenv::install { "$user":
  group => "$user"
}

rbenv::compile { "$main_ruby":
  user => "$user",
  global => true
}

rbenv::gem { "bundler":
  user => "$user",
  ruby => "$main_ruby"
}
