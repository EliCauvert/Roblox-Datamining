local HttpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local FavoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)

return function(p1) --[[ Line: 10 | Named "fetchFavorite" ]]
	-- upvalues: FavoritesUrlBuilderModule (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ Line: 14 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(FavoritesUrlBuilderModule.buildFavoriteUrl(p1), "GET")
end