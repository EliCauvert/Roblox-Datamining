local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateMarketplaceItemFavoriteStoreModule = require(script.Parent.createMarketplaceItemFavoriteStore)
local GetMarketplaceBundleStoreModule = require(DataHydration.MarketplaceBundle.getMarketplaceBundleStore)

return require(DataHydration.Parent.Signals).createComputed(function()
	-- upvalues: CreateMarketplaceItemFavoriteStoreModule (copy), GetMarketplaceBundleStoreModule (copy)
	return CreateMarketplaceItemFavoriteStoreModule({
		itemType = "Bundle",
		getFavoriteCount = function(p1)
			-- upvalues: GetMarketplaceBundleStoreModule (upval)
			local DataResult = GetMarketplaceBundleStoreModule(false).getMarketplaceBundleInfo(p1).data(false)
			
			return if DataResult then DataResult.favoriteCount else nil
		end,
		setFavoriteCount = function(p1, FavoriteCount)
			-- upvalues: GetMarketplaceBundleStoreModule (upval)
			GetMarketplaceBundleStoreModule(false).updateMarketplaceBundleInfo(p1, { favoriteCount = FavoriteCount })
		end
	})
end)