local Players = game:GetService("Players")
local StatsService = game:GetService("Stats")
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule
AnalyticsModule.EventName = {
	MenuOpened = "emoteMenuOpened",
	EmotePlayed = "emoteTriggered",
	EmoteFailed = "emoteTriggerFailed"
}

function AnalyticsModule.new()
	-- upvalues: AnalyticsModule (copy)
	local config = { eventStreamImpl = nil }
	setmetatable(config, AnalyticsModule)
	
	return config
end

function AnalyticsModule:withEventStream(EventStreamImpl)
	self.eventStreamImpl = EventStreamImpl
	
	return self
end

function AnalyticsModule:onMenuOpened()
	-- upvalues: Players (copy), StatsService (copy)
	self:_getEventStream():setRBXEventStream("emoteMenu", self.EventName.MenuOpened, {
		pid = tostring(game.PlaceId),
		uid = tostring(Players.LocalPlayer.UserId),
		btid = StatsService:GetBrowserTrackerId()
	})
end

function AnalyticsModule:onEmotePlayed(SlotNumber, AssetID)
	-- upvalues: Players (copy), StatsService (copy)
	self:_getEventStream():setRBXEventStream("emoteMenu", self.EventName.EmotePlayed, {
		pid = tostring(game.PlaceId),
		uid = tostring(Players.LocalPlayer.UserId),
		btid = StatsService:GetBrowserTrackerId(),
		slotNumber = SlotNumber,
		assetID = AssetID
	})
end

function AnalyticsModule:onEmoteFailed(SlotNumber, AssetID, ErrorType)
	-- upvalues: Players (copy), StatsService (copy)
	self:_getEventStream():setRBXEventStream("emoteMenu", self.EventName.EmoteFailed, {
		invokedByCoreGui = true,
		pid = tostring(game.PlaceId),
		uid = tostring(Players.LocalPlayer.UserId),
		btid = StatsService:GetBrowserTrackerId(),
		slotNumber = SlotNumber,
		assetID = AssetID,
		errorType = ErrorType
	})
end

function AnalyticsModule:_getEventStream()
	assert(self.eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?")
	
	return self.eventStreamImpl
end

return AnalyticsModule