local parent = script:FindFirstAncestor("DataHydration").Parent
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = httpModule.Url

return function(p0) --[[ line: 12 | named "requestUserVote" ]]
	-- upvalues: urlBuilder (ref), url (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 21 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(urlBuilder.new({
		path = "v1/games/{universeId}/votes/user",
		base = url.GAME_URL
	})({ universeId = p0 }), "GET")
end