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

local function markLastActivated(p0) --[[ line: 30 ]]
	-- upvalues: collectionService (ref), unifiedEventLogConstantsModule (ref)
	for i, v in collectionService:GetTagged(unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME) do
		collectionService:RemoveTag(v, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
	end
	collectionService:AddTag(p0, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
end

local function markSelectionListStatus(p1, p2) --[[ line: 41 ]]
	-- upvalues: fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), unifiedEventLoggingUtilsModule (ref), unifiedEventLogConstantsModule (ref), unifiedSelectionListStoreModule (ref)
	local attributes = p1:GetAttributes()
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		for i, v in unifiedEventLoggingUtilsModule.getScreenSize(p1) do
			attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
		end
		for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(p1) do
			attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
		end
	end
	if p2 then
		unifiedSelectionListStoreModule.removeFromSelectionList(attributes)
		
		return
	end
	unifiedSelectionListStoreModule.addToSelectionList(attributes)
end

local function getChildButton(p3) --[[ line: 66 ]]
	if not p3 then
		return nil
	elseif p3:IsA("TextButton") or p3:IsA("ImageButton") or p3:IsA("GuiButton") then
		return p3
	end
	for i, v in p3:GetDescendants() do
		if p3:IsA("TextButton") or p3:IsA("ImageButton") or p3:IsA("GuiButton") then
			return p3
		end
	end
	return nil
end

local function AnalyticsMetadataSelector(p4) --[[ line: 84 ]]
	return p4.AvatarExperience.AnalyticsMetadata
end

local _ = function(p5, p6) --[[ line: 88 ]]
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
	reactModule.useEffect(function() --[[ line: 89 ]]
		-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p5 (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), p6 (ref), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
		local t = {}
		t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p7) --[[ line: 97 ]]
			-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p5 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), p6 (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
			local var23 = getChildButton(p7)
			
			if var23 then
				t[p7] = var23.Activated:Connect(function() --[[ line: 100 ]]
					-- upvalues: p7 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), p5 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), p6 (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
					local attributes = p7:GetAttributes()
					
					if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						markLastActivated(p7)
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
						markSelectionListStatus(p7, attributes[unifiedEventLogConstantsModule.IS_SELECTED])
					end
					if fFlagAXFixSingleItemPurchaseWidgetLogging and fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
						local TAG_NAME = getDeferredPurchaseSourceTileModule(collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME), p7, attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or p7
						local attributes_1 = TAG_NAME:GetAttributes()
						
						for i, v in unifiedEventLoggingUtilsModule.getScreenSize(TAG_NAME) do
							attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
						end
						for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(TAG_NAME) do
							attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
						end
						lastDeferredSingleItemStoreModule.setSnapshot(attributes_1)
					end
					local var27 = if p5 then cryoModule.Dictionary.join(p5.getAnalyticsMetadata(false), { keyword = p5.getSearchKeyword(false) }) else {}
					
					if fFlagAXUnifiedImpressionsOnThumbnail then
						local var28 = p7:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
						local var29 = resolveClickSurfaceModule(p7, if p6 then p6.current else nil)
						
						if var29 ~= nil then
							var27.surface = var29
						end
						if (if var28 ~= nil then var29 else var28) ~= unifiedLoggingSurface.SEARCH_RESULTS then
							var27.keyword = nil
						end
					elseif p6 and p6.current and p6.current.current then
						local name = avatarScreenProperties[p6.current.opaque.name]
						
						if name and name.analyticsData then
							var27.surface = name.analyticsData.unifiedLoggingSurface
						end
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						var27.cartId = cartIdServiceModule.getCartId()
					end
					if fFlagAXUnifiedImpressionsOnThumbnail then
						var27 = applyClickStampFieldOverridesModule(var27, attributes)
					end
					sendUnifiedEventLogForInstanceModule(p7, var27, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end)
			end
		end)
		t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p8) --[[ line: 217 ]]
			-- upvalues: t (write)
			local var30 = t[p8]
			
			if var30 then
				var30:Disconnect()
			end
			t[p8] = nil
		end)
		
		return function() --[[ line: 226 ]]
			-- upvalues: t (write)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
		end
	end, {})
end

