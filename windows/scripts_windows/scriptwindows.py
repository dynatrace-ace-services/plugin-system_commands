import random
result=random.randint(0,9)
#print(result)
if result >  7:
	print("demo_Status;OK;value="+str(result))
elif result > 4:
	print("demo_Status;WARNING;value="+str(result))
else:
	print("demo_Status;CRITICAL;value="+str(result))
