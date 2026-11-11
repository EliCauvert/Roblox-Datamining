local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local UseSelectorSignalFunction = AvatarExperienceCommonModule.Hooks.useSelectorSignal
local SelectSearchKeyword = AvatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)

local function selectAnalyticsMetadata(p1)
	return p1.AvatarExperience.AnalyticsMetadata
end

return function()
	-- upvalues: UseAvatarRouteFunction (copy), UseSelectorSignalFunction (copy), SelectSearchKeyword (copy), selectAnalyticsMetadata (copy), ReactModule (copy), AvatarScreenProperties (copy), UnifiedEventLoggingUtilsModule (copy), UnifiedEventLogEnumsModule (copy), SendUnifiedEventLogForInstanceModule (copy), CryoModule (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorSignalResult = UseSelectorSignalFunction(SelectSearchKeyword)
	local UseSelectorSignalResult1 = UseSelectorSignalFunction(selectAnalyticsMetadata)
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: AvatarScreenProperties (upval), UseAvatarRouteResult (copy), UnifiedEventLoggingUtilsModule (upval), UnifiedEventLogEnumsModule (upval), SendUnifiedEventLogForInstanceModule (upval), CryoModule (upval), UseSelectorSignalResult1 (copy), UseSelectorSignalResult (copy)
		local VisibleInstance = p1.visibleInstance
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
		SendUnifiedEventLogForInstanceModule(VisibleInstance, CryoModule.Dictionary.join(UseSelectorSignalResult1(false), {
			action = if Flag then UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
			keyword = UseSelectorSignalResult(false)
		}), {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end, {
		UseAvatarRouteResult,
		UseSelectorSignalResult,
		UseSelectorSignalResult1
	})
end