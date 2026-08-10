local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local url = require(parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local fFlagEnableGetFriendshipStatus = require(parent.SharedFlags).FFlagEnableGetFriendshipStatus

local function _(p0) --[[ line: 23 | named "isNumericUserId" ]]
	return string.match(p0, "^%d+$") ~= nil
end

return function(p1, p2) --[[ line: 27 ]]
	-- upvalues: fFlagEnableGetFriendshipStatus (ref), httpService (ref), url (ref), myHttpRequestModule (ref)
	local var3 = p2
	
	if fFlagEnableGetFriendshipStatus then
		var3 = {}
		
		for i, v in p2 do
			if string.match(v, "^%d+$") ~= nil then
				table.insert(var3, v)
			end
		end
	end
	return myHttpRequestModule(string.format("%s/users/%s/friends/statuses?userIds=%s", url.FRIEND_URL, tostring(p1), httpService:UrlEncode(table.concat(var3, ","))), "GET"):andThen(function(p3) --[[ line: 42 ]]
		return if p3 then p3.responseBody else nil
	end)
end