local loggerModule = require(script:FindFirstAncestor("TextChannelWindow").Logger)
local sendPresetModule = require(script.Parent.sendPreset)

return function(p1, p2)
	-- upvalues: sendPresetModule (ref), loggerModule (ref)
	if p1.kind ~= "preset" then
		return false
	end
	local var1 = sendPresetModule(p1.presetId, p2)
	
	if var1 == "Sent" then
		return true
	elseif var1 == "NoChannel" then
		loggerModule:warning("Preset not sent: no reachable channel")
	end
	return false
end