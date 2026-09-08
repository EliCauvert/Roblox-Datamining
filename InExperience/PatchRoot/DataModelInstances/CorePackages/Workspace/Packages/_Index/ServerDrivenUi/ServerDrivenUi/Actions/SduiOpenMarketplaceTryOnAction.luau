local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local unifiedEventLogConstants = require(parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
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
local fFlagAXFixPurchaseSurfaceLogging = sharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local fFlagAXAvatarSortInDiscoveryUnifiedPurchase = sharedFlagsModule.FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local fFlagAXFixHomeAvatarsUnifiedPurchase = sharedFlagsModule.FFlagAXFixHomeAvatarsUnifiedPurchase
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local var2 = if fFlagAXTryOnScreenImprovements then {
	[appPage.Home] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
} else nil
local var3 = if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then {
	[appPage.Home] = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
} else nil

local function _(p1, p2, p3)
	-- upvalues: sduiActionType (ref), sduiErrorType (ref)
	local t = { name = sduiActionType.OpenMarketplaceTryOn, message = p2 }
	
	if p3 ~= nil then
		t.propName = p3
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, t, p1.appPage)
end

return function(p1, p2, p3)
	-- upvalues: sduiActionType (ref), sduiErrorType (ref), unifiedEventLogEnums (ref), fFlagAXAvatarSortInDiscoveryUnifiedPurchase (ref), var3 (ref), fFlagAXFixHomeAvatarsUnifiedPurchase (ref), findAnalyticsFieldInAncestors (ref), fFlagAXTryOnScreenImprovements (ref), var2 (ref), impressionEnums (ref), AXFixHomepageTryOnScreenAnalytics (ref), appPage (ref), analyticsService (ref), unifiedLoggingSurface (ref), unifiedEventLogConstants (ref), avatarScreen (ref), fFlagAXFixPurchaseSurfaceLogging (ref), fFlagAXEnableHomeTryOnComplexView (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var4 = if p1 then p1.actionParams else nil
	
	if var4 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenMarketplaceTryOn
		}, p3.appPage)
		
		return
	end
	assert(var4, "actionParams must exist")
	local itemId = var4.itemId
	local var5 = tostring(itemId)
	
	if itemId == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemId: {var5}`,
			propName = "itemId"
		}, p3.appPage)
		
		return
	end
	local var6 = tostring(var4.itemType)
	
	if var6 ~= "Asset" and var6 ~= "Bundle" and var6 ~= "Look" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Invalid itemType: {var6}`,
			propName = "itemType"
		}, p3.appPage)
		
		return
	end
	local var7 = if var6 == "Asset" then unifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif var6 == "Bundle" then unifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif var6 == "Look" then unifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else unifiedEventLogEnums.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
	local itemSubTypeName = var4.itemSubTypeName
	
	if (var6 == "Asset" or var6 == "Bundle") and itemSubTypeName == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemSubTypeName: {itemSubTypeName}`,
			propName = "itemSubTypeName"
		}, p3.appPage)
		
		return
	end
	local itemPrice = var4.itemPrice
	
	if itemPrice == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemPrice: {itemPrice}`,
			propName = "itemPrice"
		}, p3.appPage)
	end
	local text = var6 .. var8
	local appPage_1 = nil
	local var8 = if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then var3[p3.appPage] else nil
	local var9 = if fFlagAXFixHomeAvatarsUnifiedPurchase then {
		widgetId = findAnalyticsFieldInAncestors("widgetId", p2),
		widgetType = findAnalyticsFieldInAncestors("widgetType", p2),
		widgetItemIds = findAnalyticsFieldInAncestors("widgetItemIds", p2),
		requestId = findAnalyticsFieldInAncestors("requestId", p2),
		itemPosition = findAnalyticsFieldInAncestors("itemPosition", p2)
	} else nil
	
	if fFlagAXTryOnScreenImprovements then
		local var10 = "TryOnScreen"
		appPage_1 = var2[p3.appPage]
		
		if appPage_1 == nil then
			p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				name = sduiActionType.OpenMarketplaceTryOn,
				message = `Unsupported appPage for OpenMarketplaceTryOn action: {p3.appPage}`
			}, p3.appPage)
		else
			local t = {
				group = "AvatarItemWidgetClick",
				actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
				surface = appPage_1,
				item_id = itemId,
				item_type = var6
			}
			
			if not AXFixHomepageTryOnScreenAnalytics and p3.appPage == appPage.Home then
				var10 = "HomeTryOnScreen"
				t = {
					group = "HomePageAvatarWidgetClick",
					actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
					surface = impressionEnums.MarketplaceSurfaceType.HOMEPAGE,
					item_id = itemId,
					item_type = var6
				}
			end
			local t_1
			t.event_sender_api = impressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
			analyticsService.EventStream:sendTelemetryEvent(var10, "marketplaceOrganicFELog", t)
			local _ = nil
			
			if fFlagAXFixHomeAvatarsUnifiedPurchase then
				local var11 = var9
				t_1 = {
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
					surface = var8,
					itemId = itemId,
					itemType = var7
				}
				
				if var11.widgetId ~= nil and (var11.widgetType ~= nil and (var11.widgetItemIds ~= nil and var11.requestId ~= nil)) then
					t_1.widgetId = var11.widgetId
					t_1.widgetType = var11.widgetType
					t_1.widgetItemIds = var11.widgetItemIds
					t_1.requestId = var11.requestId
					t_1.uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
					t_1.widgetItemPrice = itemPrice
				else
					t_1.organicItemPrice = itemPrice
				end
			else
				t_1 = {
					widgetId = "DiscoveryHomepageAvatarWidget:1234",
					widgetType = "DiscoveryHomepageAvatarWidget",
					action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
					surface = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
					itemId = itemId,
					itemType = var7,
					uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP,
					widgetItemPrice = itemPrice
				}
			end
			analyticsService.EventStream:sendTelemetryEvent(unifiedEventLogConstants.EVENT_NAME, unifiedEventLogConstants.EVENT_NAME, t_1)
		end
	end
	local t = {
		name = appPage.AvatarExperienceWrapper,
		detail = text,
		extraProps = {
			routeName = avatarScreen.TryOnItem,
			params = {
				mountAsFullView = false,
				mountAnimation = true,
				showRobuxBalance = true,
				showDropDownTopBar = true,
				itemId = var5,
				itemType = var6,
				itemSubTypeName = if var6 == "Look" then nil else itemSubTypeName,
				fromHome = if fFlagAXTryOnScreenImprovements then nil else true,
				fromSurface = if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then var8 elseif fFlagAXFixPurchaseSurfaceLogging then appPage_1 else nil,
				detail = text,
				hideTab = if fFlagAXTryOnScreenImprovements then true else nil,
				simpleView = if fFlagAXTryOnScreenImprovements then p3.appPage == appPage.Home and not fFlagAXEnableHomeTryOnComplexView else nil,
				shouldNavigateDown = if fFlagAXTryOnScreenImprovements then true else nil,
				avatarUnifiedAttribution = if fFlagAXFixHomeAvatarsUnifiedPurchase then var9 else nil
			}
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	p3.dependencies.dispatch(navigateDown(t))
end