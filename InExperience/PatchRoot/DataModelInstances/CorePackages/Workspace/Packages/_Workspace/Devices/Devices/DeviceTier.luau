local ReactLowEndMemoryCutoff = game:DefineFastInt("ReactLowEndMemoryCutoff", 3500)
local ReactHighEndMemoryCutoff = game:DefineFastInt("ReactHighEndMemoryCutoff", 7500)
local SystemInfoProtocol = require(script:FindFirstAncestor("Devices").Parent.SystemInfoProtocol).SystemInfoProtocol

return {
	GetDeviceMemoryTier = function() --[[ Line: 27 ]]
		-- upvalues: SystemInfoProtocol (copy), ReactLowEndMemoryCutoff (copy), ReactHighEndMemoryCutoff (copy)
		local Success, Result = pcall(function() --[[ Line: 28 ]]
			-- upvalues: SystemInfoProtocol (upval)
			return SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.MAX_MEMORY })
		end)
		
		if Success and typeof(Result) == "table" then
			local Number: number? = tonumber(Result[SystemInfoProtocol.InfoNames.MAX_MEMORY])
			
			return if Number then if Number <= ReactLowEndMemoryCutoff then "LowEnd" elseif ReactHighEndMemoryCutoff <= Number then "HighEnd" else "MidTier" else nil
		else
			return nil
		end
	end
}