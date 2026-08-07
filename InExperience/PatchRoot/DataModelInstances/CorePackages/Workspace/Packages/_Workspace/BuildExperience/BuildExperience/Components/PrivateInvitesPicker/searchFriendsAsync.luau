local parent = script:FindFirstAncestor("BuildExperience").Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local urlBase = require(parent.UrlBuilder).UrlBase
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p0, p1, p2, p3) --[[ line: 39 | named "searchFriendsAsync" ]]
	-- upvalues: playersService (ref), promiseModule (ref), urlBase (ref), httpService (ref), fetch (ref), asPromise (ref)
	local var4 = p3
	
	if var4 == nil then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil then
			return promiseModule.reject("searchFriendsAsync: no local player")
		end
		var4 = localPlayer.UserId
	end
	local formattedText = string.format("%s/users/%d/friends/search?query=%s&limit=%d", urlBase.FRIENDS, var4, httpService:UrlEncode(p0), p2 or 20)
	
	if p1 ~= nil and p1 ~= "" then
		formattedText = string.format("%s&cursor=%s", formattedText, httpService:UrlEncode(p1))
	end
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "build-experience.friends-search",
		url = formattedText,
		decode = function(p5) --[[ line: 64 ]]
			return p5
		end
	})):andThen(function(p4) --[[ line: 69 ]]
		local t = {}
		
		for i, v in if p4 then p4.PageItems else {} do
			local var8 = if v.id ~= nil then nil else tonumber(v.id)
			
			if var8 ~= nil then
				table.insert(t, var8)
			end
		end
		local nextCursor = p4 and p4.NextCursor
		
		if nextCursor == "" then
			nextCursor = nil
		end
		return { ids = t, nextCursor = nextCursor }
	end)
end