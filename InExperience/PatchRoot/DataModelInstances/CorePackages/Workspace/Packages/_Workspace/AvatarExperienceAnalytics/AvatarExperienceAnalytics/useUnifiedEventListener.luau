local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local ResolveClickSurfaceModule = require(script.Parent.resolveClickSurface)
local ApplyClickStampFieldOverridesModule = require(script.Parent.applyClickStampFieldOverrides)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local GetDeferredPurchaseSourceTileModule = require(AvatarExperienceAnalytics.Utils.getDeferredPurchaseSourceTile)
local UnifiedSelectionListStoreModule = require(AvatarExperienceAnalytics.Store.UnifiedSelectionListStore)
local LastDeferredSingleItemStoreModule = require(AvatarExperienceAnalytics.Store.LastDeferredSingleItemStore)
local CartIdServiceModule = require(AvatarExperienceAnalytics.Lib.CartIdService)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXUnifiedImpressionsOnThumbnail = AvatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail
local FFlagAXFixSingleItemPurchaseWidgetLogging = AvatarExperienceFlagsModule.FFlagAXFixSingleItemPurchaseWidgetLogging
local FFlagAXFixSearchPurchaseSurface = AvatarExperienceFlagsModule.FFlagAXFixSearchPurchaseSurface
local FFlagAXSkipTapDetection = AvatarExperienceFlagsModule.FFlagAXSkipTapDetection

