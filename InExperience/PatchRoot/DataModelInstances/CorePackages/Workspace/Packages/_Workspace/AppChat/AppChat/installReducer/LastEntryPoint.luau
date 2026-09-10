local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roduxModule = require(parent.Rodux)
local _ = require(parent.SocialCommon)
local enteredChatFromEntryPointModule = require(appChat.Actions.EnteredChatFromEntryPoint)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagSharedChatEntryPointAction = require(parent.SharedFlags).FFlagSharedChatEntryPointAction
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local var1 = false

local function _(p1)
	-- upvalues: appChatPerfTrackerModule (ref), var1 (write)
	pcall(function()
		-- upvalues: p1 (ref), appChatPerfTrackerModule (copy), var1 (copy)
		if p1 == nil then
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatLandingTTI, {})
			
			return
		end
		appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = p1, coldStart = not var1 })
		var1 = true
	end)
end

return roduxModule.createReducer("NotSet", {
	[enteredChatFromEntryPointModule.name] = function(_, p1)
		-- upvalues: fFlagSharedChatEntryPointAction (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), var1 (write)
		if fFlagSharedChatEntryPointAction and fFlagAppChatPerfTrackingModule then
			local entryPoint = p1.entryPoint
			pcall(function()
				-- upvalues: entryPoint (ref), appChatPerfTrackerModule (copy), var1 (copy)
				if entryPoint == nil then
					appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatLandingTTI, {})
					
					return
				end
				appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatLandingTTI, { entryPoint = entryPoint, coldStart = not var1 })
				var1 = true
			end)
		end
		return p1.entryPoint
	end
})