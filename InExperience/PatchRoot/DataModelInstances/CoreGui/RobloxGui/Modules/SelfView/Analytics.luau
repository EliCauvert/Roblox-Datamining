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
local var4 = "SelfView"

function t.new(p0)
	-- upvalues: rbxAnalyticsService (ref), t (ref)
	if not p0 then
		p0 = rbxAnalyticsService
	end
	assert(p0, "Analytics impl must not be nil.")
	
	return setmetatable({ _impl = p0 }, t)
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

function t:_report(p2, p3, _, p4)
	-- upvalues: runService (ref)
	self._impl:SendEventDeferred(if runService:IsStudio() then "studio" else "client", p2, p3, p4)
end

function t:reportMicState(p5)
	-- upvalues: playersService (ref), var4 (write)
	debugPrint("Self View: Analytics:reportMicState, newState: " .. tostring(p5) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(playersService.LocalPlayer.UserId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report(var4, "inExperienceMicState", tostring(p5), {
		state = p5,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function t:reportCamState(p6)
	-- upvalues: playersService (ref), var4 (write)
	debugPrint("Self View: Analytics:reporCamState, newState: " .. tostring(p6) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",uid: " .. tostring(playersService.LocalPlayer.UserId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report(var4, "inExperienceCamState", tostring(p6), {
		state = p6,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function t:reportSelfViewEnabledInCoreGuiState(p7)
	debugPrint("Self View: Analytics:reportSelfViewEnabledInCoreGuiState, newState: " .. tostring(p7) .. ",universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()))
	self:_report("SelfView", "enabledinCoreGuiState", tostring(p7), {
		state = p7,
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId())
	})
end

function t:reportSelfViewSessionStarted(p8, p9, p10, p11, p12, p13, p14, p15)
	-- upvalues: rbxAnalyticsService (ref)
	debugPrint("Self View: Analytics:reportSelfViewSessionStarted,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",x: " .. tostring(p8) .. ",y: " .. tostring(p9) .. ",width: " .. tostring(p10) .. ",height: " .. tostring(p11) .. ",x_relative: " .. tostring(p12) .. ",y_relative: " .. tostring(p13) .. ",width_relative: " .. tostring(p14) .. ",height_relative: " .. tostring(p15))
	self:_report("SelfView", "sessionStarted", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		x = tostring(p8),
		y = tostring(p9),
		width = tostring(p10),
		height = tostring(p11),
		x_relative = tostring(p12),
		y_relative = tostring(p13),
		width_relative = tostring(p14),
		height_relative = tostring(p15)
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

function t:reportUserAccountSettings(p16, p17)
	debugPrint("Self View: Analytics:reportUserAccountSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",userAccount_videoEnabled: " .. tostring(p16) .. ",userAccount_audioEnabled: " .. tostring(p17))
	self:_report("SelfView", "userAccountSettings", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		videoenabled = tostring(p16),
		audioenabled = tostring(p17)
	})
end

function t:reportExperienceSettings(p18, p19, p20)
	debugPrint("Self View: Analytics:reportExperienceSettings,universeid: " .. tostring(game.GameId) .. ",pid: " .. tostring(game.PlaceId) .. ",sessionid: " .. tostring(self._impl:GetSessionId()) .. ",experienceSettings_placeEnabled: " .. tostring(p18) .. ",experienceSettings_videoEnabled: " .. tostring(p19) .. ",experienceSettings_audioEnabled: " .. tostring(p20))
	self:_report("SelfView", "experienceSettings", "true", {
		universeid = tostring(game.GameId),
		pid = tostring(game.PlaceId),
		sessionid = tostring(self._impl:GetPlaySessionId()),
		placeenabled = tostring(p18),
		videoenabled = tostring(p19),
		audioenabled = tostring(p20)
	})
end

function t.setLastCtx(_, p21)
	-- upvalues: var4 (write)
	var4 = p21
end

return t