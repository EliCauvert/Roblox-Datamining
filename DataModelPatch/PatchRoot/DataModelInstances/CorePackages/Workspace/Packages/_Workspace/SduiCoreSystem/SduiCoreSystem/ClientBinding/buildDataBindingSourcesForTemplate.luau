local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.ServiceContractsProto)
local TryGetPathFromDataModule = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local SduiDataBindingContentTypeModule = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local ProtoVariableMapperModule = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local FFlagSduiMarketplaceCatalogCategorySupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = SharedFlagsModule.FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiHydrationFetchIfMissing = SharedFlagsModule.FFlagSduiHydrationFetchIfMissing
local FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local FFlagSduiRenderPerf = SharedFlagsModule.FFlagSduiRenderPerf
local config = {
	[SduiDataBindingContentTypeModule.badge] = { "badge_id" },
	[SduiDataBindingContentTypeModule.creator] = { "creator_key" },
	[SduiDataBindingContentTypeModule.universe] = { "universe_id" },
	[SduiDataBindingContentTypeModule.ageRecommendation] = if FFlagSduiExperienceDetailsSupport then { "universe_id" } else nil,
	[SduiDataBindingContentTypeModule.socialLink] = if FFlagSduiExperienceDetailsSupport then { "social_link_id" } else nil,
	[SduiDataBindingContentTypeModule.marketplaceCatalogCategory] = if FFlagSduiMarketplaceCatalogCategorySupport then { "marketplace_catalog_category_item_id" } else nil,
	[SduiDataBindingContentTypeModule.song] = { "song_id" },
	[SduiDataBindingContentTypeModule.marketplaceCatalogSort] = if FFlagSduiMarketplaceCatalogSortSupport then { "catalog_sort_id" } else nil,
	[SduiDataBindingContentTypeModule.gamePass] = if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then { "game_pass_id" } else nil,
	[SduiDataBindingContentTypeModule.gameDeveloperProduct] = if FFlagSduiDevStoreSeeAllSupport then { "developer_product_id" } else nil,
	[SduiDataBindingContentTypeModule.gameSubscription] = if FFlagSduiDevStoreSeeAllSupport then { "subscription_id" } else nil,
	[SduiDataBindingContentTypeModule.playability] = if FFlagSduiExperienceDetailsSupport then { "universe_id" } else nil,
	[SduiDataBindingContentTypeModule.universeUserVoteFeedbackMetadata] = if FFlagSduiExperienceDetailsSupport then { "root_place_id" } else nil,
	[SduiDataBindingContentTypeModule.userProfile] = if FFlagSduiExperienceDetailsSupport then { "user_id" } else nil
}

return function(p1, List)
	-- upvalues: ProtoVariableMapperModule (copy), FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), TryGetPathFromDataModule (copy), config (copy), FFlagSduiHydrationFetchIfMissing (copy)
	local t = {}
	
	for _, value in List do
		local MapHydrationContentTypeToLuaResult = ProtoVariableMapperModule.mapHydrationContentTypeToLua(value.content_type)
		
		if not MapHydrationContentTypeToLuaResult then
			error(`Unsupported contentType {value.content_type}`)
		end
		local Type = value.id_binding and (value.id_binding.kind and value.id_binding.kind.type)
		local Value = value.id_binding and (value.id_binding.kind and value.id_binding.kind.value)
		local Id: string? = nil
		
		if Type == "literal" and Value then
			Id = Value
		elseif Type == "input_path" and Value then
			local TryGetPathFromDataModuleResult, TryGetPathFromDataModuleResult2 = TryGetPathFromDataModule(p1, if FFlagSduiRenderPerf then SplitDottedPathModule(Value) else string.split(Value, "."))
			
			if TryGetPathFromDataModuleResult and TryGetPathFromDataModuleResult2 ~= nil then
				Id = TryGetPathFromDataModuleResult2
			else
				error(`Unable to resolve path from inputPath: {Value} in data`)
			end
		else
			local Entry = config[MapHydrationContentTypeToLuaResult]
			
			if Entry then
				local TryGetPathFromDataModuleResult1, TryGetPathFromDataModuleResult2_1 = TryGetPathFromDataModule(p1, Entry)
				
				if TryGetPathFromDataModuleResult1 and TryGetPathFromDataModuleResult2_1 ~= nil then
					Id = TryGetPathFromDataModuleResult2_1
				else
					error(`Unable to resolve default path: {table.concat(Entry, ",")} in data for contentType {MapHydrationContentTypeToLuaResult}`)
				end
			else
				error(`Unable to find default for unknown contentType: {MapHydrationContentTypeToLuaResult}`)
			end
		end
		t[if value.alias and value.alias ~= "" then value.alias else MapHydrationContentTypeToLuaResult] = {
			contentType = MapHydrationContentTypeToLuaResult,
			id = Id,
			fetchIfMissing = if FFlagSduiHydrationFetchIfMissing then value.client_fetch else nil
		}
	end
	return t
end