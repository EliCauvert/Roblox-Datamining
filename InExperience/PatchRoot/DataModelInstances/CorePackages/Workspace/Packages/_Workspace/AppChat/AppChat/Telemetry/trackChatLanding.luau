local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.Parent.SocialCommon)
local FFlagAppChatTTIStaleGuardModule = require(AppChat.Flags.FFlagAppChatTTIStaleGuard)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local Flag = false

return function(EntryPoint)
	-- upvalues: AppChatPerfTrackerModule (copy), FFlagAppChatTTIStaleGuardModule (copy), Flag (ref)
	pcall(function()
		-- upvalues: EntryPoint (copy), AppChatPerfTrackerModule (upval), FFlagAppChatTTIStaleGuardModule (upval), Flag (upval)
		if EntryPoint == nil then
			AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatLandingTTI, {})
			
			if FFlagAppChatTTIStaleGuardModule then
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatConversationTTI, {})
				
				return
			end
		else
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = EntryPoint, coldStart = not Flag })
			Flag = true
		end
	end)
end