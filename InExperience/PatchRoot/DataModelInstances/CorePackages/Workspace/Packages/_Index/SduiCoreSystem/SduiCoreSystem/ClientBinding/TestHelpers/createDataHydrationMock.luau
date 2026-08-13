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
	createDataHydrationMock = function(p0) --[[ line: 30 ]]
		-- upvalues: t (ref)
		local t_1 = {
			Badges = if p0 then p0.Badges else {
				getBadgeInfoStore = function() --[[ line: 48 ]]
					return {
						getBadgeInfo = function() --[[ line: 50 ]]
							return {
								data = function() --[[ line: 52 ]]
									return nil
								end,
								status = function() --[[ line: 55 ]]
									return "NotReady"
								end
							}
						end,
						getBadgeInfos = function() --[[ line: 60 ]]
							return {}
						end,
						clear = function() --[[ line: 63 ]] end,
						dispose = function() --[[ line: 64 ]] end
					}
				end
			},
			Game = if p0 then p0.Game else nil,
			SocialLink = if p0 then p0.SocialLink else nil,
			MarketplaceCatalogCategory = if p0 then p0.MarketplaceCatalogCategory else {
				getMarketplaceCatalogCategoryStore = function() --[[ line: 71 ]]
					return {
						getMarketplaceCatalogCategory = function() --[[ line: 73 ]]
							return {
								data = function() --[[ line: 75 ]]
									return nil
								end,
								status = function() --[[ line: 78 ]]
									return "NotReady"
								end
							}
						end,
						getMarketplaceCatalogCategories = function() --[[ line: 83 ]]
							return {}
						end,
						updateMarketplaceCatalogCategories = function() --[[ line: 86 ]] end,
						updateMarketplaceCatalogCategory = function() --[[ line: 87 ]] end,
						clear = function() --[[ line: 88 ]] end,
						dispose = function() --[[ line: 89 ]] end
					}
				end
			},
			MarketplaceCatalogSort = if p0 then p0.MarketplaceCatalogSort else {
				getMarketplaceCatalogSortStore = function() --[[ line: 94 ]]
					return {
						getMarketplaceCatalogSort = function() --[[ line: 96 ]]
							return {
								data = function() --[[ line: 98 ]]
									return nil
								end,
								status = function() --[[ line: 101 ]]
									return "NotReady"
								end
							}
						end,
						getMarketplaceCatalogSorts = function() --[[ line: 106 ]]
							return {}
						end,
						updateMarketplaceCatalogSorts = function() --[[ line: 109 ]] end,
						updateMarketplaceCatalogSort = function() --[[ line: 110 ]] end,
						clear = function() --[[ line: 111 ]] end,
						dispose = function() --[[ line: 112 ]] end
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
	createSduiDataBinderTransformUtilsMock = function() --[[ line: 141 ]]
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