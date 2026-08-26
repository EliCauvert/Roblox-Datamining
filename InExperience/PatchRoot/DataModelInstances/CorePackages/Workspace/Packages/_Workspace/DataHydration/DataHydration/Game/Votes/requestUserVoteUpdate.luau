local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = httpModule.Url

return function(p1, p2)
	-- upvalues: urlBuilder (ref), url (ref), httpRequestModule (ref), httpService (ref)
	return httpRequestModule.config({
		requestFunction = function(p3, p4, p5)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p3, p4, p5)
		end
	})(urlBuilder.new({
		path = "v1/games/{universeId}/user-votes",
		base = url.GAME_URL
	})({ universeId = p1 }), "PATCH", {
		postBody = httpService:JSONEncode({ vote = if p2 == nil then "null" else p2 })
	})
end