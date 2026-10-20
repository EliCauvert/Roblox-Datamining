local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local TutilsModule = require(Parent.tutils)
local GameTileModule = require(Parent.GameTile)
local GameTileLayoutType = GameTileModule.GameTileTypes.GameTileLayoutType
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetGameTileCollectionItemSizeFunction = GameTileModule.getGameTileCollectionItemSize
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local GetSduiFeedStoreModule = require(ServerDrivenUi.DataStore.getSduiFeedStore)
local ApportioningPreprocessingHelpersModule = require(ServerDrivenUi.DataStore.ApportioningPreprocessingHelpers)
local FFlagLuaAppUseEffectInSignalPreprocessing = require(Parent.SharedFlags).FFlagLuaAppUseEffectInSignalPreprocessing
local FFlagLuaAppAddRequestIdToRfySignalApportioning = require(Parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local GetMainCollectionLayoutStoreFunction = require(Parent.CollectionViews).getMainCollectionLayoutStore

return function(p1, p2, p3)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), UseSelectorFunction (copy), TutilsModule (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), TopicContentsReducer (copy), FFlagLuaAppUseEffectInSignalPreprocessing (copy), ReactModule (copy), GetSduiFeedStoreModule (copy), GetMainCollectionLayoutStoreFunction (copy), OmniFeedTypes (copy), GameTileLayoutType (copy), OmniFeedConstants (copy), GetGameTileCollectionItemSizeFunction (copy), ApportioningPreprocessingHelpersModule (copy)
	local FFlagLuaAppCompositionAlways1 = FFlagLuaAppCompositionAlways or p3
	local UseSelectorResult = UseSelectorFunction(function(p4)
		-- upvalues: p1 (copy)
		local OmniRecommendation = p4.OmniRecommendations[p1]
		
		return if OmniRecommendation then OmniRecommendation.sorts else {}
	end, TutilsModule.shallowEqual)
	local UseSelectorResult1 = if FFlagLuaAppAddRequestIdToRfySignalApportioning then UseSelectorFunction(function(p4)
		-- upvalues: p1 (copy)
		local OmniRecommendation = p4.OmniRecommendations[p1]
		
		return if OmniRecommendation then OmniRecommendation.recommendationsId else nil
	end) else nil
	local UseSelectorResult2 = UseSelectorFunction(function(p4)
		-- upvalues: TopicContentsReducer (upval)
		return p4.Personalization[TopicContentsReducer.key]
	end)
	;(if FFlagLuaAppUseEffectInSignalPreprocessing then ReactModule.useEffect else ReactModule.useLayoutEffect)(function()
		-- upvalues: GetSduiFeedStoreModule (upval), p1 (copy), FFlagLuaAppCompositionAlways1 (copy), GetMainCollectionLayoutStoreFunction (upval), UseSelectorResult (copy), OmniFeedTypes (upval), GameTileLayoutType (upval), OmniFeedConstants (upval), GetGameTileCollectionItemSizeFunction (upval), p2 (copy), ApportioningPreprocessingHelpersModule (upval), UseSelectorResult2 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), UseSelectorResult1 (ref)
		local SduiFeedStoreModule = GetSduiFeedStoreModule(p1)
		local ApportioningData = {}
		local NumItemsForAllCategories = if FFlagLuaAppCompositionAlways1 then GetMainCollectionLayoutStoreFunction(false).getNumItemsForAllCategories(false) else nil
		for i, value in UseSelectorResult do
			local TopicId = value.topicId
			
			if TopicId and value.treatmentType == OmniFeedTypes.HomeGameGrid then
				local Narrow = GameTileLayoutType.Narrow
				
				if value.topicLayoutData then
					local TopicLayout = value.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
					
					if TopicLayout then
						if TopicLayout == OmniFeedConstants.ComponentTypeDataKeys.EventTile then
							Narrow = GameTileLayoutType.Event
						elseif TopicLayout == OmniFeedConstants.ComponentTypeDataKeys.GridTile then
							Narrow = GameTileLayoutType.Wide
						end
					end
				end
				local GameTileCollectionItemSize = GetGameTileCollectionItemSizeFunction(Narrow)
				local NumItemsForAllCategory = if FFlagLuaAppCompositionAlways1 then NumItemsForAllCategories[GameTileCollectionItemSize] else p2[GameTileCollectionItemSize](false).numColumns
				local NumberOfRows = value.numberOfRows or 99999
				
				if NumberOfRows == -1 then
					NumberOfRows = 99999
				end
				ApportioningPreprocessingHelpersModule.addToApportioningData(ApportioningData, TopicId, NumItemsForAllCategory * NumberOfRows, i)
			end
		end
		ApportioningPreprocessingHelpersModule.populateStartingItemIndices(ApportioningData)
		
		for i1, value1 in ApportioningData do
			local UseSelectorResultEntry = i1 and (UseSelectorResult2 and UseSelectorResult2[i1]) or nil
			value1.items = UseSelectorResultEntry and UseSelectorResultEntry.entries or {}
		end
		SduiFeedStoreModule.updateData({ apportioningData = ApportioningData }, if FFlagLuaAppAddRequestIdToRfySignalApportioning then UseSelectorResult1 else nil)
		
		return function() end
	end, {
		UseSelectorResult, UseSelectorResult2,
		if FFlagLuaAppCompositionAlways then nil else p2, p1,
		if FFlagLuaAppAddRequestIdToRfySignalApportioning then UseSelectorResult1 else nil,
		FFlagLuaAppCompositionAlways1
	})
end