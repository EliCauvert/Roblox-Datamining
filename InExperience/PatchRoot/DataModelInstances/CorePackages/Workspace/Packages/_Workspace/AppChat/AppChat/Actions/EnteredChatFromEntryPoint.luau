local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roduxModule = require(parent.Rodux)
local _ = require(parent.SocialCommon)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local var1 = false

return roduxModule.makeActionCreator(script.Name, function(p1)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), var1 (write)
	if fFlagAppChatPerfTrackingModule then
		if p1 == nil then
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatLandingTTI, {})
		else
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = p1, coldStart = not var1 })
			var1 = true
		end
	end
	return { entryPoint = p1 }
end)