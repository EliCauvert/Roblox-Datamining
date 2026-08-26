local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local httpService = game:GetService("HttpService")
local favoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)

return function(p1, p2)
	-- upvalues: favoritesUrlBuilderModule (ref), httpService (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p3, p4, p5)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p3, p4, p5)
		end
	})(favoritesUrlBuilderModule.buildFavoriteUpdateUrl(p1), "POST", { postBody = httpService:JSONEncode({ isFavorited = p2 }) })
end