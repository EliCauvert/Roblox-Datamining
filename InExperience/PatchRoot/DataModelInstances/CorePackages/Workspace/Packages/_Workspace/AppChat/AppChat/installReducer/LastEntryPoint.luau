local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.SocialCommon)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagSharedChatEntryPointAction = require(Parent.SharedFlags).FFlagSharedChatEntryPointAction
local TrackChatLandingModule = require(AppChat.Telemetry.trackChatLanding)

return require(Parent.Rodux).createReducer("NotSet", {
	[require(AppChat.Actions.EnteredChatFromEntryPoint).name] = function(_, p1)
		-- upvalues: FFlagSharedChatEntryPointAction (copy), FFlagAppChatPerfTrackingModule (copy), TrackChatLandingModule (copy)
		if FFlagSharedChatEntryPointAction and FFlagAppChatPerfTrackingModule then
			TrackChatLandingModule(p1.entryPoint)
		end
		return p1.entryPoint
	end
})