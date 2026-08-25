local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local friendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(p0)
	local t = {}
	
	for i, v in if p0 then p0.PageItems else {} do
		if v.id ~= nil then
			table.insert(t, tostring(v.id))
		end
	end
	return t
end

return function(p1, p2)
	-- upvalues: promiseModule (ref), url (ref), httpService (ref), fFlagFriendsSignalMigrationTelemetry (ref), friendsRequestTelemetryModule (ref), myHttpRequestModule (ref), collectFriendIdsFromResponse (ref)
	if p1 == nil or tostring(p1) == "" then
		return promiseModule.reject("GetFindFriendsPage called with nil userId")
	end
	local formattedText = string.format("%s/users/%s/friends/find?limit=%d", url.FRIEND_URL, tostring(p1), p2.limit)
	local cursor = p2.cursor
	
	if cursor and cursor ~= "" then
		formattedText = string.format("%s&cursor=%s", formattedText, httpService:UrlEncode(cursor))
	end
	local sort = p2.sort
	
	if sort ~= nil then
		formattedText = string.format("%s&userSort=%d", formattedText, sort)
	end
	local var8 = if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.generateRequestId() else nil
	
	return myHttpRequestModule(formattedText, "GET", if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.getRequestOptions(var8) else nil):andThen(function(p3)
		-- upvalues: fFlagFriendsSignalMigrationTelemetry (copy), var8 (ref), friendsRequestTelemetryModule (copy), collectFriendIdsFromResponse (copy)
		local var9 = if p3 then p3.responseBody else nil
		
		if fFlagFriendsSignalMigrationTelemetry and var8 and var9 then
			friendsRequestTelemetryModule.emitFindFriendsResponse(var8, collectFriendIdsFromResponse(var9))
		end
		return var9
	end)
end