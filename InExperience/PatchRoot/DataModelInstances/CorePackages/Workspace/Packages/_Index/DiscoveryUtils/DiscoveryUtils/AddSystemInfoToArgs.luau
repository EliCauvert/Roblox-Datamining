local parent = script:FindFirstAncestor("DiscoveryUtils").Parent
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local argCheckModule = require(parent.ArgCheck)
local t = {
	[systemInfoProtocol.InfoNames.MANUFACTURER] = "deviceManufacturer",
	[systemInfoProtocol.InfoNames.BASE_OS] = "operatingSystemVersion",
	[systemInfoProtocol.InfoNames.IS_64BIT] = "if64Bit",
	[systemInfoProtocol.InfoNames.CPU_CORE_COUNT] = "cpuCores"
}

return function(p1, p2)
	-- upvalues: systemInfoProtocol (ref), t (ref), argCheckModule (ref)
	local var1 = p2 or systemInfoProtocol.ALL_INFO_NAMES
	local ok, status = pcall(function()
		-- upvalues: systemInfoProtocol (copy), var1 (ref)
		return systemInfoProtocol.default:getSystemInfo(var1)
	end)
	
	if ok and typeof(status) == "table" then
		for i, v in pairs(status) do
			local var2 = t[i] or i
			argCheckModule.assert(p1[var2] == nil, "Field '" .. tostring(var2) .. "' already exists in argument table!  Will be overwritten.")
			p1[var2] = v
		end
	end
end