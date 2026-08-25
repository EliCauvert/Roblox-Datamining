local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = httpModule.Url

return function(p0, p1)
	-- upvalues: urlBuilder (ref), url (ref), httpRequestModule (ref), httpService (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.RequestInternal(p2, p3, p4)
		end
	})(urlBuilder.new({
		path = "v1/games/{universeId}/user-votes",
		base = url.GAME_URL
	})({ universeId = p0 }), "PATCH", {
		postBody = httpService:JSONEncode({ vote = if p1 == nil then "null" else p1 })
	})
end