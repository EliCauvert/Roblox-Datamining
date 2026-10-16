local Parent = script:FindFirstAncestor("DiscoveryUtils").Parent
local SystemInfoProtocol = require(Parent.SystemInfoProtocol).SystemInfoProtocol
local ArgCheckModule = require(Parent.ArgCheck)
local config = {
	[SystemInfoProtocol.InfoNames.MANUFACTURER] = "deviceManufacturer",
	[SystemInfoProtocol.InfoNames.BASE_OS] = "operatingSystemVersion",
	[SystemInfoProtocol.InfoNames.IS_64BIT] = "if64Bit",
	[SystemInfoProtocol.InfoNames.CPU_CORE_COUNT] = "cpuCores"
}

return function(p1, p2) --[[ Line: 16 ]]
	-- upvalues: SystemInfoProtocol (copy), config (copy), ArgCheckModule (copy)
	local ALLINFONAMES = if p2 then p2 else SystemInfoProtocol.ALL_INFO_NAMES
	local Success, Result = pcall(function() --[[ Line: 19 ]]
		-- upvalues: SystemInfoProtocol (upval), ALLINFONAMES (copy)
		return SystemInfoProtocol.default:getSystemInfo(ALLINFONAMES)
	end)
	
	if Success and typeof(Result) == "table" then
		for i, value in pairs(Result) do
			local Entry = config[i] or i
			ArgCheckModule.assert(p1[Entry] == nil, "Field '" .. tostring(Entry) .. "' already exists in argument table!  Will be overwritten.")
			p1[Entry] = value
		end
	end
end