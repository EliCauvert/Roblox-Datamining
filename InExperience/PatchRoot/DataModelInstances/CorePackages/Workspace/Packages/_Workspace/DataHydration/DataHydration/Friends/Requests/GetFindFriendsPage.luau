local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local url = require(parent.Http).Url
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local friendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(p0) --[[ line: 34 ]]
	local t = {}
	
	for i, v in if p0 then p0.PageItems else {} do
		if v.id ~= nil then
			table.insert(t, tostring(v.id))
		end
	end
	return t
end

return function(p1, p2) --[[ line: 44 ]]
	-- upvalues: url (ref), httpService (ref), fFlagFriendsSignalMigrationTelemetry (ref), friendsRequestTelemetryModule (ref), myHttpRequestModule (ref), collectFriendIdsFromResponse (ref)
	local formattedText = string.format("%s/users/%s/friends/find?limit=%d", url.FRIEND_URL, tostring(p1), p2.limit)
	local cursor = p2.cursor
	
	if cursor and cursor ~= "" then
		formattedText = string.format("%s&cursor=%s", formattedText, httpService:UrlEncode(cursor))
	end
	local sort = p2.sort
	
	if sort ~= nil then
		formattedText = string.format("%s&userSort=%d", formattedText, sort)
	end
	local var7 = if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.generateRequestId() else nil
	
	return myHttpRequestModule(formattedText, "GET", if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.getRequestOptions(var7) else nil):andThen(function(p3) --[[ line: 66 ]]
		-- upvalues: fFlagFriendsSignalMigrationTelemetry (copy), var7 (ref), friendsRequestTelemetryModule (copy), collectFriendIdsFromResponse (copy)
		local var8 = if p3 then p3.responseBody else nil
		
		if fFlagFriendsSignalMigrationTelemetry and var7 and var8 then
			friendsRequestTelemetryModule.emitFindFriendsResponse(var7, collectFriendIdsFromResponse(var8))
		end
		return var8
	end)
end