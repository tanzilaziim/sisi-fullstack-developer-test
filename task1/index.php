<?php

echo "Input: ";
$tinggi = (int) fgets(STDIN);

for ($i = 1; $i <= $tinggi; $i++) {
    for ($j = 1; $j <= $tinggi - $i; $j++) {
        echo " ";
    }

    for ($k = 1; $k <= $i; $k++) {
        echo "* ";
    }

    echo PHP_EOL;
}