import random
result=random.randint(0,9)
#print(result)
if result >  5:
	print("demo_Status;CRITICAL;value="+str(result))
elif result > 2:
	print("demo_Status;WARNING;value="+str(result))
else:
	print("demo_Status;OK;value="+str(result))
