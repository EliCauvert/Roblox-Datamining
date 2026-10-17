local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoduxModule = require(Parent.Rodux)
local SocialCommonModule = require(Parent.SocialCommon)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatTTIStaleGuardModule = require(AppChat.Flags.FFlagAppChatTTIStaleGuard)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)

if require(Parent.SharedFlags).FFlagSharedChatEntryPointAction then
	return SocialCommonModule.Actions.EnteredChatFromEntryPoint
else
	local Flag = false
	
	return RoduxModule.makeActionCreator(script.Name, function(EntryPoint) --[[ Line: 28 ]]
		-- upvalues: FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), FFlagAppChatTTIStaleGuardModule (copy), Flag (ref)
		if FFlagAppChatPerfTrackingModule then
			if EntryPoint == nil then
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatLandingTTI, {})
				
				if FFlagAppChatTTIStaleGuardModule then
					AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatConversationTTI, {})
				end
			else
				AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = EntryPoint, coldStart = not Flag })
				Flag = true
			end
		end
		return { entryPoint = EntryPoint }
	end)
end