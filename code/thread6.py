import threading

local_school = threading.local()

def process_student():
	std = local_school.student
	print('Hello, %s (in %s)' % (std, threading.current_thread().name))