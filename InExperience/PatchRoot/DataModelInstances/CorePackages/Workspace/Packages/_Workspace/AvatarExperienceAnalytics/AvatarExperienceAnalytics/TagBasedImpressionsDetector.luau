local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local collectionService = game:GetService("CollectionService")
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local avatarExperienceScreenSizeImpressionsDetectorModule = require(script.Parent.AvatarExperienceScreenSizeImpressionsDetector)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local sendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local selectSearchKeyword = avatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local fFlagAXItemDetailsIxpExposure = require(parent.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure

local function AnalyticsMetadataSelector(p0) --[[ line: 31 ]]
	return p0.AvatarExperience.AnalyticsMetadata
end

return function(p1) --[[ line: 35 ]]
	-- upvalues: fFlagAXItemDetailsIxpExposure (ref), useAvatarRoute (ref), useSelectorSignal (ref), selectSearchKeyword (ref), AnalyticsMetadataSelector (ref), reactModule (ref), avatarScreenProperties (ref), sendUnifiedEventLogForInstanceModule (ref), cryoModule (ref), unifiedEventLogEnumsModule (ref), collectionService (ref), unifiedEventLogConstantsModule (ref), avatarExperienceScreenSizeImpressionsDetectorModule (ref)
	local var10 = nil
	local var11 = nil
	local var12 = nil
	
	if not fFlagAXItemDetailsIxpExposure then
		var10 = useAvatarRoute()
		var11 = useSelectorSignal(selectSearchKeyword)
		var12 = useSelectorSignal(AnalyticsMetadataSelector)
	end
	local var13 = reactModule.useRef({})
	local var14 = if fFlagAXItemDetailsIxpExposure then reactModule.useRef({}) else nil
	local var15 = reactModule.useCallback(function(p2) --[[ line: 51 ]]
		-- upvalues: var13 (ref)
		return not var13.current[p2:GetFullName()]
	end, {})
	local var16 = reactModule.useCallback(function(p3) --[[ line: 56 ]]
		-- upvalues: var13 (ref), fFlagAXItemDetailsIxpExposure (copy), var14 (write), avatarScreenProperties (copy), var10 (write), sendUnifiedEventLogForInstanceModule (copy), cryoModule (copy), var12 (write), unifiedEventLogEnumsModule (copy), var11 (write), p1 (ref)
		local t = {}
		
		for i, v in p3 do
			local fullName = v:GetFullName()
			
			if not var13.current[fullName] then
				if fFlagAXItemDetailsIxpExposure then
					t[fullName] = v
					
					if not var14.current[fullName] then
						var14.current[fullName] = v.AncestryChanged:Connect(function() --[[ line: 69 ]]
							-- upvalues: v (ref), var13 (copy), fullName (ref), var14 (copy)
							if not v.Parent then
								var13.current[fullName] = nil
								
								if var14.current[fullName] then
									var14.current[fullName]:Disconnect()
									var14.current[fullName] = nil
								end
							end
						end)
					end
				else
					local name = avatarScreenProperties[var10.current.name]
					sendUnifiedEventLogForInstanceModule(v, cryoModule.Dictionary.join(var12(false), {
						action = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
						surface = if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil,
						keyword = var11(false)
					}), {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end
				var13.current[fullName] = true
			end
		end
		if fFlagAXItemDetailsIxpExposure and next(t) and p1.extensions then
			for i, v_1 in t do
				for i_2, v_2 in p1.extensions do
					v_2({ visibleInstance = v_1 })
				end
			end
		end
	end, if fFlagAXItemDetailsIxpExposure then { p1.extensions } else { var10, var11, var12 })
	
	if fFlagAXItemDetailsIxpExposure then
		reactModule.useEffect(function() --[[ line: 121 ]]
			-- upvalues: var14 (write)
			return function() --[[ line: 122 ]]
				-- upvalues: var14 (copy)
				for i, v in var14.current do
					if v then
						v:Disconnect()
					end
				end
				var14.current = {}
			end
		end, {})
	end
	return reactModule.createElement(avatarExperienceScreenSizeImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		pageFilter = p1.pageFilter,
		onRequestImpressionsSignal = p1.requestImpressionsSignal,
		filterImpressionFunc = var15,
		onImpressionsDetected = var16,
		collectObjectsFunc = reactModule.useCallback(function() --[[ line: 133 ]]
			-- upvalues: collectionService (copy), unifiedEventLogConstantsModule (copy)
			return collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME)
		end, {})
	})
end