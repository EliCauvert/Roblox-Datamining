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
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXUnifiedImpressionsOnThumbnail = avatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail
local fFlagAXFixSelectedItemIndexBleed = avatarExperienceFlagsModule.FFlagAXFixSelectedItemIndexBleed
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

local function selectAnalyticsMetadata(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

return function(p1)
	-- upvalues: useAvatarRoute (ref), useSelectorSignal (ref), selectSearchKeyword (ref), selectAnalyticsMetadata (ref), reactModule (ref), avatarScreenProperties (ref), unifiedEventLoggingUtilsModule (ref), unifiedEventLogEnumsModule (ref), fFlagAXUnifiedImpressionsOnThumbnail (ref), unifiedEventLogConstantsModule (ref), unifiedLoggingSurface (ref), fFlagAXFixSelectedItemIndexBleed (ref), cryoModule (ref), sendUnifiedEventLogForInstanceModule (ref)
	local var1 = useAvatarRoute()
	local var2 = useSelectorSignal(selectSearchKeyword)
	local var3 = useSelectorSignal(selectAnalyticsMetadata)
	
	return reactModule.useCallback(function(p2)
		-- upvalues: avatarScreenProperties (copy), var1 (ref), unifiedEventLoggingUtilsModule (copy), unifiedEventLogEnumsModule (copy), fFlagAXUnifiedImpressionsOnThumbnail (copy), p1 (ref), var2 (ref), unifiedEventLogConstantsModule (copy), unifiedLoggingSurface (copy), var3 (ref), fFlagAXFixSelectedItemIndexBleed (copy), cryoModule (copy), sendUnifiedEventLogForInstanceModule (copy)
		local v
		local visibleInstance = p2.visibleInstance
		local name = avatarScreenProperties[var1.opaque.name]
		local var4 = nil
		
		for i, v in visibleInstance:GetAttributes() do
			if unifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) and unifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i) == "action" then
				if v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION then
					var4 = true
				end
				if v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT or v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK then return end
			end
		end
		if fFlagAXUnifiedImpressionsOnThumbnail then
			local var5 = avatarScreenProperties[p1 or var1.opaque.name]
			local t = {
				action = if var4 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				keyword = var2(false)
			}
			
			if visibleInstance:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface") == nil then
				t.surface = if var5 and var5.analyticsData then var5.analyticsData.unifiedLoggingSurface else nil
			end
			if (t.surface or visibleInstance:GetAttribute(unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")) ~= unifiedLoggingSurface.SEARCH_RESULTS then
				t.keyword = nil
			end
			local var6 = var3(false)
			
			if fFlagAXFixSelectedItemIndexBleed then
				var6 = cryoModule.Dictionary.join(var6, { selectedItemIndex = cryoModule.None })
			end
			sendUnifiedEventLogForInstanceModule(visibleInstance, cryoModule.Dictionary.union(var6, t), {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
			
			return
		else
			v = {
				action = if var4 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil,
				keyword = var2(false)
			}
			sendUnifiedEventLogForInstanceModule(visibleInstance, cryoModule.Dictionary.join(var3(false), v), {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
		end
	end, {
		var1,
		var2,
		var3,
		if fFlagAXUnifiedImpressionsOnThumbnail then p1 else nil
	})
end