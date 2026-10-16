local HttpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local _ = require(script.Parent.GamePassStoreTypes)
local GamePassUrlBuilderModule = require(script.Parent.GamePassUrlBuilder)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 15 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end
})

return function(UniverseId) --[[ Line: 20 | Named "fetchGamePasses" ]]
	-- upvalues: GamePassUrlBuilderModule (copy), ConfigResult (copy)
	return ConfigResult(GamePassUrlBuilderModule.buildGamePassesUrl({ universeId = UniverseId }), "GET"):andThen(function(Result) --[[ Line: 22 ]]
		-- upvalues: UniverseId (copy)
		return {
			universeId = UniverseId,
			gamePasses = Result.responseBody and Result.responseBody.gamePasses or {}
		}
	end)
end