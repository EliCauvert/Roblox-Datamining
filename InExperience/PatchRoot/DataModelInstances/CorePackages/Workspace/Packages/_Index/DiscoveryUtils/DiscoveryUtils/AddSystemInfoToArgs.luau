local parent = script:FindFirstAncestor("DiscoveryUtils").Parent
local systemInfoProtocol = require(parent.SystemInfoProtocol).SystemInfoProtocol
local argCheckModule = require(parent.ArgCheck)
local t = {
	[systemInfoProtocol.InfoNames.MANUFACTURER] = "deviceManufacturer",
	[systemInfoProtocol.InfoNames.BASE_OS] = "operatingSystemVersion",
	[systemInfoProtocol.InfoNames.IS_64BIT] = "if64Bit",
	[systemInfoProtocol.InfoNames.CPU_CORE_COUNT] = "cpuCores"
}

return function(p0, p1) --[[ line: 16 ]]
	-- upvalues: systemInfoProtocol (ref), t (ref), argCheckModule (ref)
	local var2 = p1 or systemInfoProtocol.ALL_INFO_NAMES
	local ok, status = pcall(function() --[[ line: 19 ]]
		-- upvalues: systemInfoProtocol (copy), var2 (ref)
		return systemInfoProtocol.default:getSystemInfo(var2)
	end)
	
	if ok and typeof(status) == "table" then
		for i, v in pairs(status) do
			local var3 = t[i] or i
			argCheckModule.assert(p0[var3] == nil, "Field '" .. tostring(var3) .. "' already exists in argument table!  Will be overwritten.")
			p0[var3] = v
		end
	end
end