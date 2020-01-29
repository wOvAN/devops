apt install -y cpu-checker

# If 0 it means that your CPU doesn't support hardware virtualization.
# If 1 or more it does - but you still need to make sure that virtualization is enabled in the BIOS. 

egrep -c '(vmx|svm)' /proc/cpuinfo

