local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.ServiceContractsProto)
local tryGetPathFromDataModule = require(sduiCoreSystem.ClientBinding.tryGetPathFromData)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local sduiDataBindingContentTypeModule = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiMarketplaceCatalogCategorySupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiHydrationFetchIfMissing = sharedFlagsModule.FFlagSduiHydrationFetchIfMissing
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local t = {
	[sduiDataBindingContentTypeModule.badge] = { "badge_id" },
	[sduiDataBindingContentTypeModule.creator] = { "creator_key" },
	[sduiDataBindingContentTypeModule.universe] = { "universe_id" },
	[sduiDataBindingContentTypeModule.ageRecommendation] = { "universe_id" },
	[sduiDataBindingContentTypeModule.socialLink] = { "social_link_id" },
	[sduiDataBindingContentTypeModule.marketplaceCatalogCategory] = if fFlagSduiMarketplaceCatalogCategorySupport then { "marketplace_catalog_category_item_id" } else nil,
	[sduiDataBindingContentTypeModule.song] = { "song_id" },
	[sduiDataBindingContentTypeModule.marketplaceCatalogSort] = if fFlagSduiMarketplaceCatalogSortSupport then { "catalog_sort_id" } else nil,
	[sduiDataBindingContentTypeModule.gamePass] = { "game_pass_id" },
	[sduiDataBindingContentTypeModule.gameDeveloperProduct] = if fFlagSduiDevStoreSeeAllSupport then { "developer_product_id" } else nil,
	[sduiDataBindingContentTypeModule.gameSubscription] = if fFlagSduiDevStoreSeeAllSupport then { "subscription_id" } else nil,
	[sduiDataBindingContentTypeModule.playability] = { "universe_id" },
	[sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata] = { "root_place_id" },
	[sduiDataBindingContentTypeModule.userProfile] = { "user_id" },
	[sduiDataBindingContentTypeModule.collectibleItem] = if sharedFlagsModule.FFlagSduiAddCollectibleItemDataHydration then { "collectible_item_id" } else nil
}

return function(p1, p2)
	-- upvalues: protoVariableMapperModule (ref), splitDottedPathModule (ref), tryGetPathFromDataModule (ref), t (ref), fFlagSduiHydrationFetchIfMissing (ref)
	local t_1 = {}
	
	for i, v in p2 do
		local var1 = protoVariableMapperModule.mapHydrationContentTypeToLua(v.content_type)
		
		if not var1 then
			error(`Unsupported contentType {v.content_type}`)
		end
		local var2
		local type = v.id_binding and (v.id_binding.kind and v.id_binding.kind.type)
		local value = v.id_binding and (v.id_binding.kind and v.id_binding.kind.value)
		local var3 = nil
		
		if type == "literal" and value then
			var3 = value
		elseif type == "input_path" and value then
			var2, var15 = tryGetPathFromDataModule(p1, splitDottedPathModule(value))
			
			if var2 and var15 ~= nil then
				var3 = var15
			else
				error(`Unable to resolve path from inputPath: {value} in data`)
			end
		else
			local var4 = t[var1]
			
			if var4 then
				var2, var14 = tryGetPathFromDataModule(p1, var4)
				
				if var2 and var14 ~= nil then
					var3 = var14
				else
					error(`Unable to resolve default path: {table.concat(var4, ",")} in data for contentType {var1}`)
				end
			else
				error(`Unable to find default for unknown contentType: {var1}`)
			end
		end
		t_1[if v.alias and v.alias ~= "" then v.alias else var1] = {
			contentType = var1,
			id = var3,
			fetchIfMissing = if fFlagSduiHydrationFetchIfMissing then v.client_fetch else nil
		}
	end
	return t_1
end