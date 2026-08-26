local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local url = require(parent.Http).Url
local myHttpRequestModule = require(dataHydration.Friends.Networking.myHttpRequest)
local fFlagEnableGetFriendshipStatus = require(parent.SharedFlags).FFlagEnableGetFriendshipStatus

local function _(p1)
	return string.match(p1, "^%d+$") ~= nil
end

return function(p1, p2)
	-- upvalues: fFlagEnableGetFriendshipStatus (ref), httpService (ref), url (ref), myHttpRequestModule (ref)
	local var1 = p2
	
	if fFlagEnableGetFriendshipStatus then
		var1 = {}
		
		for i, v in p2 do
			if string.match(v, "^%d+$") ~= nil then
				table.insert(var1, v)
			end
		end
	end
	return myHttpRequestModule(string.format("%s/users/%s/friends/statuses?userIds=%s", url.FRIEND_URL, tostring(p1), httpService:UrlEncode(table.concat(var1, ","))), "GET"):andThen(function(p3)
		return if p3 then p3.responseBody else nil
	end)
end