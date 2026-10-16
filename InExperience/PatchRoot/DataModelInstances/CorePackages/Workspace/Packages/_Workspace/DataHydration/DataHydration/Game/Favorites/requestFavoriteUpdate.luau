local HttpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local HttpService = game:GetService("HttpService")
local FavoritesUrlBuilderModule = require(script.Parent.FavoritesUrlBuilder)

return function(p1, IsFavorited) --[[ Line: 10 | Named "requestUpdateFavorite" ]]
	-- upvalues: FavoritesUrlBuilderModule (copy), HttpService (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p2, p3, p4) --[[ Line: 18 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(FavoritesUrlBuilderModule.buildFavoriteUpdateUrl(p1), "POST", {
		postBody = HttpService:JSONEncode({ isFavorited = IsFavorited })
	})
end