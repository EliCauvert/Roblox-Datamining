local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.SocialCommon)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local TrackChatLandingModule = require(AppChat.Telemetry.trackChatLanding)

return require(Parent.Rodux).createReducer("NotSet", {
	[require(AppChat.Actions.EnteredChatFromEntryPoint).name] = function(_, p1)
		-- upvalues: FFlagAppChatPerfTrackingModule (copy), TrackChatLandingModule (copy)
		if FFlagAppChatPerfTrackingModule then
			TrackChatLandingModule(p1.entryPoint)
		end
		return p1.entryPoint
	end
})