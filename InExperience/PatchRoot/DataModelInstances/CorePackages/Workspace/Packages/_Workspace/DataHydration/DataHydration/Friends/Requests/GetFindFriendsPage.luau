local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local FFlagFriendsSignalMigrationTelemetry = require(Parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)
local FriendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(ResponseBody) --[[ Line: 34 ]]
	local List = {}
	local PageItems = ResponseBody and ResponseBody.PageItems or {}
	for _, pageItem in PageItems do
		if pageItem.id ~= nil then
			table.insert(List, (tostring(pageItem.id)))
		end
	end
	return List
end

return function(p1, p2) --[[ Line: 44 ]]
	-- upvalues: PromiseModule (copy), Url (copy), HttpService (copy), FFlagFriendsSignalMigrationTelemetry (copy), FriendsRequestTelemetryModule (copy), MyHttpRequestModule (copy), collectFriendIdsFromResponse (copy)
	if p1 == nil or tostring(p1) == "" then
		return PromiseModule.reject("GetFindFriendsPage called with nil userId")
	end
	local Formatted = string.format("%s/users/%s/friends/find?limit=%d", Url.FRIEND_URL, tostring(p1), p2.limit)
	local Cursor = p2.cursor
	
	if Cursor and Cursor ~= "" then
		Formatted = string.format("%s&cursor=%s", Formatted, HttpService:UrlEncode(Cursor))
	end
	local Sort = p2.sort
	
	if Sort ~= nil then
		Formatted = string.format("%s&userSort=%d", Formatted, Sort)
	end
	local RequestId = if FFlagFriendsSignalMigrationTelemetry then FriendsRequestTelemetryModule.generateRequestId() else nil
	
	return MyHttpRequestModule(Formatted, "GET", if FFlagFriendsSignalMigrationTelemetry then FriendsRequestTelemetryModule.getRequestOptions(RequestId) else nil):andThen(function(Result) --[[ Line: 70 ]]
		-- upvalues: FFlagFriendsSignalMigrationTelemetry (upval), RequestId (copy), FriendsRequestTelemetryModule (upval), collectFriendIdsFromResponse (upval)
		local ResponseBody = if Result then Result.responseBody else nil
		
		if FFlagFriendsSignalMigrationTelemetry and RequestId and ResponseBody then
			FriendsRequestTelemetryModule.emitFindFriendsResponse(RequestId, (collectFriendIdsFromResponse(ResponseBody)))
		end
		return ResponseBody
	end)
end