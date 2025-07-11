#!/bin/sh

# Enable OpenNIC DNS servers
#arch-chroot ${workdir} systemctl enable opennic-up-on-boot
#arch-chroot ${workdir} systemctl enable opennic-up.timer

# Save pacman local database
mkdir -pv ${workdir}/usr/share/manjaro
#arch-chroot ${workdir} tar -czf /opt/manjaro/pacman-local-db.tar.gz /var/lib/pacman/local
pacman -Q --root=${workdir} > ${workdir}/usr/share/manjaro/installed.pkgs

# Switch branches to stable
sed -i -e 's/unstable/stable/g' ${workdir}/etc/pacman.conf
sed -i -e 's/testing/stable/g' ${workdir}/etc/pacman.conf

# Remove pacman
#arch-chroot ${workdir} sed -i -e '/HoldPkg = pacman/d' /etc/pacman.conf
#arch-chroot ${workdir} pacman -Scc --noconfirm
#arch-chroot ${workdir} pacman -Rdd pacman pacman-mirrors --noconfirm

# Delete pacman database local cache
#[[ -d "${workdir}/var/lib/pacman/local" ]] && find "${workdir}/var/lib/pacman/local" -mindepth 1 -delete
# Delete pacman package configs
#[[ -d "${workdir}/etc/pacman.d" ]] && find "${workdir}/etc/pacman.d" -type f -delete
#[[ -d "${workdir}/etc/pacman.conf" ]] && find "${workdir}/etc/pacman.conf" -type f -delete
