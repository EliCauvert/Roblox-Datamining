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

local function _(p0)
	return if p0 == nil or p0 == "" then nil else tonumber(p0)
end

local function buildGameJoinCardCommonFields(p1)
	-- upvalues: playersService (ref)
	local t = {}
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		t.uid = localPlayer.UserId
	end
	if p1.friendId and p1.friendId ~= "" then
		local var11 = tonumber(p1.friendId)
		
		if var11 then
			t.cardUserId = var11
		end
	end
	local universeId = p1.universeId
	local var12 = if universeId == nil or universeId == "" then nil else tonumber(universeId)
	
	if var12 then
		t.universeId = var12
	end
	if p1.absolutePosition ~= nil then
		t.carouselAbsolutePosition = math.floor(p1.absolutePosition)
	end
	return t
end

return {
	logGameJoinCardButtonEvent = function(p2, p3)
		-- upvalues: buildGameJoinCardCommonFields (ref), telemetryService (ref), t (ref)
		local var13 = buildGameJoinCardCommonFields(p3 or {})
		var13.buttonAction = p2
		telemetryService:LogEvent(t, {
			eventContext = "gameJoinCard",
			customFields = var13,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logGameJoinCardPageLoaded = function(p4)
		-- upvalues: buildGameJoinCardCommonFields (ref), telemetryService (ref), t_1 (ref)
		telemetryService:LogEvent(t_1, {
			eventContext = "gameJoinCard",
			customFields = buildGameJoinCardCommonFields(p4 or {}),
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardAgeCheckUpsellImpression = function(p5)
		-- upvalues: telemetryService (ref), t_2 (ref)
		local t = {}
		local universeId = p5.universeId
		local var15 = if universeId == nil or universeId == "" then nil else tonumber(universeId)
		
		if var15 then
			t.universeId = var15
		end
		telemetryService:LogEvent(t_2, {
			eventContext = "gameJoinCard",
			customFields = t,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardAgeCheckVerificationOutcome = function(p6)
		-- upvalues: ageCheckUpsellOutcome (ref), telemetryService (ref), t_3 (ref)
		local t = { outcome = ageCheckUpsellOutcome[p6.outcome] }
		local universeId = p6.universeId
		local var17 = if universeId == nil or universeId == "" then nil else tonumber(universeId)
		
		if var17 then
			t.universeId = var17
		end
		telemetryService:LogEvent(t_3, {
			eventContext = "gameJoinCard",
			customFields = t,
			standardizedFields = { "addSessionInfo" }
		})
	end,
	logJoinCardCtaLoadTime = function(p7)
		-- upvalues: telemetryService (ref), t_4 (ref)
		telemetryService:LogEvent(t_4, {
			eventContext = "gameJoinCard",
			customFields = {
				durationMs = math.max(0, math.floor(p7.durationMs)),
				ctaType = p7.ctaType,
				wasCached = p7.wasCached
			},
			standardizedFields = { "addSessionInfo" }
		})
	end
}