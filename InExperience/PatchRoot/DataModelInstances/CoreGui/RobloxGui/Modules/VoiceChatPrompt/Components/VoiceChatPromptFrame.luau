local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local contextActionService = game:GetService("ContextActionService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local useLastInput = responsiveModule.useLastInput
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local toast = UIBloxModule.App.Dialog.Toast
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local validateStyle = UIBloxModule.Style.Validator.validateStyle
local promptTypeModule = require(script.Parent.Parent.PromptType)
local inGameMenuPolicyModule = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy)
local voiceChatConsentModalModule = require(script.Parent.VoiceChatConsentModal)
local voiceChatTooltipModule = require(script.Parent.VoiceChatTooltip)
local devicePermissionsModalModule = require(script.Parent.DevicePermissionsModal)
local assetsModule = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local _ = require(corePackagesService.Workspace.Packages.VoiceChatCore)
local flags = require(corePackagesService.Workspace.Packages.VoiceChat).Flags
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local getFFlagEnableVoicePromptReasonTextModule = require(robloxGui.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local getFFlagSupportGamepadNavInVoiceModals = flags.GetFFlagSupportGamepadNavInVoiceModals
local getFIntVoiceToxicityToastDurationSecondsModule = require(robloxGui.Modules.Flags.GetFIntVoiceToxicityToastDurationSeconds)
local voiceChatOnlyReportVoiceBans = game:DefineFastFlag("VoiceChatOnlyReportVoiceBans", false)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local getFFlagShowDevicePermissionsModal = sharedFlagsModule.GetFFlagShowDevicePermissionsModal
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFIntVoiceJoinM3ToastDurationSecondsModule = require(robloxGui.Modules.Flags.GetFIntVoiceJoinM3ToastDurationSeconds)
local getFFlagEnableSeamlessVoiceDataConsentToastModule = require(robloxGui.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local getFFlagUpdateVoiceConnectionToastsModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagUpdateVoiceConnectionToasts)
local getFFlagEnableVoiceTrustedConnectionsToastsModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts)
local getFFlagVoiceConnectToastCapturesTrustedFriendsSubtitleModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceConnectToastCapturesTrustedFriendsSubtitle)
local getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local voiceNudgeUseNewDACopyModule = require(script.Parent.Parent.Parent.VoiceChat.Helpers.VoiceNudgeUseNewDACopy)
local voiceNudgeUseNewConfirmButton = game:DefineFastFlag("VoiceNudgeUseNewConfirmButton", false)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local _ = nil
local var35 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(220, 220, 220)
local _ = roactModule.PureComponent:extend("VoiceChatPromptFrame")
local t = {
	[promptTypeModule.None] = "",
	[promptTypeModule.NotAudible] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"),
	[promptTypeModule.Permission] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"),
	[promptTypeModule.Retry] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"),
	[promptTypeModule.Place] = "Exceeds Max Players",
	[promptTypeModule.User] = "Not Eligible for Voice",
	[promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended"),
	[promptTypeModule.VoiceChatSuspendedTemporary] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"),
	[promptTypeModule.VoiceChatSuspendedTemporaryB] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"),
	[promptTypeModule.VoiceChatSuspendedPermanent] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"),
	[promptTypeModule.VoiceLoading] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Connecting"),
	[promptTypeModule.VoiceToxicityModal] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"),
	[promptTypeModule.VoiceToxicityToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"),
	[promptTypeModule.VoiceToxicityFeedbackToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback"),
	[promptTypeModule.VoiceChatSuspendedTemporaryToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"),
	[promptTypeModule.VoiceConsentDeclinedToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind"),
	[promptTypeModule.VoiceConsentAcceptedToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"),
	[promptTypeModule.VoiceConsentModalV1] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"),
	[promptTypeModule.VoiceConsentModalV2] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers"),
	[promptTypeModule.VoiceConsentModalV3] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"),
	[promptTypeModule.JoinedVoiceToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"),
	[promptTypeModule.JoinVoiceSTUX] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"),
	[promptTypeModule.LeaveVoice] = if getFFlagUpdateVoiceConnectionToastsModule() then var35:Format("Feature.SettingsHub.Prompt.LeaveVoiceChatV2") else robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.LeaveVoiceChat"),
	[promptTypeModule.JoinVoice] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2"),
	[promptTypeModule.DevicePermissionsModal] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess"),
	[promptTypeModule.VoiceDataConsentOptOutToast] = if getFFlagEnableSeamlessVoiceDataConsentToastModule() then var35:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat") else nil,
	[promptTypeModule.UnifiedJoinVoiceToast] = if getFFlagUpdateVoiceConnectionToastsModule() then var35:Format("Feature.SettingsHub.Prompt.JoinedVoiceChatV3") else nil,
	[promptTypeModule.AgeCheckForVoiceToast] = var35:Format("Feature.SettingsHub.Prompt.Title.AgeCheckForVoiceToast"),
	[promptTypeModule.UpdateOnAutoJoinToast] = if getFFlagEnableVoiceTrustedConnectionsToastsModule() then var35:Format("Feature.SettingsHub.Prompt.UpdateToVoiceChat") else nil,
	[promptTypeModule.VoiceChatSuspendedTemporaryBV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspendedV2") else nil,
	[promptTypeModule.VoiceToxicityModalV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat") else nil,
	[promptTypeModule.VoiceToxicityToastV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat") else nil
}
local t_1 = {
	[promptTypeModule.None] = "",
	[promptTypeModule.NotAudible] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"),
	[promptTypeModule.Permission] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission"),
	[promptTypeModule.Retry] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry"),
	[promptTypeModule.Place] = "Spatial voice is only available for places with Max Players of 30 or less.",
	[promptTypeModule.User] = "This account is not eligible to use Spatial Voice.",
	[promptTypeModule.VoiceChatSuspendedTemporary] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone"),
	[promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera"),
	[promptTypeModule.VoiceChatSuspendedTemporaryB] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1"),
	[promptTypeModule.VoiceChatSuspendedPermanent] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked"),
	[promptTypeModule.VoiceLoading] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting"),
	[promptTypeModule.VoiceToxicityModal] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal"),
	[promptTypeModule.VoiceToxicityToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast"),
	[promptTypeModule.VoiceToxicityFeedbackToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow"),
	[promptTypeModule.VoiceChatSuspendedTemporaryToast] = function(p0) --[[ line: 186 ]]
		-- upvalues: robloxTranslatorModule (ref)
		return robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", { dateTime = p0 })
	end,
	[promptTypeModule.VoiceConsentDeclinedToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"),
	[promptTypeModule.VoiceConsentAcceptedToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"),
	[promptTypeModule.VoiceConsentModalV1] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"),
	[promptTypeModule.VoiceConsentModalV2] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"),
	[promptTypeModule.VoiceConsentModalV3] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"),
	[promptTypeModule.JoinedVoiceToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute"),
	[promptTypeModule.JoinVoiceSTUX] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere"),
	[promptTypeModule.DevicePermissionsModal] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess"),
	[promptTypeModule.VoiceDataConsentOptOutToast] = if getFFlagEnableSeamlessVoiceDataConsentToastModule() then var35:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData") else nil,
	[promptTypeModule.UnifiedJoinVoiceToast] = if getFFlagVoiceConnectToastCapturesTrustedFriendsSubtitleModule then robloxTranslatorModule:FormatByKey("Feature.Captures.Prompt.Subtitle.VoiceChatRecordingTrustedFriendsAgeGroup") elseif getFFlagEnableVoiceTrustedConnectionsToastsModule() then var35:Format(if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedFriends" else "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedConnections") elseif getFFlagUpdateVoiceConnectionToastsModule() then var35:Format("Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupV2") else nil,
	[promptTypeModule.AgeCheckForVoiceToast] = var35:Format("Feature.SettingsHub.Prompt.Subtitle.GoToAccountInfo"),
	[promptTypeModule.UpdateOnAutoJoinToast] = if getFFlagEnableVoiceTrustedConnectionsToastsModule() then var35:Format(if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedFriendsUpdate" else "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedConnectionsUpdate") else nil,
	[promptTypeModule.VoiceChatSuspendedTemporaryBV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1V2") else nil,
	[promptTypeModule.VoiceToxicityModalV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModalV2") else nil,
	[promptTypeModule.VoiceToxicityToastV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToastV2") else nil
}

if runService:IsStudio() then
	t[promptTypeModule.Place] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Place")
	t[promptTypeModule.User] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.User")
	t_1[promptTypeModule.Place] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place")
	t_1[promptTypeModule.User] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User")
end
local _ = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect")
local var40 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations")
local var41 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil")
local var42 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Understand")
local var43 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GotIt")
local var44 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge")
local var45 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2")
local var46 = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Ok") else nil
local var47 = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2V2") else nil
local var48 = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudgeV2") else nil

local function _(p1) --[[ line: 265 | named "PromptTypeIsBan" ]]
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	return if p1 ~= promptTypeModule.VoiceChatSuspendedPermanent then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
end

local _ = function(p2) --[[ line: 273 | named "IsModalNudge" ]]
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	return if p2 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p2 == promptTypeModule.VoiceToxicityModalV2 else true
end

local _ = function(p3) --[[ line: 278 | named "IsVoiceConsentModal" ]]
	-- upvalues: promptTypeModule (ref)
	return if p3 ~= promptTypeModule.VoiceConsentModalV1 then if p3 ~= promptTypeModule.VoiceConsentModalV2 then p3 == promptTypeModule.VoiceConsentModalV3 else true else true
end

local _ = function(p4) --[[ line: 284 | named "IsDevicePermissionsModal" ]]
	-- upvalues: promptTypeModule (ref)
	return p4 == promptTypeModule.DevicePermissionsModal
end

local _ = function(p5) --[[ line: 288 | named "PromptTypeIsModal" ]]
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	local var51 = if p5 ~= promptTypeModule.VoiceChatSuspendedPermanent then if p5 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p5 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p5 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p5 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
	
	if not var51 then
		var51 = if p5 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p5 == promptTypeModule.VoiceToxicityModalV2 else true
		
		if not var51 then
			var51 = if p5 ~= promptTypeModule.VoiceConsentModalV1 then if p5 ~= promptTypeModule.VoiceConsentModalV2 then p5 == promptTypeModule.VoiceConsentModalV3 else true else true
			var51 = var51 or p5 == promptTypeModule.DevicePermissionsModal
		end
	end
	return var51
end

local _ = function(p6) --[[ line: 295 | named "PromptTypeIsVoiceConsent" ]]
	-- upvalues: promptTypeModule (ref)
	return if p6 ~= promptTypeModule.VoiceConsentDeclinedToast then p6 == promptTypeModule.VoiceConsentAcceptedToast else true
end

local _ = function(p7) --[[ line: 299 | named "PromptTypeIsVoiceDataConsent" ]]
	-- upvalues: promptTypeModule (ref)
	return p7 == promptTypeModule.VoiceDataConsentOptOutToast
end

local _ = function(p8) --[[ line: 303 | named "PromptTypeIsConnectDisconnectToast" ]]
	-- upvalues: promptTypeModule (ref), getFFlagUpdateVoiceConnectionToastsModule (ref)
	return if p8 ~= promptTypeModule.JoinVoice then if p8 ~= promptTypeModule.LeaveVoice then getFFlagUpdateVoiceConnectionToastsModule() and p8 == promptTypeModule.UnifiedJoinVoiceToast else true else true
end

local _ = function(p9) --[[ line: 309 | named "ShouldShowBannedUntil" ]]
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	return if p9 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p9 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p9 ~= promptTypeModule.VoiceChatSuspendedTemporaryToast then if p9 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p9 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
end

local _ = function(p10) --[[ line: 317 | named "ShouldShowSecondaryButton" ]]
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	local var52 = true
	
	if p10 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
			var52 = true
			
			if p10 ~= promptTypeModule.VoiceChatSuspendedTemporaryBV2 then
				var52 = if p10 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p10 == promptTypeModule.VoiceToxicityModalV2 else true
			end
		end
	end
	return var52
end

local voiceChatPromptFrame = roactModule.PureComponent:extend("VoiceChatPromptFrame")
voiceChatPromptFrame.validateProps = tModule.strictInterface({
	promptSignal = tModule.optional(tModule.RBXScriptSignal),
	errorText = tModule.optional(tModule.string),
	bannedUntil = tModule.optional(tModule.string),
	onContinueFunc = tModule.optional(tModule.callback),
	onPrimaryActivated = tModule.optional(tModule.callback),
	onSecondaryActivated = tModule.optional(tModule.callback),
	onReadyForSignal = tModule.optional(tModule.callback),
	Analytics = tModule.optional(tModule.table),
	VoiceChatServiceManager = tModule.optional(tModule.table),
	showNewContent = tModule.optional(tModule.boolean),
	showCheckbox = tModule.optional(tModule.boolean),
	showDataConsentToast = tModule.optional(tModule.boolean),
	policyMapper = tModule.optional(tModule.callback),
	appStyle = validateStyle,
	settingsAppAvailable = tModule.optional(tModule.boolean),
	UserInputService = tModule.optional(tModule.table),
	lastInput = tModule.optional(tModule.string)
})

function voiceChatPromptFrame.init(p11) --[[ line: 342 ]]
	-- upvalues: promptTypeModule (ref), getFFlagSupportGamepadNavInVoiceModals (ref), roactModule (ref), robloxTranslatorModule (ref), t (ref), t_1 (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), getFFlagUpdateVoiceConnectionToastsModule (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (ref), images (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), contextActionService (ref), voiceNudgeUseNewDACopyModule (ref), voiceChatOnlyReportVoiceBans (ref)
	p11.promptStyle = {
		Theme = p11.props.appStyle.Theme,
		Font = p11.props.appStyle.Font
	}
	p11.state = {
		toastContent = nil,
		banEnd = "",
		showPrompt = true,
		screenSize = Vector2.new(0, 0),
		promptType = promptTypeModule.None
	}
	p11.ref = if getFFlagSupportGamepadNavInVoiceModals() then roactModule.createRef() else nil
	
	if p11.props.showNewContent then
		local var53 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended")
		local var54 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2")
		t[promptTypeModule.VoiceChatSuspendedTemporary] = var53
		t[promptTypeModule.VoiceChatSuspendedPermanent] = var53
		t_1[promptTypeModule.VoiceChatSuspendedTemporary] = var54
	end
	function p11.onScreenSizeChanged(p12) --[[ line: 366 ]]
		-- upvalues: p11 (ref)
		if p11.state.screenSize ~= p12.AbsoluteSize then
			p11:setState({ screenSize = p12.AbsoluteSize })
		end
	end
	
	function p11.promptSignalCallback(p13) --[[ line: 374 ]]
		-- upvalues: promptTypeModule (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), p11 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), t (copy), t_1 (copy), getFFlagUpdateVoiceConnectionToastsModule (copy), getFFlagEnableVoiceTrustedConnectionsToastsModule (copy), images (copy), getFFlagEnableSeamlessVoiceDataConsentToastModule (copy), robloxTranslatorModule (copy), roactModule (copy)
		if if p13 ~= promptTypeModule.VoiceChatSuspendedPermanent then if p13 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p13 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p13 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p13 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true then
			if p11.props.Analytics then
				p11.props.Analytics:reportBanMessageEvent("Shown")
			end
			if p11.props.VoiceChatServiceManager then
				p11.props.VoiceChatServiceManager:reportBanMessage("Shown")
			end
		end
		if (if p13 ~= promptTypeModule.VoiceConsentModalV1 then if p13 ~= promptTypeModule.VoiceConsentModalV2 then p13 == promptTypeModule.VoiceConsentModalV3 else true else true) and p11.props.Analytics then
			p11.props.Analytics:reportInExpConsent("shown", p11.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else "")
		end
		if p13 == promptTypeModule.DevicePermissionsModal and p11.props.Analytics and p11.props.VoiceChatServiceManager then
			p11.props.Analytics:reportDevicePermissionsModalEvent("Shown", p11.props.VoiceChatServiceManager:GetSessionId(), p11.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData())
		end
		if p13 and p13 ~= promptTypeModule.None then
			local var55 = t[p13]
			local var56 = t_1[p13]
			
			if (if p13 ~= promptTypeModule.JoinVoice then if p13 ~= promptTypeModule.LeaveVoice then getFFlagUpdateVoiceConnectionToastsModule() and p13 == promptTypeModule.UnifiedJoinVoiceToast else true else true) and p11.props.VoiceChatServiceManager and p11.props.VoiceChatServiceManager:HasSeamlessVoiceFeature("HideJoinToastSubtitle") then
				var56 = nil
			end
			if typeof(var55) == "function" then
				var55 = var55(p11.props.bannedUntil)
			end
			if typeof(var56) == "function" then
				var56 = var56(p11.props.bannedUntil)
			end
			local var57, var58
			local _ = nil
			
			if getFFlagEnableVoiceTrustedConnectionsToastsModule() and p13 == promptTypeModule.UpdateOnAutoJoinToast then
				var58 = images["icons/controls/microphone"]
			else
				var57 = if p13 ~= promptTypeModule.VoiceConsentDeclinedToast then p13 == promptTypeModule.VoiceConsentAcceptedToast else true
				
				if var57 or p13 == promptTypeModule.JoinedVoiceToast or getFFlagUpdateVoiceConnectionToastsModule() and p13 == promptTypeModule.UnifiedJoinVoiceToast then
					var58 = images["icons/controls/publicAudioJoin"]
				else
					var57 = if p13 ~= promptTypeModule.JoinVoice then if p13 ~= promptTypeModule.LeaveVoice then getFFlagUpdateVoiceConnectionToastsModule() and p13 == promptTypeModule.UnifiedJoinVoiceToast else true else true
					var58 = if var57 then images["icons/actions/info"] elseif p13 == promptTypeModule.VoiceDataConsentOptOutToast and getFFlagEnableSeamlessVoiceDataConsentToastModule() then nil else images["icons/status/alert"]
				end
			end
			p11:setState({
				showPrompt = true,
				promptType = p13,
				toastContent = {
					iconImage = var58,
					toastTitle = var55,
					toastSubtitle = var56,
					onActivated = function() --[[ line: 452 ]]
						-- upvalues: p11 (copy)
						if p11.props.onPrimaryActivated then
							p11.props.onPrimaryActivated()
						end
					end,
					onDismissed = function() --[[ line: 457 ]] end
				}
			})
			var57 = if p13 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p13 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p13 ~= promptTypeModule.VoiceChatSuspendedTemporaryToast then if p13 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p13 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
			
			if not var57 then return end
			var57 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", { banDurationInMinutes = p11.props.bannedUntil })
			p11:setState({
				banEnd = if p13 == promptTypeModule.VoiceChatSuspendedTemporaryB then var57 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p13 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 then if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspensionV2", { banDurationInMinutes = p11.props.bannedUntil }) else nil else " " .. p11.props.bannedUntil .. "."
			})
			
			return
		else
			p11:setState({
				promptType = promptTypeModule.None,
				toastContent = roactModule.None
			})
		end
	end
	
	function p11.closeVoiceBanPrompt() --[[ line: 487 ]]
		-- upvalues: p11 (ref), contextActionService (copy), promptTypeModule (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), voiceChatOnlyReportVoiceBans (copy)
		p11:setState({ showPrompt = false })
		
		if p11.props.onContinueFunc then
			p11.props.onContinueFunc()
		end
		contextActionService:UnbindCoreAction("CloseVoiceBanPrompt")
		local var59 = p11.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryB
		local var60 = getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (voiceNudgeUseNewDACopyModule() and p11.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2)
		
		if voiceChatOnlyReportVoiceBans then
			local promptType = p11.state.promptType
			
			if (if promptType ~= promptTypeModule.VoiceChatSuspendedPermanent then if promptType ~= promptTypeModule.VoiceChatSuspendedTemporary then if promptType ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if promptType ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true) and not var59 and not var60 then
				if p11.props.Analytics then
					p11.props.Analytics:reportBanMessageEvent("Acknowledged")
				end
				if p11.props.VoiceChatServiceManager then
					p11.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
					
					return
				end
			end
		elseif not var59 and not var60 then
			if p11.props.Analytics then
				p11.props.Analytics:reportBanMessageEvent("Acknowledged")
			end
			if p11.props.VoiceChatServiceManager then
				p11.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
			end
		end
	end
	
	function p11.checkInputStateForClosePrompt(_, p14, _) --[[ line: 522 ]]
		-- upvalues: p11 (ref)
		if p14 == Enum.UserInputState.Begin then
			p11.closeVoiceBanPrompt()
		end
	end
	
	function p11.handlePrimayActivated() --[[ line: 528 ]]
		-- upvalues: p11 (ref)
		p11.closeVoiceBanPrompt()
		
		if p11.props.onPrimaryActivated then
			p11.props.onPrimaryActivated()
		end
	end
	
	function p11.handleSecondaryActivated() --[[ line: 535 ]]
		-- upvalues: p11 (ref)
		p11.closeVoiceBanPrompt()
		
		if p11.props.onSecondaryActivated then
			p11.props.onSecondaryActivated()
		end
	end
end

function voiceChatPromptFrame.render(p15) --[[ line: 543 ]]
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagShowDevicePermissionsModal (ref), textService (ref), var41 (ref), var45 (ref), var47 (ref), var40 (ref), getFFlagSupportGamepadNavInVoiceModals (ref), voiceNudgeUseNewConfirmButton (ref), roactModule (ref), var46 (ref), var43 (ref), var42 (ref), color_1 (ref), color (ref), button (ref), buttonType (ref), UIBloxModule (ref), assetsModule (ref), var48 (ref), var44 (ref), devicePermissionsModalModule (ref), t (ref), t_1 (ref), userInputService (ref), voiceChatConsentModalModule (ref), coreGuiService (ref), voiceChatTooltipModule (ref), getFIntVoiceToxicityToastDurationSecondsModule (ref), getFIntVoiceJoinM3ToastDurationSecondsModule (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), toast (ref), externalEventConnection (ref)
	local var61 = if getFFlagEnableVoicePromptReasonTextModule() then p15.props.errorText else nil
	local promptType = p15.state.promptType
	local var62 = if promptType ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType == promptTypeModule.VoiceToxicityModalV2 else true
	local var63 = if p15.state.promptType ~= promptTypeModule.VoiceToxicityToast then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p15.state.promptType == promptTypeModule.VoiceToxicityToastV2 else true
	local var64 = p15.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryB
	local var65 = getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (voiceNudgeUseNewDACopyModule() and p15.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2)
	local var66 = getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (voiceNudgeUseNewDACopyModule() and (if p15.state.promptType ~= promptTypeModule.VoiceToxicityModalV2 then p15.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true))
	local promptType_1 = p15.state.promptType
	local var67 = if promptType_1 ~= promptTypeModule.VoiceConsentModalV1 then if promptType_1 ~= promptTypeModule.VoiceConsentModalV2 then promptType_1 == promptTypeModule.VoiceConsentModalV3 else true else true
	local var68 = getFFlagShowDevicePermissionsModal() and p15.state.promptType == promptTypeModule.DevicePermissionsModal
	local y = Enum.AutomaticSize.Y
	local _ = nil
	local promptType_2 = p15.state.promptType
	local var69 = if promptType_2 ~= promptTypeModule.VoiceChatSuspendedPermanent then if promptType_2 ~= promptTypeModule.VoiceChatSuspendedTemporary then if promptType_2 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if promptType_2 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType_2 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
	
	if not var69 then
		var69 = if promptType_2 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType_2 == promptTypeModule.VoiceToxicityModalV2 else true
		
		if not var69 then
			var69 = if promptType_2 ~= promptTypeModule.VoiceConsentModalV1 then if promptType_2 ~= promptTypeModule.VoiceConsentModalV2 then promptType_2 == promptTypeModule.VoiceConsentModalV3 else true else true
			var69 = var69 or promptType_2 == promptTypeModule.DevicePermissionsModal
		end
	end
	if var69 then
		local toastTitle = p15.state.toastContent.toastTitle
		local var70 = 20 + textService:GetTextSize(toastTitle, p15.promptStyle.Font.Header1.RelativeSize * p15.promptStyle.Font.BaseSize, p15.promptStyle.Font.Header1.Font, Vector2.new(325, 1e999)).Y
		local var61_1 = var61 or (if p15.state.banEnd ~= "" then p15.state.toastContent.toastSubtitle .. p15.state.banEnd else "<b>" .. (if var64 or getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var65 then p15.state.banEnd else var41 .. p15.state.banEnd) .. "</b><br />" .. p15.state.toastContent.toastSubtitle)
		local font = p15.promptStyle.Font.Body.Font
		local var72 = p15.promptStyle.Font.Body.RelativeSize * p15.promptStyle.Font.BaseSize
		local var73 = 20 + textService:GetTextSize(var61_1, var72, font, Vector2.new(325, 1e999)).Y
		
		if var64 or var65 then
			var73 += 20
		end
		local var74 = if var64 then var45 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var65 then var47 else var40
		local var75 = 20 + textService:GetTextSize(var74, var72, font, Vector2.new(325, 1e999)).Y
		local promptType_3 = p15.state.promptType
		local var76 = true
		
		if promptType_3 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then
			if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
				var76 = true
				
				if promptType_3 ~= promptTypeModule.VoiceChatSuspendedTemporaryBV2 then
					var76 = if promptType_3 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType_3 == promptTypeModule.VoiceToxicityModalV2 else true
				end
			end
		end
		local var77 = if getFFlagSupportGamepadNavInVoiceModals() then Enum.SelectionBehavior.Stop else nil
		local var78 = if getFFlagSupportGamepadNavInVoiceModals() then true else nil
		local _ = nil
		
		return roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
			InGameMenuInformationalDialog = if var67 then roactModule.createElement(voiceChatConsentModalModule, {
				titleText = t[p15.state.promptType],
				bodyText = t_1[p15.state.promptType],
				handlePrimaryActivated = p15.handlePrimayActivated,
				handleSecondaryActivated = p15.handleSecondaryActivated,
				Analytics = p15.props.Analytics,
				showCheckbox = p15.props.showCheckbox,
				promptStyle = p15.promptStyle,
				showPrompt = p15.state.showPrompt,
				ref = if getFFlagSupportGamepadNavInVoiceModals() then p15.ref else nil
			}) elseif var68 then roactModule.createElement(devicePermissionsModalModule, {
				titleText = t[p15.state.promptType],
				bodyText = t_1[p15.state.promptType],
				handlePrimaryActivated = p15.handlePrimayActivated,
				handleSecondaryActivated = p15.handleSecondaryActivated,
				Analytics = p15.props.Analytics,
				promptStyle = p15.promptStyle,
				showPrompt = p15.state.showPrompt,
				settingsAppAvailable = p15.props.settingsAppAvailable,
				UserInputService = if p15.props.UserInputService ~= nil then userInputService else p15.props.UserInputService,
				ref = if getFFlagSupportGamepadNavInVoiceModals() then p15.ref else nil
			}) else roactModule.createElement("ScreenGui", {
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				Enabled = p15.state.showPrompt,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = roactModule.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					BackgroundColor3 = p15.promptStyle.Theme.Overlay.Color,
					BackgroundTransparency = p15.promptStyle.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = roactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p15.promptStyle.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p15.promptStyle.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 365, 0, 55 + var70 + 1 + var73 + 14 + var75 + 36 + 40),
					AutomaticSize = y,
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
					SelectionBehaviorDown = var77,
					SelectionBehaviorLeft = var77,
					SelectionBehaviorRight = var77,
					SelectionBehaviorUp = var77,
					SelectionGroup = var78,
					ref = if getFFlagSupportGamepadNavInVoiceModals() then p15.ref else nil
				}, {
					Padding = roactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20)
					}),
					Layout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Icon = roactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = p15.state.toastContent.iconImage,
						Size = UDim2.new(0, 55, 0, 55)
					}),
					TitleTextContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, var70),
						AutomaticSize = y
					}, {
						TitleText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
							fontStyle = p15.promptStyle.Font.Header1,
							colorStyle = p15.promptStyle.Theme.SystemPrimaryDefault,
							textXAlignment = Enum.TextXAlignment.Center,
							size = UDim2.new(1, 0, 1, 0),
							text = toastTitle
						})
					}),
					Divider = roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						BackgroundColor3 = p15.promptStyle.Theme.Divider.Color,
						BackgroundTransparency = p15.promptStyle.Theme.Divider.Transparency,
						Size = UDim2.new(0.8, 0, 0, 1)
					}),
					DividerSpaceContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 7)
					}),
					BodyTextContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, var73)
					}, {
						BodyText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
							fontStyle = p15.promptStyle.Font.Body,
							colorStyle = p15.promptStyle.Theme.TextDefault,
							textXAlignment = Enum.TextXAlignment.Center,
							size = UDim2.new(1, 0, 1, 0),
							text = var61_1
						})
					}),
					TextSpaceContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 6,
						Size = UDim2.new(1, 0, 0, 7)
					}),
					SubBodyTextContainer = not var62 and roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 7,
						Size = UDim2.new(1, 0, 0, var75),
						AutomaticSize = y
					}, {
						BodyText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
							fontStyle = p15.promptStyle.Font.Body,
							colorStyle = p15.promptStyle.Theme.TextDefault,
							textXAlignment = Enum.TextXAlignment.Center,
							size = UDim2.new(1, 0, 1, 0),
							text = var74
						})
					}),
					SpaceContainer2 = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 8,
						Size = UDim2.new(1, 0, 0, 10)
					}),
					ButtonContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 9,
						Size = UDim2.new(1, 0, 0, 36),
						AutomaticSize = y
					}, {
						Layout = roactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 20),
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						ConfirmButton = if voiceNudgeUseNewConfirmButton then roactModule.createElement("TextButton", {
							Size = UDim2.new(1, -5, 0, 48),
							LayoutOrder = 1,
							Text = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() and var65 then var46 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var62 and (voiceNudgeUseNewDACopyModule() and p15.state.promptType == promptTypeModule.VoiceToxicityModalV2) then var46 elseif var62 then var43 else var42,
							[roactModule.Event.Activated] = p15.handlePrimayActivated,
							[roactModule.Event.MouseEnter] = function(p16) --[[ line: 611 ]]
								-- upvalues: color_1 (copy)
								p16.BackgroundColor3 = color_1
							end,
							[roactModule.Event.MouseLeave] = function(p17) --[[ line: 614 ]]
								-- upvalues: color (copy)
								p17.BackgroundColor3 = color
							end,
							Selectable = var78,
							BackgroundColor3 = color,
							BackgroundTransparency = 0,
							TextColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							AutoButtonColor = false,
							Font = Enum.Font.BuilderSansBold,
							TextSize = 20
						}, {
							Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
						}) else roactModule.createElement(button, {
							layoutOrder = 1,
							buttonType = buttonType.PrimarySystem,
							size = UDim2.new(1, -5, 0, 48),
							text = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() and var65 then var46 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var62 and (voiceNudgeUseNewDACopyModule() and p15.state.promptType == promptTypeModule.VoiceToxicityModalV2) then var46 elseif var62 then var43 else var42,
							onActivated = p15.handlePrimayActivated,
							Selectable = var78
						}),
						SecondaryButton = var76 and roactModule.createElement(UIBloxModule.App.Button.LinkButton, {
							colorStyleDefault = "TextMuted",
							colorStyleHover = "TextMuted",
							layoutOrder = if voiceNudgeUseNewConfirmButton then 2 else 1,
							size = UDim2.new(1, -5, 0, 36),
							text = if var66 then var48 else var44,
							onActivated = p15.handleSecondaryActivated
						})
					})
				})
			})
		})
	else
		return if p15.state.promptType == promptTypeModule.JoinVoiceSTUX then roactModule.createElement(voiceChatTooltipModule, {
			titleText = t[p15.state.promptType],
			subtitleText = t_1[p15.state.promptType],
			promptStyle = p15.promptStyle,
			showPrompt = p15.state.showPrompt,
			onClose = function() --[[ line: 846 ]]
				-- upvalues: p15 (ref)
				p15:setState({ showPrompt = false })
			end,
			onMenuOpen = p15.hideOnMenuOpen
		}) else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[roactModule.Change.AbsoluteSize] = p15.onScreenSizeChanged
		}, {
			Toast = p15.state.promptType ~= promptTypeModule.None and roactModule.createElement(toast, {
				duration = if var63 then getFIntVoiceToxicityToastDurationSecondsModule() elseif var63 then getFIntVoiceToxicityToastDurationSecondsModule() elseif p15.state.promptType == promptTypeModule.JoinedVoiceToast then getFIntVoiceJoinM3ToastDurationSecondsModule() else 3,
				toastContent = p15.state.toastContent,
				show = if p15.state.promptType == promptTypeModule.VoiceDataConsentOptOutToast and getFFlagEnableSeamlessVoiceDataConsentToastModule() then if p15.props.showDataConsentToast then p15.props.showDataConsentToast else false else p15.state.showPrompt
			}),
			EventConnection = p15.props.promptSignal and roactModule.createElement(externalEventConnection, {
				event = p15.props.promptSignal,
				callback = p15.promptSignalCallback
			})
		})
	end
