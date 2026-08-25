local playersService = game:GetService("Players")
local statsService = game:GetService("Stats")
local t = {}
t.__index = t
t.EventName = {
	MenuOpened = "emoteMenuOpened",
	EmotePlayed = "emoteTriggered",
	EmoteFailed = "emoteTriggerFailed"
}

function t.new()
	-- upvalues: t (ref)
	local t_1 = { eventStreamImpl = nil }
	setmetatable(t_1, t)
	
	return t_1
end

function t:withEventStream(p0)
	self.eventStreamImpl = p0
	
	return self
end

function t:onMenuOpened()
	-- upvalues: playersService (ref), statsService (ref)
	self:_getEventStream():setRBXEventStream("emoteMenu", self.EventName.MenuOpened, {
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		btid = statsService:GetBrowserTrackerId()
	})
end

function t:onEmotePlayed(p1, p2)
	-- upvalues: playersService (ref), statsService (ref)
	self:_getEventStream():setRBXEventStream("emoteMenu", self.EventName.EmotePlayed, {
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		btid = statsService:GetBrowserTrackerId(),
		slotNumber = p1,
		assetID = p2
	})
end

function t:onEmoteFailed(p3, p4, p5)
	-- upvalues: playersService (ref), statsService (ref)
	self:_getEventStream():setRBXEventStream("emoteMenu", self.EventName.EmoteFailed, {
		invokedByCoreGui = true,
		pid = tostring(game.PlaceId),
		uid = tostring(playersService.LocalPlayer.UserId),
		btid = statsService:GetBrowserTrackerId(),
		slotNumber = p3,
		assetID = p4,
		errorType = p5
	})
end

function t:_getEventStream()
	assert(self.eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?")
	
	return self.eventStreamImpl
end

return t