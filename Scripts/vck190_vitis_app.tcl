
proc app_create {} {
	setws -switch ../Design/Software/Vitis/prj_app

	platform create -name vck190_wrapper -hw ../Design/Hardware/vck190_ddr4/design_1_wrapper.xsa
	
	domain create -name standalone_psv_cortexa72_0 -os standalone -proc versal_cips_0_pspmc_0_psv_cortexa72_0

	app create -name hello_a72_0 -sysproj vck190_system -platform vck190_wrapper -domain standalone_psv_cortexa72_0 -template {Hello World} -lang C
	
		
}

proc app_build {} {
	setws ../Design/Software/Vitis/prj_app
	app build -name hello_a72_0
}

app_create
app_build
