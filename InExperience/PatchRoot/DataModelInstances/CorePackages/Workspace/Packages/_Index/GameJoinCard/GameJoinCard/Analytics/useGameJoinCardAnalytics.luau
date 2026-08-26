local playersService = game:GetService("Players")
local telemetryService = game:GetService("TelemetryService")
local loggingProtocolModule = require(script:FindFirstAncestor("GameJoinCard").Parent.LoggingProtocol)
local ageCheckUpsellOutcome = require(script.Parent.AnalyticsConstants).AgeCheckUpsellOutcome
local gameJoinCardAnalyticsThrottleHundredthsPercent = game:DefineFastInt("GameJoinCardAnalyticsThrottleHundredthsPercent", 10000)
local t = {
	eventName = "buttonClick",
	description = "Game join card button taps (GameJoinCardButtonEvents \226\134\146 buttonClick, ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_button_events.proto",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = gameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 14 }
}
local t_1 = {
	eventName = "luaPageLoad",
	description = "Game join card surface shown (GameJoinCardPageLoadedEvent \226\134\146 luaPageLoad, ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_page_loaded.proto",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = gameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 4, 14 }
}
local t_2 = {
	eventName = "joinCardAgeCheckUpsellImpression",
	description = "Game join card age-check upsell shown to user (ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_age_check_upsell_impression.proto",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = gameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 5, 19 }
}
local t_3 = {
	eventName = "joinCardAgeCheckVerificationOutcome",
	description = "Outcome (success/cancelled/error) of the age-check verification flow opened from the game join card (ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_age_check_verification_outcome.proto",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = gameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 5, 19 }
}
local t_4 = {
	eventName = "joinCardCtaLoadTime",
	description = "Game join card carousel tap \226\134\146 CTA settled duration in ms, plus the ctaType rendered and whether playability was served from cache (ctx gameJoinCard)",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_cta_load_time.proto",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = gameJoinCardAnalyticsThrottleHundredthsPercent,
	lastUpdated = { 2026, 5, 19 }
}

local function _(p1)
	return if p1 == nil or p1 == "" then nil else tonumber(p1)
end

local function buildGameJoinCardCommonFields(p1)
	-- upvalues: playersService (ref)
	local t = {}
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		t.uid = localPlayer.UserId
	end
	if p1.friendId and p1.friendId ~= "" then
		local var1 = tonumber(p1.friendId)
		
		if var1 then
			t.cardUserId = var1
		end
	end
	local universeId = p1.universeId
	local var2 = if universeId == nil or universeId == "" then nil else tonumber(universeId)
	
	if var2 then
		t.universeId = var2
	end
	if p1.absolutePosition ~= nil then
		t.carouselAbsolutePosition = math.floor(p1.absolutePosition)
	end
	return t
end

return {
	logGameJoinCardButtonEvent = function(p1, p2)
		-- upvalues: buildGameJoinCardCommonFields (ref), telemetryService (ref), t (ref)
		local var1 = buildGameJoinCardCommonFields(p2 or {})
		var1.buttonAction = p1
		telemetryService:LogEvent(t, {
			eventContext = "gameJoinCard",
			customFields = var1,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logGameJoinCardPageLoaded = function(p1)
		-- upvalues: buildGameJoinCardCommonFields (ref), telemetryService (ref), t_1 (ref)
		telemetryService:LogEvent(t_1, {
			eventContext = "gameJoinCard",
			customFields = buildGameJoinCardCommonFields(p1 or {}),
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardAgeCheckUpsellImpression = function(p1)
		-- upvalues: telemetryService (ref), t_2 (ref)
		local t = {}
		local universeId = p1.universeId
		local var1 = if universeId == nil or universeId == "" then nil else tonumber(universeId)
		
		if var1 then
			t.universeId = var1
		end
		telemetryService:LogEvent(t_2, {
			eventContext = "gameJoinCard",
			customFields = t,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardAgeCheckVerificationOutcome = function(p1)
		-- upvalues: ageCheckUpsellOutcome (ref), telemetryService (ref), t_3 (ref)
		local t = { outcome = ageCheckUpsellOutcome[p1.outcome] }
		local universeId = p1.universeId
		local var1 = if universeId == nil or universeId == "" then nil else tonumber(universeId)
		
		if var1 then
			t.universeId = var1
		end
		telemetryService:LogEvent(t_3, {
			eventContext = "gameJoinCard",
			customFields = t,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardCtaLoadTime = function(p1)
		-- upvalues: telemetryService (ref), t_4 (ref)
		telemetryService:LogEvent(t_4, {
			eventContext = "gameJoinCard",
			customFields = {
				durationMs = math.max(0, math.floor(p1.durationMs)),
				ctaType = p1.ctaType,
				wasCached = p1.wasCached
			},
			standardizedFields = { "addSessionInfo" }
		})
	end
}