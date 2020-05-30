#!/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# TEST 1. request the Genesis block
curl -s "localhost:8000/block/0"
echo

# TEST 2. Make request of ownership
curl -s -X POST -H 'Content-Type: application/json' -d '{"address":"2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64"}' localhost:8000/requestValidation
echo

# TEST 3. Submit your Star
curl -s -X POST -H 'Content-Type: application/json' localhost:8000/submitStar -d '
{ "address":"2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64",
  "signature": "",
  "message": "",
  "star": {
    "dec": "",
    "ra": "",
    "story": ""
  }
}'
echo

# TEST 4. Retrieve Stars owned by me
curl -s -X GET localhost:8000/blocks/2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64
echo
