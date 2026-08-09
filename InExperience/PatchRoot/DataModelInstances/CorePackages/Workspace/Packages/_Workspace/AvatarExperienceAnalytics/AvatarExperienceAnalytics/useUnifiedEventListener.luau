local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local sendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local unifiedSelectionListStoreModule = require(avatarExperienceAnalytics.Store.UnifiedSelectionListStore)
local cartIdServiceModule = require(avatarExperienceAnalytics.Lib.CartIdService)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local selectSearchKeyword = avatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local fFlagAXMISEnableMultiShoppingUnifiedEvents = require(parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents

local function markLastActivated(p0) --[[ line: 22 ]]
	-- upvalues: collectionService (ref), unifiedEventLogConstantsModule (ref)
	for i, v in collectionService:GetTagged(unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME) do
		collectionService:RemoveTag(v, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
	end
	collectionService:AddTag(p0, unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
end

local function markSelectionListStatus(p1, p2) --[[ line: 33 ]]
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

local function getChildButton(p3) --[[ line: 58 ]]
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

local function AnalyticsMetadataSelector(p4) --[[ line: 76 ]]
	return p4.AvatarExperience.AnalyticsMetadata
end

local _ = function(p5, p6) --[[ line: 80 ]]
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), cryoModule (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), sendUnifiedEventLogForInstanceModule (ref)
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), p5 (ref), cryoModule (copy), p6 (ref), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy)
		local t = {}
		t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p7) --[[ line: 89 ]]
			-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), p5 (copy), cryoModule (copy), p6 (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
			local var17 = getChildButton(p7)
			
			if var17 then
				t[p7] = var17.Activated:Connect(function() --[[ line: 92 ]]
					-- upvalues: p7 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), p5 (copy), cryoModule (copy), p6 (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy)
					local attributes = p7:GetAttributes()
					
					if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						markLastActivated(p7)
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
						markSelectionListStatus(p7, attributes[unifiedEventLogConstantsModule.IS_SELECTED])
					end
					local var19 = if p5 then cryoModule.Dictionary.join(p5.getAnalyticsMetadata(false), { keyword = p5.getSearchKeyword(false) }) else {}
					
					if p6 and p6.current and p6.current.current then
						local name = avatarScreenProperties[p6.current.opaque.name]
						
						if name and name.analyticsData then
							var19.surface = name.analyticsData.unifiedLoggingSurface
						end
					end
					if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						var19.cartId = cartIdServiceModule.getCartId()
					end
					sendUnifiedEventLogForInstanceModule(p7, var19, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end)
			end
		end)
		t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p8) --[[ line: 142 ]]
			-- upvalues: t (write)
			local var20 = t[p8]
			
			if var20 then
				var20:Disconnect()
			end
			t[p8] = nil
		end)
		
		return function() --[[ line: 151 ]]
			-- upvalues: t (write)
			for i, v in t do
				v:Disconnect()
			end
			t = {}
		end
	end, {})
end

return {
	useUnifiedEventListener = function() --[[ line: 161 ]]
		-- upvalues: useSelectorSignal (ref), AnalyticsMetadataSelector (ref), selectSearchKeyword (ref), useAvatarRoute (ref), reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), cryoModule (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local var21 = useSelectorSignal(AnalyticsMetadataSelector)
		local var22 = useSelectorSignal(selectSearchKeyword)
		local var23 = useAvatarRoute()
		local var24 = reactModule.useRef(var23)
		reactModule.useEffect(function() --[[ line: 167 ]]
			-- upvalues: var24 (ref), var23 (ref)
			var24.current = var23
		end, { var23 })
		local t = { getAnalyticsMetadata = var21, getSearchKeyword = var22 }
		reactModule.useEffect(function() --[[ line: 81 ]]
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), t (ref), cryoModule (copy), var24 (ref), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p9) --[[ line: 89 ]]
				-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), t (copy), cryoModule (copy), var24 (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var17 = getChildButton(p9)
				
				if var17 then
					t[p9] = var17.Activated:Connect(function() --[[ line: 92 ]]
						-- upvalues: p9 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), t (copy), cryoModule (copy), var24 (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p9:GetAttributes()
						
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p9)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p9, attributes[unifiedEventLogConstantsModule.IS_SELECTED])
						end
						local var19 = if t then cryoModule.Dictionary.join(t.getAnalyticsMetadata(false), { keyword = t.getSearchKeyword(false) }) else {}
						
						if var24 and var24.current and var24.current.current then
							local name = avatarScreenProperties[var24.current.opaque.name]
							
							if name and name.analyticsData then
								var19.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var19.cartId = cartIdServiceModule.getCartId()
						end
						sendUnifiedEventLogForInstanceModule(p9, var19, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p10) --[[ line: 142 ]]
				-- upvalues: t (write)
				local var20 = t[p10]
				
				if var20 then
					var20:Disconnect()
				end
				t[p10] = nil
			end)
			
			return function() --[[ line: 151 ]]
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {})
	end,
	useUnifiedEventListenerInExperience = function() --[[ line: 177 ]]
		-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), getChildButton (ref), markLastActivated (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), markSelectionListStatus (ref), cryoModule (ref), avatarScreenProperties (ref), cartIdServiceModule (ref), sendUnifiedEventLogForInstanceModule (ref)
		local useEffect = reactModule.useEffect
		local var26 = nil
		local var27 = nil
		useEffect(function() --[[ line: 81 ]]
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), var26 (ref), cryoModule (copy), var27 (ref), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy)
			local t = {}
			t.instanceAdded = collectionService:GetInstanceAddedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p11) --[[ line: 89 ]]
				-- upvalues: getChildButton (copy), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), var26 (copy), cryoModule (copy), var27 (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy), t (write)
				local var17 = getChildButton(p11)
				
				if var17 then
					t[p11] = var17.Activated:Connect(function() --[[ line: 92 ]]
						-- upvalues: p11 (ref), unifiedEventLogConstantsModule (copy), markLastActivated (copy), fFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), var26 (copy), cryoModule (copy), var27 (copy), avatarScreenProperties (copy), cartIdServiceModule (copy), sendUnifiedEventLogForInstanceModule (copy)
						local attributes = p11:GetAttributes()
						
						if attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(p11)
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and attributes[unifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(p11, attributes[unifiedEventLogConstantsModule.IS_SELECTED])
						end
						local var19 = if var26 then cryoModule.Dictionary.join(var26.getAnalyticsMetadata(false), { keyword = var26.getSearchKeyword(false) }) else {}
						
						if var27 and var27.current and var27.current.current then
							local name = avatarScreenProperties[var27.current.opaque.name]
							
							if name and name.analyticsData then
								var19.surface = name.analyticsData.unifiedLoggingSurface
							end
						end
						if fFlagAXMISEnableMultiShoppingUnifiedEvents and attributes[unifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							var19.cartId = cartIdServiceModule.getCartId()
						end
						sendUnifiedEventLogForInstanceModule(p11, var19, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			t.instanceRemoved = collectionService:GetInstanceRemovedSignal(unifiedEventLogConstantsModule.TAG_NAME):Connect(function(p12) --[[ line: 142 ]]
				-- upvalues: t (write)
				local var20 = t[p12]
				
				if var20 then
					var20:Disconnect()
				end
				t[p12] = nil
			end)
			
			return function() --[[ line: 151 ]]
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
				t = {}
			end
		end, {})
	end
}