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
	createDataHydrationMock = function(p0)
		-- upvalues: t (ref)
		local t_1 = {
			Badges = if p0 then p0.Badges else {
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
			Game = if p0 then p0.Game else nil,
			SocialLink = if p0 then p0.SocialLink else nil,
			MarketplaceCatalogCategory = if p0 then p0.MarketplaceCatalogCategory else {
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
			MarketplaceCatalogSort = if p0 then p0.MarketplaceCatalogSort else {
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
			Song = if p0 then p0.Song else nil,
			MarketplaceAsset = if p0 then p0.MarketplaceAsset else nil,
			MarketplaceBundle = if p0 then p0.MarketplaceBundle else nil,
			MarketplaceLook = if p0 then p0.MarketplaceLook else nil,
			MediaAsset = if p0 then p0.MediaAsset else nil,
			UserProfile = if p0 then p0.UserProfile else nil,
			Community = if p0 then p0.Community else nil,
			CommunityUserMembership = if p0 then p0.CommunityUserMembership else nil,
			DataHydrationTypes = t
		}
		
		if p0 and p0.extraFields then
			for i, v in p0.extraFields do
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