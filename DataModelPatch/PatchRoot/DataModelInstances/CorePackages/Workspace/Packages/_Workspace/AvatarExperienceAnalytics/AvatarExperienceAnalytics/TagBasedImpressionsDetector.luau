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
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local FFlagAXItemDetailsIxpExposure = require(Parent.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure

local function AnalyticsMetadataSelector(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

return function(p1)
	-- upvalues: FFlagAXItemDetailsIxpExposure (copy), UseAvatarRouteFunction (copy), UseSelectorSignalFunction (copy), SelectSearchKeyword (copy), AnalyticsMetadataSelector (copy), ReactModule (copy), AvatarScreenProperties (copy), SendUnifiedEventLogForInstanceModule (copy), CryoModule (copy), UnifiedEventLogEnumsModule (copy), CollectionService (copy), UnifiedEventLogConstantsModule (copy), AvatarExperienceScreenSizeImpressionsDetectorModule (copy)
	local v1 = nil
	local Callback = nil
	local Callback1 = nil
	
	if not FFlagAXItemDetailsIxpExposure then
		v1 = UseAvatarRouteFunction()
		Callback = UseSelectorSignalFunction(SelectSearchKeyword)
		Callback1 = UseSelectorSignalFunction(AnalyticsMetadataSelector)
	end
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = if FFlagAXItemDetailsIxpExposure then ReactModule.useRef({}) else nil
	local UseResult = ReactModule.useCallback(function(Object): boolean
		-- upvalues: UseRefResult (copy)
		return not UseRefResult.current[Object:GetFullName()]
	end, {})
	local UseResult1 = ReactModule.useCallback(function(List)
		-- upvalues: UseRefResult (copy), FFlagAXItemDetailsIxpExposure (upval), UseRefResult1 (ref), AvatarScreenProperties (upval), v1 (ref), SendUnifiedEventLogForInstanceModule (upval), CryoModule (upval), Callback1 (ref), UnifiedEventLogEnumsModule (upval), Callback (ref), p1 (copy)
		local VisibleInstances = {}
		
		for _, value in List do
			local FullName = value:GetFullName()
			
			if not UseRefResult.current[FullName] then
				if FFlagAXItemDetailsIxpExposure then
					VisibleInstances[FullName] = value
					
					if not UseRefResult1.current[FullName] then
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
					SendUnifiedEventLogForInstanceModule(value, CryoModule.Dictionary.join(Callback1(false), {
						action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
						surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
						keyword = Callback(false)
					}), {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end
				UseRefResult.current[FullName] = true
			end
		end
		if FFlagAXItemDetailsIxpExposure and next(VisibleInstances) and p1.extensions then
			for _, visibleInstance in VisibleInstances do
				for _, extension in p1.extensions do
					extension({ visibleInstance = visibleInstance })
				end
			end
		end
	end, if FFlagAXItemDetailsIxpExposure then { p1.extensions } else { v1, Callback, Callback1 })
	
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
		collectObjectsFunc = ReactModule.useCallback(function()
			-- upvalues: CollectionService (upval), UnifiedEventLogConstantsModule (upval)
			return CollectionService:GetTagged(UnifiedEventLogConstantsModule.TAG_NAME)
		end, {})
	})
end