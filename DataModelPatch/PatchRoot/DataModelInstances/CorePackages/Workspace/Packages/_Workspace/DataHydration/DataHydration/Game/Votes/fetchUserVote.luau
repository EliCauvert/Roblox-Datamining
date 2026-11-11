local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return function(UniverseId)
	-- upvalues: UrlBuilder (copy), Url (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(UrlBuilder.new({
		path = "v1/games/{universeId}/votes/user",
		base = Url.GAME_URL
	})({ universeId = UniverseId }), "GET")
end