local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local UnifiedEventLogConstants = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local UnifiedEventLogEnums = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local AnalyticsService = require(Parent.AvatarExperienceAnalytics).AnalyticsService
local ImpressionEnums = require(Parent.AvatarExperienceAnalytics).Enums.ImpressionEnums
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXTryOnScreenImprovements = SharedFlagsModule.FFlagAXTryOnScreenImprovements
local FFlagAXEnableHomeTryOnComplexView = SharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local FFlagAXAvatarSortInDiscoveryUnifiedPurchase = SharedFlagsModule.FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local Config = if FFlagAXTryOnScreenImprovements then {
	[AppPage.Home] = ImpressionEnums.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[AppPage.SearchPage] = ImpressionEnums.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
} else nil
local Config1 = if FFlagAXAvatarSortInDiscoveryUnifiedPurchase then {
	[AppPage.Home] = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[AppPage.SearchPage] = UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
} else nil

local function _(p1, Message, PropName)
	-- upvalues: SduiActionType (copy), SduiErrorType (copy)
	local config = {
		name = SduiActionType.OpenMarketplaceTryOn,
		message = Message
	}
	
	if PropName ~= nil then
		config.propName = PropName
	end
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, config, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiActionType (copy), SduiErrorType (copy), UnifiedEventLogEnums (copy), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (copy), Config1 (copy), FFlagAXTryOnScreenImprovements (copy), Config (copy), ImpressionEnums (copy), AXFixHomepageTryOnScreenAnalytics (copy), AppPage (copy), AnalyticsService (copy), UnifiedLoggingSurface (copy), UnifiedEventLogConstants (copy), AvatarScreen (copy), FFlagAXFixPurchaseSurfaceLogging (copy), FFlagAXEnableHomeTryOnComplexView (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenMarketplaceTryOn
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local ItemId = ActionParams.itemId
	local Text = tostring(ItemId)
	
	if ItemId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemId: {Text}`,
			propName = "itemId"
		}, p2.appPage)
		
		return
	end
	local Text1 = tostring(ActionParams.itemType)
	
	if Text1 ~= "Asset" and Text1 ~= "Bundle" and Text1 ~= "Look" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Invalid itemType: {Text1}`,
			propName = "itemType"
		}, p2.appPage)
		
		return
	end
	local ASSET = if Text1 == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif Text1 == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif Text1 == "Look" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else UnifiedEventLogEnums.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
	local ItemSubTypeName = ActionParams.itemSubTypeName
	
	if (Text1 == "Asset" or Text1 == "Bundle") and ItemSubTypeName == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemSubTypeName: {ItemSubTypeName}`,
			propName = "itemSubTypeName"
		}, p2.appPage)
		
		return
	end
	local ItemPrice = ActionParams.itemPrice
	
	if ItemPrice == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemPrice: {ItemPrice}`,
			propName = "itemPrice"
		}, p2.appPage)
	end
	local Text2 = Text1 .. Text
	local Surface = nil
	local Entry = if FFlagAXAvatarSortInDiscoveryUnifiedPurchase then Config1[p2.appPage] else nil
	
	if FFlagAXTryOnScreenImprovements then
		local v1 = "TryOnScreen"
		Surface = Config[p2.appPage]
		
		if Surface == nil then
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				name = SduiActionType.OpenMarketplaceTryOn,
				message = `Unsupported appPage for OpenMarketplaceTryOn action: {p2.appPage}`
			}, p2.appPage)
		else
			local config1 = {
				group = "AvatarItemWidgetClick",
				actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
				surface = Surface,
				item_id = ItemId,
				item_type = Text1
			}
			
			if not AXFixHomepageTryOnScreenAnalytics and p2.appPage == AppPage.Home then
				v1 = "HomeTryOnScreen"
				config1 = {
					group = "HomePageAvatarWidgetClick",
					actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
					surface = ImpressionEnums.MarketplaceSurfaceType.HOMEPAGE,
					item_id = ItemId,
					item_type = Text1
				}
			end
			config1.event_sender_api = ImpressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
			AnalyticsService.EventStream:sendTelemetryEvent(v1, "marketplaceOrganicFELog", config1)
			AnalyticsService.EventStream:sendTelemetryEvent(UnifiedEventLogConstants.EVENT_NAME, UnifiedEventLogConstants.EVENT_NAME, {
				widgetId = "DiscoveryHomepageAvatarWidget:1234",
				widgetType = "DiscoveryHomepageAvatarWidget",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
				itemId = ItemId,
				itemType = ASSET,
				uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP,
				widgetItemPrice = ItemPrice
			})
		end
	end
	local config = {
		name = AppPage.AvatarExperienceWrapper,
		detail = Text2,
		extraProps = {
			routeName = AvatarScreen.TryOnItem,
			params = {
				mountAsFullView = false,
				mountAnimation = true,
				showRobuxBalance = true,
				showDropDownTopBar = true,
				itemId = Text,
				itemType = Text1,
				itemSubTypeName = if Text1 == "Look" then nil else ItemSubTypeName,
				fromHome = not FFlagAXTryOnScreenImprovements or nil,
				fromSurface = if FFlagAXAvatarSortInDiscoveryUnifiedPurchase then Entry elseif FFlagAXFixPurchaseSurfaceLogging then Surface else nil,
				detail = Text2,
				hideTab = if FFlagAXTryOnScreenImprovements then true else nil,
				simpleView = if FFlagAXTryOnScreenImprovements then p2.appPage == AppPage.Home and not FFlagAXEnableHomeTryOnComplexView else nil,
				shouldNavigateDown = if FFlagAXTryOnScreenImprovements then true else nil
			}
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p2.dependencies.dispatch(NavigateDownFunction(config))
	end
end