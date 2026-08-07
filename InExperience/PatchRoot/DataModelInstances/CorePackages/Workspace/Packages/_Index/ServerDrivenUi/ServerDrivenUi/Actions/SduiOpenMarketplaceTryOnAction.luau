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
local analyticsService = require(parent.AvatarExperienceAnalytics).AnalyticsService
local impressionEnums = require(parent.AvatarExperienceAnalytics).Enums.ImpressionEnums
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXTryOnScreenImprovements = sharedFlagsModule.FFlagAXTryOnScreenImprovements
local fFlagAXEnableHomeTryOnComplexView = sharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local fFlagAXFixPurchaseSurfaceLogging = sharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local fFlagAXAvatarSortInDiscoveryUnifiedPurchase = sharedFlagsModule.FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local var4 = if fFlagAXTryOnScreenImprovements then {
	[appPage.Home] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = impressionEnums.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
} else nil
local var5 = if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then {
	[appPage.Home] = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[appPage.SearchPage] = unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
} else nil

local function _(p0, p1, p2) --[[ line: 56 | named "reportOpenMarketplaceTryOnPropError" ]]
	-- upvalues: sduiActionType (ref), sduiErrorType (ref)
	local t = { name = sduiActionType.OpenMarketplaceTryOn, message = p1 }
	
	if p2 ~= nil then
		t.propName = p2
	end
	p0.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, t, p0.appPage)
end

return function(p3, _, p4) --[[ line: 69 ]]
	-- upvalues: sduiActionType (ref), sduiErrorType (ref), unifiedEventLogEnums (ref), fFlagAXAvatarSortInDiscoveryUnifiedPurchase (ref), var5 (ref), fFlagAXTryOnScreenImprovements (ref), var4 (ref), impressionEnums (ref), AXFixHomepageTryOnScreenAnalytics (ref), appPage (ref), analyticsService (ref), unifiedLoggingSurface (ref), unifiedEventLogConstants (ref), avatarScreen (ref), fFlagAXFixPurchaseSurfaceLogging (ref), fFlagAXEnableHomeTryOnComplexView (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
	local var7 = if p3 then p3.actionParams else nil
	
	if var7 == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenMarketplaceTryOn
		}, p4.appPage)
		
		return
	end
	assert(var7, "actionParams must exist")
	local itemId = var7.itemId
	local var8 = tostring(itemId)
	
	if itemId == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemId: {var8}`,
			propName = "itemId"
		}, p4.appPage)
		
		return
	end
	local var9 = tostring(var7.itemType)
	
	if var9 ~= "Asset" and var9 ~= "Bundle" and var9 ~= "Look" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Invalid itemType: {var9}`,
			propName = "itemType"
		}, p4.appPage)
		
		return
	end
	local var10 = if var9 == "Asset" then unifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif var9 == "Bundle" then unifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif var9 == "Look" then unifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else unifiedEventLogEnums.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
	local itemSubTypeName = var7.itemSubTypeName
	
	if (var9 == "Asset" or var9 == "Bundle") and itemSubTypeName == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemSubTypeName: {itemSubTypeName}`,
			propName = "itemSubTypeName"
		}, p4.appPage)
		
		return
	end
	local itemPrice = var7.itemPrice
	
	if itemPrice == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = sduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemPrice: {itemPrice}`,
			propName = "itemPrice"
		}, p4.appPage)
	end
	local text = var9 .. var8
	local appPage_1 = nil
	local var12 = if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then var5[p4.appPage] else nil
	
	if fFlagAXTryOnScreenImprovements then
		local var13 = "TryOnScreen"
		appPage_1 = var4[p4.appPage]
		
		if appPage_1 == nil then
			p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				name = sduiActionType.OpenMarketplaceTryOn,
				message = `Unsupported appPage for OpenMarketplaceTryOn action: {p4.appPage}`
			}, p4.appPage)
		else
			local t = {
				group = "AvatarItemWidgetClick",
				actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
				surface = appPage_1,
				item_id = itemId,
				item_type = var9
			}
			
			if not AXFixHomepageTryOnScreenAnalytics and p4.appPage == appPage.Home then
				var13 = "HomeTryOnScreen"
				t = {
					group = "HomePageAvatarWidgetClick",
					actionType = impressionEnums.ActionType.UI_BUTTON_CLICK,
					surface = impressionEnums.MarketplaceSurfaceType.HOMEPAGE,
					item_id = itemId,
					item_type = var9
				}
			end
			t.event_sender_api = impressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
			analyticsService.EventStream:sendTelemetryEvent(var13, "marketplaceOrganicFELog", t)
			analyticsService.EventStream:sendTelemetryEvent(unifiedEventLogConstants.EVENT_NAME, unifiedEventLogConstants.EVENT_NAME, {
				widgetId = "DiscoveryHomepageAvatarWidget:1234",
				widgetType = "DiscoveryHomepageAvatarWidget",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = unifiedLoggingSurface.DISCOVERY_HOMEPAGE,
				itemId = itemId,
				itemType = var10,
				uiTreatmentType = unifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP,
				widgetItemPrice = itemPrice
			})
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
				itemId = var8,
				itemType = var9,
				itemSubTypeName = if var9 == "Look" then nil else itemSubTypeName,
				fromHome = if fFlagAXTryOnScreenImprovements then nil else true,
				fromSurface = if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then var12 elseif fFlagAXFixPurchaseSurfaceLogging then appPage_1 else nil,
				detail = text,
				hideTab = if fFlagAXTryOnScreenImprovements then true else nil,
				simpleView = if fFlagAXTryOnScreenImprovements then p4.appPage == appPage.Home and not fFlagAXEnableHomeTryOnComplexView else nil,
				shouldNavigateDown = if fFlagAXTryOnScreenImprovements then true else nil
			}
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var2.down(var2.fromLegacyPage(t))
		
		return
	end
	p4.dependencies.dispatch(navigateDown(t))
end