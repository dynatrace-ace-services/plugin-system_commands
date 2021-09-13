SET /a num=%random% %%100
echo %num%
IF %num% GTR 75 (
	echo demo_Status;value=%num%;OK
) ELSE	 (
	echo demo_Status;value=%num%;CRITICAL
	)
