local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = httpModule.Url

return function(p1)
	-- upvalues: urlBuilder (ref), url (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(urlBuilder.new({
		path = "v2/games/{universeId}/media",
		base = url.GAME_URL
	})({ universeId = p1 }), "GET")
end