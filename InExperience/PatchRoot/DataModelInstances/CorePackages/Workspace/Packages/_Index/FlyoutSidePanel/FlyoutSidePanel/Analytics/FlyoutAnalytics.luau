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

local function _(p0) --[[ line: 64 | named "checkEventNameMappings" ]]
	-- upvalues: flyoutContentSettingsModule (ref)
	return if p0 and flyoutContentSettingsModule.EventNameMappings[p0] then flyoutContentSettingsModule.EventNameMappings[p0] else p0 or ""
end

local function logEventHelper(p1, p2, p3) --[[ line: 71 ]]
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

local _ = function(p4, p5, p6, p7) --[[ line: 111 | named "sendMoreGridItemClickEvent_legacy" ]]
	p4:setRBXEventStream("moreGridItem", "moreGridItemClick", { itemType = p5, localUserId = p6, url = p7 })
end

return {
	onFlyoutSidePanelClosed = function(p8) --[[ line: 93 ]]
		-- upvalues: logEventHelper (ref), t_1 (ref)
		logEventHelper(t_1, "flyout_close", p8)
	end,
	onFlyoutTooltipShown = function(p9) --[[ line: 97 ]]
		-- upvalues: logEventHelper (ref), t_2 (ref)
		logEventHelper(t_2, "flyout_tooltip_show", p9)
	end,
	onFlyoutTooltipDismissed = function(p10) --[[ line: 101 ]]
		-- upvalues: logEventHelper (ref), t_3 (ref)
		logEventHelper(t_3, "flyout_tooltip_dismiss", p10)
	end,
	onFlyoutContentItemClicked = function(p11) --[[ line: 105 ]]
		-- upvalues: logEventHelper (ref), t_4 (ref), t_1 (ref)
		logEventHelper(t_4, "flyout_item_click", p11)
		logEventHelper(t_1, "flyout_close", p11)
	end,
	sendMoreLegacyAndFlyoutItemClickEvent = function(p12, p13, p14, p15) --[[ line: 119 ]]
		-- upvalues: flyoutContentSettingsModule (ref), logEventHelper (ref), t_4 (ref), t_1 (ref)
		local var9 = if p13 and flyoutContentSettingsModule.EventNameMappings[p13] then flyoutContentSettingsModule.EventNameMappings[p13] else p13 or ""
		local t = { source = "click", integrationId = var9 }
		logEventHelper(t_4, "flyout_item_click", t)
		logEventHelper(t_1, "flyout_close", t)
		p12:setRBXEventStream("moreGridItem", "moreGridItemClick", { itemType = var9, localUserId = p14, url = p15 })
	end,
	sendPageLoadEvent = function(p16, p17) --[[ line: 125 ]]
		-- upvalues: localizationService (ref), logEventHelper (ref), t (ref)
		p16:setRBXEventStream("AppRouter", "luaPageLoad", {
			page = "more",
			locale = localizationService.RobloxLocaleId,
			rootPageTitle = p17
		})
		logEventHelper(t, "flyout_open", { source = p17 })
	end
}