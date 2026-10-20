local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local Url = require(Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)
local FFlagEnableGetFriendshipStatus = require(Parent.SharedFlags).FFlagEnableGetFriendshipStatus

local function _(Text: string): boolean
	return string.match(Text, "^%d+$") ~= nil
end

return function(p1, List1)
	-- upvalues: FFlagEnableGetFriendshipStatus (copy), HttpService (copy), Url (copy), MyHttpRequestModule (copy)
	local List = List1
	
	if FFlagEnableGetFriendshipStatus then
		List = {}
		
		for _, value in List1 do
			if string.match(value, "^%d+$") ~= nil then
				table.insert(List, value)
			end
		end
	end
	return MyHttpRequestModule(string.format("%s/users/%s/friends/statuses?userIds=%s", Url.FRIEND_URL, tostring(p1), (HttpService:UrlEncode(table.concat(List, ",")))), "GET"):andThen(function(Result)
		return if Result then Result.responseBody else nil
	end)
end