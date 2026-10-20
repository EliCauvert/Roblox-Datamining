local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local _ = require(script.Parent.MarketplaceItemFavoriteStoreTypes)
local MarketplaceItemFavoriteUrlBuilderModule = require(script.Parent.MarketplaceItemFavoriteUrlBuilder)

return function(p1, p2)
	-- upvalues: GetLocalPlayerUserIdFunction (copy), PromiseModule (copy), MarketplaceItemFavoriteUrlBuilderModule (copy), HttpRequestModule (copy)
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	
	return if LocalPlayerUserId then HttpRequestModule.config({
		requestFunction = function(p3, p4, p5)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p3, p4, p5)
		end
	})(MarketplaceItemFavoriteUrlBuilderModule.buildFavoriteUrl(tostring(LocalPlayerUserId), p1, p2), "GET") else PromiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot fetch favorite status: missing or invalid local player ID"
	})
end