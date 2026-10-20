local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local UnifiedSelectionListStoreModule = require(AvatarExperienceAnalytics.Store.UnifiedSelectionListStore)
local CartIdServiceModule = require(AvatarExperienceAnalytics.Lib.CartIdService)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents

local function markLastActivated(Key)
	-- upvalues: CollectionService (copy), UnifiedEventLogConstantsModule (copy)
	for _, value in CollectionService:GetTagged(UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME) do
		CollectionService:RemoveTag(value, UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
	end
	CollectionService:AddTag(Key, UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
end

local function markSelectionListStatus(Key, p1)
	-- upvalues: FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLoggingUtilsModule (copy), UnifiedEventLogConstantsModule (copy), UnifiedSelectionListStoreModule (copy)
	local Attributes = Key:GetAttributes()
	
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		for i, value in UnifiedEventLoggingUtilsModule.getScreenSize(Key) do
			Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i] = value
		end
		for i1, value1 in UnifiedEventLoggingUtilsModule.getElementSizeAndPosition(Key) do
			Attributes[UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i1] = value1
		end
	end
	if p1 then
		UnifiedSelectionListStoreModule.removeFromSelectionList(Attributes)
		
		return
	else
		UnifiedSelectionListStoreModule.addToSelectionList(Attributes)
	end
end

local function getChildButton(Object)
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

local function AnalyticsMetadataSelector(p2)
	return p2.AvatarExperience.AnalyticsMetadata
end

local function _(p2, p3)
	-- upvalues: ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), CryoModule (copy), AvatarScreenProperties (copy), CartIdServiceModule (copy), SendUnifiedEventLogForInstanceModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), getChildButton (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), p2 (copy), CryoModule (upval), p3 (copy), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval)
		local ActivatedConnections = {}
		ActivatedConnections.instanceAdded = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged)
			-- upvalues: getChildButton (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), p2 (upval), CryoModule (upval), p3 (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval), ActivatedConnections (ref)
			local v1 = getChildButton(Tagged)
			
			if v1 then
				ActivatedConnections[Tagged] = v1.Activated:Connect(function()
					-- upvalues: Tagged (copy), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), p2 (upval), CryoModule (upval), p3 (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval)
					local Attributes = Tagged:GetAttributes()
					
					if Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						markLastActivated(Tagged)
					end
					if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and Attributes[UnifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
						markSelectionListStatus(Tagged, Attributes[UnifiedEventLogConstantsModule.IS_SELECTED])
					end
					local JoinResult = if p2 then CryoModule.Dictionary.join(p2.getAnalyticsMetadata(false), { keyword = p2.getSearchKeyword(false) }) else {}
					
					if p3 and p3.current and p3.current.current then
						local v2 = AvatarScreenProperties[p3.current.opaque.name]
						
						if v2 and v2.analyticsData then
							JoinResult.surface = v2.analyticsData.unifiedLoggingSurface
						end
					end
					if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
						JoinResult.cartId = CartIdServiceModule.getCartId()
					end
					SendUnifiedEventLogForInstanceModule(Tagged, JoinResult, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end)
			end
		end)
		ActivatedConnections.instanceRemoved = CollectionService:GetInstanceRemovedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged)
			-- upvalues: ActivatedConnections (ref)
			local ActivatedConnection = ActivatedConnections[Tagged]
			
			if ActivatedConnection then
				ActivatedConnection:Disconnect()
			end
			ActivatedConnections[Tagged] = nil
		end)
		
		return function()
			-- upvalues: ActivatedConnections (ref)
			for _, activatedConnection in ActivatedConnections do
				activatedConnection:Disconnect()
			end
			ActivatedConnections = {}
		end
	end, {})
end

