local LocalizationService = game:GetService("LocalizationService")
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local Default = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.LoggingProtocol).default
local FlyoutRemoveAddSessionInfo = game:DefineFastFlag("FlyoutRemoveAddSessionInfo", false)
local config = {
	eventName = "coreui_flyout_side_panel_open",
	description = "FlyoutSidePanel open event, source can be Home, Chat, or Charts",
	links = "https://roblox.atlassian.net/browse/APPEXP-3739",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutSidePanelOpenEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local config1 = {
	eventName = "coreui_flyout_side_panel_close",
	description = "FlyoutSidePanel close event, source can be click, swipe, or shield",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutSidePanelCloseEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local config2 = {
	eventName = "coreui_flyout_tooltip_show",
	description = "Flyout tooltip show event",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/9318",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutTooltipShowEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2026, 1, 21 }
}
local config3 = {
	eventName = "coreui_flyout_tooltip_dismiss",
	description = "Flyout tooltip dismiss event, source can be click or shield",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutTooltipDismissEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local config4 = {
	eventName = "coreui_flyout_content_item_click",
	description = "FlyoutSidePanel content item click event",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutContentItemClickEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local config5 = {
	eventName = "coreui_flyout_content_item_impression",
	description = "FlyoutSidePanel content item impression event",
	links = "https://roblox.atlassian.net/browse/MKTUJ-5174",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutContentItemImpressionEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2026, 9, 3 }
}

local function _(p1) --[[ Line: 73 | Named "checkEventNameMappings" ]]
	-- upvalues: FlyoutContentSettingsModule (copy)
	return if p1 and FlyoutContentSettingsModule.EventNameMappings[p1] then FlyoutContentSettingsModule.EventNameMappings[p1] else p1 or ""
end

local function logEventHelper(p1, p2, p3) --[[ Line: 80 ]]
	-- upvalues: FlyoutRemoveAddSessionInfo (copy), FlyoutContentSettingsModule (copy), Default (copy)
	local IntegrationId = p3.integrationId
	Default:logRobloxTelemetryEvent(p1, if FlyoutRemoveAddSessionInfo then {
		"addPlaceId",
		"addUniverseId",
		"addPlaceInstanceId",
		"addSessionId",
		"addOsInfo"
	} else {
		"addPlaceId", "addUniverseId", "addPlaceInstanceId", "addSessionId",
		"addSessionInfo", "addOsInfo"
	}, {
		integration_id = if IntegrationId and FlyoutContentSettingsModule.EventNameMappings[IntegrationId] then FlyoutContentSettingsModule.EventNameMappings[IntegrationId] else IntegrationId or "",
		source = p3.source,
		local_timestamp = os.time(),
		count = p3.count
	}, p2)
end

local _ = function(p1, ItemType, LocalUserId, Url) --[[ Line: 124 | Named "sendMoreGridItemClickEvent_legacy" ]]
	p1:setRBXEventStream("moreGridItem", "moreGridItemClick", {
		itemType = ItemType,
		localUserId = LocalUserId,
		url = Url
	})
end

return {
	onFlyoutSidePanelClosed = function(p1) --[[ Line: 102 ]]
		-- upvalues: logEventHelper (copy), config1 (copy)
		logEventHelper(config1, "flyout_close", p1)
	end,
	onFlyoutTooltipShown = function(p1) --[[ Line: 106 ]]
		-- upvalues: logEventHelper (copy), config2 (copy)
		logEventHelper(config2, "flyout_tooltip_show", p1)
	end,
	onFlyoutTooltipDismissed = function(p1) --[[ Line: 110 ]]
		-- upvalues: logEventHelper (copy), config3 (copy)
		logEventHelper(config3, "flyout_tooltip_dismiss", p1)
	end,
	onFlyoutContentItemClicked = function(p1) --[[ Line: 114 ]]
		-- upvalues: logEventHelper (copy), config4 (copy), config1 (copy)
		logEventHelper(config4, "flyout_item_click", p1)
		logEventHelper(config1, "flyout_close", p1)
	end,
	onFlyoutContentItemImpressed = function(p1) --[[ Line: 120 ]]
		-- upvalues: logEventHelper (copy), config5 (copy)
		logEventHelper(config5, "flyout_item_impression", p1)
	end,
	sendMoreLegacyAndFlyoutItemClickEvent = function(p1, p2, LocalUserId, Url) --[[ Line: 132 ]]
		-- upvalues: FlyoutContentSettingsModule (copy), logEventHelper (copy), config4 (copy), config1 (copy)
		local EventNameMapping = if p2 and FlyoutContentSettingsModule.EventNameMappings[p2] then FlyoutContentSettingsModule.EventNameMappings[p2] else p2 or ""
		local config = { source = "click", integrationId = EventNameMapping }
		logEventHelper(config4, "flyout_item_click", config)
		logEventHelper(config1, "flyout_close", config)
		p1:setRBXEventStream("moreGridItem", "moreGridItemClick", {
			itemType = EventNameMapping,
			localUserId = LocalUserId,
			url = Url
		})
	end,
	sendPageLoadEvent = function(p1, RootPageTitle) --[[ Line: 138 ]]
		-- upvalues: LocalizationService (copy), logEventHelper (copy), config (copy)
		p1:setRBXEventStream("AppRouter", "luaPageLoad", {
			page = "more",
			locale = LocalizationService.RobloxLocaleId,
			rootPageTitle = RootPageTitle
		})
		logEventHelper(config, "flyout_open", { source = RootPageTitle })
	end
}