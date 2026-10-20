local LoggerModule = require(script:FindFirstAncestor("TextChannelWindow").Logger)
local SendPresetModule = require(script.Parent.sendPreset)

return function(p1, p2): boolean
	-- upvalues: SendPresetModule (copy), LoggerModule (copy)
	if p1.kind ~= "preset" then
		return false
	end
	local SendPresetModuleResult = SendPresetModule(p1.presetId, p2)
	
	if SendPresetModuleResult == "Sent" then
		return true
	end
	if SendPresetModuleResult == "NoChannel" then
		LoggerModule:warning("Preset not sent: no reachable channel")
	end
	return false
end