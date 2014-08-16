import 'base_variables.pp'

include editors
include networking
include development
include redhat_tools
class {'teardown':     stage => cleanup}
