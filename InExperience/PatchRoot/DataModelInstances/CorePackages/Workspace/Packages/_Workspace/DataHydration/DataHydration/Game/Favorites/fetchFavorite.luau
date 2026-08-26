local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local favoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)

return function(p1)
	-- upvalues: favoritesUrlBuilderModule (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(favoritesUrlBuilderModule.buildFavoriteUrl(p1), "GET")
end