local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local favoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)

return function(p0)
	-- upvalues: favoritesUrlBuilderModule (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(favoritesUrlBuilderModule.buildFavoriteUrl(p0), "GET")
end