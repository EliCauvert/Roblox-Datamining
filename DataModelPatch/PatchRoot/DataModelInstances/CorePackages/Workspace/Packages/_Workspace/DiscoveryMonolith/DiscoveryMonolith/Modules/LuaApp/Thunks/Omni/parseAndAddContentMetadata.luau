local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local GameInfoModel = require(Parent.GameModels).GameInfoModel
local ParseAndAddGameInfosFunction = require(Parent.GameInfosRodux).parseAndAddGameInfos
local MutedErrorFunction = require(Parent.Loggers).mutedError
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local Modules = DiscoveryMonolith.Modules
local AddContentMetadataModule = require(Modules.LuaApp.Actions.Games.AddContentMetadata)
local ApiFetchIconsForOmniDataModule = require(Modules.LuaApp.Thunks.Games.ApiFetchIconsForOmniData)
local FFlagLuaAppReduceGameIconFetches = require(Parent.SharedFlags).FFlagLuaAppReduceGameIconFetches
local config = {
	[OmniRecommendationsContentType.GameCoPlay] = require(Modules.LuaApp.Models.DiscoveryApi.GameCoPlay).fromJsonData,
	[OmniRecommendationsContentType.CatalogAsset] = require(Modules.LuaApp.Models.DiscoveryApi.CatalogAsset).fromJsonData,
	[OmniRecommendationsContentType.CatalogBundle] = require(Modules.LuaApp.Models.DiscoveryApi.CatalogBundle).fromJsonData,
	[OmniRecommendationsContentType.RecommendedFriend] = require(Parent.PYMKCarousel).PYMKCarouselModel.fromJsonData
}

local function parseAndAddContentEntries(p1, p2, ContentMetadata, p3, p4)
	-- upvalues: DiscoveryTypesModule (copy), ParseAndAddGameInfosFunction (copy), GameInfoModel (copy), FFlagLuaAppReduceGameIconFetches (copy), config (copy), MutedErrorFunction (copy)
	for i, value in pairs(ContentMetadata) do
		if not p3[i] then
			p3[i] = {}
		end
		if i == DiscoveryTypesModule.OmniRecommendationsContentType.Game then
			ParseAndAddGameInfosFunction(p1, p2, value, GameInfoModel.fromOmniApi, function(_, p5)
				-- upvalues: p3 (copy), i (copy)
				p3[i][p5.universeId] = p5
			end, if FFlagLuaAppReduceGameIconFetches then p4 else nil)
		else
			local Entry = config[i]
			
			if Entry then
				for i1, value1 in pairs(value) do
					Entry(value1):match(function(p5)
						-- upvalues: p3 (copy), i (copy), i1 (copy), MutedErrorFunction (upval)
						if p3[i][i1] then
							MutedErrorFunction(`Duplicate contentStringId {i1} found for type {i}`)
							
							return
						else
							p3[i][i1] = p5
						end
					end):matchError(function(p6)
						warn(p6)
					end)
				end
			end
		end
	end
end

local function _(p5): boolean
	-- upvalues: OmniFeedTypes (copy), OmniFeedConstants (copy)
	if p5.treatmentType == OmniFeedTypes.Carousel or p5.treatmentType == OmniFeedTypes.HomeGameGrid then
		local TopicLayout = p5.topicLayoutData and p5.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
		
		return TopicLayout ~= OmniFeedConstants.ComponentTypeDataKeys.EventTile and TopicLayout ~= OmniFeedConstants.ComponentTypeDataKeys.GridTile and p5.recommendationList ~= nil
	else
		return false
	end
end

return function(p5, p6, p7)
	-- upvalues: FFlagLuaAppReduceGameIconFetches (copy), OmniFeedTypes (copy), OmniFeedConstants (copy), parseAndAddContentEntries (copy), AddContentMetadataModule (copy), ApiFetchIconsForOmniDataModule (copy)
	if not p7 then
		return {}
	end
	if not p7.contentMetadata and not p7.contentMetadataByStringId then
		return {}
	end
	local v1: ((any) -> any)? = nil
	
	if FFlagLuaAppReduceGameIconFetches and p7.sorts then
		local t1 = {}
		
		for _, sort in p7.sorts do
			local HasRecommendationList = nil
			if sort.treatmentType == OmniFeedTypes.Carousel or sort.treatmentType == OmniFeedTypes.HomeGameGrid then
				local TopicLayout = sort.topicLayoutData and sort.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
				HasRecommendationList = TopicLayout ~= OmniFeedConstants.ComponentTypeDataKeys.EventTile and TopicLayout ~= OmniFeedConstants.ComponentTypeDataKeys.GridTile and sort.recommendationList ~= nil
			else
				HasRecommendationList = false
			end
			if HasRecommendationList then
				for _, value in sort.recommendationList do
					if value.contentType == "Game" then
						t1[tostring(value.contentId)] = true
					end
				end
			end
		end
		v1 = function(p8)
			-- upvalues: t1 (copy)
			return t1[p8]
		end
	end
	local t = {}
	parseAndAddContentEntries(p5, p6, p7.contentMetadata, t, if FFlagLuaAppReduceGameIconFetches then v1 else nil)
	
	if p7.contentMetadataByStringId then
		parseAndAddContentEntries(p5, p6, p7.contentMetadataByStringId, t, if FFlagLuaAppReduceGameIconFetches then v1 else nil)
	end
	if next(t) then
		p6:dispatch(AddContentMetadataModule(t))
		p6:dispatch(ApiFetchIconsForOmniDataModule(p5, t))
	end
	return t
end