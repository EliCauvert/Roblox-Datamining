local AddSystemInfoToArgsFunction = require(script:FindFirstAncestor("Home").Parent.DiscoveryUtils).AddSystemInfoToArgs
local config = {
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

return function() --[[ Line: 31 | Named "buildHomeSystemContextFeatures" ]]
	-- upvalues: AddSystemInfoToArgsFunction (copy), config (copy)
	local t = {}
	AddSystemInfoToArgsFunction(t)
	local t1 = {}
	
	for i, value in config do
		local Entry = t[i]
		
		if Entry ~= nil and Entry ~= "" then
			t1[value] = tostring(Entry)
		end
	end
	local MaxResolution: string = t.maxResolution
	
	if typeof(MaxResolution) == "string" then
		local Match, Match2 = string.match(MaxResolution, "^(%d+)x(%d+)$")
		
		if Match and Match2 then
			t1.screenwidth = Match
			t1.screenheight = Match2
		end
	end
	return t1
end