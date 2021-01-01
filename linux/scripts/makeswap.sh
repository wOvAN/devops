size=8192
name=/.swapfile_${size}
##################################################
dd if=/dev/zero of=${name} bs=1M count=${size}
# fallocate --length 2GiB ${name}

chown root:root ${name}
chmod 600 ${name}

mkswap ${name} -L swapfile_${size}
swapon ${name}

# > fstab
echo "${name}     swap     swap     defaults     0     0" >> /etc/fstab

# off
# swapoff ${name}