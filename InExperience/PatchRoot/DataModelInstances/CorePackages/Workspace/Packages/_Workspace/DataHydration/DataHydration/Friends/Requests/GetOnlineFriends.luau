local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local friendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(p0) --[[ line: 33 ]]
	local t = {}
	
	for i, v in if p0 then p0.data else {} do
		if v.id ~= nil then
			table.insert(t, tostring(v.id))
		end
	end
	return t
end

return function(p1) --[[ line: 43 ]]
	-- upvalues: promiseModule (ref), fFlagFriendsSignalMigrationTelemetry (ref), friendsRequestTelemetryModule (ref), url (ref), myHttpRequestModule (ref), collectFriendIdsFromResponse (ref)
	if p1 == nil or tostring(p1) == "" then
		return promiseModule.reject("GetOnlineFriends called with nil userId")
	end
	local var6 = if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.generateRequestId() else nil
	
	return myHttpRequestModule(string.format("%s/users/%s/friends/online", url.FRIEND_URL, tostring(p1)), "GET", if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.getRequestOptions(var6) else nil):andThen(function(p2) --[[ line: 54 ]]
		-- upvalues: fFlagFriendsSignalMigrationTelemetry (copy), var6 (ref), friendsRequestTelemetryModule (copy), collectFriendIdsFromResponse (copy)
		local var7 = if p2 then p2.responseBody else nil
		
		if fFlagFriendsSignalMigrationTelemetry and var6 and var7 then
			friendsRequestTelemetryModule.emitGetAllOnlineFriendsResponse(var6, collectFriendIdsFromResponse(var7))
		end
		return var7
	end)
end