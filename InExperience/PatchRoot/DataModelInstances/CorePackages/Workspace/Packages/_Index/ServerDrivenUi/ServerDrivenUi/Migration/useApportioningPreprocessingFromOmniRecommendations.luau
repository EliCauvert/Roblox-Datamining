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
local fFlagLuaAppCompositionSupport = require(parent.SharedFlags).FFlagLuaAppCompositionSupport
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local getMainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore

return function(p0, p1, p2) --[[ line: 40 | named "useApportioningPreprocessingFromOmniRecommendations" ]]
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fFlagLuaAppCompositionSupport (ref), useSelector (ref), tutilsModule (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (ref), topicContentsReducer (ref), fFlagLuaAppUseEffectInSignalPreprocessing (ref), reactModule (ref), getSduiFeedStoreModule (ref), getMainCollectionLayoutStore (ref), omniFeedTypes (ref), gameTileLayoutType (ref), omniFeedConstants (ref), getGameTileCollectionItemSize (ref), apportioningPreprocessingHelpersModule (ref)
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or fFlagLuaAppCompositionSupport and p2
	local var10 = useSelector(function(p3) --[[ line: 48 ]]
		-- upvalues: p0 (ref)
		local var13 = p3.OmniRecommendations[p0]
		
		return if var13 then var13.sorts else {}
	end, tutilsModule.shallowEqual)
	local var11 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then useSelector(function(p4) --[[ line: 58 ]]
		-- upvalues: p0 (ref)
		local var14 = p4.OmniRecommendations[p0]
		
		return if var14 then var14.recommendationsId else nil
	end) else nil
	local var12 = useSelector(function(p5) --[[ line: 67 ]]
		-- upvalues: topicContentsReducer (copy)
		return p5.Personalization[topicContentsReducer.key]
	end)
	;(if fFlagLuaAppUseEffectInSignalPreprocessing then reactModule.useEffect else reactModule.useLayoutEffect)(function() --[[ line: 75 ]]
		-- upvalues: getSduiFeedStoreModule (copy), p0 (ref), fFlagLuaAppCompositionAlways_1 (ref), getMainCollectionLayoutStore (copy), var10 (ref), omniFeedTypes (copy), gameTileLayoutType (copy), omniFeedConstants (copy), getGameTileCollectionItemSize (copy), p1 (ref), apportioningPreprocessingHelpersModule (copy), var12 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var11 (write)
		local var15 = getSduiFeedStoreModule(p0)
		local t = {}
		local var17 = if fFlagLuaAppCompositionAlways_1 then getMainCollectionLayoutStore(false).getNumItemsForAllCategories(false) else nil
		
		for i, v in var10 do
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
				local var19 = getGameTileCollectionItemSize(narrow)
				local var20 = if fFlagLuaAppCompositionAlways_1 then var17[var19] else p1[var19](false).numColumns
				local numberOfRows = v.numberOfRows or 99999
				
				if numberOfRows == -1 then
					numberOfRows = 99999
				end
				apportioningPreprocessingHelpersModule.addToApportioningData(t, topicId, var20 * numberOfRows, i)
			end
		end
		apportioningPreprocessingHelpersModule.populateStartingItemIndices(t)
		
		for i_1, v_1 in t do
			local var18 = if i_1 then if var12 then var12[i_1] else nil else nil
			v_1.items = if var18 then var18.entries else {}
		end
		var15.updateData({ apportioningData = t }, if fFlagLuaAppAddRequestIdToRfySignalApportioning then var11 else nil)
		
		return function() --[[ line: 142 ]] end
	end, {
		var10, var12, if not fFlagLuaAppCompositionAlways then p1 else nil, p0,
		if fFlagLuaAppAddRequestIdToRfySignalApportioning then var11 else nil,
		if fFlagLuaAppCompositionSupport then fFlagLuaAppCompositionAlways_1 else nil
	})
end