return {
	useUnifiedEventListener = function()
		-- upvalues: UseSelectorSignalFunction (copy), AnalyticsMetadataSelector (copy), SelectSearchKeyword (copy), UseAvatarRouteFunction (copy), ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), CryoModule (copy), AvatarScreenProperties (copy), CartIdServiceModule (copy), SendUnifiedEventLogForInstanceModule (copy)
		local UseSelectorSignalResult = UseSelectorSignalFunction(AnalyticsMetadataSelector)
		local UseSelectorSignalResult1 = UseSelectorSignalFunction(SelectSearchKeyword)
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local UseRefResult = ReactModule.useRef(UseAvatarRouteResult)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), UseAvatarRouteResult (copy)
			UseRefResult.current = UseAvatarRouteResult
		end, { UseAvatarRouteResult })
		local config = {
			getAnalyticsMetadata = UseSelectorSignalResult,
			getSearchKeyword = UseSelectorSignalResult1
		}
		ReactModule.useEffect(function()
			-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), getChildButton (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), config (copy), CryoModule (upval), UseRefResult (copy), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval)
			local ActivatedConnections = {}
			ActivatedConnections.instanceAdded = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged)
				-- upvalues: getChildButton (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), config (upval), CryoModule (upval), UseRefResult (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval), ActivatedConnections (ref)
				local v1 = getChildButton(Tagged)
				
				if v1 then
					ActivatedConnections[Tagged] = v1.Activated:Connect(function()
						-- upvalues: Tagged (copy), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), config (upval), CryoModule (upval), UseRefResult (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval)
						local Attributes = Tagged:GetAttributes()
						
						if Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(Tagged)
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and Attributes[UnifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(Tagged, Attributes[UnifiedEventLogConstantsModule.IS_SELECTED])
						end
						local JoinResult = if config then CryoModule.Dictionary.join(config.getAnalyticsMetadata(false), { keyword = config.getSearchKeyword(false) }) else {}
						
						if UseRefResult and UseRefResult.current and UseRefResult.current.current then
							local v2 = AvatarScreenProperties[UseRefResult.current.opaque.name]
							
							if v2 and v2.analyticsData then
								JoinResult.surface = v2.analyticsData.unifiedLoggingSurface
							end
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							JoinResult.cartId = CartIdServiceModule.getCartId()
						end
						SendUnifiedEventLogForInstanceModule(Tagged, JoinResult, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			ActivatedConnections.instanceRemoved = CollectionService:GetInstanceRemovedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged)
				-- upvalues: ActivatedConnections (ref)
				local ActivatedConnection = ActivatedConnections[Tagged]
				
				if ActivatedConnection then
					ActivatedConnection:Disconnect()
				end
				ActivatedConnections[Tagged] = nil
			end)
			
			return function()
				-- upvalues: ActivatedConnections (ref)
				for _, activatedConnection in ActivatedConnections do
					activatedConnection:Disconnect()
				end
				ActivatedConnections = {}
			end
		end, {})
	end,
	useUnifiedEventListenerInExperience = function()
		-- upvalues: ReactModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), getChildButton (copy), markLastActivated (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), markSelectionListStatus (copy), CryoModule (copy), AvatarScreenProperties (copy), CartIdServiceModule (copy), SendUnifiedEventLogForInstanceModule (copy)
		local v1 = nil
		local v2 = nil
		ReactModule.useEffect(function()
			-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval), getChildButton (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), v1 (copy), CryoModule (upval), v2 (copy), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval)
			local ActivatedConnections = {}
			ActivatedConnections.instanceAdded = CollectionService:GetInstanceAddedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged)
				-- upvalues: getChildButton (upval), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), v1 (upval), CryoModule (upval), v2 (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval), ActivatedConnections (ref)
				local v3 = getChildButton(Tagged)
				
				if v3 then
					ActivatedConnections[Tagged] = v3.Activated:Connect(function()
						-- upvalues: Tagged (copy), UnifiedEventLogConstantsModule (upval), markLastActivated (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), markSelectionListStatus (upval), v1 (upval), CryoModule (upval), v2 (upval), AvatarScreenProperties (upval), CartIdServiceModule (upval), SendUnifiedEventLogForInstanceModule (upval)
						local Attributes = Tagged:GetAttributes()
						
						if Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							markLastActivated(Tagged)
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] and Attributes[UnifiedEventLogConstantsModule.IS_SELECTED] ~= nil then
							markSelectionListStatus(Tagged, Attributes[UnifiedEventLogConstantsModule.IS_SELECTED])
						end
						local JoinResult = if v1 then CryoModule.Dictionary.join(v1.getAnalyticsMetadata(false), { keyword = v1.getSearchKeyword(false) }) else {}
						
						if v2 and v2.current and v2.current.current then
							local v4 = AvatarScreenProperties[v2.current.opaque.name]
							
							if v4 and v4.analyticsData then
								JoinResult.surface = v4.analyticsData.unifiedLoggingSurface
							end
						end
						if FFlagAXMISEnableMultiShoppingUnifiedEvents and Attributes[UnifiedEventLogConstantsModule.HAS_DEFERRED_ACTION] then
							JoinResult.cartId = CartIdServiceModule.getCartId()
						end
						SendUnifiedEventLogForInstanceModule(Tagged, JoinResult, {
							includeScreenSize = true,
							includeElementSizeAndPosition = true
						})
					end)
				end
			end)
			ActivatedConnections.instanceRemoved = CollectionService:GetInstanceRemovedSignal(UnifiedEventLogConstantsModule.TAG_NAME):Connect(function(Tagged)
				-- upvalues: ActivatedConnections (ref)
				local ActivatedConnection = ActivatedConnections[Tagged]
				
				if ActivatedConnection then
					ActivatedConnection:Disconnect()
				end
				ActivatedConnections[Tagged] = nil
			end)
			
			return function()
				-- upvalues: ActivatedConnections (ref)
				for _, activatedConnection in ActivatedConnections do
					activatedConnection:Disconnect()
				end
				ActivatedConnections = {}
			end
		end, {})
	end
}