local function markLastActivated(p1) --[[ Line: 32 ]]
	-- upvalues: CollectionService (copy), UnifiedEventLogConstantsModule (copy)
	for _, value in CollectionService:GetTagged(UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME) do
		CollectionService:RemoveTag(value, UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
	end
	CollectionService:AddTag(p1, UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
end

local function markSelectionListStatus(Object, p2, p3) --[[ Line: 43 ]]
	-- upvalues: FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLoggingUtilsModule (copy), UnifiedEventLogConstantsModule (copy), FFlagAXFixSearchPurchaseSurface (copy), ResolveClickSurfaceModule (copy), UnifiedSelectionListStoreModule (copy)
	local Attributes = Object:GetAttributes()
	
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		for i, value in UnifiedEventLoggingUtilsModule.getScreenSize(Object) do
			Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = value
		end
		for i1, value1 in UnifiedEventLoggingUtilsModule.getElementSizeAndPosition(Object) do
			Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i1] = value1
		end
	end
	if FFlagAXFixSearchPurchaseSurface and not p2 then
		local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface"
		
		if Attributes[Text] == nil then
			local ResolveClickSurfaceModuleResult = ResolveClickSurfaceModule(Object, if p3 then p3.current else nil)
			
			if ResolveClickSurfaceModuleResult ~= nil then
				Attributes[Text] = ResolveClickSurfaceModuleResult
			end
		end
	end
	if p2 then
		UnifiedSelectionListStoreModule.removeFromSelectionList(Attributes)
		
		return
	else
		UnifiedSelectionListStoreModule.addToSelectionList(Attributes)
	end
end

local function getChildButton(Object) --[[ Line: 84 ]]
	if not Object then
		return nil
	end
	if Object:IsA("TextButton") or Object:IsA("ImageButton") or Object:IsA("GuiButton") then
		return Object
	end
	for _, _ in Object:GetDescendants() do
		if Object:IsA("TextButton") or Object:IsA("ImageButton") or Object:IsA("GuiButton") then
			return Object
		end
	end
	return nil
end

local function AnalyticsMetadataSelector(p4) --[[ Line: 102 ]]
	return p4.AvatarExperience.AnalyticsMetadata
end

local function _(p4, p5) --[[ Line: 106 ]]
	-- upvalues: ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), getChildButton (copy), FFlagAXSkipTapDetection (copy), markLastActivated (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), FFlagAXFixSearchPurchaseSurface (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (copy), UnifiedEventLogEnumsModule (copy), GetDeferredPurchaseSourceTileModule (copy), UnifiedEventLoggingUtilsModule (copy), LastDeferredSingleItemStoreModule (copy), CryoModule (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), ResolveClickSurfaceModule (copy), UnifiedLoggingSurface (copy), AvatarScreenProperties (copy), CartIdServiceModule (copy), ApplyClickStampFieldOverridesModule (copy), SendUnifiedEventLogForInstanceModule (copy)
	ReactModule.useEffect(function() --[[ Line: 108 ]]
		-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), getChildButton (upval), FFlagAXSkipTapDetection (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), p5 (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), p4 (copy), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval)
		local ActivatedConnections = {}
		ActivatedConnections.instanceAdded = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 116 ]]
			-- upvalues: getChildButton (upval), FFlagAXSkipTapDetection (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), p5 (upval), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), CollectionService (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), p4 (upval), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval), ActivatedConnections (ref)
			local v1 = getChildButton(Tagged)
			
			if v1 then
				ActivatedConnections[Tagged] = v1.Activated:Connect(function() --[[ Line: 119 ]]
					-- upvalues: Tagged (copy), FFlagAXSkipTapDetection (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), p5 (upval), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), CollectionService (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), p4 (upval), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval)
					local Attributes = Tagged:GetAttributes()
					
					if FFlagAXSkipTapDetection and Attributes[UnifiedEventLogConstantsModule.SKIP_TAP_DETECTION] == true then return end
					if Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						markLastActivated(Tagged)
					end
					if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and Attributes[UnifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
						markSelectionListStatus(Tagged, Attributes[UnifiedEventLogConstantsModule.IS_SELECTED], if FFlagAXFixSearchPurchaseSurface then p5 else nil)
					end
					if FFlagAXFixSingleItemPurchaseWidgetLogging and FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
						local Object = GetDeferredPurchaseSourceTileModule(CollectionService:GetTagged(UnifiedEventLogConstantsModule.TAG_NAME), Tagged, Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or Tagged
						local Attributes1 = Object:GetAttributes()
						
						for i, value in UnifiedEventLoggingUtilsModule.getScreenSize(Object) do
							Attributes1[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = value
						end
						for i1, value1 in UnifiedEventLoggingUtilsModule.getElementSizeAndPosition(Object) do
							Attributes1[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i1] = value1
						end
						LastDeferredSingleItemStoreModule.setSnapshot(Attributes1)
					end
					local JoinResult = if p4 then CryoModule.Dictionary.join(p4.getAnalyticsMetadata(false), { keyword = p4.getSearchKeyword(false) }) else {}
					
					if FFlagAXUnifiedImpressionsOnThumbnail then
						local Attribute = Tagged:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
						local Surface = ResolveClickSurfaceModule(Tagged, if p5 then p5.current else nil)
						
						if Surface ~= nil then
							JoinResult.surface = Surface
						end
						if (if Attribute == nil then Surface else Attribute) ~= UnifiedLoggingSurface.SEARCH_RESULTS then
							JoinResult.keyword = nil
						end
					elseif p5 and p5.current and p5.current.current then
						local v2 = AvatarScreenProperties[p5.current.opaque.name]
						
						if v2 and v2.analyticsData then
							JoinResult.surface = v2.analyticsData.unifiedLoggingSurface
						end
					end
					if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						JoinResult.cartId = CartIdServiceModule.getCartId()
					end
					if FFlagAXUnifiedImpressionsOnThumbnail then
						JoinResult = ApplyClickStampFieldOverridesModule(JoinResult, Attributes)
					end
					SendUnifiedEventLogForInstanceModule(Tagged, JoinResult, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end)
			end
		end)
		ActivatedConnections.instanceRemoved = CollectionService:GetInstanceRemovedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 243 ]]
			-- upvalues: ActivatedConnections (ref)
			local ActivatedConnection = ActivatedConnections[Tagged]
			
			if ActivatedConnection then
				ActivatedConnection:Disconnect()
			end
			ActivatedConnections[Tagged] = nil
		end)
		
		return function() --[[ Line: 252 ]]
			-- upvalues: ActivatedConnections (ref)
			for _, activatedConnection in ActivatedConnections do
				activatedConnection:Disconnect()
			end
			ActivatedConnections = {}
		end
	end, {})
end

