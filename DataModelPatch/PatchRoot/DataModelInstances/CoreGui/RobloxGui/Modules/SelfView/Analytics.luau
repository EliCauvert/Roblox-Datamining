function debugPrint(_) end

debugPrint("Self View Analytics 10-19-2022__1")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule
AnalyticsModule.INFO = "info"
AnalyticsModule.WARNING = "warning"
AnalyticsModule.ERROR = "error"
local LastCtx = "SelfView"

function AnalyticsModule.new(_impl)
	-- upvalues: RbxAnalyticsService (copy), AnalyticsModule (copy)
	if not _impl then
		_impl = RbxAnalyticsService
	end
	assert(_impl, "Analytics impl must not be nil.")
	
	return (setmetatable({ _impl = _impl }, AnalyticsModule))
end

local function stub() end

function AnalyticsModule.stubService()
	-- upvalues: stub (copy)
	return {
		SetRBXEvent = stub,
		SetRBXEventStream = stub,
		SendEventDeferred = stub,
		ReportCounter = stub,
		ReportStats = stub,
		ReportInfluxSeries = stub,
		GetSessionId = stub
	}
end

function AnalyticsModule:setImpl(_impl)
	self._impl = _impl
end

function AnalyticsModule:_report(LastCtx, EventName, _, AdditionalArgs)
	-- upvalues: RunService (copy)
	self._impl:SendEventDeferred(if RunService:IsStudio() then "studio" else "client", LastCtx, EventName, AdditionalArgs)
end

function AnalyticsModule:reportMicState(State)
	-- upvalues: Players (copy), LastCtx (ref)
	debugPrint("Self View: Analytics:reportMicState, newState: " .. tostring(State) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(Players.LocalPlayer.UserId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report(LastCtx, "inExperienceMicState", tostring(State), {
		state = State,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		uid = tostring(Players.LocalPlayer.UserId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function AnalyticsModule:reportCamState(State)
	-- upvalues: Players (copy), LastCtx (ref)
	debugPrint("Self View: Analytics:reporCamState, newState: " .. tostring(State) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(Players.LocalPlayer.UserId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report(LastCtx, "inExperienceCamState", tostring(State), {
		state = State,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		uid = tostring(Players.LocalPlayer.UserId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function AnalyticsModule:reportSelfViewEnabledInCoreGuiState(State)
	debugPrint("Self View: Analytics:reportSelfViewEnabledInCoreGuiState, newState: " .. tostring(State) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report("SelfView", "enabledinCoreGuiState", tostring(State), {
		state = State,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function AnalyticsModule:reportSelfViewSessionStarted(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: RbxAnalyticsService (copy)
	debugPrint("Self View: Analytics:reportSelfViewSessionStarted,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",x: " .. tostring(p1) .. ",y: " .. tostring(p2) .. ",width: " .. tostring(p3) .. ",height: " .. tostring(p4) .. ",x_relative: " .. tostring(p5) .. ",y_relative: " .. tostring(p6) .. ",width_relative: " .. tostring(p7) .. ",height_relative: " .. tostring(p8))
	self:_report("SelfView", "sessionStarted", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		x = tostring(p1),
		y = tostring(p2),
		width = tostring(p3),
		height = tostring(p4),
		x_relative = tostring(p5),
		y_relative = tostring(p6),
		width_relative = tostring(p7),
		height_relative = tostring(p8)
	})
	RbxAnalyticsService:AddGlobalPointsField("feature/avatarChat/selfViewOn", 1)
end

function AnalyticsModule:reportSelfViewSessionStopped()
	-- upvalues: RbxAnalyticsService (copy)
	debugPrint("Self View: Analytics:reportSelfViewSessionStopped,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report("SelfView", "sessionStopped", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
	RbxAnalyticsService:AddGlobalPointsField("feature/avatarChat/selfViewOn", 0)
end

function AnalyticsModule:reportUserAccountSettings(p1, p2)
	debugPrint("Self View: Analytics:reportUserAccountSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",userAccount_videoEnabled: " .. tostring(p1) .. ",userAccount_audioEnabled: " .. tostring(p2))
	self:_report("SelfView", "userAccountSettings", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		videoenabled = tostring(p1),
		audioenabled = tostring(p2)
	})
end

function AnalyticsModule:reportExperienceSettings(p1, p2, p3)
	debugPrint("Self View: Analytics:reportExperienceSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",experienceSettings_placeEnabled: " .. tostring(p1) .. ",experienceSettings_videoEnabled: " .. tostring(p2) .. ",experienceSettings_audioEnabled: " .. tostring(p3))
	self:_report("SelfView", "experienceSettings", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		placeenabled = tostring(p1),
		videoenabled = tostring(p2),
		audioenabled = tostring(p3)
	})
end

function AnalyticsModule:setLastCtx(Value)
	-- upvalues: LastCtx (ref)
	LastCtx = Value
end

return AnalyticsModule