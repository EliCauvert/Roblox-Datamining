local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local _ = require(script.Parent.GamePassStoreTypes)
local gamePassUrlBuilderModule = require(script.Parent.GamePassUrlBuilder)
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end
})

return function(p1)
	-- upvalues: gamePassUrlBuilderModule (ref), var1 (ref)
	return var1(gamePassUrlBuilderModule.buildGamePassesUrl({ universeId = p1 }), "GET"):andThen(function(p2)
		-- upvalues: p1 (ref)
		return {
			universeId = p1,
			gamePasses = if p2.responseBody then p2.responseBody.gamePasses else {}
		}
	end)
end