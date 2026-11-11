local Parent = script.Parent.Parent
local Players = game:GetService("Players")

return (require(Parent.Analytics.setupFireEvent)({
	analytics = require(Parent.Analytics.AnalyticsService),
	infoForAllEvents = {
		isUnder13 = if Players.LocalPlayer then Players.LocalPlayer:GetUnder13() else nil,
		pid = tostring(game.PlaceId),
		source = require(Parent.Constants).AnalyticsSource,
		uid = require(Parent.Utils.getLocalUserId)(Players)
	}
}))