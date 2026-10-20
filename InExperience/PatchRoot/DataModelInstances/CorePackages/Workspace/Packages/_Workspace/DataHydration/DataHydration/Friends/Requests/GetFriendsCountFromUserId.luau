local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local MyHttpRequestModule = require(DataHydration.Friends.Networking.myHttpRequest)

return function(p1)
	-- upvalues: PromiseModule (copy), Url (copy), MyHttpRequestModule (copy)
	return if p1 == nil or tostring(p1) == "" then PromiseModule.reject("GetFriendsCountFromUserId called with nil userId") else MyHttpRequestModule(string.format("%s/users/%s/friends/count", Url.FRIEND_URL, (tostring(p1))), "GET"):andThen(function(Result)
		return if Result then Result.responseBody else nil
	end)
end