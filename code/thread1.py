import subprocess

print('$ nslookup guohang.me')
r = subprocess.call(['nslookup', 'guohang.me'])
print('Exit code:', r)