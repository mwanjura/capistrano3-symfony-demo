# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Include symfony extension
require 'capistrano/symfony'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
