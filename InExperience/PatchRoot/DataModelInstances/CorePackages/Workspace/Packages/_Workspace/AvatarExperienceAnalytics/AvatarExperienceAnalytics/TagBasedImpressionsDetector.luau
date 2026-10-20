local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local CollectionService = game:GetService("CollectionService")
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local AvatarExperienceScreenSizeImpressionsDetectorModule = require(script.Parent.AvatarExperienceScreenSizeImpressionsDetector)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local SeenImpressionsStoreModule = require(script.Parent.Store.SeenImpressionsStore)
local UnifiedImpressions = SeenImpressionsStoreModule.Category.UnifiedImpressions
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXItemDetailsIxpExposure = AvatarExperienceFlagsModule.FFlagAXItemDetailsIxpExposure
local FFlagAXUnifiedImpressionsOnThumbnail = AvatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail

local function AnalyticsMetadataSelector(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

local function getImpressionDedupKey(Object)
	-- upvalues: UnifiedEventLogConstantsModule (copy)
	local ATTRIBUTEPREFIX = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX
	local Attribute = Object:GetAttribute(ATTRIBUTEPREFIX .. "widgetId")
	local Attribute1 = Object:GetAttribute(ATTRIBUTEPREFIX .. "itemId")
	
	return if Attribute1 == nil then if Attribute == nil then Object:GetFullName() else "widget|" .. tostring(Attribute) else string.format("item|%s|%s|%s|%s|%s", tostring(Attribute), tostring(Attribute1), tostring(Object:GetAttribute(ATTRIBUTEPREFIX .. "gridPositionRow")), tostring(Object:GetAttribute(ATTRIBUTEPREFIX .. "gridPositionColumn")), (tostring(Object:GetAttribute(ATTRIBUTEPREFIX .. "itemPosition"))))
end

return function(p1)
	-- upvalues: FFlagAXItemDetailsIxpExposure (copy), UseAvatarRouteFunction (copy), UseSelectorSignalFunction (copy), SelectSearchKeyword (copy), AnalyticsMetadataSelector (copy), ReactModule (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), UnifiedEventLogConstantsModule (copy), SeenImpressionsStoreModule (copy), UnifiedImpressions (copy), getImpressionDedupKey (copy), AvatarScreenProperties (copy), SendUnifiedEventLogForInstanceModule (copy), CryoModule (copy), UnifiedEventLogEnumsModule (copy), CollectionService (copy), AvatarExperienceScreenSizeImpressionsDetectorModule (copy)
	local v1 = nil
	local Callback1 = nil
	local Callback = nil
	
	if not FFlagAXItemDetailsIxpExposure then
		v1 = UseAvatarRouteFunction()
		Callback1 = UseSelectorSignalFunction(SelectSearchKeyword)
		Callback = UseSelectorSignalFunction(AnalyticsMetadataSelector)
	end
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = if FFlagAXItemDetailsIxpExposure then ReactModule.useRef({}) else nil
	local UseResult = ReactModule.useCallback(function(Object): boolean
		-- upvalues: FFlagAXUnifiedImpressionsOnThumbnail (upval), UnifiedEventLogConstantsModule (upval), SeenImpressionsStoreModule (upval), UnifiedImpressions (upval), getImpressionDedupKey (upval), UseRefResult (copy)
		return if FFlagAXUnifiedImpressionsOnThumbnail then not Object:GetAttribute(UnifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION) and not SeenImpressionsStoreModule.hasSeen(UnifiedImpressions, getImpressionDedupKey(Object)) else not UseRefResult.current[Object:GetFullName()]
	end, {})
	local UseResult1 = ReactModule.useCallback(function(List)
		-- upvalues: FFlagAXUnifiedImpressionsOnThumbnail (upval), SeenImpressionsStoreModule (upval), UnifiedImpressions (upval), getImpressionDedupKey (upval), UseRefResult (copy), FFlagAXItemDetailsIxpExposure (upval), UseRefResult1 (ref), AvatarScreenProperties (upval), v1 (ref), SendUnifiedEventLogForInstanceModule (upval), CryoModule (upval), Callback (ref), UnifiedEventLogEnumsModule (upval), Callback1 (ref), p1 (copy)
		local VisibleInstances = {}
		
		for _, value in List do
			local FullName = value:GetFullName()
			
			if not (if FFlagAXUnifiedImpressionsOnThumbnail then SeenImpressionsStoreModule.hasSeen(UnifiedImpressions, getImpressionDedupKey(value)) else UseRefResult.current[FullName]) then
				if FFlagAXItemDetailsIxpExposure then
					VisibleInstances[FullName] = value
					
					if not FFlagAXUnifiedImpressionsOnThumbnail and not UseRefResult1.current[FullName] then
						UseRefResult1.current[FullName] = value.AncestryChanged:Connect(function()
							-- upvalues: value (copy), UseRefResult (upval), FullName (copy), UseRefResult1 (upval)
							if not value.Parent then
								UseRefResult.current[FullName] = nil
								
								if UseRefResult1.current[FullName] then
									UseRefResult1.current[FullName]:Disconnect()
									UseRefResult1.current[FullName] = nil
								end
							end
						end)
					end
				else
					local AvatarScreenProperty = AvatarScreenProperties[v1.current.name]
					SendUnifiedEventLogForInstanceModule(value, CryoModule.Dictionary.join(Callback(false), {
						action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
						surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
						keyword = Callback1(false)
					}), {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end
				if FFlagAXUnifiedImpressionsOnThumbnail then
					SeenImpressionsStoreModule.markSeen(UnifiedImpressions, getImpressionDedupKey(value))
				else
					UseRefResult.current[FullName] = true
				end
			end
		end
		if FFlagAXItemDetailsIxpExposure and next(VisibleInstances) and p1.extensions then
			for _, visibleInstance in VisibleInstances do
				for _, extension in p1.extensions do
					extension({ visibleInstance = visibleInstance })
				end
			end
		end
	end, if FFlagAXItemDetailsIxpExposure then { p1.extensions } else { v1, Callback1, Callback })
	
	if FFlagAXItemDetailsIxpExposure then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (ref)
			return function()
				-- upvalues: UseRefResult1 (upval)
				for _, Connection in UseRefResult1.current do
					if Connection then
						Connection:Disconnect()
					end
				end
				UseRefResult1.current = {}
			end
		end, {})
	end
	return ReactModule.createElement(AvatarExperienceScreenSizeImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		pageFilter = p1.pageFilter,
		onRequestImpressionsSignal = p1.requestImpressionsSignal,
		filterImpressionFunc = UseResult,
		onImpressionsDetected = UseResult1,
		collectObjectsFunc = ReactModule.useCallback(function(Ancestor)
			-- upvalues: FFlagAXUnifiedImpressionsOnThumbnail (upval), CollectionService (upval), UnifiedEventLogConstantsModule (upval)
			if not FFlagAXUnifiedImpressionsOnThumbnail then
				return CollectionService:GetTagged(UnifiedEventLogConstantsModule.TAG_NAME)
			end
			local Tagged = CollectionService:GetTagged(UnifiedEventLogConstantsModule.TAG_NAME)
			
			if not Ancestor then
				return Tagged
			end
			local List = {}
			
			for _, value in Tagged do
				if value:IsDescendantOf(Ancestor) then
					table.insert(List, value)
				end
			end
			return List
		end, {})
	})
end