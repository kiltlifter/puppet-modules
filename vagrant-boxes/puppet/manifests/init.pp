import 'base_variables.pp'

include editors
include networking
include development
#include repos
class {'teardown':     stage => cleanup}
