local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.SocialCommon)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local Flag = false

return require(Parent.Rodux).makeActionCreator(script.Name, function(EntryPoint)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), Flag (ref)
	if FFlagAppChatPerfTrackingModule then
		if EntryPoint == nil then
			AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatLandingTTI, {})
		else
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = EntryPoint, coldStart = not Flag })
			Flag = true
		end
	end
	return { entryPoint = EntryPoint }
end)