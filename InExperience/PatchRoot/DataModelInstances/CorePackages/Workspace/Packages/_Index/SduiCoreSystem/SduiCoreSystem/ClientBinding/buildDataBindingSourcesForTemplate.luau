local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.ServiceContractsProto)
local tryGetPathFromDataModule = require(sduiCoreSystem.ClientBinding.tryGetPathFromData)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local sduiDataBindingContentTypeModule = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagSduiMarketplaceCatalogCategorySupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local fFlagSduiMarketplaceCatalogSortSupport = sharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local fFlagSduiHydrationFetchIfMissing = sharedFlagsModule.FFlagSduiHydrationFetchIfMissing
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local fFlagSduiRenderPerf = sharedFlagsModule.FFlagSduiRenderPerf
local t = {
	[sduiDataBindingContentTypeModule.badge] = { "badge_id" },
	[sduiDataBindingContentTypeModule.creator] = { "creator_key" },
	[sduiDataBindingContentTypeModule.universe] = { "universe_id" },
	[sduiDataBindingContentTypeModule.ageRecommendation] = if fFlagSduiExperienceDetailsSupport then { "universe_id" } else nil,
	[sduiDataBindingContentTypeModule.socialLink] = if fFlagSduiExperienceDetailsSupport then { "social_link_id" } else nil,
	[sduiDataBindingContentTypeModule.marketplaceCatalogCategory] = if fFlagSduiMarketplaceCatalogCategorySupport then { "marketplace_catalog_category_item_id" } else nil,
	[sduiDataBindingContentTypeModule.song] = { "song_id" },
	[sduiDataBindingContentTypeModule.marketplaceCatalogSort] = if fFlagSduiMarketplaceCatalogSortSupport then { "catalog_sort_id" } else nil,
	[sduiDataBindingContentTypeModule.gamePass] = if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then { "game_pass_id" } else nil,
	[sduiDataBindingContentTypeModule.gameDeveloperProduct] = if fFlagSduiDevStoreSeeAllSupport then { "developer_product_id" } else nil,
	[sduiDataBindingContentTypeModule.gameSubscription] = if fFlagSduiDevStoreSeeAllSupport then { "subscription_id" } else nil,
	[sduiDataBindingContentTypeModule.playability] = if fFlagSduiExperienceDetailsSupport then { "universe_id" } else nil,
	[sduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata] = if fFlagSduiExperienceDetailsSupport then { "root_place_id" } else nil,
	[sduiDataBindingContentTypeModule.userProfile] = if fFlagSduiExperienceDetailsSupport then { "user_id" } else nil
}

return function(p0, p1)
	-- upvalues: protoVariableMapperModule (ref), fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), tryGetPathFromDataModule (ref), t (ref), fFlagSduiHydrationFetchIfMissing (ref)
	local t_1 = {}
	
	for i, v in p1 do
		local var8 = protoVariableMapperModule.mapHydrationContentTypeToLua(v.content_type)
		
		if not var8 then
			error(`Unsupported contentType {v.content_type}`)
		end
		local var13
		local type = v.id_binding and (v.id_binding.kind and v.id_binding.kind.type)
		local value = v.id_binding and (v.id_binding.kind and v.id_binding.kind.value)
		local var11 = nil
		
		if type == "literal" and value then
			var11 = value
		elseif type == "input_path" and value then
			var13, var15 = tryGetPathFromDataModule(p0, if fFlagSduiRenderPerf then splitDottedPathModule(value) else string.split(value, "."))
			
			if var13 and var15 ~= nil then
				var11 = var15
			else
				error(`Unable to resolve path from inputPath: {value} in data`)
			end
		else
			local var12 = t[var8]
			
			if var12 then
				var13, var14 = tryGetPathFromDataModule(p0, var12)
				
				if var13 and var14 ~= nil then
					var11 = var14
				else
					error(`Unable to resolve default path: {table.concat(var12, ",")} in data for contentType {var8}`)
				end
			else
				error(`Unable to find default for unknown contentType: {var8}`)
			end
		end
		t_1[if v.alias and v.alias ~= "" then v.alias else var8] = {
			contentType = var8,
			id = var11,
			fetchIfMissing = if fFlagSduiHydrationFetchIfMissing then v.client_fetch else nil
		}
	end
	return t_1
end