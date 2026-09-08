local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local sendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local resolveClickSurfaceModule = require(script.Parent.resolveClickSurface)
local applyClickStampFieldOverridesModule = require(script.Parent.applyClickStampFieldOverrides)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local getDeferredPurchaseSourceTileModule = require(avatarExperienceAnalytics.Utils.getDeferredPurchaseSourceTile)
local unifiedSelectionListStoreModule = require(avatarExperienceAnalytics.Store.UnifiedSelectionListStore)
local lastDeferredSingleItemStoreModule = require(avatarExperienceAnalytics.Store.LastDeferredSingleItemStore)
local cartIdServiceModule = require(avatarExperienceAnalytics.Lib.CartIdService)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local selectSearchKeyword = avatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local unifiedLoggingSurface = avatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShoppingUnifiedEvents = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local fFlagAXUnifiedImpressionsOnThumbnail = avatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail
local fFlagAXFixSingleItemPurchaseWidgetLogging = avatarExperienceFlagsModule.FFlagAXFixSingleItemPurchaseWidgetLogging
local fFlagAXFixSearchPurchaseSurface = avatarExperienceFlagsModule.FFlagAXFixSearchPurchaseSurface
local fFlagAXSkipTapDetection = avatarExperienceFlagsModule.FFlagAXSkipTapDetection

local function markLastActivated(p1)
	-- upvalues: collectionService (ref), unifiedEventLogConstantsModule (ref)
	for i, v in collectionService:GetTagged(unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME) do
		collectionService:RemoveTag(v, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
	end
	collectionService:AddTag(p1, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
end

local function markSelectionListStatus(p2, p3, p4)
	-- upvalues: fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), unifiedEventLoggingUtilsModule (ref), unifiedEventLogConstantsModule (ref), fFlagAXFixSearchPurchaseSurface (ref), resolveClickSurfaceModule (ref), unifiedSelectionListStoreModule (ref)
	local attributes = p2:GetAttributes()
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		for i, v in unifiedEventLoggingUtilsModule.getScreenSize(p2) do
			attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
		end
		for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(p2) do
			attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
		end
	end
	if fFlagAXFixSearchPurchaseSurface and not p3 then
		local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface"
		
		if attributes[text] == nil then
			local var1 = resolveClickSurfaceModule(p2, if p4 then p4.current else nil)
			
			if var1 ~= nil then
				attributes[text] = var1
			end
		end
	end
	if p3 then
		unifiedSelectionListStoreModule.removeFromSelectionList(attributes)
		
		return
	end
	unifiedSelectionListStoreModule.addToSelectionList(attributes)
end

local function getChildButton(p5)
	if not p5 then
		return nil
	elseif p5:IsA("TextButton") or p5:IsA("ImageButton") or p5:IsA("GuiButton") then
		return p5
	end
	for i, v in p5:GetDescendants() do
		if p5:IsA("TextButton") or p5:IsA("ImageButton") or p5:IsA("GuiButton") then
			return p5
		end
	end
	return nil
end

local function AnalyticsMetadataSelector(p6)
	return p6.AvatarExperience.AnalyticsMetadata
end

local _ = function(p6, p7)
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), fFlagAXSkipTapDetection (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSearchPurchaseSurface (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
	reactModule.useEffect(function()
		-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), fFlagAXSkipTapDetection (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), p7 (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p6 (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
		local t = {}
		t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p8)
			-- upvalues: getChildButton (copy), fFlagAXSkipTapDetection (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), p7 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p6 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
			local var2 = getChildButton(p8)
			
			if var2 then
				t[p8] = var2.Activated:Connect(function()
					-- upvalues: p8 (ref), fFlagAXSkipTapDetection (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), p7 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p6 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
					local attributes = p8:GetAttributes()
					
					if fFlagAXSkipTapDetection and attributes[unifiedEventLogConstantsModule.SKIP_TAP_DETECTION] == true then return end
					if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						markLastActivated(p8)
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
						markSelectionListStatus(p8, attributes[unifiedEventLogConstantsModule.IS_SELECTED], if fFlagAXFixSearchPurchaseSurface then p7 else nil)
					end
					if fFlagAXFixSingleItemPurchaseWidgetLogging and fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
						local TAG_NAME = getDeferredPurchaseSourceTileModule(collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME), p8, attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or p8
						local attributes_1 = TAG_NAME:GetAttributes()
						
						for i, v in unifiedEventLoggingUtilsModule.getScreenSize(TAG_NAME) do
							attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
						end
						for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(TAG_NAME) do
							attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
						end
						lastDeferredSingleItemStoreModule.setSnapshot(attributes_1)
					end
					local var3 = if p6 then cryoModule.Dictionary.join(p6.getAnalyticsMetadata(false), { keyword = p6.getSearchKeyword(false) }) else {}
					
					if fFlagAXUnifiedImpressionsOnThumbnail then
						local var4 = p8:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
						local var5 = resolveClickSurfaceModule(p8, if p7 then p7.current else nil)
						
						if var5 ~= nil then
							var3.surface = var5
						end
						if (if var4 ~= nil then var5 else var4) ~= unifiedLoggingSurface.SEARCH_RESULTS then
							var3.keyword = nil
						end
					elseif p7 and p7.current and p7.current.current then
						local name = avatarScreenProperties[p7.current.opaque.name]
						
						if name and name.analyticsData then
							var3.surface = name.analyticsData.unifiedLoggingSurface
						end
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						var3.cartId = cartIdServiceModule.getCartId()
					end
					if fFlagAXUnifiedImpressionsOnThumbnail then
						var3 = applyClickStampFieldOverridesModule(var3, attributes)
					end
					sendUnifiedEventLogForInstanceModule(p8, var3, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end)
			end
		end)
		t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p9)
			-- upvalues: t (write)
			local var3 = t[p9]
			
			if var3 then
				var3:Disconnect()
			end
			t[p9] = nil
		end)
		
		return function()
			-- upvalues: t (write)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
		end
	end, {})
