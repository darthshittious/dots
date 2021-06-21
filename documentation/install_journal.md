# My Arch Install

Open arch install guide in a different tty:

```bash
lynx wiki.archlinux.org/title/Installation_guide
```

Sync Clock

```bash
timedatectl set-ntp true
```

Partition the disk

```bash
cfdisk /dev/nvme0n1
```

Layout:

```
p1 260m boot
p2 20G  root
p3 ...  home
```

Format the partitions

```bash
mkfs.fat -F 32 p1
mkfs.ext4 p2
mkfs.ext4 p3
```

Mount File System

```bash
mount p2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount p1 /mnt/boot
mount p3 /mnt/home
```

Install packages

```bash
pacstrap /mnt base linux linux-firmware vim
```

Generate fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Chroot into Arch

```bash
arch-chroot
```

Configure clock

```bash
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
```

Locales

```bash
vim /etc/locale.gen  # uncomment
locale-gen
echo "LANG=en_GB.UTF-8" > /etc/locale.conf
echo "KEYMAP=uk" > /etc/vconsole.conf
```

```bash
echo Mordor > /etc/hostname

tee /etc/hosts << EOF
127.0.0.1       localhost
::1             localhost
127.0.1.1       myHostname.localdomain myHostname
EOF
```

Set password

```bash
passwd
```

Install stuff

```bash
pacman -S networkmanager wireless_tools wpa_supplicant man-db man-pages texinfo neovim linux-firmware linux linux-headers base-devel
pacman -S grub efibootmgr mtools dosfstools amd-ucode ntfs-3g os-prober
```

Enable networkmanager service

```bash
systemctl enable NetworkManager
```

Install grub

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```
