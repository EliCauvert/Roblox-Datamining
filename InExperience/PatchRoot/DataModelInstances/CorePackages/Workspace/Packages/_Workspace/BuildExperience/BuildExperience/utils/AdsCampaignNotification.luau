local httpService = game:GetService("HttpService")

local function getDeepLink(p1)
	if typeof(p1) ~= "table" or typeof(p1.type) ~= "string" or string.lower(p1.type) ~= "ads" then
		return nil
	end
	local universeId = p1.universeId
	local var1 = if typeof(universeId) == "number" or typeof(universeId) == "string" then tonumber(universeId) else nil
	
	return if var1 == nil or var1 <= 0 or var1 % 1 ~= 0 then nil else `roblox://navigation/build?universeId={var1}&type=ads`
end

return {
	NotificationType = "BuildAdsCampaign",
	EventName = "BuildAdsCampaign",
	getDeepLink = getDeepLink,
	connect = function(p1, p2, p3)
		-- upvalues: httpService (ref), getDeepLink (ref)
		return p1:RegisterCallback(p1.ToastEvents.UserAction, "BuildAdsCampaign", function(p4)
			-- upvalues: httpService (copy), getDeepLink (copy), p3 (ref), p2 (ref)
			if typeof(p4) ~= "table" or p4.userActionType ~= "click" or (typeof(p4.visualItem) ~= "table" or p4.visualItem.eventName ~= "BuildAdsCampaign") or (typeof(p4.visualItem.actionEventParams) ~= "string" or typeof(p4.notificationData) ~= "table" or typeof(p4.notificationData.id) ~= "string") then return end
			local ok, status = pcall(httpService.JSONDecode, httpService, p4.visualItem.actionEventParams)
			local var1 = if ok then getDeepLink(status) else nil
			
			if var1 ~= nil then
				p3(p4.notificationData.id)
				p2(var1)
			end
		end)
	end
}