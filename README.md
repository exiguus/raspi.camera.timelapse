# Raspberry Pi Camera Module timelapse automation
A collection of shell scripts that help automation with raspberri pi and camera module using raspistill
- take photos every N minute or hour
- build timelapse videos from photo with mencoder every day
- upload, backup and remove photos and videos every minute, hour or day
for raspberry pi + camera modul.
Help to avoid crash by multiple instances of raspistill and limit the disk space usage.
Needs raspistill, rsync, wget and mailutils to be installed.

## setup
- make photo and video paths for pi user
```
mkdir -p /home/pi/camera/photos/
mkdir /home/pi/camera/videos/
```
- copy scripts and change mode
```
cp -R script/camera/ /usr/local/sbin/
chmod 700 /usr/local/sbin/camera/*/*.sh
```
- edit user and connection setting for backup and sync
```
nano /usr/local/sbin/camera/photo/backup.sh
nano /usr/local/sbin/camera/photo/sync.sh
nano /usr/local/sbin/camera/video/backup.sh
nano /usr/local/sbin/camera/video/sync.sh
```
- edit photo options
```
nano /usr/local/sbin/camera/photo/take.sh
nano /usr/local/sbin/camera/video/take.sh
```
- edit timelapse video options
```
nano /usr/local/sbin/camera/video/make.sh
```
- edit monitoring options
```
nano /usr/local/sbin/camera/check/photo.sh
```
- setup cronjob
```
cp cron/camera /etc/cron.d/
nano /etc/cron.d/camera
/etc/init.d/cron restart
```



## Note
The WiFi_Check script is by Author: Kevin Reed (Dweeber)

## tags
raspberry pi, raspi, photo, foto, video, timelapse, shell