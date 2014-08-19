import 'base_variables.pp'

include editors
include networking
include development
include redhat_tools
class {'setup': stage => pre}
class {'teardown':     stage => cleanup}
