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

local function markLastActivated(p0)
	-- upvalues: collectionService (ref), unifiedEventLogConstantsModule (ref)
	for i, v in collectionService:GetTagged(unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME) do
		collectionService:RemoveTag(v, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
	end
	collectionService:AddTag(p0, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
end

local function markSelectionListStatus(p1, p2, p3)
	-- upvalues: fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), unifiedEventLoggingUtilsModule (ref), unifiedEventLogConstantsModule (ref), fFlagAXFixSearchPurchaseSurface (ref), resolveClickSurfaceModule (ref), unifiedSelectionListStoreModule (ref)
	local attributes = p1:GetAttributes()
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		for i, v in unifiedEventLoggingUtilsModule.getScreenSize(p1) do
			attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
		end
		for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(p1) do
			attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
		end
	end
	if fFlagAXFixSearchPurchaseSurface and not p2 then
		local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface"
		
		if attributes[text] == nil then
			local var23 = resolveClickSurfaceModule(p1, if p3 then p3.current else nil)
			
			if var23 ~= nil then
				attributes[text] = var23
			end
		end
	end
	if p2 then
		unifiedSelectionListStoreModule.removeFromSelectionList(attributes)
		
		return
	end
	unifiedSelectionListStoreModule.addToSelectionList(attributes)
end

local function getChildButton(p4)
	if not p4 then
		return nil
	elseif p4:IsA("TextButton") or p4:IsA("ImageButton") or p4:IsA("GuiButton") then
		return p4
	end
	for i, v in p4:GetDescendants() do
		if p4:IsA("TextButton") or p4:IsA("ImageButton") or p4:IsA("GuiButton") then
			return p4
		end
	end
	return nil
end

local function AnalyticsMetadataSelector(p5)
	return p5.AvatarExperience.AnalyticsMetadata
end

local _ = function(p6, p7)
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSearchPurchaseSurface (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
	reactModule.useEffect(function()
		-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), p7 (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p6 (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
		local t = {}
		t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p8)
			-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), p7 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p6 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
			local var25 = getChildButton(p8)
			
			if var25 then
				t[p8] = var25.Activated:Connect(function()
					-- upvalues: p8 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), p7 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p6 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
					local attributes = p8:GetAttributes()
					
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
					local var29 = if p6 then cryoModule.Dictionary.join(p6.getAnalyticsMetadata(false), { keyword = p6.getSearchKeyword(false) }) else {}
					
					if fFlagAXUnifiedImpressionsOnThumbnail then
						local var30 = p8:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
						local var31 = resolveClickSurfaceModule(p8, if p7 then p7.current else nil)
						
						if var31 ~= nil then
							var29.surface = var31
						end
						if (if var30 ~= nil then var31 else var30) ~= unifiedLoggingSurface.SEARCH_RESULTS then
							var29.keyword = nil
						end
					elseif p7 and p7.current and p7.current.current then
						local name = avatarScreenProperties[p7.current.opaque.name]
						
						if name and name.analyticsData then
							var29.surface = name.analyticsData.unifiedLoggingSurface
						end
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						var29.cartId = cartIdServiceModule.getCartId()
					end
					if fFlagAXUnifiedImpressionsOnThumbnail then
						var29 = applyClickStampFieldOverridesModule(var29, attributes)
					end
					sendUnifiedEventLogForInstanceModule(p8, var29, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end)
			end
		end)
		t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p9)
			-- upvalues: t (write)
			local var32 = t[p9]
			
			if var32 then
				var32:Disconnect()
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
		-- upvalues: useSelectorSignal (ref), AnalyticsMetadataSelector (ref), selectSearchKeyword (ref), useAvatarRoute (ref), reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSearchPurchaseSurface (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local var33 = useSelectorSignal(AnalyticsMetadataSelector)
		local var34 = useSelectorSignal(selectSearchKeyword)
		local var35 = useAvatarRoute()
		local var36 = reactModule.useRef(var35)
		reactModule.useEffect(function()
			-- upvalues: var36 (ref), var35 (ref)
			var36.current = var35
		end, { var35 })
		local t = { getAnalyticsMetadata = var33, getSearchKeyword = var34 }
		reactModule.useEffect(function()
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var36 (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p10)
				-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var36 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var25 = getChildButton(p10)
				
				if var25 then
					t[p10] = var25.Activated:Connect(function()
						-- upvalues: p10 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var36 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p10:GetAttributes()
						
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p10)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p10, attributes[unifiedEventLogConstantsModule.IS_SELECTED], if fFlagAXFixSearchPurchaseSurface then var36 else nil)
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
						local var29 = if t then cryoModule.Dictionary.join(t.getAnalyticsMetadata(false), { keyword = t.getSearchKeyword(false) }) else {}
						
						if fFlagAXUnifiedImpressionsOnThumbnail then
							local var30 = p10:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local var31 = resolveClickSurfaceModule(p10, if var36 then var36.current else nil)
							
							if var31 ~= nil then
								var29.surface = var31
							end
							if (if var30 ~= nil then var31 else var30) ~= unifiedLoggingSurface.SEARCH_RESULTS then
								var29.keyword = nil
							end
						elseif var36 and var36.current and var36.current.current then
							local name = avatarScreenProperties[var36.current.opaque.name]
							
							if name and name.analyticsData then
								var29.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var29.cartId = cartIdServiceModule.getCartId()
						end
						if fFlagAXUnifiedImpressionsOnThumbnail then
							var29 = applyClickStampFieldOverridesModule(var29, attributes)
						end
						sendUnifiedEventLogForInstanceModule(p10, var29, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p11)
				-- upvalues: t (write)
				local var32 = t[p11]
				
				if var32 then
					var32:Disconnect()
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
	end,
	useUnifiedEventListenerInExperience = function()
		-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSearchPurchaseSurface (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local useEffect = reactModule.useEffect
		local var38 = nil
		local var39 = nil
		useEffect(function()
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var38 (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var39 (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p12)
				-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var38 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var39 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var25 = getChildButton(p12)
				
				if var25 then
					t[p12] = var25.Activated:Connect(function()
						-- upvalues: p12 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSearchPurchaseSurface (copy), var38 (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var39 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p12:GetAttributes()
						
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p12)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p12, attributes[unifiedEventLogConstantsModule.IS_SELECTED], if fFlagAXFixSearchPurchaseSurface then var38 else nil)
						end
						if fFlagAXFixSingleItemPurchaseWidgetLogging and fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
							local attributes_1 = (getDeferredPurchaseSourceTileModule(collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME), p12, attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or p12):GetAttributes()
							
							for i, v in unifiedEventLoggingUtilsModule.getScreenSize(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
							end
							for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
							end
							lastDeferredSingleItemStoreModule.setSnapshot(attributes_1)
						end
						local var29 = if var39 then cryoModule.Dictionary.join(var39.getAnalyticsMetadata(false), { keyword = var39.getSearchKeyword(false) }) else {}
						
						if fFlagAXUnifiedImpressionsOnThumbnail then
							local var30 = p12:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local var31 = resolveClickSurfaceModule(p12, if var38 then var38.current else nil)
							
							if var31 ~= nil then
								var29.surface = var31
							end
							if (if var30 ~= nil then var31 else var30) ~= unifiedLoggingSurface.SEARCH_RESULTS then
								var29.keyword = nil
							end
						elseif var38 and var38.current and var38.current.current then
							local name = avatarScreenProperties[var38.current.opaque.name]
							
							if name and name.analyticsData then
								var29.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var29.cartId = cartIdServiceModule.getCartId()
						end
						if fFlagAXUnifiedImpressionsOnThumbnail then
							var29 = applyClickStampFieldOverridesModule(var29, attributes)
						end
						sendUnifiedEventLogForInstanceModule(p12, var29, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p13)
				-- upvalues: t (write)
				local var32 = t[p13]
				
				if var32 then
					var32:Disconnect()
				end
				t[p13] = nil
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