local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local _ = require(Parent.UnifiedEventEnums)
local UnifiedEventLogConstantsModule = require(AvatarExperienceAnalytics.UnifiedEventLogConstants)
local UnifiedEventLogEnumsModule = require(AvatarExperienceAnalytics.UnifiedEventLogEnums)
local SendUnifiedEventLogModule = require(AvatarExperienceAnalytics.sendUnifiedEventLog)
local UnifiedEventCounterAggregatorModule = require(AvatarExperienceAnalytics.Lib.UnifiedEventCounterAggregator)
local AXUnifiedEventFilterModule = require(AvatarExperienceAnalytics.AXUnifiedEventFilter)
local FFlagAXUnifiedEventCounters = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventCounters
local FFlagAXUnifiedEventStrictPayloads = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local DiscoveryTabCategory = require(Parent.AvatarExperienceNavigation).Enums.DiscoveryTabCategory
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local AnalyticsServiceModule = require(AvatarExperienceAnalytics.AnalyticsService)
local ImpressionEnumsModule = require(AvatarExperienceAnalytics.Enums.ImpressionEnums)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXEnableHomeTryOnComplexView = SharedFlagsModule.FFlagAXEnableHomeTryOnComplexView
local FFlagAXFixHomeAvatarsUnifiedPurchase = SharedFlagsModule.FFlagAXFixHomeAvatarsUnifiedPurchase
local FFlagAXDiscoveryItemPurchaseAttribution = SharedFlagsModule.FFlagAXDiscoveryItemPurchaseAttribution
local FFlagAppIaHomeCampaignSubTab = SharedFlagsModule.FFlagAppIaHomeCampaignSubTab
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AXFixHomepageTryOnScreenAnalytics = game:DefineFastFlag("AXFixHomepageTryOnScreenAnalytics", false)
local config = {
	[AppPage.Home] = ImpressionEnumsModule.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE,
	[AppPage.SearchPage] = ImpressionEnumsModule.MarketplaceSurfaceType.DISCOVERY_SEARCH_RESULTS,
	[AppPage.Campaign] = if FFlagAppIaHomeCampaignSubTab then ImpressionEnumsModule.MarketplaceSurfaceType.DISCOVERY_HOMEPAGE else nil
}
local config1 = {
	[AppPage.Home] = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
	[AppPage.SearchPage] = UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS,
	[AppPage.Campaign] = if FFlagAppIaHomeCampaignSubTab then UnifiedLoggingSurface.DISCOVERY_HOMEPAGE else nil
}

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

return function(p1, p2, p3)
	-- upvalues: SduiActionType (copy), SduiErrorType (copy), UnifiedEventLogEnumsModule (copy), FFlagAXUnifiedEventCounters (copy), config1 (copy), FFlagAppIaHomeCampaignSubTab (copy), AppPage (copy), DiscoveryTabCategory (copy), FFlagAXFixHomeAvatarsUnifiedPurchase (copy), FindAnalyticsFieldInAncestorsFunction (copy), config (copy), ImpressionEnumsModule (copy), AXFixHomepageTryOnScreenAnalytics (copy), AnalyticsServiceModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), UnifiedLoggingSurface (copy), FFlagAXDiscoveryItemPurchaseAttribution (copy), SendUnifiedEventLogModule (copy), UnifiedEventCounterAggregatorModule (copy), AXUnifiedEventFilterModule (copy), UnifiedEventLogConstantsModule (copy), AvatarScreen (copy), FFlagAXEnableHomeTryOnComplexView (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
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
	local ASSET = if Text1 == "Asset" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET elseif Text1 == "Bundle" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE elseif Text1 == "Look" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK else UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE
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
	local CAMPAIGN = if FFlagAppIaHomeCampaignSubTab and p3.appPage == AppPage.Campaign then DiscoveryTabCategory.CAMPAIGN else nil
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
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = Entry1,
			item_id = ItemId,
			item_type = Text1
		}
		
		if not AXFixHomepageTryOnScreenAnalytics and p3.appPage == AppPage.Home then
			v1 = "HomeTryOnScreen"
			config2 = {
				group = "HomePageAvatarWidgetClick",
				actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
				surface = ImpressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE,
				item_id = ItemId,
				item_type = Text1
			}
		end
		if not FFlagAppIaHomeCampaignSubTab or p3.appPage ~= AppPage.Campaign then
			config2.event_sender_api = ImpressionEnumsModule.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
			AnalyticsServiceModule.EventStream:sendTelemetryEvent(v1, "marketplaceOrganicFELog", config2)
		end
		local config4 = nil
		if FFlagAXFixHomeAvatarsUnifiedPurchase then
			config4 = {
				action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = Entry,
				itemId = if FFlagAXUnifiedEventStrictPayloads then Text else ItemId,
				itemType = ASSET
			}
			
			if Config.widgetId ~= nil and (Config.widgetType ~= nil and (Config.widgetItemIds ~= nil and Config.requestId ~= nil)) then
				config4.widgetId = if FFlagAXUnifiedEventStrictPayloads then tostring(Config.widgetId) else Config.widgetId
				config4.widgetType = if FFlagAXUnifiedEventStrictPayloads then tostring(Config.widgetType) else Config.widgetType
				config4.widgetItemIds = if FFlagAXUnifiedEventStrictPayloads then tostring(Config.widgetItemIds) else Config.widgetItemIds
				config4.requestId = if FFlagAXUnifiedEventStrictPayloads then tostring(Config.requestId) else Config.requestId
				config4.uiTreatmentType = UnifiedEventLogEnumsModule.WidgetUiTreatment.ITEM_GROUP
				config4.widgetItemPrice = Number
			else
				config4.organicItemPrice = Number
			end
		else
			config4 = {
				widgetId = "DiscoveryHomepageAvatarWidget:1234",
				widgetType = "DiscoveryHomepageAvatarWidget",
				action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.ITEM_SELECTED,
				surface = UnifiedLoggingSurface.DISCOVERY_HOMEPAGE,
				itemId = ItemId,
				itemType = ASSET,
				uiTreatmentType = UnifiedEventLogEnumsModule.WidgetUiTreatment.ITEM_GROUP,
				widgetItemPrice = Number
			}
		end
		config4.category = CAMPAIGN
		
		if FFlagAXDiscoveryItemPurchaseAttribution then
			SendUnifiedEventLogModule(config4)
		else
			if FFlagAXUnifiedEventCounters then
				UnifiedEventCounterAggregatorModule.record(config4, AXUnifiedEventFilterModule.filter(config4, { skipReporting = true }))
			end
			AnalyticsServiceModule.EventStream:sendTelemetryEvent(UnifiedEventLogConstantsModule.EVENT_NAME, UnifiedEventLogConstantsModule.EVENT_NAME, config4)
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
				fromCategory = CAMPAIGN,
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