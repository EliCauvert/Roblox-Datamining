local LoggerModule = require(script:FindFirstAncestor("TextChannelWindow").Logger)
local SendPresetModule = require(script.Parent.sendPreset)

return function(p1, p2): boolean
	-- upvalues: SendPresetModule (copy), LoggerModule (copy)
	local SendPresetModuleResult = SendPresetModule(p1, p2)
	
	if SendPresetModuleResult == "Sent" then
		return true
	end
	if SendPresetModuleResult == "NoChannel" then
		LoggerModule:warning("Preset not sent: no reachable channel")
	elseif SendPresetModuleResult == "DirectChat" then
		LoggerModule:warning("Preset not sent: direct chats do not support Quick Words")
	end
	return false
end