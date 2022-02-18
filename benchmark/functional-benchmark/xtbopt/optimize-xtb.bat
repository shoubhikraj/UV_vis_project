mkdir scratch
@for /l %%f in (1,1,15) do (
	copy ..\generated_inputs\pre-struct-%%f.xyz .\scratch\
	@cd scratch\
	xtb pre-struct-%%f.xyz --opt tight --namespace optimize
	@del /q pre-struct-%%f.xyz >NUL
	@ren optimize.xtbopt.xyz struct-%%f.xyz
	@move struct-%%f.xyz ..\
	@cd ..
	@del /q .\scratch\* >NUL
)
@rmdir scratch