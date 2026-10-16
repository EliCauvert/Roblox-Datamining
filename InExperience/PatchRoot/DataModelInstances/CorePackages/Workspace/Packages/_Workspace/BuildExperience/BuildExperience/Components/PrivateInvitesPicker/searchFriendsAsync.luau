local Parent = script:FindFirstAncestor("BuildExperience").Parent
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(Input, Input1, p1, UserId) --[[ Line: 39 | Named "searchFriendsAsync" ]]
	-- upvalues: Players (copy), PromiseModule (copy), UrlBase (copy), HttpService (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local UserId1 = UserId
	
	if UserId1 == nil then
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil then
			return PromiseModule.reject("searchFriendsAsync: no local player")
		end
		UserId1 = LocalPlayer.UserId
	end
	local Formatted = string.format("%s/users/%d/friends/search?query=%s&limit=%d", UrlBase.FRIENDS, UserId1, HttpService:UrlEncode(Input), p1 or 20)
	
	if Input1 ~= nil and Input1 ~= "" then
		Formatted = string.format("%s&cursor=%s", Formatted, HttpService:UrlEncode(Input1))
	end
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "build-experience.friends-search",
		url = Formatted,
		decode = function(p2) --[[ Line: 64 ]]
			return p2
		end
	}))):andThen(function(Result) --[[ Line: 69 ]]
		local Ids = {}
		local PageItems = Result and Result.PageItems or {}
		for _, pageItem in PageItems do
			local Number = if pageItem.id == nil then nil else tonumber(pageItem.id)
			
			if Number ~= nil then
				table.insert(Ids, Number)
			end
		end
		local NextCursor = Result and Result.NextCursor
		
		if NextCursor == "" then
			NextCursor = nil
		end
		return { ids = Ids, nextCursor = NextCursor }
	end)
end