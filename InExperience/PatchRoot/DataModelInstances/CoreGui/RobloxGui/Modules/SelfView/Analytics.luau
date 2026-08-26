function debugPrint(_) end

debugPrint("Self View Analytics 10-19-2022__1")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local t = {}
t.__index = t
t.INFO = "info"
t.WARNING = "warning"
t.ERROR = "error"
local var1 = "SelfView"

function t.new(p1)
	-- upvalues: rbxAnalyticsService (ref), t (ref)
	if not p1 then
		p1 = rbxAnalyticsService
	end
	assert(p1, "Analytics impl must not be nil.")
	
	return setmetatable({ _impl = p1 }, t)
end

local function stub() end

function t.stubService()
	-- upvalues: stub (ref)
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

function t:setImpl(p1)
	self._impl = p1
end

function t:_report(p1, p2, _, p3)
	-- upvalues: runService (ref)
	self._impl:SendEventDeferred(if runService:IsStudio() then "studio" else "client", p1, p2, p3)
end

function t:reportMicState(p1)
	-- upvalues: playersService (ref), var1 (write)
	debugPrint("Self View: Analytics:reportMicState, newState: " .. tostring(p1) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(playersService.LocalPlayer.UserId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report(var1, "inExperienceMicState", tostring(p1), {
		state = p1,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function t:reportCamState(p1)
	-- upvalues: playersService (ref), var1 (write)
	debugPrint("Self View: Analytics:reporCamState, newState: " .. tostring(p1) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(playersService.LocalPlayer.UserId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report(var1, "inExperienceCamState", tostring(p1), {
		state = p1,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function t:reportSelfViewEnabledInCoreGuiState(p1)
	debugPrint("Self View: Analytics:reportSelfViewEnabledInCoreGuiState, newState: " .. tostring(p1) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report("SelfView", "enabledinCoreGuiState", tostring(p1), {
		state = p1,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function t:reportSelfViewSessionStarted(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: rbxAnalyticsService (ref)
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
	rbxAnalyticsService:AddGlobalPointsField("feature/avatarChat/selfViewOn", 1)
end

function t:reportSelfViewSessionStopped()
	-- upvalues: rbxAnalyticsService (ref)
	debugPrint("Self View: Analytics:reportSelfViewSessionStopped,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report("SelfView", "sessionStopped", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
	rbxAnalyticsService:AddGlobalPointsField("feature/avatarChat/selfViewOn", 0)
end

function t:reportUserAccountSettings(p1, p2)
	debugPrint("Self View: Analytics:reportUserAccountSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",userAccount_videoEnabled: " .. tostring(p1) .. ",userAccount_audioEnabled: " .. tostring(p2))
	self:_report("SelfView", "userAccountSettings", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		videoenabled = tostring(p1),
		audioenabled = tostring(p2)
	})
end

function t:reportExperienceSettings(p1, p2, p3)
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

function t.setLastCtx(_, p1)
	-- upvalues: var1 (write)
	var1 = p1
end

return t