local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.SocialCommon)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagSharedChatEntryPointAction = require(Parent.SharedFlags).FFlagSharedChatEntryPointAction
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local Flag = false

local function _(EntryPoint) --[[ Line: 22 | Named "trackChatLanding" ]]
	-- upvalues: AppChatPerfTrackerModule (copy), Flag (ref)
	pcall(function() --[[ Line: 23 ]]
		-- upvalues: EntryPoint (copy), AppChatPerfTrackerModule (upval), Flag (upval)
		if EntryPoint == nil then
			AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatLandingTTI, {})
			
			return
		else
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = EntryPoint, coldStart = not Flag })
			Flag = true
		end
	end)
end

return require(Parent.Rodux).createReducer("NotSet", {
	[require(AppChat.Actions.EnteredChatFromEntryPoint).name] = function(_, p1) --[[ Line: 39 ]]
		-- upvalues: FFlagSharedChatEntryPointAction (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), Flag (ref)
		if FFlagSharedChatEntryPointAction and FFlagAppChatPerfTrackingModule then
			local EntryPoint = p1.entryPoint
			pcall(function() --[[ Line: 23 ]]
				-- upvalues: EntryPoint (copy), AppChatPerfTrackerModule (upval), Flag (upval)
				if EntryPoint == nil then
					AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatLandingTTI, {})
					
					return
				else
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = EntryPoint, coldStart = not Flag })
					Flag = true
				end
			end)
		end
		return p1.entryPoint
	end
})