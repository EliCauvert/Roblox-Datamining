local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local httpService = game:GetService("HttpService")
local favoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)

return function(p0, p1) --[[ line: 10 | named "requestUpdateFavorite" ]]
	-- upvalues: favoritesUrlBuilderModule (ref), httpService (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ line: 18 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(favoritesUrlBuilderModule.buildFavoriteUpdateUrl(p0), "POST", { postBody = httpService:JSONEncode({ isFavorited = p1 }) })
end