local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local url = require(parent.Http).Url
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local friendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(p0) --[[ line: 32 ]]
	local t = {}
	
	for i, v in if p0 then p0.data else {} do
		if v.id ~= nil then
			table.insert(t, tostring(v.id))
		end
	end
	return t
end

return function(p1) --[[ line: 42 ]]
	-- upvalues: fFlagFriendsSignalMigrationTelemetry (ref), friendsRequestTelemetryModule (ref), url (ref), myHttpRequestModule (ref), collectFriendIdsFromResponse (ref)
	local var5 = if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.generateRequestId() else nil
	
	return myHttpRequestModule(string.format("%s/users/%s/friends/online", url.FRIEND_URL, tostring(p1)), "GET", if fFlagFriendsSignalMigrationTelemetry then friendsRequestTelemetryModule.getRequestOptions(var5) else nil):andThen(function(p2) --[[ line: 49 ]]
		-- upvalues: fFlagFriendsSignalMigrationTelemetry (copy), var5 (ref), friendsRequestTelemetryModule (copy), collectFriendIdsFromResponse (copy)
		local var6 = if p2 then p2.responseBody else nil
		
		if fFlagFriendsSignalMigrationTelemetry and var5 and var6 then
			friendsRequestTelemetryModule.emitGetAllOnlineFriendsResponse(var5, collectFriendIdsFromResponse(var6))
		end
		return var6
	end)
end