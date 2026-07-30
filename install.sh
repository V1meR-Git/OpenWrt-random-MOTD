#!/bin/sh
echo "Установка Git..."
apk update && apk add git && apk add git-http

echo "Установлен, клонирование репозитория..."
git clone https://github.com/V1meR-Git/OpenWrt-random-MOTD.git /root/OpenWrt-random-MOTD
mkdir -p /root/banners

echo "Копирование файлов..."
cp /root/OpenWrt-random-MOTD/etc/profile.d/apk-cheatsheet.sh /etc/profile.d/apk-cheatsheet.sh
cp /root/OpenWrt-random-MOTD/root/banners/* /root/banners/

echo "Выдача прав..."
chmod +x /etc/profile.d/apk-cheatsheet.sh
chmod 644 /root/banners/*
echo "Установка завершена"

printf "Удалить git и git-http ? [y/N]: "
read answer < /dev/tty
case "$answer" in
    [Yy]|[Yy][Ee][Ss])
        apk del git-http && apk del git
        echo "Удалено."
        ;;
    *)
        echo "Без изменений."
        ;;
esac

echo "Очистка хвостов..."
rm -rf /root/OpenWrt-random-MOTD

echo "Готово, нужно переподключиться по ssh"
