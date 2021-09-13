SET /a num=%random% %%100
IF %num% GTR 75 (
	echo "demo_Status;OK;value=%num%"
) ELSE	 (
	echo "demo_Status;CRITICAL;value=%num%"
	)
