local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local UnifiedEventLogConstants = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local UnifiedEventLogEnums = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local SendUnifiedEventLogFunction = require(Parent.AvatarExperienceAnalytics).sendUnifiedEventLog
local UnifiedEventCounterAggregator = require(Parent.AvatarExperienceAnalytics).UnifiedEventCounterAggregator
local AXUnifiedEventFilter = require(Parent.AvatarExperienceAnalytics).AXUnifiedEventFilter
local FFlagAXUnifiedEventCounters = require(Parent.AvatarExperienceAnalytics).Flags.FFlagAXUnifiedEventCounters
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local AnalyticsService = require(Parent.AvatarExperienceAnalytics).AnalyticsService
local ImpressionEnums = require(Parent.AvatarExperienceAnalytics).Enums.ImpressionEnums
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXEnableHomeTryOnComplexView = SharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local FFlagAXFixHomeAvatarsUnifiedPurchase = SharedFlagsModule.FFlagAXFixHomeAvatarsUnifiedPurchase
local FFlagAXDiscoveryItemPurchaseAttribution = SharedFlagsModule.FFlagAXDiscoveryItemPurchaseAttribution
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local config = {
	[AppPage.Home] = ImpressionEnums.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[AppPage.SearchPage] = ImpressionEnums.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS
}
local config1 = {
	[AppPage.Home] = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[AppPage.SearchPage] = UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
}

local function _(p1, Message, PropName) --[[ Line: 52 | Named "reportOpenMarketplaceTryOnPropError" ]]
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

return function(p1, p2, p3) --[[ Line: 65 ]]
	-- upvalues: SduiActionType (copy), SduiErrorType (copy), UnifiedEventLogEnums (copy), FFlagAXUnifiedEventCounters (copy), config1 (copy), FFlagAXFixHomeAvatarsUnifiedPurchase (copy), FindAnalyticsFieldInAncestorsFunction (copy), config (copy), ImpressionEnums (copy), AXFixHomepageTryOnScreenAnalytics (copy), AppPage (copy), AnalyticsService (copy), UnifiedLoggingSurface (copy), FFlagAXDiscoveryItemPurchaseAttribution (copy), SendUnifiedEventLogFunction (copy), UnifiedEventCounterAggregator (copy), AXUnifiedEventFilter (copy), UnifiedEventLogConstants (copy), AvatarScreen (copy), FFlagAXEnableHomeTryOnComplexView (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenMarketplaceTryOn
		}, p3.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local ItemId = ActionParams.itemId
	local Text = tostring(ItemId)
	
	if ItemId == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemId: {Text}`,
			propName = "itemId"
		}, p3.appPage)
		
		return
	end
	local Text1 = tostring(ActionParams.itemType)
	
	if Text1 ~= "Asset" and Text1 ~= "Bundle" and Text1 ~= "Look" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Invalid itemType: {Text1}`,
			propName = "itemType"
		}, p3.appPage)
		
		return
	end
	local ASSET = if Text1 == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif Text1 == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE elseif Text1 == "Look" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK else UnifiedEventLogEnums.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
	local ItemSubTypeName = ActionParams.itemSubTypeName
	
	if (Text1 == "Asset" or Text1 == "Bundle") and ItemSubTypeName == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemSubTypeName: {ItemSubTypeName}`,
			propName = "itemSubTypeName"
		}, p3.appPage)
		
		return
	end
	local Number = if FFlagAXUnifiedEventCounters then tonumber(ActionParams.itemPrice) else ActionParams.itemPrice
	
	if Number == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Missing itemPrice: {Number}`,
			propName = "itemPrice"
		}, p3.appPage)
	end
	local Text2 = Text1 .. Text
	local Entry = config1[p3.appPage]
	local Config = if FFlagAXFixHomeAvatarsUnifiedPurchase then {
		widgetId = FindAnalyticsFieldInAncestorsFunction("widgetId", p2),
		widgetType = FindAnalyticsFieldInAncestorsFunction("widgetType", p2),
		widgetItemIds = FindAnalyticsFieldInAncestorsFunction("widgetItemIds", p2),
		requestId = FindAnalyticsFieldInAncestorsFunction("requestId", p2),
		itemPosition = FindAnalyticsFieldInAncestorsFunction("itemPosition", p2)
	} else nil
	local v1 = "TryOnScreen"
	local Entry1 = config[p3.appPage]
	
	if Entry1 == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenMarketplaceTryOn,
			message = `Unsupported appPage for OpenMarketplaceTryOn action: {p3.appPage}`
		}, p3.appPage)
	else
		local config2 = {
			group = "AvatarItemWidgetClick",
			actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
			surface = Entry1,
			item_id = ItemId,
			item_type = Text1
		}
		
		if not AXFixHomepageTryOnScreenAnalytics and p3.appPage == AppPage.Home then
			v1 = "HomeTryOnScreen"
			config2 = {
				group = "HomePageAvatarWidgetClick",
				actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
				surface = ImpressionEnums.MarketplaceSurfaceType.HOMEPAGE,
				item_id = ItemId,
				item_type = Text1
			}
		end
		config2.event_sender_api = ImpressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
		AnalyticsService.EventStream:sendTelemetryEvent(v1, "marketplaceOrganicFELog", config2)
		local config4 = nil
		
		if FFlagAXFixHomeAvatarsUnifiedPurchase then
			config4 = {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = Entry,
				itemId = ItemId,
				itemType = ASSET
			}
			
			if Config.widgetId ~= nil and (Config.widgetType ~= nil and (Config.widgetItemIds ~= nil and Config.requestId ~= nil)) then
				config4.widgetId = Config.widgetId
				config4.widgetType = Config.widgetType
				config4.widgetItemIds = Config.widgetItemIds
				config4.requestId = Config.requestId
				config4.uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP
				config4.widgetItemPrice = Number
			else
				config4.organicItemPrice = Number
			end
		else
			config4 = {
				widgetId = "DiscoveryHomepageAvatarWidget:1234",
				widgetType = "DiscoveryHomepageAvatarWidget",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
				itemId = ItemId,
				itemType = ASSET,
				uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP,
				widgetItemPrice = Number
			}
		end
		if FFlagAXDiscoveryItemPurchaseAttribution then
			SendUnifiedEventLogFunction(config4)
		else
			if FFlagAXUnifiedEventCounters then
				UnifiedEventCounterAggregator.record(config4, AXUnifiedEventFilter.filter(config4, { skipReporting = true }))
			end
			AnalyticsService.EventStream:sendTelemetryEvent(UnifiedEventLogConstants.EVENT_NAME, UnifiedEventLogConstants.EVENT_NAME, config4)
		end
	end
	local config3 = {
		name = AppPage.AvatarExperienceWrapper,
		detail = Text2,
		extraProps = {
			routeName = AvatarScreen.TryOnItem,
			params = {
				mountAsFullView = false,
				mountAnimation = true,
				showRobuxBalance = true,
				showDropDownTopBar = true,
				hideTab = true,
				shouldNavigateDown = true,
				itemId = Text,
				itemType = Text1,
				itemSubTypeName = if Text1 == "Look" then nil else ItemSubTypeName,
				fromSurface = Entry,
				detail = Text2,
				simpleView = p3.appPage == AppPage.Home and not FFlagAXEnableHomeTryOnComplexView,
				avatarUnifiedAttribution = if FFlagAXFixHomeAvatarsUnifiedPurchase then Config else nil
			}
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config3))
		
		return
	else
		p3.dependencies.dispatch(NavigateDownFunction(config3))
	end
end