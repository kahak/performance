name             'performance'
maintainer       "performance"
maintainer_email "k.hakimzadeh@gmail.com"
license          "Apache v2.0"
description      'Installs/Configures/Runs performance'
version          "0.1"

recipe            "performance::install", "Experiment setup for performance"
recipe            "performance::experiment",  "configFile=; Experiment name: experiment"


depends "kagent"



%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end



attribute "performance/group",
:description => "group parameter value",
:type => "string"

attribute "performance/numworkers",
:description => "numworkers parameter value",
:type => "string"

attribute "performance/user",
:description => "user parameter value",
:type => "string"


