#!/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# TEST 1. request the Genesis block
curl "localhost:8000/block/0"

# TEST 2. Make request of ownership
curl -X POST -d {"address":"2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64"} localhost:8000/requestValidation

# TEST 3. Submit your Star
curl -X POST localhost:8000/submitStar -d '
{ "address":"2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64",
  "signature": "",
  "message": "",
  "star": {
    "dec": "",
    "ra": "",
    "story": ""
  }
}'

# TEST 4. Retrieve Stars owned by me
curl -X GET localhost:8000/blocks/2N5QNPC8nEWDwue4XLJvqzrtwwUAboBrN64
