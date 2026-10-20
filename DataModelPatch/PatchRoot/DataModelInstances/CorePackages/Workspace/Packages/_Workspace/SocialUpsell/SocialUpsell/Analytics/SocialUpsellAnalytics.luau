local TelemetryService = game:GetService("TelemetryService")
local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local _ = require(SocialUpsell.Types)
local Parent = SocialUpsell.Parent
local CryoModule = require(Parent.Cryo)
local UpsellEntrySurfaceTypeModule = require(SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local UpsellComponentModule = require(SocialUpsell.Analytics.Enum.UpsellComponent)
local UpsellStageModule = require(SocialUpsell.Analytics.Enum.UpsellStage)
local _ = require(Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local FFlagAddSessionizationToAnalyticsModule = require(SocialUpsell.Flag.FFlagAddSessionizationToAnalytics)
local FFlagAddAEGIS2AnalyticsModule = require(SocialUpsell.Flag.FFlagAddAEGIS2Analytics)
local FFlagAddUpsellEntryComponentToAnalyticsModule = require(SocialUpsell.Flag.FFlagAddUpsellEntryComponentToAnalytics)
local config = {
	description = "Upsell Banner Analytics Event",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FIntSocialUpsellEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 9, 26 }
}

function evaluateUpsellStage(Homepage, Modal, Modal1)
	-- upvalues: UpsellComponentModule (copy), UpsellEntrySurfaceTypeModule (copy), FFlagAddAEGIS2AnalyticsModule (copy), UpsellStageModule (copy)
	return if Modal == UpsellComponentModule.Modal then if Modal1 == UpsellComponentModule.Modal and (Homepage == UpsellEntrySurfaceTypeModule.Homepage or FFlagAddAEGIS2AnalyticsModule and (Homepage == UpsellEntrySurfaceTypeModule.InExperienceChatInputBar or Homepage == UpsellEntrySurfaceTypeModule.InExperienceVoiceChatIcon)) then UpsellStageModule.Fae else UpsellStageModule.FaeDetails else UpsellStageModule.Fae
end

local function _(Text, Text1, Text2)
	return if Text and Text1 and Text2 then Text .. Text1 .. Text2 else nil
end

function logUpsellEvent(EventName, CustomFields)
	-- upvalues: CryoModule (copy), config (copy), RbxAnalyticsService (copy), FFlagAddUpsellEntryComponentToAnalyticsModule (copy), FFlagAddSessionizationToAnalyticsModule (copy), FFlagAddAEGIS2AnalyticsModule (copy), TelemetryService (copy)
	local JoinResult = CryoModule.Dictionary.join(config, { eventName = EventName })
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	local UpsellPurpose = CustomFields.upsellPurpose
	local UpsellEntrySurface = CustomFields.upsellEntrySurface
	local UpsellComponent = CustomFields.upsellComponent
	local CustomFields1 = {
		upsellEntrySurface = CustomFields.upsellEntrySurface,
		upsellStage = CustomFields.upsellStage,
		upsellImpressionId = CustomFields.upsellImpressionId,
		upsellComponent = CustomFields.upsellComponent,
		btn = CustomFields.btn or nil,
		conversationId = CustomFields.conversationId or nil,
		playSessionId = if PlaySessionId == "" then nil else PlaySessionId,
		clientTimeStamp = os.time(),
		upsellEntryComponent = if FFlagAddUpsellEntryComponentToAnalyticsModule then CustomFields.upsellEntryComponent else nil,
		upsellIdentifier = if UpsellPurpose and UpsellEntrySurface and UpsellComponent then UpsellPurpose .. UpsellEntrySurface .. UpsellComponent else nil,
		upsellPurpose = CustomFields.upsellPurpose
	}
	local List = if FFlagAddSessionizationToAnalyticsModule then { "addSessionInfo" } else {}
	
	if FFlagAddAEGIS2AnalyticsModule then
		table.insert(List, "addPlaceId")
		table.insert(List, "addUniverseId")
	end
	TelemetryService:LogEvent(JoinResult, { customFields = CustomFields1, standardizedFields = List })
end

return {
	evaluateUpsellStage = evaluateUpsellStage,
	logUpsellEvent = logUpsellEvent
}