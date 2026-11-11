local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local FFlagFriendsSignalMigrationTelemetry = require(Parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)
local FriendsRequestTelemetryModule = require(script.Parent.FriendsRequestTelemetry)

local function collectFriendIdsFromResponse(ResponseBody)
	local List = {}
	local Data = ResponseBody and ResponseBody.data or {}
	for _, entry in Data do
		if entry.id ~= nil then
			table.insert(List, (tostring(entry.id)))
		end
	end
	return List
end

return function(p1)
	-- upvalues: PromiseModule (copy), FFlagFriendsSignalMigrationTelemetry (copy), FriendsRequestTelemetryModule (copy), Url (copy), MyHttpRequestModule (copy), collectFriendIdsFromResponse (copy)
	if p1 == nil or tostring(p1) == "" then
		return PromiseModule.reject("GetOnlineFriends called with nil userId")
	else
		local RequestId = if FFlagFriendsSignalMigrationTelemetry then FriendsRequestTelemetryModule.generateRequestId() else nil
		
		return MyHttpRequestModule(string.format("%s/users/%s/friends/online", Url.FRIEND_URL, (tostring(p1))), "GET", if FFlagFriendsSignalMigrationTelemetry then FriendsRequestTelemetryModule.getRequestOptions(RequestId) else nil):andThen(function(Result)
			-- upvalues: FFlagFriendsSignalMigrationTelemetry (upval), RequestId (copy), FriendsRequestTelemetryModule (upval), collectFriendIdsFromResponse (upval)
			local ResponseBody = if Result then Result.responseBody else nil
			
			if FFlagFriendsSignalMigrationTelemetry and RequestId and ResponseBody then
				FriendsRequestTelemetryModule.emitGetAllOnlineFriendsResponse(RequestId, (collectFriendIdsFromResponse(ResponseBody)))
			end
			return ResponseBody
		end)
	end
end