return {
	useUnifiedEventListener = function() --[[ line: 236 ]]
		-- upvalues: useSelectorSignal (ref), AnalyticsMetadataSelector (ref), selectSearchKeyword (ref), useAvatarRoute (ref), reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local var31 = useSelectorSignal(AnalyticsMetadataSelector)
		local var32 = useSelectorSignal(selectSearchKeyword)
		local var33 = useAvatarRoute()
		local var34 = reactModule.useRef(var33)
		reactModule.useEffect(function() --[[ line: 242 ]]
			-- upvalues: var34 (ref), var33 (ref)
			var34.current = var33
		end, { var33 })
		local t = { getAnalyticsMetadata = var31, getSearchKeyword = var32 }
		reactModule.useEffect(function() --[[ line: 89 ]]
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), var34 (ref), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p9) --[[ line: 97 ]]
				-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), var34 (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var23 = getChildButton(p9)
				
				if var23 then
					t[p9] = var23.Activated:Connect(function() --[[ line: 100 ]]
						-- upvalues: p9 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), t (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), var34 (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p9:GetAttributes()
						
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p9)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p9, attributes[unifiedEventLogConstantsModule.IS_SELECTED])
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
						local var27 = if t then cryoModule.Dictionary.join(t.getAnalyticsMetadata(false), { keyword = t.getSearchKeyword(false) }) else {}
						
						if fFlagAXUnifiedImpressionsOnThumbnail then
							local var28 = p9:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local var29 = resolveClickSurfaceModule(p9, if var34 then var34.current else nil)
							
							if var29 ~= nil then
								var27.surface = var29
							end
							if (if var28 ~= nil then var29 else var28) ~= unifiedLoggingSurface.SEARCH_RESULTS then
								var27.keyword = nil
							end
						elseif var34 and var34.current and var34.current.current then
							local name = avatarScreenProperties[var34.current.opaque.name]
							
							if name and name.analyticsData then
								var27.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var27.cartId = cartIdServiceModule.getCartId()
						end
						if fFlagAXUnifiedImpressionsOnThumbnail then
							var27 = applyClickStampFieldOverridesModule(var27, attributes)
						end
						sendUnifiedEventLogForInstanceModule(p9, var27, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p10) --[[ line: 217 ]]
				-- upvalues: t (write)
				local var30 = t[p10]
				
				if var30 then
					var30:Disconnect()
				end
				t[p10] = nil
			end)
			
			return function() --[[ line: 226 ]]
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {})
	end,
	useUnifiedEventListenerInExperience = function() --[[ line: 252 ]]
		-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), getDeferredPurchaseSourceTileModule (ref), unifiedEventLoggingUtilsModule (ref), lastDeferredSingleItemStoreModule (ref), cryoModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), resolveClickSurfaceModule (ref), unifiedLoggingSurface (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), applyClickStampFieldOverridesModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local useEffect = reactModule.useEffect
		local var36 = nil
		local var37 = nil
		useEffect(function() --[[ line: 89 ]]
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var36 (ref), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), var37 (ref), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p11) --[[ line: 97 ]]
				-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var36 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), var37 (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var23 = getChildButton(p11)
				
				if var23 then
					t[p11] = var23.Activated:Connect(function() --[[ line: 100 ]]
						-- upvalues: p11 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), fFlagAXFixSingleItemPurchaseWidgetLogging (copy), unifiedEventLogEnumsModule (copy), getDeferredPurchaseSourceTileModule (copy), collectionService (copy), unifiedEventLoggingUtilsModule (copy), lastDeferredSingleItemStoreModule (copy), var36 (copy), cryoModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), resolveClickSurfaceModule (copy), var37 (copy), unifiedLoggingSurface (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), applyClickStampFieldOverridesModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p11:GetAttributes()
						
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p11)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p11, attributes[unifiedEventLogConstantsModule.IS_SELECTED])
						end
						if fFlagAXFixSingleItemPurchaseWidgetLogging and fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "action"] == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
							local attributes_1 = (getDeferredPurchaseSourceTileModule(collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME), p11, attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"], attributes[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"]) or p11):GetAttributes()
							
							for i, v in unifiedEventLoggingUtilsModule.getScreenSize(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = v
							end
							for i_1, v_1 in unifiedEventLoggingUtilsModule.getElementSizeAndPosition(TAG_NAME) do
								attributes_1[unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i_1] = v_1
							end
							lastDeferredSingleItemStoreModule.setSnapshot(attributes_1)
						end
						local var27 = if var36 then cryoModule.Dictionary.join(var36.getAnalyticsMetadata(false), { keyword = var36.getSearchKeyword(false) }) else {}
						
						if fFlagAXUnifiedImpressionsOnThumbnail then
							local var28 = p11:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")
							local var29 = resolveClickSurfaceModule(p11, if var37 then var37.current else nil)
							
							if var29 ~= nil then
								var27.surface = var29
							end
							if (if var28 ~= nil then var29 else var28) ~= unifiedLoggingSurface.SEARCH_RESULTS then
								var27.keyword = nil
							end
						elseif var37 and var37.current and var37.current.current then
							local name = avatarScreenProperties[var37.current.opaque.name]
							
							if name and name.analyticsData then
								var27.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var27.cartId = cartIdServiceModule.getCartId()
						end
						if fFlagAXUnifiedImpressionsOnThumbnail then
							var27 = applyClickStampFieldOverridesModule(var27, attributes)
						end
						sendUnifiedEventLogForInstanceModule(p11, var27, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p12) --[[ line: 217 ]]
				-- upvalues: t (write)
				local var30 = t[p12]
				
				if var30 then
					var30:Disconnect()
				end
				t[p12] = nil
			end)
			
			return function() --[[ line: 226 ]]
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {})
	end
}