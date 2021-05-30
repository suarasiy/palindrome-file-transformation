#! /bin/sh
#
# palindrom_transform.sh
# Copyright (C) 2021 suarasiy <suarasiy@suara> aka Sidiq Indrajati Yusuf
#
# Distributed under terms of the MIT license.
#
# Nama  : Sidiq Indrajati Yusuf
# Nim   : 1911102441031
# Prodi : Teknik Informatika
# Kelas : A


# ----------------------------- #

IFS=""
TEKS_KONTAINER=()
TRANSFORMED_KONTAINER=()
PALINDROMED_KONTAINER=()

baca_file () {
    while read baris
    do
        TEKS_KONTAINER+=($baris)
    done
}

palindrome_return () {
    for palindrome_status in ${PALINDROMED_KONTAINER[@]}
    do
        echo $palindrome_status
    done
}

palindrome_kualifikasi () {
    for index in "${!TRANSFORMED_KONTAINER[@]}"
    do
        local ORIGIN_TEKS=${TEKS_KONTAINER[$index]}
        local TRANS_TEKS=${TRANSFORMED_KONTAINER[$index]}

        if [ $TRANS_TEKS == $ORIGIN_TEKS ];
        then
            PALINDROMED_KONTAINER+=(true)
        else
            PALINDROMED_KONTAINER+=(false)
        fi
    done
}

palindrome_pseudo_generate () {
    for teks in "${TEKS_KONTAINER[@]}"
    do
        local PSEUDO_TEKS=""
        local LENGTH_TEKS=`expr ${#teks} - 1`

        for (( INDEX=$LENGTH_TEKS; INDEX>=0; INDEX-- ))
        do
            PSEUDO_TEKS+=${teks:INDEX:1}
        done

        TRANSFORMED_KONTAINER+=($PSEUDO_TEKS)
    done

    palindrome_kualifikasi
}

baca_file
palindrome_pseudo_generate
palindrome_return
