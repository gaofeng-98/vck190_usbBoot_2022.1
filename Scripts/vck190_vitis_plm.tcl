
setws -switch ../Design/Software/Vitis/prj_plm

platform create -name vck190_wrapper -hw ../Design/Hardware/vck190_ddr4/design_1_wrapper.xsa

domain create -name pmc -os standalone -proc versal_cips_0_pspmc_0_psv_pmc_0 -support-app {versal_plm}

platform generate

bsp reload

bsp config plm_usb_en "true"

bsp write

bsp reload

catch {bsp regenerate}

platform generate

app create -name plm -sysproj plm_system -platform vck190_wrapper -domain pmc -template {versal PLM} -lang C
	
app build -name plm



