#!/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# TEST 1. request the Genesis block
curl -s "localhost:8000/block/0"
echo

# TEST 2. Make request of ownership
curl -s -X POST -H 'Content-Type: application/json' -d '{"address":"bc1qqgz2favl6mhz0awqrgskrm7km6sy89vfljpcz2"}' localhost:8000/requestValidation
echo

# TEST 3. Submit your Star
curl -s -X POST -H 'Content-Type: application/json' localhost:8000/submitstar -d @- <<\EOF
{ "address": "1DJhoaeJvEfPoT3AzUQNYHj5BFFycrLENW",
  "signature": "HwUbL0skcaLQlsUMIgz1W5Tyn0u9LnJ18811jgeEw2OedyYrcMTaOlbR9Dx+auLTXMK0BEsvI14Hhk/+xGsHWQQ=",
  "message": "1DJhoaeJvEfPoT3AzUQNYHj5BFFycrLENW:1590845723:starRegistry",
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
