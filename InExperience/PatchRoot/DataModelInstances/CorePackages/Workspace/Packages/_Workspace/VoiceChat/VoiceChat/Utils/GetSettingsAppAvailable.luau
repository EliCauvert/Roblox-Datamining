local dependenciesModule = require(script:FindFirstAncestor("VoiceChat").dependencies)
local sharedFlags = dependenciesModule.SharedFlags
local default = dependenciesModule.LinkingProtocol.LinkingProtocol.default
local settingsRoute = dependenciesModule.LinkingProtocol.Enums.SettingsRoute
local fFlagEnableRetryForLinkingProtocolFetch = sharedFlags.FFlagEnableRetryForLinkingProtocolFetch
local fIntLinkingProtocolFetchRetries = sharedFlags.FIntLinkingProtocolFetchRetries
local fIntLinkingProtocolFetchTimeoutMS = sharedFlags.FIntLinkingProtocolFetchTimeoutMS

return function()
	-- upvalues: fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref)
	local var1 = false
	local var2 = false
	
	if fFlagEnableRetryForLinkingProtocolFetch then
		for _ = 0, fIntLinkingProtocolFetchRetries do
			local thread = task.spawn(function()
				-- upvalues: var1 (write), var2 (write), default (copy), settingsRoute (copy)
				local var6, var7 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
				var1 = var6
				var2 = var7
			end)
			task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
			task.cancel(thread)
			
			if var2 == nil then
				continue
			end
		end
	else
		local var4, var5 = default:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
		var1 = var4
		var2 = var5
	end
	return var1 and var2 == true
end