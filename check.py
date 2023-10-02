import psutil
import os
print("jalanan check py")
def is_process_running(process_name):
    for process in psutil.process_iter(['pid', 'name']):
        if process.info['name'] == process_name:
            return True
    return False

if not is_process_running('python3'):
    os.system('/usr/bin/python3 /home/ubun/pentester/pybotnet/main.py')
