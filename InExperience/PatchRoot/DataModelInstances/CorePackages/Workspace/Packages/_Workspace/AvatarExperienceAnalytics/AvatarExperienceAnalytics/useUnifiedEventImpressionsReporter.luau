local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local unifiedLoggingSurface = avatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local sendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local selectSearchKeyword = avatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local fFlagAXUnifiedImpressionsOnThumbnail = require(parent.AvatarExperienceFlags).FFlagAXUnifiedImpressionsOnThumbnail
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

local function selectAnalyticsMetadata(p0) --[[ line: 20 ]]
	return p0.AvatarExperience.AnalyticsMetadata
end

return function(p1) --[[ line: 24 | named "useUnifiedEventImpressionsReporter" ]]
	-- upvalues: useAvatarRoute (ref), useSelectorSignal (ref), selectSearchKeyword (ref), selectAnalyticsMetadata (ref), reactModule (ref), avatarScreenProperties (ref), unifiedEventLoggingUtilsModule (ref), unifiedEventLogEnumsModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), unifiedEventLogConstantsModule (ref), unifiedLoggingSurface (ref), sendUnifiedEventLogForInstanceModule (ref), cryoModule (ref)
	local var10 = useAvatarRoute()
	local var11 = useSelectorSignal(selectSearchKeyword)
	local var12 = useSelectorSignal(selectAnalyticsMetadata)
	
	return reactModule.useCallback(function(p2) --[[ line: 32 ]]
		-- upvalues: avatarScreenProperties (copy), var10 (ref), unifiedEventLoggingUtilsModule (copy), unifiedEventLogEnumsModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), p1 (ref), var11 (ref), unifiedEventLogConstantsModule (copy), unifiedLoggingSurface (copy), sendUnifiedEventLogForInstanceModule (copy), cryoModule (copy), var12 (ref)
		local v
		local visibleInstance = p2.visibleInstance
		local name = avatarScreenProperties[var10.opaque.name]
		local var13 = nil
		
		for i, v in visibleInstance:GetAttributes() do
			if unifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) and unifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i) == "action" then
				if v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION then
					var13 = true
				end
				if v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT or v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK then return end
			end
		end
		if fFlagAXUnifiedImpressionsOnThumbnail then
			local var14 = avatarScreenProperties[p1 or var10.opaque.name]
			local t = {
				action = if var13 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				keyword = var11(false)
			}
			
			if visibleInstance:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface") == nil then
				t.surface = if var14 and var14.analyticsData then var14.analyticsData.unifiedLoggingSurface else nil
			end
			if (t.surface or visibleInstance:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")) ~= unifiedLoggingSurface.SEARCH_RESULTS then
				t.keyword = nil
			end
			sendUnifiedEventLogForInstanceModule(visibleInstance, cryoModule.Dictionary.union(var12(false), t), {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
			
			return
		else
			v = {
				action = if var13 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil,
				keyword = var11(false)
			}
			sendUnifiedEventLogForInstanceModule(visibleInstance, cryoModule.Dictionary.join(var12(false), v), {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
		end
	end, {
		var10,
		var11,
		var12,
		if fFlagAXUnifiedImpressionsOnThumbnail then p1 else nil
	})
end