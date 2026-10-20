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
local config = {
	description = "Upsell Banner Analytics Event",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("FIntSocialUpsellEventThrottleHunderedthsPercent", 10000),
	lastUpdated = { 2025, 9, 26 }
}

function evaluateUpsellStage(Homepage, Modal, Modal1)
	-- upvalues: UpsellComponentModule (copy), UpsellEntrySurfaceTypeModule (copy), UpsellStageModule (copy)
	return if Modal == UpsellComponentModule.Modal then if Modal1 == UpsellComponentModule.Modal and (Homepage == UpsellEntrySurfaceTypeModule.Homepage or Homepage == UpsellEntrySurfaceTypeModule.InExperienceChatInputBar or Homepage == UpsellEntrySurfaceTypeModule.InExperienceVoiceChatIcon) then UpsellStageModule.Fae else UpsellStageModule.FaeDetails else UpsellStageModule.Fae
end

local function _(Text, Text1, Text2)
	return if Text and Text1 and Text2 then Text .. Text1 .. Text2 else nil
end

function logUpsellEvent(EventName, CustomFields)
	-- upvalues: CryoModule (copy), config (copy), RbxAnalyticsService (copy), TelemetryService (copy)
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
		upsellEntryComponent = CustomFields.upsellEntryComponent,
		upsellIdentifier = if UpsellPurpose and UpsellEntrySurface and UpsellComponent then UpsellPurpose .. UpsellEntrySurface .. UpsellComponent else nil,
		upsellPurpose = CustomFields.upsellPurpose
	}
	local List = { "addSessionInfo" }
	table.insert(List, "addPlaceId")
	table.insert(List, "addUniverseId")
	TelemetryService:LogEvent(JoinResult, { customFields = CustomFields1, standardizedFields = List })
end

return {
	evaluateUpsellStage = evaluateUpsellStage,
	logUpsellEvent = logUpsellEvent
}