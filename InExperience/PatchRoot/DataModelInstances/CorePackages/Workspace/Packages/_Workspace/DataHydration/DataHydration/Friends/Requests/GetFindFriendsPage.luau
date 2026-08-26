local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local friendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(p1)
	local t = {}
	
	for i, v in if p1 then p1.PageItems else {} do
		if v.id ~= nil then
			table.insert(t, tostring(v.id))
		end
	end
	return t
end

return function(p2, p3)
	-- upvalues: promiseModule (ref), url (ref), httpService (ref), fFlagFriendsSignalMigrationTelemetry (ref), friendsRequestTelemetryModule (ref), myHttpRequestModule (ref), collectFriendIdsFromResponse (ref)
	if p2 == nil or tostring(p2) == "" then
		return promiseModule.reject("GetFindFriendsPage called with nil userId")
	end
	local formattedText = string.format("%s/users/%s/friends/find?limit=%d", url.FRIEND_URL, tostring(p2), p3.limit)
	local cursor = p3.cursor
	
	if cursor and cursor ~= "" then
		formattedText = string.format("%s&cursor=%s", formattedText, httpService:UrlEncode(cursor))
	end
	local sort = p3.sort
	
	if sort ~= nil then
		formattedText = string.format("%s&userSort=%d", formattedText, sort)
	end
	local var1 = if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.generateRequestId() else nil
	
	return myHttpRequestModule(formattedText, "GET", if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.getRequestOptions(var1) else nil):andThen(function(p4)
		-- upvalues: fFlagFriendsSignalMigrationTelemetry (copy), var1 (ref), friendsRequestTelemetryModule (copy), collectFriendIdsFromResponse (copy)
		local var2 = if p4 then p4.responseBody else nil
		
		if fFlagFriendsSignalMigrationTelemetry and var1 and var2 then
			friendsRequestTelemetryModule.emitFindFriendsResponse(var1, collectFriendIdsFromResponse(var2))
		end
		return var2
	end)
end