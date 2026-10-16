local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return function(UniverseId, p1) --[[ Line: 13 | Named "requestUserVoteUpdate" ]]
	-- upvalues: UrlBuilder (copy), Url (copy), HttpRequestModule (copy), HttpService (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ Line: 22 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(UrlBuilder.new({
		path = "v1/games/{universeId}/user-votes",
		base = Url.GAME_URL
	})({ universeId = UniverseId }), "PATCH", {
		postBody = HttpService:JSONEncode({ vote = if p1 == nil then "null" else p1 })
	})
end