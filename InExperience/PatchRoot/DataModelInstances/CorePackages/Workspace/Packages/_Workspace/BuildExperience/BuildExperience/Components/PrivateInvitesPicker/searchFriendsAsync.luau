local parent = script:FindFirstAncestor("BuildExperience").Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local urlBase = require(parent.UrlBuilder).UrlBase
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2, p3, p4)
	-- upvalues: playersService (ref), promiseModule (ref), urlBase (ref), httpService (ref), fetch (ref), asPromise (ref)
	local var1 = p4
	
	if var1 == nil then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil then
			return promiseModule.reject("searchFriendsAsync: no local player")
		end
		var1 = localPlayer.UserId
	end
	local formattedText = string.format("%s/users/%d/friends/search?query=%s&limit=%d", urlBase.FRIENDS, var1, httpService:UrlEncode(p1), p3 or 20)
	
	if p2 ~= nil and p2 ~= "" then
		formattedText = string.format("%s&cursor=%s", formattedText, httpService:UrlEncode(p2))
	end
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "build-experience.friends-search",
		url = formattedText,
		decode = function(p5)
			return p5
		end
	})):andThen(function(p5)
		local t = {}
		
		for i, v in if p5 then p5.PageItems else {} do
			local var2 = if v.id ~= nil then nil else tonumber(v.id)
			
			if var2 ~= nil then
				table.insert(t, var2)
			end
		end
		local nextCursor = p5 and p5.NextCursor
		
		if nextCursor == "" then
			nextCursor = nil
		end
		return { ids = t, nextCursor = nextCursor }
	end)
end