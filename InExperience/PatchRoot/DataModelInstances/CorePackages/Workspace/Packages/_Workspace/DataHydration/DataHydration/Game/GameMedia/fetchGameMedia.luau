local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return function(UniverseId) --[[ Line: 12 | Named "fetchGameMedia" ]]
	-- upvalues: UrlBuilder (copy), Url (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 21 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(UrlBuilder.new({
		path = "v2/games/{universeId}/media",
		base = Url.GAME_URL
	})({ universeId = UniverseId }), "GET")
end