local Players = game:GetService("Players")
local TelemetryService = game:GetService("TelemetryService")
local LoggingProtocolModule = require(script:FindFirstAncestor("GameJoinCard").Parent.LoggingProtocol)
local AgeCheckUpsellOutcome = require(script.Parent.AnalyticsConstants).AgeCheckUpsellOutcome
local GameJoinCardAnalyticsThrottleHundredthsPercent = game:DefineFastInt("GameJoinCardAnalyticsThrottleHundredthsPercent", 10000)
local config = {
	eventName = "buttonClick",
	description = "Game join card button taps (GameJoinCardButtonEvents → buttonClick, ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_button_events.proto",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = GameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 14 }
}
local config1 = {
	eventName = "luaPageLoad",
	description = "Game join card surface shown (GameJoinCardPageLoadedEvent → luaPageLoad, ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_page_loaded.proto",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = GameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 14 }
}
local config2 = {
	eventName = "joinCardAgeCheckUpsellImpression",
	description = "Game join card age-check upsell shown to user (ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_age_check_upsell_impression.proto",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = GameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 5, 19 }
}
local config3 = {
	eventName = "joinCardAgeCheckVerificationOutcome",
	description = "Outcome (success/cancelled/error) of the age-check verification flow opened from the game join card (ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_age_check_verification_outcome.proto",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = GameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 5, 19 }
}
local config4 = {
	eventName = "joinCardCtaLoadTime",
	description = "Game join card carousel tap → CTA settled duration in ms, plus the ctaType rendered and whether playability was served from cache (ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_cta_load_time.proto",
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = GameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 5, 19 }
}

local function _(p1)
	return if p1 == nil or p1 == "" then nil else tonumber(p1)
end

local function buildGameJoinCardCommonFields(p1)
	-- upvalues: Players (copy)
	local t = {}
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		t.uid = LocalPlayer.UserId
	end
	if p1.friendId and p1.friendId ~= "" then
		local Number1: number? = tonumber(p1.friendId)
		
		if Number1 then
			t.cardUserId = Number1
		end
	end
	local UniverseId = p1.universeId
	local Number = if UniverseId == nil or UniverseId == "" then nil else tonumber(UniverseId)
	
	if Number then
		t.universeId = Number
	end
	if p1.absolutePosition ~= nil then
		t.carouselAbsolutePosition = math.floor(p1.absolutePosition)
	end
	return t
end

return {
	logGameJoinCardButtonEvent = function(ButtonAction, p1)
		-- upvalues: buildGameJoinCardCommonFields (copy), TelemetryService (copy), config (copy)
		local GameJoinCardCommonFields = buildGameJoinCardCommonFields(p1 or {})
		GameJoinCardCommonFields.buttonAction = ButtonAction
		TelemetryService:LogEvent(config, {
			eventContext = "gameJoinCard",
			customFields = GameJoinCardCommonFields,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logGameJoinCardPageLoaded = function(p1)
		-- upvalues: buildGameJoinCardCommonFields (copy), TelemetryService (copy), config1 (copy)
		TelemetryService:LogEvent(config1, {
			eventContext = "gameJoinCard",
			customFields = buildGameJoinCardCommonFields(p1 or {}),
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardAgeCheckUpsellImpression = function(p1)
		-- upvalues: TelemetryService (copy), config2 (copy)
		local CustomFields = {}
		local UniverseId = p1.universeId
		local Number = if UniverseId == nil or UniverseId == "" then nil else tonumber(UniverseId)
		
		if Number then
			CustomFields.universeId = Number
		end
		TelemetryService:LogEvent(config2, {
			eventContext = "gameJoinCard",
			customFields = CustomFields,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardAgeCheckVerificationOutcome = function(CustomFields)
		-- upvalues: AgeCheckUpsellOutcome (copy), TelemetryService (copy), config3 (copy)
		local CustomFields1 = { outcome = AgeCheckUpsellOutcome[CustomFields.outcome] }
		local UniverseId = CustomFields.universeId
		local Number = if UniverseId == nil or UniverseId == "" then nil else tonumber(UniverseId)
		
		if Number then
			CustomFields1.universeId = Number
		end
		TelemetryService:LogEvent(config3, {
			eventContext = "gameJoinCard",
			customFields = CustomFields1,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardCtaLoadTime = function(p1)
		-- upvalues: TelemetryService (copy), config4 (copy)
		TelemetryService:LogEvent(config4, {
			eventContext = "gameJoinCard",
			customFields = {
				durationMs = math.max(0, (math.floor(p1.durationMs))),
				ctaType = p1.ctaType,
				wasCached = p1.wasCached
			},
			standardizedFields = { "addSessionInfo" }
		})
	end
}