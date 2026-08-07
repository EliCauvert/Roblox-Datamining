local parent = script.Parent.Parent
local playersService = game:GetService("Players")

return require(parent.Analytics.setupFireEvent)({
	analytics = require(parent.Analytics.AnalyticsService),
	infoForAllEvents = {
		isUnder13 = if playersService.LocalPlayer then playersService.LocalPlayer:GetUnder13() else nil,
		pid = tostring(game.PlaceId),
		source = require(parent.Constants).AnalyticsSource,
		uid = require(parent.Utils.getLocalUserId)(playersService)
	}
})