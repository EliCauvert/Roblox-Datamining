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
local fFlagAXTryOnScreenImprovements = sharedFlagsModule.FFlagAXTryOnScreenImprovements
local fFlagAXEnableHomeTryOnComplexView = sharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local fFlagAXFixHomeAvatarsUnifiedPurchase = sharedFlagsModule.FFlagAXFixHomeAvatarsUnifiedPurchase
local fFlagAXDiscoveryItemPurchaseAttribution = sharedFlagsModule.FFlagAXDiscoveryItemPurchaseAttribution
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local var2 = if fFlagAXTryOnScreenImprovements then {
	[appPage.Home] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
} else nil
local t = {
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
	-- upvalues: sduiActionType (ref), sduiErrorType (ref), unifiedEventLogEnums (ref), fFlagAXUnifiedEventCounters (ref), t (ref), fFlagAXFixHomeAvatarsUnifiedPurchase (ref), findAnalyticsFieldInAncestors (ref), fFlagAXTryOnScreenImprovements (ref), var2 (ref), impressionEnums (ref), AXFixHomepageTryOnScreenAnalytics (ref), appPage (ref), analyticsService (ref), unifiedLoggingSurface (ref), fFlagAXDiscoveryItemPurchaseAttribution (ref), sendUnifiedEventLog (ref), unifiedEventCounterAggregator (ref), AXUnifiedEventFilter (ref), unifiedEventLogConstants (ref), avatarScreen (ref), fFlagAXEnableHomeTryOnComplexView (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var3 = if p1 then p1.actionParams else nil
	
	if var3 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenMarketplaceTryOn
		}, p3.appPage)
		
		return
	end
	assert(var3, "actionParams must exist")
	local itemId = var3.itemId
	local var4 = tostring(itemId)
	
	if itemId == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemId: {var4}`,
			propName = "itemId"
		}, p3.appPage)
		
		return
	end
	local var5 = tostring(var3.itemType)
	
	if var5 ~= "Asset" and var5 ~= "Bundle" and var5 ~= "Look" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Invalid itemType: {var5}`,
			propName = "itemType"
		}, p3.appPage)
		
		return
	end
	local var6 = if var5 == "Asset" then unifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif var5 == "Bundle" then unifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif var5 == "Look" then unifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else unifiedEventLogEnums.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
	local itemSubTypeName = var3.itemSubTypeName
	
	if (var5 == "Asset" or var5 == "Bundle") and itemSubTypeName == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemSubTypeName: {itemSubTypeName}`,
			propName = "itemSubTypeName"
		}, p3.appPage)
		
		return
	end
	local var7 = if fFlagAXUnifiedEventCounters then tonumber(var3.itemPrice) else var3.itemPrice
	
	if var7 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemPrice: {var7}`,
			propName = "itemPrice"
		}, p3.appPage)
	end
	local text = var5 .. var8
	local _ = nil
	local appPage_1 = t[p3.appPage]
	local var8 = if fFlagAXFixHomeAvatarsUnifiedPurchase then {
		widgetId = findAnalyticsFieldInAncestors("widgetId", p2),
		widgetType = findAnalyticsFieldInAncestors("widgetType", p2),
		widgetItemIds = findAnalyticsFieldInAncestors("widgetItemIds", p2),
		requestId = findAnalyticsFieldInAncestors("requestId", p2),
		itemPosition = findAnalyticsFieldInAncestors("itemPosition", p2)
	} else nil
	
	if fFlagAXTryOnScreenImprovements then
		local var9 = "TryOnScreen"
		local appPage_2 = var2[p3.appPage]
		
		if appPage_2 == nil then
			p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				name = sduiActionType.OpenMarketplaceTryOn,
				message = `Unsupported appPage for OpenMarketplaceTryOn action: {p3.appPage}`
			}, p3.appPage)
		else
			local t_1 = {
				group = "AvatarItemWidgetClick",
				actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
				surface = appPage_2,
				item_id = itemId,
				item_type = var5
			}
			
			if not AXFixHomepageTryOnScreenAnalytics and p3.appPage == appPage.Home then
				var9 = "HomeTryOnScreen"
				t_1 = {
					group = "HomePageAvatarWidgetClick",
					actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
					surface = impressionEnums.MarketplaceSurfaceType.HOMEPAGE,
					item_id = itemId,
					item_type = var5
				}
			end
			local t_2
			t_1.event_sender_api = impressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
			analyticsService.EventStream:sendTelemetryEvent(var9, "marketplaceOrganicFELog", t_1)
			local _ = nil
			
			if fFlagAXFixHomeAvatarsUnifiedPurchase then
				local var10 = var8
				t_2 = {
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
					surface = appPage_1,
					itemId = itemId,
					itemType = var6
				}
				
				if var10.widgetId ~= nil and (var10.widgetType ~= nil and (var10.widgetItemIds ~= nil and var10.requestId ~= nil)) then
					t_2.widgetId = var10.widgetId
					t_2.widgetType = var10.widgetType
					t_2.widgetItemIds = var10.widgetItemIds
					t_2.requestId = var10.requestId
					t_2.uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
					t_2.widgetItemPrice = var7
				else
					t_2.organicItemPrice = var7
				end
			else
				t_2 = {
					widgetId = "DiscoveryHomepageAvatarWidget:1234",
					widgetType = "DiscoveryHomepageAvatarWidget",
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
					surface = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
					itemId = itemId,
					itemType = var6,
					uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP,
					widgetItemPrice = var7
				}
			end
			if fFlagAXDiscoveryItemPurchaseAttribution then
				sendUnifiedEventLog(t_2)
			elseif fFlagAXUnifiedEventCounters then
				unifiedEventCounterAggregator.record(t_2, AXUnifiedEventFilter.filter(t_2, { skipReporting = true }))
			end
			analyticsService.EventStream:sendTelemetryEvent(unifiedEventLogConstants.EVENT_NAME, unifiedEventLogConstants.EVENT_NAME, t_2)
		end
	end
	local t_1 = {
		name = appPage.AvatarExperienceWrapper,
		detail = text,
		extraProps = {
			routeName = avatarScreen.TryOnItem,
			params = {
				mountAsFullView = false,
				mountAnimation = true,
				showRobuxBalance = true,
				showDropDownTopBar = true,
				itemId = var4,
				itemType = var5,
				itemSubTypeName = if var5 == "Look" then nil else itemSubTypeName,
				fromHome = if fFlagAXTryOnScreenImprovements then nil else true,
				fromSurface = appPage_1,
				detail = text,
				hideTab = if fFlagAXTryOnScreenImprovements then true else nil,
				simpleView = if fFlagAXTryOnScreenImprovements then p3.appPage == appPage.Home and not fFlagAXEnableHomeTryOnComplexView else nil,
				shouldNavigateDown = if fFlagAXTryOnScreenImprovements then true else nil,
				avatarUnifiedAttribution = if fFlagAXFixHomeAvatarsUnifiedPurchase then var8 else nil
			}
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t_1))
		
		return
	end
	p3.dependencies.dispatch(navigateDown(t_1))
end