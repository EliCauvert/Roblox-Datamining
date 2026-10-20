local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local _ = require(script.Parent.MarketplaceItemFavoriteStoreTypes)
local MarketplaceItemFavoriteUrlBuilderModule = require(script.Parent.MarketplaceItemFavoriteUrlBuilder)

return function(p1, p2, p3) --[[ Line: 15 | Named "requestMarketplaceItemFavoriteUpdate" ]]
	-- upvalues: GetLocalPlayerUserIdFunction (copy), PromiseModule (copy), MarketplaceItemFavoriteUrlBuilderModule (copy), HttpRequestModule (copy), HttpService (copy)
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	
	return if LocalPlayerUserId then HttpRequestModule.config({
		requestFunction = function(p4, p5, p6) --[[ Line: 32 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.RequestInternal(p4, p5, p6)
		end
	})(MarketplaceItemFavoriteUrlBuilderModule.buildFavoriteUrl(tostring(LocalPlayerUserId), p1, p2), if p3 then "POST" else "DELETE", {
		postBody = if p3 then HttpService:JSONEncode({}) else nil
	}) else PromiseModule.reject({
		ClientError = "Missing or invalid local player ID",
		message = "Cannot update favorite status: missing or invalid local player ID"
	})
end