local localizationService = game:GetService("LocalizationService")
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local default = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.LoggingProtocol).default
local flyoutRemoveAddSessionInfo = game:DefineFastFlag("FlyoutRemoveAddSessionInfo", false)
local t = {
	eventName = "coreui_flyout_side_panel_open",
	description = "FlyoutSidePanel open event, source can be Home, Chat, or Charts",
	links = "https://roblox.atlassian.net/browse/APPEXP-3739",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutSidePanelOpenEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local t_1 = {
	eventName = "coreui_flyout_side_panel_close",
	description = "FlyoutSidePanel close event, source can be click, swipe, or shield",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutSidePanelCloseEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local t_2 = {
	eventName = "coreui_flyout_tooltip_show",
	description = "Flyout tooltip show event",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/9318",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutTooltipShowEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2026, 1, 21 }
}
local t_3 = {
	eventName = "coreui_flyout_tooltip_dismiss",
	description = "Flyout tooltip dismiss event, source can be click or shield",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutTooltipDismissEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}
local t_4 = {
	eventName = "coreui_flyout_content_item_click",
	description = "FlyoutSidePanel content item click event",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8500",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FlyoutContentItemClickEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 10, 30 }
}

local function _(p1)
	-- upvalues: flyoutContentSettingsModule (ref)
	return if p1 and flyoutContentSettingsModule.EventNameMappings[p1] then flyoutContentSettingsModule.EventNameMappings[p1] else p1 or ""
end

local function logEventHelper(p1, p2, p3)
	-- upvalues: flyoutRemoveAddSessionInfo (ref), flyoutContentSettingsModule (ref), default (ref)
	local integrationId = p3.integrationId
	default:logRobloxTelemetryEvent(p1, if flyoutRemoveAddSessionInfo then {
		"addPlaceId",
		"addUniverseId",
		"addPlaceInstanceId",
		"addSessionId",
		"addOsInfo"
	} else {
		"addPlaceId", "addUniverseId", "addPlaceInstanceId", "addSessionId",
		"addSessionInfo", "addOsInfo"
	}, {
		integration_id = if integrationId and flyoutContentSettingsModule.EventNameMappings[integrationId] then flyoutContentSettingsModule.EventNameMappings[integrationId] else integrationId or "",
		source = p3.source,
		local_timestamp = os.time(),
		count = p3.count
	}, p2)
end

local _ = function(p1, p2, p3, p4)
	p1:setRBXEventStream("moreGridItem", "moreGridItemClick", { itemType = p2, localUserId = p3, url = p4 })
end

return {
	onFlyoutSidePanelClosed = function(p1)
		-- upvalues: logEventHelper (ref), t_1 (ref)
		logEventHelper(t_1, "flyout_close", p1)
	end,
	onFlyoutTooltipShown = function(p1)
		-- upvalues: logEventHelper (ref), t_2 (ref)
		logEventHelper(t_2, "flyout_tooltip_show", p1)
	end,
	onFlyoutTooltipDismissed = function(p1)
		-- upvalues: logEventHelper (ref), t_3 (ref)
		logEventHelper(t_3, "flyout_tooltip_dismiss", p1)
	end,
	onFlyoutContentItemClicked = function(p1)
		-- upvalues: logEventHelper (ref), t_4 (ref), t_1 (ref)
		logEventHelper(t_4, "flyout_item_click", p1)
		logEventHelper(t_1, "flyout_close", p1)
	end,
	sendMoreLegacyAndFlyoutItemClickEvent = function(p1, p2, p3, p4)
		-- upvalues: flyoutContentSettingsModule (ref), logEventHelper (ref), t_4 (ref), t_1 (ref)
		local var1 = if p2 and flyoutContentSettingsModule.EventNameMappings[p2] then flyoutContentSettingsModule.EventNameMappings[p2] else p2 or ""
		local t = { source = "click", integrationId = var1 }
		logEventHelper(t_4, "flyout_item_click", t)
		logEventHelper(t_1, "flyout_close", t)
		p1:setRBXEventStream("moreGridItem", "moreGridItemClick", { itemType = var1, localUserId = p3, url = p4 })
	end,
	sendPageLoadEvent = function(p1, p2)
		-- upvalues: localizationService (ref), logEventHelper (ref), t (ref)
		p1:setRBXEventStream("AppRouter", "luaPageLoad", {
			page = "more",
			locale = localizationService.RobloxLocaleId,
			rootPageTitle = p2
		})
		logEventHelper(t, "flyout_open", { source = p2 })
	end
}