local DependenciesModule = require(script:FindFirstAncestor("VoiceChat").dependencies)
local SharedFlags = DependenciesModule.SharedFlags
local Default = DependenciesModule.LinkingProtocol.LinkingProtocol.default
local SettingsRoute = DependenciesModule.LinkingProtocol.Enums.SettingsRoute
local FFlagEnableRetryForLinkingProtocolFetch = SharedFlags.FFlagEnableRetryForLinkingProtocolFetch
local FIntLinkingProtocolFetchRetries = SharedFlags.FIntLinkingProtocolFetchRetries
local FIntLinkingProtocolFetchTimeoutMS = SharedFlags.FIntLinkingProtocolFetchTimeoutMS

return function(): boolean --[[ Line: 20 ]]
	-- upvalues: FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default (copy), SettingsRoute (copy), FIntLinkingProtocolFetchTimeoutMS (copy)
	local v1 = false
	local Enabled = false
	
	if FFlagEnableRetryForLinkingProtocolFetch then
		for _ = 0, FIntLinkingProtocolFetchRetries do
			local SpawnedThread = task.spawn(function() --[[ Line: 26 ]]
				-- upvalues: v1 (ref), Enabled (ref), Default (upval), SettingsRoute (upval)
				v1, Enabled = Default:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()
			end)
			task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
			task.cancel(SpawnedThread)
			
			if Enabled ~= nil then break end
		end
	else
		v1, Enabled = Default:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()
	end
	return v1 and Enabled == true
end