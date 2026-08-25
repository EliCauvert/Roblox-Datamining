local reactLowEndMemoryCutoff = game:DefineFastInt("ReactLowEndMemoryCutoff", 3500)
local reactHighEndMemoryCutoff = game:DefineFastInt("ReactHighEndMemoryCutoff", 7500)
local systemInfoProtocol = require(script:FindFirstAncestor("Devices").Parent.SystemInfoProtocol).SystemInfoProtocol
local _ = {
	LowEnd = "LowEnd",
	MidTier = "MidTier",
	HighEnd = "HighEnd"
}

return {
	GetDeviceMemoryTier = function()
		-- upvalues: systemInfoProtocol (ref), reactLowEndMemoryCutoff (ref), reactHighEndMemoryCutoff (ref)
		local ok, status = pcall(function()
			-- upvalues: systemInfoProtocol (copy)
			return systemInfoProtocol.default:getSystemInfo({ systemInfoProtocol.InfoNames.MAX_MEMORY })
		end)
		
		if not ok or typeof(status) ~= "table" then
			return nil
		end
		local var2 = tonumber(status[systemInfoProtocol.InfoNames.MAX_MEMORY])
		
		return if var2 then if var2 <= reactLowEndMemoryCutoff then "LowEnd" elseif reactHighEndMemoryCutoff <= var2 then "HighEnd" else "MidTier" else nil
	end
}