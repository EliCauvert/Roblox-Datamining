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

local function AnalyticsMetadataSelector(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

local function getImpressionDedupKey(p1)
	-- upvalues: unifiedEventLogConstantsModule (ref)
	local ATTRIBUTE_PREFIX = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX
	local var1 = p1:GetAttribute(ATTRIBUTE_PREFIX .. "widgetId")
	local var2 = p1:GetAttribute(ATTRIBUTE_PREFIX .. "itemId")
	
	return if var2 == nil then if var1 == nil then p1:GetFullName() else "widget|" .. tostring(var1) else string.format("item|%s|%s|%s|%s|%s", tostring(var1), tostring(var2), tostring(p1:GetAttribute(ATTRIBUTE_PREFIX .. "gridPositionRow")), tostring(p1:GetAttribute(ATTRIBUTE_PREFIX .. "gridPositionColumn")), tostring(p1:GetAttribute(ATTRIBUTE_PREFIX .. "itemPosition")))
end

return function(p1)
	-- upvalues: fFlagAXItemDetailsIxpExposure (ref), useAvatarRoute (ref), useSelectorSignal (ref), selectSearchKeyword (ref), AnalyticsMetadataSelector (ref), reactModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), unifiedEventLogConstantsModule (ref), seenImpressionsStoreModule (ref), unifiedImpressions (ref), getImpressionDedupKey (ref), avatarScreenProperties (ref), sendUnifiedEventLogForInstanceModule (ref), cryoModule (ref), unifiedEventLogEnumsModule (ref), collectionService (ref), avatarExperienceScreenSizeImpressionsDetectorModule (ref)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	if not fFlagAXItemDetailsIxpExposure then
		var1 = useAvatarRoute()
		var2 = useSelectorSignal(selectSearchKeyword)
		var3 = useSelectorSignal(AnalyticsMetadataSelector)
	end
	local var4 = reactModule.useRef({})
	local var5 = if fFlagAXItemDetailsIxpExposure then reactModule.useRef({}) else nil
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (copy), unifiedEventLogConstantsModule (copy), seenImpressionsStoreModule (copy), unifiedImpressions (copy), getImpressionDedupKey (copy), var4 (ref)
		return if fFlagAXUnifiedImpressionsOnThumbnail then if p2:GetAttribute(unifiedEventLogConstantsModule.SKIP_IMPRESSION_DETECTION) then false else not seenImpressionsStoreModule.hasSeen(unifiedImpressions, getImpressionDedupKey(p2)) else not var4.current[p2:GetFullName()]
	end, {})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (copy), seenImpressionsStoreModule (copy), unifiedImpressions (copy), getImpressionDedupKey (copy), var4 (ref), fFlagAXItemDetailsIxpExposure (copy), var5 (write), avatarScreenProperties (copy), var1 (write), sendUnifiedEventLogForInstanceModule (copy), cryoModule (copy), var3 (write), unifiedEventLogEnumsModule (copy), var2 (write), p1 (ref)
		local t = {}
		
		for i, v in p2 do
			local fullName = v:GetFullName()
			
			if not (if fFlagAXUnifiedImpressionsOnThumbnail then seenImpressionsStoreModule.hasSeen(unifiedImpressions, getImpressionDedupKey(v)) else var4.current[fullName]) then
				if fFlagAXItemDetailsIxpExposure then
					t[fullName] = v
					
					if not fFlagAXUnifiedImpressionsOnThumbnail and not var5.current[fullName] then
						var5.current[fullName] = v.AncestryChanged:Connect(function()
							-- upvalues: v (ref), var4 (copy), fullName (ref), var5 (copy)
							if not v.Parent then
								var4.current[fullName] = nil
								
								if var5.current[fullName] then
									var5.current[fullName]:Disconnect()
									var5.current[fullName] = nil
								end
							end
						end)
					end
				else
					local name = avatarScreenProperties[var1.current.name]
					sendUnifiedEventLogForInstanceModule(v, cryoModule.Dictionary.join(var3(false), {
						action = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
						surface = if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil,
						keyword = var2(false)
					}), {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end
				if fFlagAXUnifiedImpressionsOnThumbnail then
					seenImpressionsStoreModule.markSeen(unifiedImpressions, getImpressionDedupKey(v))
				else
					var4.current[fullName] = true
				end
			end
		end
		if fFlagAXItemDetailsIxpExposure and next(t) and p1.extensions then
			for i, v in t do
				for i_2, v_2 in p1.extensions do
					v_2({ visibleInstance = v })
				end
			end
		end
	end, if fFlagAXItemDetailsIxpExposure then { p1.extensions } else { var1, var2, var3 })
	
	if fFlagAXItemDetailsIxpExposure then
		reactModule.useEffect(function()
			-- upvalues: var5 (write)
			return function()
				-- upvalues: var5 (copy)
				for i, v in var5.current do
					if v then
						v:Disconnect()
					end
				end
				var5.current = {}
			end
		end, {})
	end
	return reactModule.createElement(avatarExperienceScreenSizeImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		pageFilter = p1.pageFilter,
		onRequestImpressionsSignal = p1.requestImpressionsSignal,
		filterImpressionFunc = var6,
		onImpressionsDetected = var7,
		collectObjectsFunc = reactModule.useCallback(function(p3)
			-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (copy), collectionService (copy), unifiedEventLogConstantsModule (copy)
			if not fFlagAXUnifiedImpressionsOnThumbnail then
				return collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME)
			end
			local tag_nameTagged = collectionService:GetTagged(unifiedEventLogConstantsModule.TAG_NAME)
			
			if not p3 then
				return tag_nameTagged
			end
			local t = {}
			
			for i, v in tag_nameTagged do
				if v:IsDescendantOf(p3) then
					table.insert(t, v)
				end
			end
			return t
		end, {})
	})
end