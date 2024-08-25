#!/bin/bash

mkdir idiomas turismo
touch idiomas/{nombres,notas}.txt
cp idiomas/* turismo/
chmod go+wx turismo/*.txt
tar -czf idiomas.tar.gz idiomas/
rm -rf idiomas/
tar -xzf idiomas.tar.gz

