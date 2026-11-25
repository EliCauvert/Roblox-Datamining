local SduiDataBinderTransformUtilsModule = require(script:FindFirstAncestor("SduiCoreSystem").ClientBinding.SduiDataBinderTransformUtils)
local SnakeToCamel = SduiDataBinderTransformUtilsModule.snakeToCamel
local ProtobufTimestampToLocalTimeString = SduiDataBinderTransformUtilsModule.protobufTimestampToLocalTimeString
local DataHydrationTypes = {
	DataStatus = {
		Ready = "Ready",
		NotReady = "NotReady",
		Failed = "Failed"
	}
}

return {
	createDataHydrationMock = function(p1)
		-- upvalues: DataHydrationTypes (copy)
		local config = {
			Badges = p1 and p1.Badges or {
				getBadgeInfoStore = function()
					return {
						getBadgeInfo = function()
							return {
								data = function()
									return nil
								end,
								status = function(): string
									return "NotReady"
								end
							}
						end,
						getBadgeInfos = function()
							return {}
						end,
						clear = function() end,
						dispose = function() end
					}
				end
			},
			Game = p1 and p1.Game or nil,
			SocialLink = p1 and p1.SocialLink or nil,
			MarketplaceCatalogCategory = p1 and p1.MarketplaceCatalogCategory or {
				getMarketplaceCatalogCategoryStore = function()
					return {
						getMarketplaceCatalogCategory = function()
							return {
								data = function()
									return nil
								end,
								status = function(): string
									return "NotReady"
								end
							}
						end,
						getMarketplaceCatalogCategories = function()
							return {}
						end,
						updateMarketplaceCatalogCategories = function() end,
						updateMarketplaceCatalogCategory = function() end,
						clear = function() end,
						dispose = function() end
					}
				end
			},
			MarketplaceCatalogSort = p1 and p1.MarketplaceCatalogSort or {
				getMarketplaceCatalogSortStore = function()
					return {
						getMarketplaceCatalogSort = function()
							return {
								data = function()
									return nil
								end,
								status = function(): string
									return "NotReady"
								end
							}
						end,
						getMarketplaceCatalogSorts = function()
							return {}
						end,
						updateMarketplaceCatalogSorts = function() end,
						updateMarketplaceCatalogSort = function() end,
						clear = function() end,
						dispose = function() end
					}
				end
			},
			Song = p1 and p1.Song or nil,
			MarketplaceAsset = p1 and p1.MarketplaceAsset or nil,
			MarketplaceBundle = p1 and p1.MarketplaceBundle or nil,
			MarketplaceLook = p1 and p1.MarketplaceLook or nil,
			MarketplaceItemFavorite = p1 and p1.MarketplaceItemFavorite or nil,
			CollectibleItem = p1 and p1.CollectibleItem or nil,
			MediaAsset = p1 and p1.MediaAsset or nil,
			UserProfile = p1 and p1.UserProfile or nil,
			Community = p1 and p1.Community or nil,
			CommunityUserMembership = p1 and p1.CommunityUserMembership or nil,
			NotificationBadge = p1 and p1.NotificationBadge or nil,
			LeaderboardStats = p1 and p1.LeaderboardStats or nil,
			BuyRobux = p1 and p1.BuyRobux or nil,
			DataHydrationTypes = DataHydrationTypes
		}
		
		if p1 and p1.extraFields then
			for i, extraField in p1.extraFields do
				config[i] = extraField
			end
		end
		return config
	end,
	createSduiDataBinderTransformUtilsMock = function()
		-- upvalues: SnakeToCamel (copy), ProtobufTimestampToLocalTimeString (copy)
		return {
			snakeToCamel = SnakeToCamel,
			protobufTimestampToLocalTimeString = ProtobufTimestampToLocalTimeString
		}
	end,
	snakeToCamel = SnakeToCamel,
	protobufTimestampToLocalTimeString = ProtobufTimestampToLocalTimeString,
	DataHydrationTypesMock = DataHydrationTypes
}