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
	createDataHydrationMock = function(p1) --[[ Line: 30 ]]
		-- upvalues: DataHydrationTypes (copy)
		local config = {
			Badges = p1 and p1.Badges or {
				getBadgeInfoStore = function() --[[ Line: 51 ]]
					return {
						getBadgeInfo = function() --[[ Line: 53 ]]
							return {
								data = function() --[[ Line: 55 ]]
									return nil
								end,
								status = function(): string --[[ Line: 58 ]]
									return "NotReady"
								end
							}
						end,
						getBadgeInfos = function() --[[ Line: 63 ]]
							return {}
						end,
						clear = function() --[[ Line: 66 ]] end,
						dispose = function() --[[ Line: 67 ]] end
					}
				end
			},
			Game = p1 and p1.Game or nil,
			SocialLink = p1 and p1.SocialLink or nil,
			MarketplaceCatalogCategory = p1 and p1.MarketplaceCatalogCategory or {
				getMarketplaceCatalogCategoryStore = function() --[[ Line: 74 ]]
					return {
						getMarketplaceCatalogCategory = function() --[[ Line: 76 ]]
							return {
								data = function() --[[ Line: 78 ]]
									return nil
								end,
								status = function(): string --[[ Line: 81 ]]
									return "NotReady"
								end
							}
						end,
						getMarketplaceCatalogCategories = function() --[[ Line: 86 ]]
							return {}
						end,
						updateMarketplaceCatalogCategories = function() --[[ Line: 89 ]] end,
						updateMarketplaceCatalogCategory = function() --[[ Line: 90 ]] end,
						clear = function() --[[ Line: 91 ]] end,
						dispose = function() --[[ Line: 92 ]] end
					}
				end
			},
			MarketplaceCatalogSort = p1 and p1.MarketplaceCatalogSort or {
				getMarketplaceCatalogSortStore = function() --[[ Line: 97 ]]
					return {
						getMarketplaceCatalogSort = function() --[[ Line: 99 ]]
							return {
								data = function() --[[ Line: 101 ]]
									return nil
								end,
								status = function(): string --[[ Line: 104 ]]
									return "NotReady"
								end
							}
						end,
						getMarketplaceCatalogSorts = function() --[[ Line: 109 ]]
							return {}
						end,
						updateMarketplaceCatalogSorts = function() --[[ Line: 112 ]] end,
						updateMarketplaceCatalogSort = function() --[[ Line: 113 ]] end,
						clear = function() --[[ Line: 114 ]] end,
						dispose = function() --[[ Line: 115 ]] end
					}
				end
			},
			Song = p1 and p1.Song or nil,
			MarketplaceAsset = p1 and p1.MarketplaceAsset or nil,
			MarketplaceBundle = p1 and p1.MarketplaceBundle or nil,
			MarketplaceLook = p1 and p1.MarketplaceLook or nil,
			CollectibleItem = p1 and p1.CollectibleItem or nil,
			MediaAsset = p1 and p1.MediaAsset or nil,
			UserProfile = p1 and p1.UserProfile or nil,
			Community = p1 and p1.Community or nil,
			CommunityUserMembership = p1 and p1.CommunityUserMembership or nil,
			NotificationBadge = p1 and p1.NotificationBadge or nil,
			LeaderboardStats = p1 and p1.LeaderboardStats or nil,
			DataHydrationTypes = DataHydrationTypes
		}
		
		if p1 and p1.extraFields then
			for i, extraField in p1.extraFields do
				config[i] = extraField
			end
		end
		return config
	end,
	createSduiDataBinderTransformUtilsMock = function() --[[ Line: 147 ]]
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