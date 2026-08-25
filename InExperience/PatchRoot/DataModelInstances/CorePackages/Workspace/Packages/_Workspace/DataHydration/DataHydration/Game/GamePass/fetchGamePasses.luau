local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local _ = require(script.Parent.GamePassStoreTypes)
local gamePassUrlBuilderModule = require(script.Parent.GamePassUrlBuilder)
local var2 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end
})

return function(p3)
	-- upvalues: gamePassUrlBuilderModule (ref), var2 (ref)
	return var2(gamePassUrlBuilderModule.buildGamePassesUrl({ universeId = p3 }), "GET"):andThen(function(p4)
		-- upvalues: p3 (ref)
		return {
			universeId = p3,
			gamePasses = if p4.responseBody then p4.responseBody.gamePasses else {}
		}
	end)
end