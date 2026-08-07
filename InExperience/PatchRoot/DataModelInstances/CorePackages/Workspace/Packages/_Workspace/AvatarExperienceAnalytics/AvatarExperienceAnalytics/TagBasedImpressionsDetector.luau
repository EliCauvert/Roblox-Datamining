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
local seenImpressionsStoreModule = require(script.Parent.Store.SeenImpressionsStore)
local unifiedImpressions = seenImpressionsStoreModule.Category.UnifiedImpressions
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local selectSearchKeyword = avatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXItemDetailsIxpExposure = avatarExperienceFlagsModule.FFlagAXItemDetailsIxpExposure
local fFlagAXUnifiedImpressionsOnThumbnail = avatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail

local function AnalyticsMetadataSelector(p0) --[[ line: 36 ]]
	return p0.AvatarExperience.AnalyticsMetadata
end

local function getImpressionDedupKey(p1) --[[ line: 40 ]]
	-- upvalues: unifiedEventLogConstantsModule (ref)
	local ATTRIBUTE_PREFIX = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX
	local var13 = p1:GetAttribute(ATTRIBUTE_PREFIX .. "widgetId")
	local var14 = p1:GetAttribute(ATTRIBUTE_PREFIX .. "itemId")
	
	return if var14 == nil then if var13 == nil then p1:GetFullName() else "widget|" .. tostring(var13) else string.format("item|%s|%s|%s|%s|%s", tostring(var13), tostring(var14), tostring(p1:GetAttribute(ATTRIBUTE_PREFIX .. "gridPositionRow")), tostring(p1:GetAttribute(ATTRIBUTE_PREFIX .. "gridPositionColumn")), tostring(p1:GetAttribute(ATTRIBUTE_PREFIX .. "itemPosition")))
end

return function(p2) --[[ line: 59 ]]
	-- upvalues: fFlagAXItemDetailsIxpExposure (ref), useAvatarRoute (ref), useSelectorSignal (ref), selectSearchKeyword (ref), AnalyticsMetadataSelector (ref), reactModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), unifiedEventLogConstantsModule (ref), seenImpressionsStoreModule (ref), unifiedImpressions (ref), getImpressionDedupKey (ref), avatarScreenProperties (ref), sendUnifiedEventLogForInstanceModule (ref), cryoModule (ref), unifiedEventLogEnumsModule (ref), collectionService (ref), avatarExperienceScreenSizeImpressionsDetectorModule (ref)
	local var15 = nil
	local var16 = nil
	local var17 = nil
	
	if not fFlagAXItemDetailsIxpExposure then
		var15 = useAvatarRoute()
		var16 = useSelectorSignal(selectSearchKeyword)
		var17 = useSelectorSignal(AnalyticsMetadataSelector)
	end
	local var18 = reactModule.useRef({})
	local var19 = if fFlagAXItemDetailsIxpExposure then reactModule.useRef({}) else nil
	local var20 = reactModule.useCallback(function(p3) --[[ line: 75 ]]
		-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (copy), unifiedEventLogConstantsModule (copy), seenImpressionsStoreModule (copy), unifiedImpressions (copy), getImpressionDedupKey (copy), var18 (ref)
		return if fFlagAXUnifiedImpressionsOnThumbnail then if p3:GetAttribute(unifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION) then false else not seenImpressionsStoreModule.hasSeen(unifiedImpressions, getImpressionDedupKey(p3)) else not var18.current[p3:GetFullName()]
	end, {})
	local var21 = reactModule.useCallback(function(p4) --[[ line: 86 ]]
		-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (copy), seenImpressionsStoreModule (copy), unifiedImpressions (copy), getImpressionDedupKey (copy), var18 (ref), fFlagAXItemDetailsIxpExposure (copy), var19 (write), avatarScreenProperties (copy), var15 (write), sendUnifiedEventLogForInstanceModule (copy), cryoModule (copy), var17 (write), unifiedEventLogEnumsModule (copy), var16 (write), p2 (ref)
		local t = {}
		
		for i, v in p4 do
			local fullName = v:GetFullName()
			
			if not (if fFlagAXUnifiedImpressionsOnThumbnail then seenImpressionsStoreModule.hasSeen(unifiedImpressions, getImpressionDedupKey(v)) else var18.current[fullName]) then
				if fFlagAXItemDetailsIxpExposure then
					t[fullName] = v
					
					if not fFlagAXUnifiedImpressionsOnThumbnail and not var19.current[fullName] then
						var19.current[fullName] = v.AncestryChanged:Connect(function() --[[ line: 106 ]]
							-- upvalues: v (ref), var18 (copy), fullName (ref), var19 (copy)
							if not v.Parent then
								var18.current[fullName] = nil
								
								if var19.current[fullName] then
									var19.current[fullName]:Disconnect()
									var19.current[fullName] = nil
								end
							end
						end)
					end
				else
					local name = avatarScreenProperties[var15.current.name]
					sendUnifiedEventLogForInstanceModule(v, cryoModule.Dictionary.join(var17(false), {
						action = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
						surface = if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil,
						keyword = var16(false)
					}), {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end
				if fFlagAXUnifiedImpressionsOnThumbnail then
					seenImpressionsStoreModule.markSeen(unifiedImpressions, getImpressionDedupKey(v))
				else
					var18.current[fullName] = true
				end
			end
		end
		if fFlagAXItemDetailsIxpExposure and next(t) and p2.extensions then
			for i, v in t do
				for i_2, v_2 in p2.extensions do
					v_2({ visibleInstance = v })
				end
			end
		end
	end, if fFlagAXItemDetailsIxpExposure then { p2.extensions } else { var15, var16, var17 })
	
	if fFlagAXItemDetailsIxpExposure then
		reactModule.useEffect(function() --[[ line: 162 ]]
			-- upvalues: var19 (write)
			return function() --[[ line: 163 ]]
				-- upvalues: var19 (copy)
				for i, v in var19.current do
					if v then
						v:Disconnect()
					end
				end
				var19.current = {}
			end
		end, {})
	end
	return reactModule.createElement(avatarExperienceScreenSizeImpressionsDetectorModule, {
		parentRef = p2.parentRef,
		pageFilter = p2.pageFilter,
		onRequestImpressionsSignal = p2.requestImpressionsSignal,
		filterImpressionFunc = var20,
		onImpressionsDetected = var21,
		collectObjectsFunc = reactModule.useCallback(function(p5) --[[ line: 174 ]]
			-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (copy), collectionService (copy), unifiedEventLogConstantsModule (copy)
			if not fFlagAXUnifiedImpressionsOnThumbnail then
				return collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME)
			end
			local tag_nameTagged = collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME)
			
			if not p5 then
				return tag_nameTagged
			end
			local t = {}
			
			for i, v in tag_nameTagged do
				if v:IsDescendantOf(p5) then
					table.insert(t, v)
				end
			end
			return t
		end, {})
	})
end