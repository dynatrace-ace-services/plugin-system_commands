SET /a num=%random% %%100
echo %num%
IF %num% GTR 75 (
	echo "demo_Status;OK;value=%num%"
) ELSE	 (
	"echo demo_Status;value=%num%;CRITICAL"
	)
