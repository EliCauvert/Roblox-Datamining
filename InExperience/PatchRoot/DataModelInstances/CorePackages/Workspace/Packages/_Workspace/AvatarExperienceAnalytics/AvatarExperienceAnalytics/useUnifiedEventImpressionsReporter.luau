local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXUnifiedImpressionsOnThumbnail = AvatarExperienceFlagsModule.FFlagAXUnifiedImpressionsOnThumbnail
local FFlagAXFixSelectedItemIndexBleed = AvatarExperienceFlagsModule.FFlagAXFixSelectedItemIndexBleed
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

local function selectAnalyticsMetadata(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

return function(p1)
	-- upvalues: UseAvatarRouteFunction (copy), UseSelectorSignalFunction (copy), SelectSearchKeyword (copy), selectAnalyticsMetadata (copy), ReactModule (copy), AvatarScreenProperties (copy), UnifiedEventLoggingUtilsModule (copy), UnifiedEventLogEnumsModule (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), UnifiedEventLogConstantsModule (copy), UnifiedLoggingSurface (copy), FFlagAXFixSelectedItemIndexBleed (copy), CryoModule (copy), SendUnifiedEventLogForInstanceModule (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorSignalResult = UseSelectorSignalFunction(SelectSearchKeyword)
	local UseSelectorSignalResult1 = UseSelectorSignalFunction(selectAnalyticsMetadata)
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: AvatarScreenProperties (upval), UseAvatarRouteResult (copy), UnifiedEventLoggingUtilsModule (upval), UnifiedEventLogEnumsModule (upval), FFlagAXUnifiedImpressionsOnThumbnail (upval), p1 (copy), UseSelectorSignalResult (copy), UnifiedEventLogConstantsModule (upval), UnifiedLoggingSurface (upval), UseSelectorSignalResult1 (copy), FFlagAXFixSelectedItemIndexBleed (upval), CryoModule (upval), SendUnifiedEventLogForInstanceModule (upval)
		local VisibleInstance = p2.visibleInstance
		local AvatarScreenProperty = AvatarScreenProperties[UseAvatarRouteResult.opaque.name]
		local Flag: boolean? = nil
		
		for i, attribute in VisibleInstance:GetAttributes() do
			if UnifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) and UnifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i) == "action" then
				if attribute == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION then
					Flag = true
				end
				if attribute == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT or attribute == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK then return end
			end
		end
		if not FFlagAXUnifiedImpressionsOnThumbnail then
			SendUnifiedEventLogForInstanceModule(VisibleInstance, CryoModule.Dictionary.join(UseSelectorSignalResult1(false), {
				action = if Flag then UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
				keyword = UseSelectorSignalResult(false)
			}), {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
			
			return
		end
		local AvatarScreenProperty1 = AvatarScreenProperties[p1 or UseAvatarRouteResult.opaque.name]
		local config = {
			action = if Flag then UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			keyword = UseSelectorSignalResult(false)
		}
		
		if VisibleInstance:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface") == nil then
			config.surface = if AvatarScreenProperty1 and AvatarScreenProperty1.analyticsData then AvatarScreenProperty1.analyticsData.unifiedLoggingSurface else nil
		end
		if (config.surface or VisibleInstance:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "surface")) ~= UnifiedLoggingSurface.SEARCH_RESULTS then
			config.keyword = nil
		end
		local UseSelectorSignalResultResult = UseSelectorSignalResult1(false)
		
		if FFlagAXFixSelectedItemIndexBleed then
			UseSelectorSignalResultResult = CryoModule.Dictionary.join(UseSelectorSignalResultResult, { selectedItemIndex = CryoModule.None })
		end
		SendUnifiedEventLogForInstanceModule(VisibleInstance, CryoModule.Dictionary.union(UseSelectorSignalResultResult, config), {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end, {
		UseAvatarRouteResult,
		UseSelectorSignalResult,
		UseSelectorSignalResult1,
		if FFlagAXUnifiedImpressionsOnThumbnail then p1 else nil
	})
end