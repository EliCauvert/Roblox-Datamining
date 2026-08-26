local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local tutilsModule = require(parent.tutils)
local roactUtilsModule = require(parent.RoactUtils)
local collectionViewsModule = require(parent.CollectionViews)
local gameTileModule = require(parent.GameTile)
local gameTileLayoutType = gameTileModule.GameTileTypes.GameTileLayoutType
local topicContentsReducer = require(parent.TopicContentsRodux).TopicContentsReducer
local discoveryTypesModule = require(parent.DiscoveryTypes)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local getGameTileCollectionItemSize = gameTileModule.getGameTileCollectionItemSize
local omniFeedTypes = discoveryTypesModule.OmniFeedTypes
local omniFeedConstants = discoveryTypesModule.OmniFeedConstants
local getSduiFeedStoreModule = require(serverDrivenUi.DataStore.getSduiFeedStore)
local apportioningPreprocessingHelpersModule = require(serverDrivenUi.DataStore.ApportioningPreprocessingHelpers)
local fFlagLuaAppUseEffectInSignalPreprocessing = require(parent.SharedFlags).FFlagLuaAppUseEffectInSignalPreprocessing
local fFlagLuaAppAddRequestIdToRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local getMainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore

return function(p1, p2, p3)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), useSelector (ref), tutilsModule (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (ref), topicContentsReducer (ref), fFlagLuaAppUseEffectInSignalPreprocessing (ref), reactModule (ref), getSduiFeedStoreModule (ref), getMainCollectionLayoutStore (ref), omniFeedTypes (ref), gameTileLayoutType (ref), omniFeedConstants (ref), getGameTileCollectionItemSize (ref), apportioningPreprocessingHelpersModule (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p3
	local var1 = useSelector(function(p4)
		-- upvalues: p1 (ref)
		local var2 = p4.OmniRecommendations[p1]
		
		return if var2 then var2.sorts else {}
	end, tutilsModule.shallowEqual)
	local var2 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then useSelector(function(p4)
		-- upvalues: p1 (ref)
		local var3 = p4.OmniRecommendations[p1]
		
		return if var3 then var3.recommendationsId else nil
	end) else nil
	local var3 = useSelector(function(p4)
		-- upvalues: topicContentsReducer (copy)
		return p4.Personalization[topicContentsReducer.key]
	end)
	;(if fFlagLuaAppUseEffectInSignalPreprocessing then reactModule.useEffect else reactModule.useLayoutEffect)(function()
		-- upvalues: getSduiFeedStoreModule (copy), p1 (ref), fFlagLuaAppCompositionAlways_1 (ref), getMainCollectionLayoutStore (copy), var1 (ref), omniFeedTypes (copy), gameTileLayoutType (copy), omniFeedConstants (copy), getGameTileCollectionItemSize (copy), p2 (ref), apportioningPreprocessingHelpersModule (copy), var3 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var2 (write)
		local var4 = getSduiFeedStoreModule(p1)
		local t = {}
		local var5 = if fFlagLuaAppCompositionAlways_1 then getMainCollectionLayoutStore(false).getNumItemsForAllCategories(false) else nil
		
		for i, v in var1 do
			local topicId = v.topicId
			
			if topicId and v.treatmentType == omniFeedTypes.HomeGameGrid then
				local narrow = gameTileLayoutType.Narrow
				
				if v.topicLayoutData then
					local componentType = v.topicLayoutData[omniFeedConstants.TopicLayoutDataKeys.ComponentType]
					
					if componentType then
						if componentType == omniFeedConstants.ComponentTypeDataKeys.EventTile then
							narrow = gameTileLayoutType.Event
						elseif componentType == omniFeedConstants.ComponentTypeDataKeys.GridTile then
							narrow = gameTileLayoutType.Wide
						end
					end
				end
				local var6 = getGameTileCollectionItemSize(narrow)
				local var7 = if fFlagLuaAppCompositionAlways_1 then var5[var6] else p2[var6](false).numColumns
				local numberOfRows = v.numberOfRows or 99999
				
				if numberOfRows == -1 then
					numberOfRows = 99999
				end
				apportioningPreprocessingHelpersModule.addToApportioningData(t, topicId, var7 * numberOfRows, i)
			end
		end
		apportioningPreprocessingHelpersModule.populateStartingItemIndices(t)
		
		for i_1, v_1 in t do
			local var8 = if i_1 then if var3 then var3[i_1] else nil else nil
			v_1.items = if var8 then var8.entries else {}
		end
		var4.updateData({ apportioningData = t }, if fFlagLuaAppAddRequestIdToRfySignalApportioning then var2 else nil)
		
		return function() end
	end, {
		var1, var3, if not fFlagLuaAppCompositionAlways then p2 else nil, p1,
		if fFlagLuaAppAddRequestIdToRfySignalApportioning then var2 else nil,
		fFlagLuaAppCompositionAlways_1
	})
end