end

function voiceChatPromptFrame.didUpdate(p18) --[[ line: 890 ]]
	-- upvalues: getFFlagSupportGamepadNavInVoiceModals (ref), responsiveModule (ref), guiService (ref)
	if getFFlagSupportGamepadNavInVoiceModals() then
		if p18.props.lastInput == responsiveModule.Input.Directional then
			local value = p18.ref:getValue()
			
			if p18.state.showPrompt and value then
				guiService:Select(value)
			end
			if p18.state.showPrompt or not value then
				return
			else
				guiService.SelectedCoreObject = nil
				
				return
			end
		elseif guiService.SelectedCoreObject then
			guiService.SelectedCoreObject = nil
		end
	end
end

function voiceChatPromptFrame.didMount(p19) --[[ line: 922 ]]
	-- upvalues: contextActionService (ref)
	if p19.props.onReadyForSignal then
		p19.props.onReadyForSignal()
	end
	contextActionService:BindCoreAction("CloseVoiceBanPrompt", p19.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("CloseVoiceBanPrompt", p19.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB)
end

voiceChatPromptFrame = inGameMenuPolicyModule.connect(function(p20, _) --[[ line: 940 ]]
	return {
		showNewContent = p20.getGameInfoShowChatFeatures(),
		showCheckbox = p20.getDisplayCheckboxInVoiceConsent(),
		showDataConsentToast = if p20.getDisplayCheckboxInVoiceConsent() == nil then false else p20.getDisplayCheckboxInVoiceConsent()
	}
end)(voiceChatPromptFrame)

local function WrappedVoiceChatPromptFrame(p21) --[[ line: 950 ]]
	-- upvalues: useStyle (ref), getFFlagSupportGamepadNavInVoiceModals (ref), useLastInput (ref), roactModule (ref), voiceChatPromptFrame (write), cryoModule (ref)
	return roactModule.createElement(voiceChatPromptFrame, cryoModule.Dictionary.join(p21, {
		appStyle = useStyle(),
		lastInput = if getFFlagSupportGamepadNavInVoiceModals() then if getFFlagSupportGamepadNavInVoiceModals() then useLastInput() else nil else nil
	}))
end

return function(p22) --[[ line: 961 ]]
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), WrappedVoiceChatPromptFrame (ref)
	return renderWithCoreScriptsStyleProviderModule({
		roactModule.createElement(WrappedVoiceChatPromptFrame, p22)
	})
end