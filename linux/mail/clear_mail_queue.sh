#!/bin/sh

set -e

#################################################################################

### Clear mail queue
clear_mailq (){
    # To see mail queue, enter:
    # mailq
    postfix flush
    postsuper -d ALL
    postsuper -d ALL deferred
}

clear_mailq

#################################################################################
