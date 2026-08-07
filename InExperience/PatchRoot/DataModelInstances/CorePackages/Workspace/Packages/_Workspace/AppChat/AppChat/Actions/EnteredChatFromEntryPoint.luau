local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roduxModule = require(parent.Rodux)
local _ = require(parent.SocialCommon)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local var4 = false

return roduxModule.makeActionCreator(script.Name, function(p0) --[[ line: 16 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), var4 (write)
	if fFlagAppChatPerfTrackingModule then
		if p0 == nil then
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatLandingTTI, {})
		else
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = p0, coldStart = not var4 })
			var4 = true
		end
	end
	return { entryPoint = p0 }
end)