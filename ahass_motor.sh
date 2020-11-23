#!/bin/bash
#Copyright (c) Final Project By Devan Cakra M.W All Rights Reserved
while :
do
clear
echo "+=======================================================+";
echo "|              SELAMAT DATANG DI AHASS MOTOR            |";
echo "|_______________________________________________________|";
echo "|         Pelayanan cepat, lengkap, yang terdepan       |";
echo "+=======================================================+";
printf "\n\n";
echo "+=======================================================+";
echo "|                        MENU UTAMA                     |";
echo "+=======================================================+";
echo "| 1. Detail Tanggal Hari Ini                            |";
echo "| 2. Pengaturan User                                    |";
echo "| 3. Daftar Pelayanan Servis Motor                      |";
echo "| 4. Jalankan Deadlock                                  |";
echo "| 5. Exit Program                                       |";
echo "+=======================================================+";
read -p "Masukkan pilihan menu [1-5]     : " pil;

case $pil in
1)
clear
echo "+=======================================================+";
echo "|                 Detail Tanggal Hari Ini               |";
echo "+=======================================================+";
echo "Informasi Keseluruhan :"; 
date
read
clear
;;

2)
clear
echo "+=======================================================+";
echo "|                     Pengaturan User                   |";
echo "+=======================================================+";
echo "| 1. Menambah User                                      |";
echo "| 2. Tampilkan User Terdaftar                           |";
echo "| 3. Jadikan Super User                                 |";
echo "| 4. Mengganti Password                                 |";
echo "| 5. Menghapus User                                     |";
echo "+=======================================================+";
read -p "Masukkan pilihan menu [1-5]     : " opsi;
#-----------------------------------------------------------------------------
if [ $opsi == 1 ];
then
clear
echo "+=======================================================+";
echo "|                      Menambah User                    |";
echo "+=======================================================+";
echo "Masukkan nama user yang ingin ditambahkan = ";
read add_user;
sudo adduser $add_user
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| User a/n $add_user berhasil ditambahkan!			|";
echo "+=======================================================+";
#-----------------------------------------------------------------------------
elif [ $opsi == 2 ];
then
clear
echo "+=======================================================+";
echo "|                 Tampilkan User Terdaftar              |";
echo "+=======================================================+";
echo "User yang telah terdaftar sebagai berikut = ";
printf "\n\n";
echo "+=======================================================+";
echo "|                       Daftar user                     |";
echo "+=======================================================+";
cat /etc/passwd | grep -v 'nologin' | awk -F: '$3 >= 1000 {print $1}'
echo "+=======================================================+";
#-----------------------------------------------------------------------------
elif [ $opsi == 3 ];
then
clear
echo "+=======================================================+";
echo "|                   Jadikan Super User                  |";
echo "+=======================================================+";
echo "Masukkan nama user yang ingin dijadikan super user = ";
read add_su;
su $add_su
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| User a/n $add_su berhasil dijadikan super user!		|";
echo "+=======================================================+";
#-----------------------------------------------------------------------------
elif [ $opsi == 4 ];
then
clear
echo "+=======================================================+";
echo "|                   Mengganti Password                  |";
echo "+=======================================================+";
echo "Masukkan nama user yang ingin diganti passwordnya = ";
read user_changepassword;
sudo passwd $user_changepassword
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| User a/n $user_changepassword berhasil diganti passwordnya!		|";
echo "+=======================================================+";
#-----------------------------------------------------------------------------
elif [ $opsi == 5 ];
then
clear
echo "+=======================================================+";
echo "|                     Menghapus User                    |";
echo "+=======================================================+";
echo "Masukkan nama user yang ingin dihapus = ";
read remove_user;
sudo deluser --remove-home $remove_user
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| User a/n $remove_user berhasil dihapus!			|";
echo "+=======================================================+";
#-----------------------------------------------------------------------------
else
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| Pilihan menu yang anda inputkan salah...              |";
echo "+=======================================================+";
fi
read
clear
;;

3)
clear
echo "+=======================================================+";
echo "|               Daftar Pelayanan Servis Motor           |";
echo "+=======================================================+";
echo "| 1. Ganti Oli                                          |";
echo "| 2. Ganti Ban Luar                                     |";
echo "| 3. Ganti Ban Dalam                                    |";
echo "| 4. Ganti Skok                                         |";
echo "| 5. Ganti Velg                                         |";
echo "| 6. Penambahan Assesoris                               |";
echo "| 7. Servis Keseluruhan                                 |";
echo "| 8. Isi Angin                                          |";
echo "+=======================================================+";
read -p "Masukkan pilihan [1-8] : " pilih;
#-----------------------------------------------------------------------------
if [ $pilih == 1 ];
then
let harga=100000;
elif [ $pilih == 2 ];
then
let harga=250000;
elif [ $pilih == 3 ];
then
let harga=50000;
elif [ $pilih == 4 ];
then
let harga=80000;
elif [ $pilih == 5 ];
then
let harga=225000;
elif [ $pilih == 6 ];
then
let harga=500000;
elif [ $pilih == 7 ];
then
let harga=550000;
elif [ $pilih == 8 ];
then
let harga=8000;
else
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| Pilihan menu yang anda inputkan salah...              |";
echo "+=======================================================+";
fi
#-----------------------------------------------------------------------------
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| Total pembayaran = Rp. $harga                         |";
echo "| Terima kasih atas kepercayaan anda.....               |";
echo "+=======================================================+";
read
clear
;;

4)
clear
echo "+=======================================================+";
echo "|                     Jalankan Deadlock                 |";
echo "+=======================================================+";
echo " Program deadlock akan diaktifkan dalam waktu 5 detik...";
sleep 5s;
while :; do
dd if=out.fifo bs=1b count 1 2>/dev/null|grep$1
if [ $?-eq 0 ];
then
echo "$2">in.fifo exit 0
fi
done
;;

5)
printf "\n\n";
echo "+=======================================================+";
echo "|                       Exit Program                    |";
echo "+=======================================================+";
echo "| Berhasil keluar....                                   |";
echo "+=======================================================+";
exit 1
;;

*)
printf "\n\n";
echo "+=======================================================+";
echo "|                        Keterangan                     |";
echo "+=======================================================+";
echo "| Pilihan menu yang anda inputkan salah...              |";
echo "+=======================================================+";
read
clear
;;

esac
done