return {
	useUnifiedEventListener = function() --[[ Line: 262 ]]
		-- upvalues: UseSelectorSignalFunction (copy), AnalyticsMetadataSelector (copy), SelectSearchKeyword (copy), UseAvatarRouteFunction (copy), ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), getChildButton (copy), FFlagAXSkipTapDetection (copy), markLastActivated (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), FFlagAXFixSearchPurchaseSurface (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (copy), UnifiedEventLogEnumsModule (copy), GetDeferredPurchaseSourceTileModule (copy), UnifiedEventLoggingUtilsModule (copy), LastDeferredSingleItemStoreModule (copy), CryoModule (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), ResolveClickSurfaceModule (copy), UnifiedLoggingSurface (copy), AvatarScreenProperties (copy), CartIdServiceModule (copy), ApplyClickStampFieldOverridesModule (copy), SendUnifiedEventLogForInstanceModule (copy)
		local UseSelectorSignalResult = UseSelectorSignalFunction(AnalyticsMetadataSelector)
		local UseSelectorSignalResult1 = UseSelectorSignalFunction(SelectSearchKeyword)
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local UseRefResult = ReactModule.useRef(UseAvatarRouteResult)
		ReactModule.useEffect(function() --[[ Line: 268 ]]
			-- upvalues: UseRefResult (copy), UseAvatarRouteResult (copy)
			UseRefResult.current = UseAvatarRouteResult
		end, { UseAvatarRouteResult })
		local config = {
			getAnalyticsMetadata = UseSelectorSignalResult,
			getSearchKeyword = UseSelectorSignalResult1
		}
		ReactModule.useEffect(function() --[[ Line: 108 ]]
			-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), getChildButton (upval), FFlagAXSkipTapDetection (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), UseRefResult (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), config (copy), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval)
			local ActivatedConnections = {}
			ActivatedConnections.instanceAdded = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 116 ]]
				-- upvalues: getChildButton (upval), FFlagAXSkipTapDetection (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), UseRefResult (upval), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), CollectionService (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), config (upval), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval), ActivatedConnections (ref)
				local v2 = getChildButton(Tagged)
				
				if v2 then
					ActivatedConnections[Tagged] = v2.Activated:Connect(function() --[[ Line: 119 ]]
						-- upvalues: Tagged (copy), FFlagAXSkipTapDetection (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), UseRefResult (upval), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), CollectionService (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), config (upval), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval)
						local Attributes = Tagged:GetAttributes()
						
						if FFlagAXSkipTapDetection and Attributes[UnifiedEventLogConstantsModule.SKIP_TAP_DETECTION] == true then return end
						if Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(Tagged)
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and Attributes[UnifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(Tagged, Attributes[UnifiedEventLogConstantsModule.IS_SELECTED], if FFlagAXFixSearchPurchaseSurface then UseRefResult else nil)
						end
						if FFlagAXFixSingleItemPurchaseWidgetLogging and FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
							local Object = GetDeferredPurchaseSourceTileModule(CollectionService:GetTagged(UnifiedEventLogConstantsModule.TAG_NAME), Tagged, Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or Tagged
							local Attributes1 = Object:GetAttributes()
							
							for i, value in UnifiedEventLoggingUtilsModule.getScreenSize(Object) do
								Attributes1[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = value
							end
							for i1, value1 in UnifiedEventLoggingUtilsModule.getElementSizeAndPosition(Object) do
								Attributes1[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i1] = value1
							end
							LastDeferredSingleItemStoreModule.setSnapshot(Attributes1)
						end
						local JoinResult = if config then CryoModule.Dictionary.join(config.getAnalyticsMetadata(false), { keyword = config.getSearchKeyword(false) }) else {}
						
						if FFlagAXUnifiedImpressionsOnThumbnail then
							local Attribute = Tagged:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local Surface = ResolveClickSurfaceModule(Tagged, if UseRefResult then UseRefResult.current else nil)
							
							if Surface ~= nil then
								JoinResult.surface = Surface
							end
							if (if Attribute == nil then Surface else Attribute) ~= UnifiedLoggingSurface.SEARCH_RESULTS then
								JoinResult.keyword = nil
							end
						elseif UseRefResult and UseRefResult.current and UseRefResult.current.current then
							local v3 = AvatarScreenProperties[UseRefResult.current.opaque.name]
							
							if v3 and v3.analyticsData then
								JoinResult.surface = v3.analyticsData.unifiedLoggingSurface
							end
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							JoinResult.cartId = CartIdServiceModule.getCartId()
						end
						if FFlagAXUnifiedImpressionsOnThumbnail then
							JoinResult = ApplyClickStampFieldOverridesModule(JoinResult, Attributes)
						end
						SendUnifiedEventLogForInstanceModule(Tagged, JoinResult, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			ActivatedConnections.instanceRemoved = CollectionService:GetInstanceRemovedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 243 ]]
				-- upvalues: ActivatedConnections (ref)
				local ActivatedConnection = ActivatedConnections[Tagged]
				
				if ActivatedConnection then
					ActivatedConnection:Disconnect()
				end
				ActivatedConnections[Tagged] = nil
			end)
			
			return function() --[[ Line: 252 ]]
				-- upvalues: ActivatedConnections (ref)
				for _, activatedConnection in ActivatedConnections do
					activatedConnection:Disconnect()
				end
				ActivatedConnections = {}
			end
		end, {})
	end,
	useUnifiedEventListenerInExperience = function() --[[ Line: 278 ]]
		-- upvalues: ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), getChildButton (copy), FFlagAXSkipTapDetection (copy), markLastActivated (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), FFlagAXFixSearchPurchaseSurface (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (copy), UnifiedEventLogEnumsModule (copy), GetDeferredPurchaseSourceTileModule (copy), UnifiedEventLoggingUtilsModule (copy), LastDeferredSingleItemStoreModule (copy), CryoModule (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), ResolveClickSurfaceModule (copy), UnifiedLoggingSurface (copy), AvatarScreenProperties (copy), CartIdServiceModule (copy), ApplyClickStampFieldOverridesModule (copy), SendUnifiedEventLogForInstanceModule (copy)
		local v3 = nil
		local v4 = nil
		ReactModule.useEffect(function() --[[ Line: 108 ]]
			-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), getChildButton (upval), FFlagAXSkipTapDetection (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), v3 (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), v4 (copy), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval)
			local ActivatedConnections = {}
			ActivatedConnections.instanceAdded = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 116 ]]
				-- upvalues: getChildButton (upval), FFlagAXSkipTapDetection (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), v3 (upval), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), CollectionService (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), v4 (upval), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval), ActivatedConnections (ref)
				local v5 = getChildButton(Tagged)
				
				if v5 then
					ActivatedConnections[Tagged] = v5.Activated:Connect(function() --[[ Line: 119 ]]
						-- upvalues: Tagged (copy), FFlagAXSkipTapDetection (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), FFlagAXFixSearchPurchaseSurface (upval), v3 (upval), FFlagAXFixSingleItemPurchaseWidgetLogging (upval), UnifiedEventLogEnumsModule (upval), GetDeferredPurchaseSourceTileModule (upval), CollectionService (upval), UnifiedEventLoggingUtilsModule (upval), LastDeferredSingleItemStoreModule (upval), v4 (upval), CryoModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), ResolveClickSurfaceModule (upval), UnifiedLoggingSurface (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), ApplyClickStampFieldOverridesModule (upval), SendUnifiedEventLogForInstanceModule (upval)
						local Attributes = Tagged:GetAttributes()
						
						if FFlagAXSkipTapDetection and Attributes[UnifiedEventLogConstantsModule.SKIP_TAP_DETECTION] == true then return end
						if Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(Tagged)
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and Attributes[UnifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(Tagged, Attributes[UnifiedEventLogConstantsModule.IS_SELECTED], if FFlagAXFixSearchPurchaseSurface then v3 else nil)
						end
						if FFlagAXFixSingleItemPurchaseWidgetLogging and FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
							local Object = GetDeferredPurchaseSourceTileModule(CollectionService:GetTagged(UnifiedEventLogConstantsModule.TAG_NAME), Tagged, Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or Tagged
							local Attributes1 = Object:GetAttributes()
							
							for i, value in UnifiedEventLoggingUtilsModule.getScreenSize(Object) do
								Attributes1[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = value
							end
							for i1, value1 in UnifiedEventLoggingUtilsModule.getElementSizeAndPosition(Object) do
								Attributes1[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i1] = value1
							end
							LastDeferredSingleItemStoreModule.setSnapshot(Attributes1)
						end
						local JoinResult = if v4 then CryoModule.Dictionary.join(v4.getAnalyticsMetadata(false), { keyword = v4.getSearchKeyword(false) }) else {}
						
						if FFlagAXUnifiedImpressionsOnThumbnail then
							local Attribute = Tagged:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local Surface = ResolveClickSurfaceModule(Tagged, if v3 then v3.current else nil)
							
							if Surface ~= nil then
								JoinResult.surface = Surface
							end
							if (if Attribute == nil then Surface else Attribute) ~= UnifiedLoggingSurface.SEARCH_RESULTS then
								JoinResult.keyword = nil
							end
						elseif v3 and v3.current and v3.current.current then
							local v6 = AvatarScreenProperties[v3.current.opaque.name]
							
							if v6 and v6.analyticsData then
								JoinResult.surface = v6.analyticsData.unifiedLoggingSurface
							end
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							JoinResult.cartId = CartIdServiceModule.getCartId()
						end
						if FFlagAXUnifiedImpressionsOnThumbnail then
							JoinResult = ApplyClickStampFieldOverridesModule(JoinResult, Attributes)
						end
						SendUnifiedEventLogForInstanceModule(Tagged, JoinResult, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			ActivatedConnections.instanceRemoved = CollectionService:GetInstanceRemovedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged) --[[ Line: 243 ]]
				-- upvalues: ActivatedConnections (ref)
				local ActivatedConnection = ActivatedConnections[Tagged]
				
				if ActivatedConnection then
					ActivatedConnection:Disconnect()
				end
				ActivatedConnections[Tagged] = nil
			end)
			
			return function() --[[ Line: 252 ]]
				-- upvalues: ActivatedConnections (ref)
				for _, activatedConnection in ActivatedConnections do
					activatedConnection:Disconnect()
				end
				ActivatedConnections = {}
			end
		end, {})
	end
}