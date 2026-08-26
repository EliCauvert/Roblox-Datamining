local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local friendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(p1)
	local t = {}
	
	for i, v in if p1 then p1.data else {} do
		if v.id ~= nil then
			table.insert(t, tostring(v.id))
		end
	end
	return t
end

return function(p2)
	-- upvalues: promiseModule (ref), fFlagFriendsSignalMigrationTelemetry (ref), friendsRequestTelemetryModule (ref), url (ref), myHttpRequestModule (ref), collectFriendIdsFromResponse (ref)
	if p2 == nil or tostring(p2) == "" then
		return promiseModule.reject("GetOnlineFriends called with nil userId")
	end
	local var1 = if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.generateRequestId() else nil
	
	return myHttpRequestModule(string.format("%s/users/%s/friends/online", url.FRIEND_URL, tostring(p2)), "GET", if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.getRequestOptions(var1) else nil):andThen(function(p3)
		-- upvalues: fFlagFriendsSignalMigrationTelemetry (copy), var1 (ref), friendsRequestTelemetryModule (copy), collectFriendIdsFromResponse (copy)
		local var2 = if p3 then p3.responseBody else nil
		
		if fFlagFriendsSignalMigrationTelemetry and var1 and var2 then
			friendsRequestTelemetryModule.emitGetAllOnlineFriendsResponse(var1, collectFriendIdsFromResponse(var2))
		end
		return var2
	end)
end