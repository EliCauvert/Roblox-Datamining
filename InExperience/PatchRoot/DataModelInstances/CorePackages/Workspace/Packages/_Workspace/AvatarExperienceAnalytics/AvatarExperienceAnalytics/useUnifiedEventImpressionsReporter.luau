local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local sendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local useSelectorSignal = avatarExperienceCommonModule.Hooks.useSelectorSignal
local selectSearchKeyword = avatarExperienceCommonModule.State.Selectors.selectSearchKeyword
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)

local function selectAnalyticsMetadata(p0) --[[ line: 16 ]]
	return p0.AvatarExperience.AnalyticsMetadata
end

return function() --[[ line: 20 | named "useUnifiedEventImpressionsReporter" ]]
	-- upvalues: useAvatarRoute (ref), useSelectorSignal (ref), selectSearchKeyword (ref), selectAnalyticsMetadata (ref), reactModule (ref), avatarScreenProperties (ref), unifiedEventLoggingUtilsModule (ref), unifiedEventLogEnumsModule (ref), sendUnifiedEventLogForInstanceModule (ref), cryoModule (ref)
	local var9 = useAvatarRoute()
	local var10 = useSelectorSignal(selectSearchKeyword)
	local var11 = useSelectorSignal(selectAnalyticsMetadata)
	
	return reactModule.useCallback(function(p1) --[[ line: 25 ]]
		-- upvalues: avatarScreenProperties (copy), var9 (ref), unifiedEventLoggingUtilsModule (copy), unifiedEventLogEnumsModule (copy), sendUnifiedEventLogForInstanceModule (copy), cryoModule (copy), var11 (ref), var10 (ref)
		local v
		local visibleInstance = p1.visibleInstance
		local name = avatarScreenProperties[var9.opaque.name]
		local var12 = nil
		
		for i, v in visibleInstance:GetAttributes() do
			if unifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) and unifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i) == "action" then
				if v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION then
					var12 = true
				end
				if v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT or v == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK then return end
			end
		end
		v = {
			action = if var12 then unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_IMPRESSION else unifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if name and name.analyticsData then name.analyticsData.unifiedLoggingSurface else nil,
			keyword = var10(false)
		}
		sendUnifiedEventLogForInstanceModule(visibleInstance, cryoModule.Dictionary.join(var11(false), v), {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end, { var9, var10, var11 })
end