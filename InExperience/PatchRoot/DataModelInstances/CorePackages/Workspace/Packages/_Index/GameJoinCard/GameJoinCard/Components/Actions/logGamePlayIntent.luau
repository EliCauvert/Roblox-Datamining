local httpService = game:GetService("HttpService")
local discoveryAnalyticsModule = require(script:FindFirstAncestor("GameJoinCard").Parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local peopleListInHomePage = discoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: gamePlayIntent (ref), peopleListInHomePage (ref), httpService (ref)
	local userId = p1.userId
	
	if userId == "" then return end
	local presence = p1.presence
	local placeId = presence.placeId
	local var1 = if placeId == nil or tostring(placeId) == "" then "" else tostring(placeId)
	local var2 = tonumber(presence.rootPlaceId)
	
	if var1 == "" or var2 == nil then
		return
	end
	gamePlayIntent(p1.eventIngest, peopleListInHomePage, {
		placeId = var1,
		rootPlaceId = var2,
		friendId = userId,
		joinAttemptId = httpService:GenerateGUID(false)
	})
end