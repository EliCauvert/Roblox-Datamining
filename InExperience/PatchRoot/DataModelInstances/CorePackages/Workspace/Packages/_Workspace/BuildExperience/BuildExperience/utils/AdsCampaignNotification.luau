local HttpService = game:GetService("HttpService")

local function getDeepLink(p1) --[[ Line: 6 ]]
	if typeof(p1) == "table" and typeof(p1.type) == "string" and string.lower(p1.type) == "ads" then
		local UniverseId = p1.universeId
		local Number = if typeof(UniverseId) == "number" or typeof(UniverseId) == "string" then tonumber(UniverseId) else nil
		
		return if Number == nil or Number <= 0 or Number % 1 ~= 0 then nil else `roblox://navigation/build?universeId={Number}&type=ads`
	else
		return nil
	end
end

return {
	NotificationType = "BuildAdsCampaign",
	EventName = "BuildAdsCampaign",
	getDeepLink = getDeepLink,
	connect = function(p1, Callback1, Callback) --[[ Line: 18 ]]
		-- upvalues: HttpService (copy), getDeepLink (copy)
		return p1:RegisterCallback(p1.ToastEvents.UserAction, "BuildAdsCampaign", function(p2) --[[ Line: 22 ]]
			-- upvalues: HttpService (upval), getDeepLink (upval), Callback (copy), Callback1 (copy)
			if typeof(p2) ~= "table" or p2.userActionType ~= "click" or typeof(p2.visualItem) ~= "table" or p2.visualItem.eventName ~= "BuildAdsCampaign" or typeof(p2.visualItem.actionEventParams) ~= "string" or typeof(p2.notificationData) ~= "table" or typeof(p2.notificationData.id) ~= "string" then return end
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2.visualItem.actionEventParams)
			local DeepLink = if Success then getDeepLink(Result) else nil
			
			if DeepLink ~= nil then
				Callback(p2.notificationData.id)
				Callback1(DeepLink)
			end
		end)
	end
}