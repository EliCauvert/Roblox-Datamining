local HttpService = game:GetService("HttpService")
local DiscoveryAnalyticsModule = require(script:FindFirstAncestor("GameJoinCard").Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local PeopleListInHomePage = DiscoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local _ = require(script.Parent.Types)

return function(p1) --[[ Line: 11 | Named "logGamePlayIntent" ]]
	-- upvalues: GamePlayIntentFunction (copy), PeopleListInHomePage (copy), HttpService (copy)
	local UserId = p1.userId
	
	if UserId == "" then return end
	local Presence = p1.presence
	local PlaceId = Presence.placeId
	local Text: string = if PlaceId == nil or tostring(PlaceId) == "" then "" else tostring(PlaceId)
	local Number: number? = tonumber(Presence.rootPlaceId)
	
	if Text ~= "" and Number ~= nil then
		GamePlayIntentFunction(p1.eventIngest, PeopleListInHomePage, {
			placeId = Text,
			rootPlaceId = Number,
			friendId = UserId,
			joinAttemptId = HttpService:GenerateGUID(false)
		})
		
		return
	end
end