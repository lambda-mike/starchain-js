#!/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# TEST 1. request the Genesis block
curl -s "localhost:8000/block/0"
echo

# TEST 2. Make request of ownership
curl -s -X POST -H 'Content-Type: application/json' -d '{"address":"1DJhoaeJvEfPoT3AzUQNYHj5BFFycrLENW"}' localhost:8000/requestValidation
echo

# TEST 3. Submit your Star
curl -s -X POST -H 'Content-Type: application/json' localhost:8000/submitstar -d @- <<\EOF
{ "address": "1DJhoaeJvEfPoT3AzUQNYHj5BFFycrLENW",
  "signature": "IPcWVLdDGIrX0nwdlF0YqSsJajfkTCKQsw9aZ0x1lgJodBD8kS9x6OnJXR7zRj/cTUdv2aIG7L372tap3zkn6lM=",
  "message": "1DJhoaeJvEfPoT3AzUQNYHj5BFFycrLENW:1590846424:starRegistry",
  "star": {
    "dec": "68° 52' 56.9",
    "ra": "16h 29m 1.0s",
    "story": "Testing the story 4"
  }
}
EOF

echo

# TEST 4. Retrieve Stars owned by me
curl -s -X GET localhost:8000/blocks/2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64
echo

# TEST 5. Get block by hash
curl -s "localhost:8000/block/hash/b06ad471a19ef484b8d26fc4bc9255aca274239e8395a188d8acfed1f97d0206"
echo