end

return {
	useUnifiedEventListener = function()
		-- upvalues: useSelectorSignal (ref), AnalyticsMetadataSelector (ref), selectSearchKeyword (ref), useAvatarRoute (ref), reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), fFlagAXSkipTapDetection (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSearchPurchaseSurface (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local var3 = useSelectorSignal(AnalyticsMetadataSelector)
		local var4 = useSelectorSignal(selectSearchKeyword)
		local var5 = useAvatarRoute()
		local var6 = reactModule.useRef(var5)
		reactModule.useEffect(function()
			-- upvalues: var6 (ref), var5 (ref)
			var6.current = var5
		end, { var5 })
		local t = { getAnalyticsMetadata = var3, getSearchKeyword = var4 }
		reactModule.useEffect(function()
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), fFlagAXSkipTapDetection (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var6 (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p9)
				-- upvalues: getChildButton (copy), fFlagAXSkipTapDetection (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var6 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var7 = getChildButton(p9)
				
				if var7 then
					t[p9] = var7.Activated:Connect(function()
						-- upvalues: p9 (ref), fFlagAXSkipTapDetection (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var6 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p9:GetAttributes()
						
						if fFlagAXSkipTapDetection and attributes[unifiedEventLogConstantsModule.SKIP_TAP_DETECTION] == true then return end
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p9)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p9, attributes[unifiedEventLogConstantsModule.IS_SELECTED], if fFlagAXFixSearchPurchaseSurface then var6 else nil)
						end
						if fFlagAXFixSingleItemPurchaseWidgetLogging and fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
							local attributes_1 = (getDeferredPurchaseSourceTileModule(collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME), p9, attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or p9):GetAttributes()
							
							for i, v in unifiedEventLoggingUtilsModule.getScreenSize(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
							end
							for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
							end
							lastDeferredSingleItemStoreModule.setSnapshot(attributes_1)
						end
						local var8 = if t then cryoModule.Dictionary.join(t.getAnalyticsMetadata(false), { keyword = t.getSearchKeyword(false) }) else {}
						
						if fFlagAXUnifiedImpressionsOnThumbnail then
							local var9 = p9:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local var10 = resolveClickSurfaceModule(p9, if var6 then var6.current else nil)
							
							if var10 ~= nil then
								var8.surface = var10
							end
							if (if var9 ~= nil then var10 else var9) ~= unifiedLoggingSurface.SEARCH_RESULTS then
								var8.keyword = nil
							end
						elseif var6 and var6.current and var6.current.current then
							local name = avatarScreenProperties[var6.current.opaque.name]
							
							if name and name.analyticsData then
								var8.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var8.cartId = cartIdServiceModule.getCartId()
						end
						if fFlagAXUnifiedImpressionsOnThumbnail then
							var8 = applyClickStampFieldOverridesModule(var8, attributes)
						end
						sendUnifiedEventLogForInstanceModule(p9, var8, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p10)
				-- upvalues: t (write)
				local var8 = t[p10]
				
				if var8 then
					var8:Disconnect()
				end
				t[p10] = nil
			end)
			
			return function()
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {})
	end,
	useUnifiedEventListenerInExperience = function()
		-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), fFlagAXSkipTapDetection (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSearchPurchaseSurface (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local useEffect = reactModule.useEffect
		local var8 = nil
		local var9 = nil
		useEffect(function()
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), fFlagAXSkipTapDetection (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var8 (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var9 (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p10)
				-- upvalues: getChildButton (copy), fFlagAXSkipTapDetection (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var8 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var9 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var10 = getChildButton(p10)
				
				if var10 then
					t[p10] = var10.Activated:Connect(function()
						-- upvalues: p10 (ref), fFlagAXSkipTapDetection (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var8 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var9 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p10:GetAttributes()
						
						if fFlagAXSkipTapDetection and attributes[unifiedEventLogConstantsModule.SKIP_TAP_DETECTION] == true then return end
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p10)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p10, attributes[unifiedEventLogConstantsModule.IS_SELECTED], if fFlagAXFixSearchPurchaseSurface then var8 else nil)
						end
						if fFlagAXFixSingleItemPurchaseWidgetLogging and fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
							local attributes_1 = (getDeferredPurchaseSourceTileModule(collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME), p10, attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or p10):GetAttributes()
							
							for i, v in unifiedEventLoggingUtilsModule.getScreenSize(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
							end
							for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
							end
							lastDeferredSingleItemStoreModule.setSnapshot(attributes_1)
						end
						local var11 = if var9 then cryoModule.Dictionary.join(var9.getAnalyticsMetadata(false), { keyword = var9.getSearchKeyword(false) }) else {}
						
						if fFlagAXUnifiedImpressionsOnThumbnail then
							local var12 = p10:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local var13 = resolveClickSurfaceModule(p10, if var8 then var8.current else nil)
							
							if var13 ~= nil then
								var11.surface = var13
							end
							if (if var12 ~= nil then var13 else var12) ~= unifiedLoggingSurface.SEARCH_RESULTS then
								var11.keyword = nil
							end
						elseif var8 and var8.current and var8.current.current then
							local name = avatarScreenProperties[var8.current.opaque.name]
							
							if name and name.analyticsData then
								var11.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var11.cartId = cartIdServiceModule.getCartId()
						end
						if fFlagAXUnifiedImpressionsOnThumbnail then
							var11 = applyClickStampFieldOverridesModule(var11, attributes)
						end
						sendUnifiedEventLogForInstanceModule(p10, var11, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p11)
				-- upvalues: t (write)
				local var11 = t[p11]
				
				if var11 then
					var11:Disconnect()
				end
				t[p11] = nil
			end)
			
			return function()
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {})
	end
}