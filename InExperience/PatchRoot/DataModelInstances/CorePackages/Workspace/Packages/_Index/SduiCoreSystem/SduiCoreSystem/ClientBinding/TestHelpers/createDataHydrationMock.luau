local sduiDataBinderTransformUtilsModule = require(script:FindFirstAncestor("SduiCoreSystem").ClientBinding.SduiDataBinderTransformUtils)
local snakeToCamel = sduiDataBinderTransformUtilsModule.snakeToCamel
local protobufTimestampToLocalTimeString = sduiDataBinderTransformUtilsModule.protobufTimestampToLocalTimeString
local t = {
	DataStatus = {
		Ready = "Ready",
		NotReady = "NotReady",
		Failed = "Failed"
	}
}

return {
	createDataHydrationMock = function(p1)
		-- upvalues: t (ref)
		local t_1 = {
			Badges = if p1 then p1.Badges else {
				getBadgeInfoStore = function()
					return {
						getBadgeInfo = function()
							return {
								data = function()
									return nil
								end,
								status = function()
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
			Game = if p1 then p1.Game else nil,
			SocialLink = if p1 then p1.SocialLink else nil,
			MarketplaceCatalogCategory = if p1 then p1.MarketplaceCatalogCategory else {
				getMarketplaceCatalogCategoryStore = function()
					return {
						getMarketplaceCatalogCategory = function()
							return {
								data = function()
									return nil
								end,
								status = function()
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
			MarketplaceCatalogSort = if p1 then p1.MarketplaceCatalogSort else {
				getMarketplaceCatalogSortStore = function()
					return {
						getMarketplaceCatalogSort = function()
							return {
								data = function()
									return nil
								end,
								status = function()
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
			Song = if p1 then p1.Song else nil,
			MarketplaceAsset = if p1 then p1.MarketplaceAsset else nil,
			MarketplaceBundle = if p1 then p1.MarketplaceBundle else nil,
			MarketplaceLook = if p1 then p1.MarketplaceLook else nil,
			MediaAsset = if p1 then p1.MediaAsset else nil,
			UserProfile = if p1 then p1.UserProfile else nil,
			Community = if p1 then p1.Community else nil,
			CommunityUserMembership = if p1 then p1.CommunityUserMembership else nil,
			DataHydrationTypes = t
		}
		
		if p1 and p1.extraFields then
			for i, v in p1.extraFields do
				t_1[i] = v
			end
		end
		return t_1
	end,
	createSduiDataBinderTransformUtilsMock = function()
		-- upvalues: snakeToCamel (ref), protobufTimestampToLocalTimeString (ref)
		return {
			snakeToCamel = snakeToCamel,
			protobufTimestampToLocalTimeString = protobufTimestampToLocalTimeString
		}
	end,
	snakeToCamel = snakeToCamel,
	protobufTimestampToLocalTimeString = protobufTimestampToLocalTimeString,
	DataHydrationTypesMock = t
}