#!/usr/bin/env python3

import sys
import hashlib
import codecs

publickey = codecs.decode(sys.argv[1], 'hex')
s = hashlib.new('sha256', publickey).digest()
r = hashlib.new('ripemd160', s).digest()

print('SHA-256:\t{}'.format(codecs.encode(s, 'hex').decode("utf-8")))
print('RIPEMD-160:\t{}'.format(codecs.encode(r, 'hex').decode("utf-8")))
