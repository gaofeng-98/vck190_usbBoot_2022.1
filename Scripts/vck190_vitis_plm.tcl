
setws ../Software/Vitis/prj_plm

platform create -name vck190_wrapper -hw ../Hardware/vck190_ddr4/design_1_wrapper.xsa

bsp config plm_usb_en "true"

platform clean

platform generate

domain create -name pmc -os standalone -proc versal_cips_0_pspmc_0_psv_pmc_0

app create -name plm -sysproj plm_system -platform vck190_wrapper -domain pmc -template {versal PLM} -lang C
	
app build -name hello_a72_0

