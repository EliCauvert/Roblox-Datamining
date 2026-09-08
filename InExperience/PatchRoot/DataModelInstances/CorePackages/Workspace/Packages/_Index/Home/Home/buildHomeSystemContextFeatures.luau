local addSystemInfoToArgs = require(script:FindFirstAncestor("Home").Parent.DiscoveryUtils).AddSystemInfoToArgs
local t = {
	cpuCores = "cpucore",
	deviceManufacturer = "manufacturer",
	if64Bit = "if_64bit",
	maxMemory = "deviceram",
	systemVersion = "osversion",
	networkType = "networktype",
	cpuMake = "cpu_make",
	cpuSpeed = "cpu_speed",
	GPU = "gpu_adapter",
	availRAM = "avail_ram"
}

return function()
	-- upvalues: addSystemInfoToArgs (ref), t (ref)
	local t_1 = {}
	addSystemInfoToArgs(t_1)
	local t_2 = {}
	
	for i, v in t do
		local var1 = t_1[i]
		
		if var1 ~= nil and var1 ~= "" then
			t_2[v] = tostring(var1)
		end
	end
	local maxResolution = t_1.maxResolution
	
	if typeof(maxResolution) == "string" then
		local match, match_1 = string.match(maxResolution, "^(%d+)x(%d+)$")
		
		if match and match_1 then
			t_2.screenwidth = match
			t_2.screenheight = match_1
		end
	end
	return t_2
end