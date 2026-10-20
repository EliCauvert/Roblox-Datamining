local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateMarketplaceItemFavoriteStoreModule = require(script.Parent.createMarketplaceItemFavoriteStore)
local GetMarketplaceAssetStoreModule = require(DataHydration.MarketplaceAsset.getMarketplaceAssetStore)

return require(DataHydration.Parent.Signals).createComputed(function() --[[ Line: 9 ]]
	-- upvalues: CreateMarketplaceItemFavoriteStoreModule (copy), GetMarketplaceAssetStoreModule (copy)
	return CreateMarketplaceItemFavoriteStoreModule({
		itemType = "Asset",
		getFavoriteCount = function(p1) --[[ Line: 12 ]]
			-- upvalues: GetMarketplaceAssetStoreModule (upval)
			local DataResult = GetMarketplaceAssetStoreModule(false).getMarketplaceAssetInfo(p1).data(false)
			
			return if DataResult then DataResult.favoriteCount else nil
		end,
		setFavoriteCount = function(p1, FavoriteCount) --[[ Line: 16 ]]
			-- upvalues: GetMarketplaceAssetStoreModule (upval)
			GetMarketplaceAssetStoreModule(false).updateMarketplaceAssetInfo(p1, { favoriteCount = FavoriteCount })
		end
	})
end)