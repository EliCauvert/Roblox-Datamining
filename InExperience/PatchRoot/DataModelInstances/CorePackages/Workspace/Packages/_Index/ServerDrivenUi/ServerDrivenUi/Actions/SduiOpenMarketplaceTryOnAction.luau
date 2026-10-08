local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local unifiedEventLogConstants = require(parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local sendUnifiedEventLog = require(parent.AvatarExperienceAnalytics).sendUnifiedEventLog
local unifiedEventCounterAggregator = require(parent.AvatarExperienceAnalytics).UnifiedEventCounterAggregator
local AXUnifiedEventFilter = require(parent.AvatarExperienceAnalytics).AXUnifiedEventFilter
local fFlagAXUnifiedEventCounters = require(parent.AvatarExperienceAnalytics).Flags.FFlagAXUnifiedEventCounters
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local analyticsService = require(parent.AvatarExperienceAnalytics).AnalyticsService
local impressionEnums = require(parent.AvatarExperienceAnalytics).Enums.ImpressionEnums
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXEnableHomeTryOnComplexView = sharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local fFlagAXFixHomeAvatarsUnifiedPurchase = sharedFlagsModule.FFlagAXFixHomeAvatarsUnifiedPurchase
local fFlagAXDiscoveryItemPurchaseAttribution = sharedFlagsModule.FFlagAXDiscoveryItemPurchaseAttribution
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local t = {
	[appPage.Home] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
}
local t_1 = {
	[appPage.Home] = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
}

local function _(p1, p2, p3)
	-- upvalues: sduiActionType (ref), sduiErrorType (ref)
	local t = { name = sduiActionType.OpenMarketplaceTryOn, message = p2 }
	
	if p3 ~= nil then
		t.propName = p3
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, t, p1.appPage)
end

return function(p1, p2, p3)
	-- upvalues: sduiActionType (ref), sduiErrorType (ref), unifiedEventLogEnums (ref), fFlagAXUnifiedEventCounters (ref), t_1 (ref), fFlagAXFixHomeAvatarsUnifiedPurchase (ref), findAnalyticsFieldInAncestors (ref), t (ref), impressionEnums (ref), AXFixHomepageTryOnScreenAnalytics (ref), appPage (ref), analyticsService (ref), unifiedLoggingSurface (ref), fFlagAXDiscoveryItemPurchaseAttribution (ref), sendUnifiedEventLog (ref), unifiedEventCounterAggregator (ref), AXUnifiedEventFilter (ref), unifiedEventLogConstants (ref), avatarScreen (ref), fFlagAXEnableHomeTryOnComplexView (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = if p1 then p1.actionParams else nil
	
	if var2 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenMarketplaceTryOn
		}, p3.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local itemId = var2.itemId
	local var3 = tostring(itemId)
	
	if itemId == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemId: {var3}`,
			propName = "itemId"
		}, p3.appPage)
		
		return
	end
	local var4 = tostring(var2.itemType)
	
	if var4 ~= "Asset" and var4 ~= "Bundle" and var4 ~= "Look" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Invalid itemType: {var4}`,
			propName = "itemType"
		}, p3.appPage)
		
		return
	end
	local var5 = if var4 == "Asset" then unifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif var4 == "Bundle" then unifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif var4 == "Look" then unifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else unifiedEventLogEnums.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
	local itemSubTypeName = var2.itemSubTypeName
	
	if (var4 == "Asset" or var4 == "Bundle") and itemSubTypeName == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemSubTypeName: {itemSubTypeName}`,
			propName = "itemSubTypeName"
		}, p3.appPage)
		
		return
	end
	local var6 = if fFlagAXUnifiedEventCounters then tonumber(var2.itemPrice) else var2.itemPrice
	
	if var6 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemPrice: {var6}`,
			propName = "itemPrice"
		}, p3.appPage)
	end
	local text = var4 .. var8
	local _ = nil
	local appPage_1 = t_1[p3.appPage]
	local var7 = if fFlagAXFixHomeAvatarsUnifiedPurchase then {
		widgetId = findAnalyticsFieldInAncestors("widgetId", p2),
		widgetType = findAnalyticsFieldInAncestors("widgetType", p2),
		widgetItemIds = findAnalyticsFieldInAncestors("widgetItemIds", p2),
		requestId = findAnalyticsFieldInAncestors("requestId", p2),
		itemPosition = findAnalyticsFieldInAncestors("itemPosition", p2)
	} else nil
	local var8 = "TryOnScreen"
	local appPage_2 = t[p3.appPage]
	
	if appPage_2 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Unsupported appPage for OpenMarketplaceTryOn action: {p3.appPage}`
		}, p3.appPage)
	else
		local t_2 = {
			group = "AvatarItemWidgetClick",
			actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
			surface = appPage_2,
			item_id = itemId,
			item_type = var4
		}
		
		if not AXFixHomepageTryOnScreenAnalytics and p3.appPage == appPage.Home then
			var8 = "HomeTryOnScreen"
			t_2 = {
				group = "HomePageAvatarWidgetClick",
				actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
				surface = impressionEnums.MarketplaceSurfaceType.HOMEPAGE,
				item_id = itemId,
				item_type = var4
			}
		end
		local t_3
		t_2.event_sender_api = impressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
		analyticsService.EventStream:sendTelemetryEvent(var8, "marketplaceOrganicFELog", t_2)
		local _ = nil
		
		if fFlagAXFixHomeAvatarsUnifiedPurchase then
			local var9 = var7
			t_3 = {
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = appPage_1,
				itemId = itemId,
				itemType = var5
			}
			
			if var9.widgetId ~= nil and (var9.widgetType ~= nil and (var9.widgetItemIds ~= nil and var9.requestId ~= nil)) then
				t_3.widgetId = var9.widgetId
				t_3.widgetType = var9.widgetType
				t_3.widgetItemIds = var9.widgetItemIds
				t_3.requestId = var9.requestId
				t_3.uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
				t_3.widgetItemPrice = var6
			else
				t_3.organicItemPrice = var6
			end
		else
			t_3 = {
				widgetId = "DiscoveryHomepageAvatarWidget:1234",
				widgetType = "DiscoveryHomepageAvatarWidget",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
				itemId = itemId,
				itemType = var5,
				uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP,
				widgetItemPrice = var6
			}
		end
		if fFlagAXDiscoveryItemPurchaseAttribution then
			sendUnifiedEventLog(t_3)
		elseif fFlagAXUnifiedEventCounters then
			unifiedEventCounterAggregator.record(t_3, AXUnifiedEventFilter.filter(t_3, { skipReporting = true }))
		end
		analyticsService.EventStream:sendTelemetryEvent(unifiedEventLogConstants.EVENT_NAME, unifiedEventLogConstants.EVENT_NAME, t_3)
	end
	local t_2 = {
		name = appPage.AvatarExperienceWrapper,
		detail = text,
		extraProps = {
			routeName = avatarScreen.TryOnItem,
			params = {
				mountAsFullView = false,
				mountAnimation = true,
				showRobuxBalance = true,
				showDropDownTopBar = true,
				hideTab = true,
				shouldNavigateDown = true,
				itemId = var3,
				itemType = var4,
				itemSubTypeName = if var4 == "Look" then nil else itemSubTypeName,
				fromSurface = appPage_1,
				detail = text,
				simpleView = p3.appPage == appPage.Home and not fFlagAXEnableHomeTryOnComplexView,
				avatarUnifiedAttribution = if fFlagAXFixHomeAvatarsUnifiedPurchase then var7 else nil
			}
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t_2))
		
		return
	end
	p3.dependencies.dispatch(navigateDown(t_2))
end