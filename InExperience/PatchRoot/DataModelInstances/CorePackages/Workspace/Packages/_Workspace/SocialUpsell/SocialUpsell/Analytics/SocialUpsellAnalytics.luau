local telemetryService = game:GetService("TelemetryService")
local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local _ = require(socialUpsell.Types)
local parent = socialUpsell.Parent
local cryoModule = require(parent.Cryo)
local upsellEntrySurfaceTypeModule = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local upsellComponentModule = require(socialUpsell.Analytics.Enum.UpsellComponent)
local upsellStageModule = require(socialUpsell.Analytics.Enum.UpsellStage)
local _ = require(parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local fFlagAddSessionizationToAnalyticsModule = require(socialUpsell.Flag.FFlagAddSessionizationToAnalytics)
local fFlagAddAEGIS2AnalyticsModule = require(socialUpsell.Flag.FFlagAddAEGIS2Analytics)
local fFlagAddUpsellEntryComponentToAnalyticsModule = require(socialUpsell.Flag.FFlagAddUpsellEntryComponentToAnalytics)
local t = {
	description = "Upsell Banner Analytics Event",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FIntSocialUpsellEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 9, 26 }
}

function evaluateUpsellStage(p0, p1, p2) --[[ line: 29 ]]
	-- upvalues: upsellComponentModule (ref), upsellEntrySurfaceTypeModule (ref), fFlagAddAEGIS2AnalyticsModule (ref), upsellStageModule (ref)
	return if p1 == upsellComponentModule.Modal then if p2 == upsellComponentModule.Modal and (p0 == upsellEntrySurfaceTypeModule.Homepage or fFlagAddAEGIS2AnalyticsModule and (p0 == upsellEntrySurfaceTypeModule.InExperienceChatInputBar or p0 == upsellEntrySurfaceTypeModule.InExperienceVoiceChatIcon)) then upsellStageModule.Fae else upsellStageModule.FaeDetails else upsellStageModule.Fae
end

local function _(p3, p4, p5) --[[ line: 60 | named "generateUpsellIdentifier" ]]
	return if p3 and p4 and p5 then p3 .. p4 .. p5 else nil
end

function logUpsellEvent(p6, p7) --[[ line: 71 ]]
	-- upvalues: cryoModule (ref), t (ref), rbxAnalyticsService (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (ref), fFlagAddSessionizationToAnalyticsModule (ref), fFlagAddAEGIS2AnalyticsModule (ref), telemetryService (ref)
	local var11 = cryoModule.Dictionary.join(t, { eventName = p6 })
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	local t_1 = {
		upsellEntrySurface = p7.upsellEntrySurface,
		upsellStage = p7.upsellStage,
		upsellImpressionId = p7.upsellImpressionId,
		upsellComponent = p7.upsellComponent,
		btn = p7.btn or nil,
		conversationId = p7.conversationId or nil,
		playSessionId = if playSessionId ~= "" then nil else playSessionId,
		clientTimeStamp = os.time(),
		upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then p7.upsellEntryComponent else nil
	}
	local upsellPurpose = p7.upsellPurpose
	local upsellEntrySurface = p7.upsellEntrySurface
	local upsellComponent = p7.upsellComponent
	t_1.upsellIdentifier = if upsellPurpose and upsellEntrySurface and upsellComponent then upsellPurpose .. upsellEntrySurface .. upsellComponent else nil
	t_1.upsellPurpose = p7.upsellPurpose
	local var14 = if fFlagAddSessionizationToAnalyticsModule then { "addSessionInfo" } else {}
	
	if fFlagAddAEGIS2AnalyticsModule then
		table.insert(var14, "addPlaceId")
		table.insert(var14, "addUniverseId")
	end
	telemetryService:LogEvent(var11, { customFields = t_1, standardizedFields = var14 })
end

return {
	evaluateUpsellStage = evaluateUpsellStage,
	logUpsellEvent = logUpsellEvent
}