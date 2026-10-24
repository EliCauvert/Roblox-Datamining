local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.SocialCommon)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagSharedChatEntryPointAction = require(Parent.SharedFlags).FFlagSharedChatEntryPointAction
local TrackChatLandingModule = require(AppChat.Telemetry.trackChatLanding)

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), FFlagSharedChatEntryPointAction (copy), FFlagAppChatPerfTrackingModule (copy), TrackChatLandingModule (copy)
	local NotSet, NotSet2 = CreateSessionScopedSignalFunction("NotSet")
	
	return {
		getLastEntryPoint = NotSet,
		enteredChatFromEntryPoint = function(p1)
			-- upvalues: FFlagSharedChatEntryPointAction (upval), FFlagAppChatPerfTrackingModule (upval), TrackChatLandingModule (upval), NotSet2 (copy)
			if FFlagSharedChatEntryPointAction and FFlagAppChatPerfTrackingModule then
				TrackChatLandingModule(p1)
			end
			NotSet2(p1 or "NotSet")
		end,
		reset = function()
			-- upvalues: NotSet2 (copy)
			NotSet2("NotSet")
		end
	}
end