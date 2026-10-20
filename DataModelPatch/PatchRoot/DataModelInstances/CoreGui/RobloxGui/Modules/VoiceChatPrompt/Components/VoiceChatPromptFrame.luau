local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local ContextActionService = game:GetService("ContextActionService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Toast = UIBloxModule.App.Dialog.Toast
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ValidateStyle = UIBloxModule.Style.Validator.validateStyle
local PromptTypeModule = require(script.Parent.Parent.PromptType)
local InGameMenuPolicyModule = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy)
local VoiceChatConsentModalModule = require(script.Parent.VoiceChatConsentModal)
local VoiceChatTooltipModule = require(script.Parent.VoiceChatTooltip)
local DevicePermissionsModalModule = require(script.Parent.DevicePermissionsModal)
local AssetsModule = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local _ = require(CorePackages.Workspace.Packages.VoiceChatCore)
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local GetFFlagEnableVoicePromptReasonTextModule = require(RobloxGui.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local GetFFlagSupportGamepadNavInVoiceModalsFunction = require(CorePackages.Workspace.Packages.VoiceChat).Flags.GetFFlagSupportGamepadNavInVoiceModals
local GetFIntVoiceToxicityToastDurationSecondsModule = require(RobloxGui.Modules.Flags.GetFIntVoiceToxicityToastDurationSeconds)
local VoiceChatOnlyReportVoiceBans = game:DefineFastFlag("VoiceChatOnlyReportVoiceBans", false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local GetFFlagShowDevicePermissionsModalFunction = SharedFlagsModule.GetFFlagShowDevicePermissionsModal
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFIntVoiceJoinM3ToastDurationSecondsModule = require(RobloxGui.Modules.Flags.GetFIntVoiceJoinM3ToastDurationSeconds)
local GetFFlagEnableSeamlessVoiceDataConsentToastModule = require(RobloxGui.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local GetFFlagUpdateVoiceConnectionToastsModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagUpdateVoiceConnectionToasts)
local GetFFlagEnableVoiceTrustedConnectionsToastsModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts)
local GetFFlagVoiceConnectToastCapturesTrustedFriendsSubtitleModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceConnectToastCapturesTrustedFriendsSubtitle)
local GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local VoiceNudgeUseNewDACopyModule = require(script.Parent.Parent.Parent.VoiceChat.Helpers.VoiceNudgeUseNewDACopy)
local VoiceNudgeUseNewConfirmButton = game:DefineFastFlag("VoiceNudgeUseNewConfirmButton", false)
local FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local _Color3 = Color3.fromRGB(255, 255, 255)
local _Color3_1 = Color3.fromRGB(220, 220, 220)
local _ = RoactModule.PureComponent:extend("VoiceChatPromptFrame")
local config = {
	[PromptTypeModule.None] = "",
	[PromptTypeModule.NotAudible] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"),
	[PromptTypeModule.NotAudibleVoiceChatVolume] = if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule then NewResult:Format("Feature.SettingsHub.Prompt.NotAudible") else nil,
	[PromptTypeModule.Permission] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"),
	[PromptTypeModule.Retry] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicrophonePermission"),
	[PromptTypeModule.Place] = "Exceeds Max Players",
	[PromptTypeModule.User] = "Not Eligible for Voice",
	[PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicAndCameraUseSuspended"),
	[PromptTypeModule.VoiceChatSuspendedTemporary] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"),
	[PromptTypeModule.VoiceChatSuspendedTemporaryB] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"),
	[PromptTypeModule.VoiceChatSuspendedPermanent] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspended"),
	[PromptTypeModule.VoiceLoading] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Connecting"),
	[PromptTypeModule.VoiceToxicityModal] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"),
	[PromptTypeModule.VoiceToxicityToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRules"),
	[PromptTypeModule.VoiceToxicityFeedbackToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.ThankYouForFeedback"),
	[PromptTypeModule.VoiceChatSuspendedTemporaryToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended"),
	[PromptTypeModule.VoiceConsentDeclinedToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.ChangeYourMind"),
	[PromptTypeModule.VoiceConsentAcceptedToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"),
	[PromptTypeModule.VoiceConsentModalV1] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"),
	[PromptTypeModule.VoiceConsentModalV2] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatWithOthers"),
	[PromptTypeModule.VoiceConsentModalV3] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GetVoiceChat"),
	[PromptTypeModule.JoinedVoiceToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"),
	[PromptTypeModule.JoinVoiceSTUX] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChat"),
	[PromptTypeModule.LeaveVoice] = if GetFFlagUpdateVoiceConnectionToastsModule() then NewResult:Format("Feature.SettingsHub.Prompt.LeaveVoiceChatV2") else RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.LeaveVoiceChat"),
	[PromptTypeModule.JoinVoice] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2"),
	[PromptTypeModule.DevicePermissionsModal] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess"),
	[PromptTypeModule.VoiceDataConsentOptOutToast] = if GetFFlagEnableSeamlessVoiceDataConsentToastModule() then NewResult:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat") else nil,
	[PromptTypeModule.UnifiedJoinVoiceToast] = if GetFFlagUpdateVoiceConnectionToastsModule() then NewResult:Format("Feature.SettingsHub.Prompt.JoinedVoiceChatV3") else nil,
	[PromptTypeModule.AgeCheckForVoiceToast] = NewResult:Format("Feature.SettingsHub.Prompt.Title.AgeCheckForVoiceToast"),
	[PromptTypeModule.UpdateOnAutoJoinToast] = if GetFFlagEnableVoiceTrustedConnectionsToastsModule() then NewResult:Format("Feature.SettingsHub.Prompt.UpdateToVoiceChat") else nil,
	[PromptTypeModule.VoiceChatSuspendedTemporaryBV2] = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspendedV2") else nil,
	[PromptTypeModule.VoiceToxicityModalV2] = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat") else nil,
	[PromptTypeModule.VoiceToxicityToastV2] = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat") else nil
}
local FeatureSettingsHubPromptSubtitleTalkInAgeGroupTrustedFriends: string = if FFlagConnectionsToFriendsRename then "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedFriends" else "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedConnections"
local FeatureSettingsHubPromptSubtitleTalkAgeGroupTrustedFriendsUpdate: string = if FFlagConnectionsToFriendsRename then "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedFriendsUpdate" else "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedConnectionsUpdate"
local config1 = {
	[PromptTypeModule.None] = "",
	[PromptTypeModule.NotAudible] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"),
	[PromptTypeModule.NotAudibleVoiceChatVolume] = if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule then NewResult:Format("Feature.SettingsHub.Prompt.Subtitle.NotAudibleVoiceChatVolume") else nil,
	[PromptTypeModule.Permission] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicrophonePermission"),
	[PromptTypeModule.Retry] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Retry"),
	[PromptTypeModule.Place] = "Spatial voice is only available for places with Max Players of 30 or less.",
	[PromptTypeModule.User] = "This account is not eligible to use Spatial Voice.",
	[PromptTypeModule.VoiceChatSuspendedTemporary] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Microphone"),
	[PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MicAndCamera"),
	[PromptTypeModule.VoiceChatSuspendedTemporaryB] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1"),
	[PromptTypeModule.VoiceChatSuspendedPermanent] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Revoked"),
	[PromptTypeModule.VoiceLoading] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Connecting"),
	[PromptTypeModule.VoiceToxicityModal] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModal"),
	[PromptTypeModule.VoiceToxicityToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToast"),
	[PromptTypeModule.VoiceToxicityFeedbackToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.ThanksForLettingUsKnow"),
	[PromptTypeModule.VoiceChatSuspendedTemporaryToast] = function(p1)
		-- upvalues: RobloxTranslatorModule (copy)
		return RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", { dateTime = p1 })
	end,
	[PromptTypeModule.VoiceConsentDeclinedToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"),
	[PromptTypeModule.VoiceConsentAcceptedToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"),
	[PromptTypeModule.VoiceConsentModalV1] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"),
	[PromptTypeModule.VoiceConsentModalV2] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"),
	[PromptTypeModule.VoiceConsentModalV3] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"),
	[PromptTypeModule.JoinedVoiceToast] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute"),
	[PromptTypeModule.JoinVoiceSTUX] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere"),
	[PromptTypeModule.DevicePermissionsModal] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess"),
	[PromptTypeModule.VoiceDataConsentOptOutToast] = if GetFFlagEnableSeamlessVoiceDataConsentToastModule() then NewResult:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData") else nil,
	[PromptTypeModule.UnifiedJoinVoiceToast] = if GetFFlagVoiceConnectToastCapturesTrustedFriendsSubtitleModule then RobloxTranslatorModule:FormatByKey("Feature.Captures.Prompt.Subtitle.VoiceChatRecordingTrustedFriendsAgeGroup") elseif GetFFlagEnableVoiceTrustedConnectionsToastsModule() then NewResult:Format(FeatureSettingsHubPromptSubtitleTalkInAgeGroupTrustedFriends) elseif GetFFlagUpdateVoiceConnectionToastsModule() then NewResult:Format("Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupV2") else nil,
	[PromptTypeModule.AgeCheckForVoiceToast] = NewResult:Format("Feature.SettingsHub.Prompt.Subtitle.GoToAccountInfo"),
	[PromptTypeModule.UpdateOnAutoJoinToast] = if GetFFlagEnableVoiceTrustedConnectionsToastsModule() then NewResult:Format(FeatureSettingsHubPromptSubtitleTalkAgeGroupTrustedFriendsUpdate) else nil,
	[PromptTypeModule.VoiceChatSuspendedTemporaryBV2] = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan1V2") else nil,
	[PromptTypeModule.VoiceToxicityModalV2] = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityModalV2") else nil,
	[PromptTypeModule.VoiceToxicityToastV2] = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.VoiceToxicityToastV2") else nil
}

if game:GetService("RunService"):IsStudio() then
	config[PromptTypeModule.Place] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Place")
	config[PromptTypeModule.User] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.User")
	config1[PromptTypeModule.Place] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Place")
	config1[PromptTypeModule.User] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.User")
end
local _ = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.Respect")
local FeatureSettingsHubPromptSubtitleFutureViolations = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations")
local FeatureSettingsHubPromptSubtitleEffectiveUntil = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil")
local FeatureSettingsHubPromptUnderstand = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Understand")
local FeatureSettingsHubPromptGotIt = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GotIt")
local FeatureSettingsHubPromptIncorrectNudge = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge")
local FeatureSettingsHubPromptSubtitleTemporaryVoiceBan2 = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2")
local FeatureSettingsHubActionOk = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Ok") else nil
local FeatureSettingsHubPromptSubtitleTemporaryVoiceBan2V2 = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2V2") else nil
local FeatureSettingsHubPromptIncorrectNudgeV2 = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudgeV2") else nil

local function _(VoiceChatSuspendedPermanent): boolean
	-- upvalues: PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy)
	return VoiceChatSuspendedPermanent == PromptTypeModule.VoiceChatSuspendedPermanent or (VoiceChatSuspendedPermanent == PromptTypeModule.VoiceChatSuspendedTemporary or (VoiceChatSuspendedPermanent == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (VoiceChatSuspendedPermanent == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceChatSuspendedPermanent == PromptTypeModule.VoiceChatSuspendedTemporaryBV2)))
end

local _ = function(VoiceToxicityModal): boolean
	-- upvalues: PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy)
	return VoiceToxicityModal == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceToxicityModal == PromptTypeModule.VoiceToxicityModalV2
end

local _ = function(VoiceConsentModalV): boolean
	-- upvalues: PromptTypeModule (copy)
	return VoiceConsentModalV == PromptTypeModule.VoiceConsentModalV1 or (VoiceConsentModalV == PromptTypeModule.VoiceConsentModalV2 or VoiceConsentModalV == PromptTypeModule.VoiceConsentModalV3)
end

local _ = function(DevicePermissionsModal): boolean
	-- upvalues: PromptTypeModule (copy)
	return DevicePermissionsModal == PromptTypeModule.DevicePermissionsModal
end

local _ = function(VoiceConsentModalV): boolean
	-- upvalues: PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy)
	return VoiceConsentModalV == PromptTypeModule.VoiceChatSuspendedPermanent or (VoiceConsentModalV == PromptTypeModule.VoiceChatSuspendedTemporary or (VoiceConsentModalV == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (VoiceConsentModalV == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceConsentModalV == PromptTypeModule.VoiceChatSuspendedTemporaryBV2))) or (VoiceConsentModalV == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceConsentModalV == PromptTypeModule.VoiceToxicityModalV2 or (VoiceConsentModalV == PromptTypeModule.VoiceConsentModalV1 or (VoiceConsentModalV == PromptTypeModule.VoiceConsentModalV2 or VoiceConsentModalV == PromptTypeModule.VoiceConsentModalV3) or VoiceConsentModalV == PromptTypeModule.DevicePermissionsModal))
end

local _ = function(VoiceConsentAcceptedToast): boolean
	-- upvalues: PromptTypeModule (copy)
	return VoiceConsentAcceptedToast == PromptTypeModule.VoiceConsentDeclinedToast or VoiceConsentAcceptedToast == PromptTypeModule.VoiceConsentAcceptedToast
end

local _ = function(VoiceDataConsentOptOutToast): boolean
	-- upvalues: PromptTypeModule (copy)
	return VoiceDataConsentOptOutToast == PromptTypeModule.VoiceDataConsentOptOutToast
end

local _ = function(JoinVoice): boolean
	-- upvalues: PromptTypeModule (copy), GetFFlagUpdateVoiceConnectionToastsModule (copy)
	return JoinVoice == PromptTypeModule.JoinVoice or (JoinVoice == PromptTypeModule.LeaveVoice or GetFFlagUpdateVoiceConnectionToastsModule() and JoinVoice == PromptTypeModule.UnifiedJoinVoiceToast)
end

local _ = function(VoiceChatSuspendedTemporary): boolean
	-- upvalues: PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy)
	return VoiceChatSuspendedTemporary == PromptTypeModule.VoiceChatSuspendedTemporary or (VoiceChatSuspendedTemporary == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (VoiceChatSuspendedTemporary == PromptTypeModule.VoiceChatSuspendedTemporaryToast or (VoiceChatSuspendedTemporary == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceChatSuspendedTemporary == PromptTypeModule.VoiceChatSuspendedTemporaryBV2)))
end

local _ = function(VoiceChatSuspendedTemporaryB): boolean
	-- upvalues: PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy)
	return VoiceChatSuspendedTemporaryB == PromptTypeModule.VoiceChatSuspendedTemporaryB or (GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceChatSuspendedTemporaryB == PromptTypeModule.VoiceChatSuspendedTemporaryBV2 or (VoiceChatSuspendedTemporaryB == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceChatSuspendedTemporaryB == PromptTypeModule.VoiceToxicityModalV2))
end

local VoiceChatPromptFrame = RoactModule.PureComponent:extend("VoiceChatPromptFrame")
VoiceChatPromptFrame.validateProps = TModule.strictInterface({
	promptSignal = TModule.optional(TModule.RBXScriptSignal),
	errorText = TModule.optional(TModule.string),
	bannedUntil = TModule.optional(TModule.string),
	onContinueFunc = TModule.optional(TModule.callback),
	onPrimaryActivated = TModule.optional(TModule.callback),
	onSecondaryActivated = TModule.optional(TModule.callback),
	onReadyForSignal = TModule.optional(TModule.callback),
	Analytics = TModule.optional(TModule.table),
	VoiceChatServiceManager = TModule.optional(TModule.table),
	showNewContent = TModule.optional(TModule.boolean),
	showCheckbox = TModule.optional(TModule.boolean),
	showDataConsentToast = TModule.optional(TModule.boolean),
	policyMapper = TModule.optional(TModule.callback),
	appStyle = ValidateStyle,
	settingsAppAvailable = TModule.optional(TModule.boolean),
	UserInputService = TModule.optional(TModule.table),
	lastInput = TModule.optional(TModule.string)
})

function VoiceChatPromptFrame.init(p1)
	-- upvalues: PromptTypeModule (copy), GetFFlagSupportGamepadNavInVoiceModalsFunction (copy), RoactModule (copy), RobloxTranslatorModule (copy), config (copy), config1 (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), GetFFlagUpdateVoiceConnectionToastsModule (copy), GetFFlagEnableVoiceTrustedConnectionsToastsModule (copy), Images (copy), GetFFlagEnableSeamlessVoiceDataConsentToastModule (copy), ContextActionService (copy), VoiceNudgeUseNewDACopyModule (copy), VoiceChatOnlyReportVoiceBans (copy)
	p1.promptStyle = {
		Theme = p1.props.appStyle.Theme,
		Font = p1.props.appStyle.Font
	}
	p1.state = {
		toastContent = nil,
		banEnd = "",
		showPrompt = true,
		screenSize = Vector2.new(0, 0),
		promptType = PromptTypeModule.None
	}
	p1.ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then RoactModule.createRef() else nil
	
	if p1.props.showNewContent then
		local FeatureSettingsHubPromptMicUseSuspended = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended")
		config[PromptTypeModule.VoiceChatSuspendedTemporary] = FeatureSettingsHubPromptMicUseSuspended
		config[PromptTypeModule.VoiceChatSuspendedPermanent] = FeatureSettingsHubPromptMicUseSuspended
		config1[PromptTypeModule.VoiceChatSuspendedTemporary] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2")
	end
	function p1.onScreenSizeChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	function p1.promptSignalCallback(UnifiedJoinVoiceToast)
		-- upvalues: PromptTypeModule (upval), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (upval), p1 (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval), config (upval), config1 (upval), GetFFlagUpdateVoiceConnectionToastsModule (upval), GetFFlagEnableVoiceTrustedConnectionsToastsModule (upval), Images (upval), GetFFlagEnableSeamlessVoiceDataConsentToastModule (upval), RobloxTranslatorModule (upval), RoactModule (upval)
		if UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedPermanent or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporary or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryBV2))) then
			if p1.props.Analytics then
				p1.props.Analytics:reportBanMessageEvent("Shown")
			end
			if p1.props.VoiceChatServiceManager then
				p1.props.VoiceChatServiceManager:reportBanMessage("Shown")
			end
		end
		if (UnifiedJoinVoiceToast == PromptTypeModule.VoiceConsentModalV1 or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceConsentModalV2 or UnifiedJoinVoiceToast == PromptTypeModule.VoiceConsentModalV3)) and p1.props.Analytics then
			p1.props.Analytics:reportInExpConsent("shown", p1.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else "")
		end
		if UnifiedJoinVoiceToast == PromptTypeModule.DevicePermissionsModal and p1.props.Analytics and p1.props.VoiceChatServiceManager then
			p1.props.Analytics:reportDevicePermissionsModalEvent("Shown", p1.props.VoiceChatServiceManager:GetSessionId(), p1.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData())
		end
		if UnifiedJoinVoiceToast and UnifiedJoinVoiceToast ~= PromptTypeModule.None then
			local Entry = config[UnifiedJoinVoiceToast]
			local Entry1 = if (UnifiedJoinVoiceToast == PromptTypeModule.JoinVoice or (UnifiedJoinVoiceToast == PromptTypeModule.LeaveVoice or GetFFlagUpdateVoiceConnectionToastsModule() and UnifiedJoinVoiceToast == PromptTypeModule.UnifiedJoinVoiceToast)) and p1.props.VoiceChatServiceManager and p1.props.VoiceChatServiceManager:HasSeamlessVoiceFeature("HideJoinToastSubtitle") then nil else config1[UnifiedJoinVoiceToast]
			
			if typeof(Entry) == "function" then
				Entry = Entry(p1.props.bannedUntil)
			end
			if typeof(Entry1) == "function" then
				Entry1 = Entry1(p1.props.bannedUntil)
			end
			local IconsControlsMicrophone = nil
			if GetFFlagEnableVoiceTrustedConnectionsToastsModule() and UnifiedJoinVoiceToast == PromptTypeModule.UpdateOnAutoJoinToast then
				IconsControlsMicrophone = Images["icons/controls/microphone"]
			elseif UnifiedJoinVoiceToast == PromptTypeModule.VoiceConsentDeclinedToast or UnifiedJoinVoiceToast == PromptTypeModule.VoiceConsentAcceptedToast or UnifiedJoinVoiceToast == PromptTypeModule.JoinedVoiceToast or GetFFlagUpdateVoiceConnectionToastsModule() and UnifiedJoinVoiceToast == PromptTypeModule.UnifiedJoinVoiceToast then
				IconsControlsMicrophone = Images["icons/controls/publicAudioJoin"]
			else
				local IsUnifiedJoinVoiceToastMatch: boolean = UnifiedJoinVoiceToast == PromptTypeModule.JoinVoice or (UnifiedJoinVoiceToast == PromptTypeModule.LeaveVoice or GetFFlagUpdateVoiceConnectionToastsModule() and UnifiedJoinVoiceToast == PromptTypeModule.UnifiedJoinVoiceToast)
				IconsControlsMicrophone = if IsUnifiedJoinVoiceToastMatch then Images["icons/actions/info"] elseif UnifiedJoinVoiceToast == PromptTypeModule.VoiceDataConsentOptOutToast and GetFFlagEnableSeamlessVoiceDataConsentToastModule() then nil else Images["icons/status/alert"]
			end
			p1:setState({
				showPrompt = true,
				promptType = UnifiedJoinVoiceToast,
				toastContent = {
					iconImage = IconsControlsMicrophone,
					toastTitle = Entry,
					toastSubtitle = Entry1,
					onActivated = function()
						-- upvalues: p1 (upval)
						if p1.props.onPrimaryActivated then
							p1.props.onPrimaryActivated()
						end
					end,
					onDismissed = function() end
				}
			})
			
			if UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporary or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryToast or (UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryBV2))) then
				local FeatureSettingsHubPromptXMinuteSuspension = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", { banDurationInMinutes = p1.props.bannedUntil })
				local FeatureSettingsHubPromptXMinuteSuspensionV2 = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspensionV2", { banDurationInMinutes = p1.props.bannedUntil }) else nil
				p1:setState({
					banEnd = if UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryB then FeatureSettingsHubPromptXMinuteSuspension elseif GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and UnifiedJoinVoiceToast == PromptTypeModule.VoiceChatSuspendedTemporaryBV2 then FeatureSettingsHubPromptXMinuteSuspensionV2 else " " .. p1.props.bannedUntil .. "."
				})
				
				return
			end
		else
			p1:setState({
				promptType = PromptTypeModule.None,
				toastContent = RoactModule.None
			})
		end
	end
	
	function p1.closeVoiceBanPrompt()
		-- upvalues: p1 (copy), ContextActionService (upval), PromptTypeModule (upval), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (upval), VoiceNudgeUseNewDACopyModule (upval), VoiceChatOnlyReportVoiceBans (upval)
		p1:setState({ showPrompt = false })
		
		if p1.props.onContinueFunc then
			p1.props.onContinueFunc()
		end
		ContextActionService:UnbindCoreAction("CloseVoiceBanPrompt")
		local IsPromptTypeMatch = p1.state.promptType == PromptTypeModule.VoiceChatSuspendedTemporaryB
		local IsPromptTypeMatch1: boolean = GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (VoiceNudgeUseNewDACopyModule() and p1.state.promptType == PromptTypeModule.VoiceChatSuspendedTemporaryBV2)
		
		if VoiceChatOnlyReportVoiceBans then
			local PromptType = p1.state.promptType
			
			if (PromptType == PromptTypeModule.VoiceChatSuspendedPermanent or (PromptType == PromptTypeModule.VoiceChatSuspendedTemporary or (PromptType == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (PromptType == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and PromptType == PromptTypeModule.VoiceChatSuspendedTemporaryBV2)))) and not IsPromptTypeMatch and not IsPromptTypeMatch1 then
				if p1.props.Analytics then
					p1.props.Analytics:reportBanMessageEvent("Acknowledged")
				end
				if p1.props.VoiceChatServiceManager then
					p1.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
					
					return
				end
			end
		elseif not IsPromptTypeMatch and not IsPromptTypeMatch1 then
			if p1.props.Analytics then
				p1.props.Analytics:reportBanMessageEvent("Acknowledged")
			end
			if p1.props.VoiceChatServiceManager then
				p1.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
			end
		end
	end
	
	function p1:checkInputStateForClosePrompt(UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.closeVoiceBanPrompt()
		end
	end
	
	function p1.handlePrimayActivated()
		-- upvalues: p1 (copy)
		p1.closeVoiceBanPrompt()
		
		if p1.props.onPrimaryActivated then
			p1.props.onPrimaryActivated()
		end
	end
	
	function p1.handleSecondaryActivated()
		-- upvalues: p1 (copy)
		p1.closeVoiceBanPrompt()
		
		if p1.props.onSecondaryActivated then
			p1.props.onSecondaryActivated()
		end
	end
end

function VoiceChatPromptFrame.render(p1)
	-- upvalues: GetFFlagEnableVoicePromptReasonTextModule (copy), PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), VoiceNudgeUseNewDACopyModule (copy), GetFFlagShowDevicePermissionsModalFunction (copy), TextService (copy), FeatureSettingsHubPromptSubtitleEffectiveUntil (copy), FeatureSettingsHubPromptSubtitleTemporaryVoiceBan2 (copy), FeatureSettingsHubPromptSubtitleTemporaryVoiceBan2V2 (copy), FeatureSettingsHubPromptSubtitleFutureViolations (copy), GetFFlagSupportGamepadNavInVoiceModalsFunction (copy), VoiceNudgeUseNewConfirmButton (copy), RoactModule (copy), FeatureSettingsHubActionOk (copy), FeatureSettingsHubPromptGotIt (copy), FeatureSettingsHubPromptUnderstand (copy), _Color3_1 (copy), _Color3 (copy), Button (copy), ButtonType (copy), UIBloxModule (copy), AssetsModule (copy), FeatureSettingsHubPromptIncorrectNudgeV2 (copy), FeatureSettingsHubPromptIncorrectNudge (copy), DevicePermissionsModalModule (copy), config (copy), config1 (copy), UserInputService (copy), VoiceChatConsentModalModule (copy), CoreGui (copy), VoiceChatTooltipModule (copy), GetFIntVoiceToxicityToastDurationSecondsModule (copy), GetFIntVoiceJoinM3ToastDurationSecondsModule (copy), GetFFlagEnableSeamlessVoiceDataConsentToastModule (copy), Toast (copy), ExternalEventConnection (copy)
	local ErrorText = GetFFlagEnableVoicePromptReasonTextModule() and p1.props.errorText or nil
	local PromptType = p1.state.promptType
	local IsPromptTypeMatch: boolean = PromptType == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and PromptType == PromptTypeModule.VoiceToxicityModalV2
	local IsPromptTypeMatch1: boolean = p1.state.promptType == PromptTypeModule.VoiceToxicityToast or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1.state.promptType == PromptTypeModule.VoiceToxicityToastV2
	local IsPromptTypeMatch2 = p1.state.promptType == PromptTypeModule.VoiceChatSuspendedTemporaryB
	local IsPromptTypeMatch3: boolean = GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (VoiceNudgeUseNewDACopyModule() and p1.state.promptType == PromptTypeModule.VoiceChatSuspendedTemporaryBV2)
	local IsPromptTypeMatch4: boolean = GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (VoiceNudgeUseNewDACopyModule() and (p1.state.promptType == PromptTypeModule.VoiceToxicityModalV2 or p1.state.promptType == PromptTypeModule.VoiceChatSuspendedTemporaryBV2))
	local PromptType1 = p1.state.promptType
	local IsPromptTypeMatch5: boolean = PromptType1 == PromptTypeModule.VoiceConsentModalV1 or (PromptType1 == PromptTypeModule.VoiceConsentModalV2 or PromptType1 == PromptTypeModule.VoiceConsentModalV3)
	local IsPromptTypeMatch6: boolean = GetFFlagShowDevicePermissionsModalFunction() and p1.state.promptType == PromptTypeModule.DevicePermissionsModal
	local Y = Enum.AutomaticSize.Y
	local PromptType2 = p1.state.promptType
	
	if PromptType2 == PromptTypeModule.VoiceChatSuspendedPermanent or (PromptType2 == PromptTypeModule.VoiceChatSuspendedTemporary or (PromptType2 == PromptTypeModule.VoiceChatSuspendedTemporaryAvatarChat or (PromptType2 == PromptTypeModule.VoiceChatSuspendedTemporaryB or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and PromptType2 == PromptTypeModule.VoiceChatSuspendedTemporaryBV2))) or (PromptType2 == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and PromptType2 == PromptTypeModule.VoiceToxicityModalV2 or (PromptType2 == PromptTypeModule.VoiceConsentModalV1 or (PromptType2 == PromptTypeModule.VoiceConsentModalV2 or PromptType2 == PromptTypeModule.VoiceConsentModalV3) or PromptType2 == PromptTypeModule.DevicePermissionsModal)) then
		local ToastTitle = p1.state.toastContent.toastTitle
		local NewY = 20 + TextService:GetTextSize(ToastTitle, p1.promptStyle.Font.Header1.RelativeSize * p1.promptStyle.Font.BaseSize, p1.promptStyle.Font.Header1.Font, Vector2.new(325, 1e999)).Y
		local BanEnd = if IsPromptTypeMatch2 or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and IsPromptTypeMatch3 then p1.state.banEnd else FeatureSettingsHubPromptSubtitleEffectiveUntil .. p1.state.banEnd
		local Text: string = if p1.state.banEnd == "" then p1.state.toastContent.toastSubtitle .. p1.state.banEnd else "<b>" .. BanEnd .. "</b><br />" .. p1.state.toastContent.toastSubtitle
		local ErrorText1 = ErrorText or Text
		local BodyFont = p1.promptStyle.Font.Body.Font
		local ScaledRelativeSize = p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize
		local NewY1 = 20 + TextService:GetTextSize(ErrorText1, ScaledRelativeSize, BodyFont, Vector2.new(325, 1e999)).Y
		
		if IsPromptTypeMatch2 or IsPromptTypeMatch3 then
			NewY1 += 20
		end
		local FeatureSettingsHubPromptSubtitleTemporaryVoiceBan = if IsPromptTypeMatch2 then FeatureSettingsHubPromptSubtitleTemporaryVoiceBan2 elseif GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and IsPromptTypeMatch3 then FeatureSettingsHubPromptSubtitleTemporaryVoiceBan2V2 else FeatureSettingsHubPromptSubtitleFutureViolations
		local NewY2 = 20 + TextService:GetTextSize(FeatureSettingsHubPromptSubtitleTemporaryVoiceBan, ScaledRelativeSize, BodyFont, Vector2.new(325, 1e999)).Y
		local PromptType3 = p1.state.promptType
		local IsPromptTypeMatch7: boolean = PromptType3 == PromptTypeModule.VoiceChatSuspendedTemporaryB or (GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and PromptType3 == PromptTypeModule.VoiceChatSuspendedTemporaryBV2 or (PromptType3 == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and PromptType3 == PromptTypeModule.VoiceToxicityModalV2))
		local Stop = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then Enum.SelectionBehavior.Stop else nil
		local Selectable = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then true else nil
		local CreateElementFunction = RoactModule.createElement
		local v1 = "ScreenGui"
		local config2 = {
			DisplayOrder = 8,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			Enabled = p1.state.showPrompt,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}
		local config3 = {
			Overlay = RoactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Text = "",
				BackgroundColor3 = p1.promptStyle.Theme.Overlay.Color,
				BackgroundTransparency = p1.promptStyle.Theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			DialogMainFrame = RoactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = AssetsModule.Images.RoundedRect.Image,
				ImageColor3 = p1.promptStyle.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p1.promptStyle.Theme.BackgroundUIDefault.Transparency,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
				Size = UDim2.new(0, 365, 0, 55 + NewY + 1 + NewY1 + 14 + NewY2 + 36 + 40),
				AutomaticSize = Y,
				SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter,
				SelectionBehaviorDown = Stop,
				SelectionBehaviorLeft = Stop,
				SelectionBehaviorRight = Stop,
				SelectionBehaviorUp = Stop,
				SelectionGroup = Selectable,
				ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then p1.ref else nil
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 20),
					PaddingBottom = UDim.new(0, 20),
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20)
				}),
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Icon = RoactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = p1.state.toastContent.iconImage,
					Size = UDim2.new(0, 55, 0, 55)
				}),
				TitleTextContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, NewY),
					AutomaticSize = Y
				}, {
					TitleText = RoactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						fontStyle = p1.promptStyle.Font.Header1,
						colorStyle = p1.promptStyle.Theme.SystemPrimaryDefault,
						textXAlignment = Enum.TextXAlignment.Center,
						size = UDim2.new(1, 0, 1, 0),
						text = ToastTitle
					})
				}),
				Divider = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 3,
					BackgroundColor3 = p1.promptStyle.Theme.Divider.Color,
					BackgroundTransparency = p1.promptStyle.Theme.Divider.Transparency,
					Size = UDim2.new(0.8, 0, 0, 1)
				}),
				DividerSpaceContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, 7)
				}),
				BodyTextContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Size = UDim2.new(1, 0, 0, NewY1)
				}, {
					BodyText = RoactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						fontStyle = p1.promptStyle.Font.Body,
						colorStyle = p1.promptStyle.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Center,
						size = UDim2.new(1, 0, 1, 0),
						text = ErrorText1
					})
				}),
				TextSpaceContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 6,
					Size = UDim2.new(1, 0, 0, 7)
				}),
				SubBodyTextContainer = not IsPromptTypeMatch and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 7,
					Size = UDim2.new(1, 0, 0, NewY2),
					AutomaticSize = Y
				}, {
					BodyText = RoactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
						fontStyle = p1.promptStyle.Font.Body,
						colorStyle = p1.promptStyle.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Center,
						size = UDim2.new(1, 0, 1, 0),
						text = FeatureSettingsHubPromptSubtitleTemporaryVoiceBan
					})
				}),
				SpaceContainer2 = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 8,
					Size = UDim2.new(1, 0, 0, 10)
				}),
				ButtonContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 9,
					Size = UDim2.new(1, 0, 0, 36),
					AutomaticSize = Y
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 20),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					ConfirmButton = if VoiceNudgeUseNewConfirmButton then RoactModule.createElement("TextButton", {
						Size = UDim2.new(1, -5, 0, 48),
						LayoutOrder = 1,
						Text = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceNudgeUseNewDACopyModule() and IsPromptTypeMatch3 then FeatureSettingsHubActionOk elseif GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and IsPromptTypeMatch and VoiceNudgeUseNewDACopyModule() and p1.state.promptType == PromptTypeModule.VoiceToxicityModalV2 then FeatureSettingsHubActionOk elseif IsPromptTypeMatch then FeatureSettingsHubPromptGotIt else FeatureSettingsHubPromptUnderstand,
						[RoactModule.Event.Activated] = p1.handlePrimayActivated,
						[RoactModule.Event.MouseEnter] = function(p2)
							-- upvalues: _Color3_1 (upval)
							p2.BackgroundColor3 = _Color3_1
						end,
						[RoactModule.Event.MouseLeave] = function(p2)
							-- upvalues: _Color3 (upval)
							p2.BackgroundColor3 = _Color3
						end,
						Selectable = Selectable,
						BackgroundColor3 = _Color3,
						BackgroundTransparency = 0,
						TextColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						AutoButtonColor = false,
						Font = Enum.Font.BuilderSansBold,
						TextSize = 20
					}, {
						Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					}) else RoactModule.createElement(Button, {
						layoutOrder = 1,
						buttonType = ButtonType.PrimarySystem,
						size = UDim2.new(1, -5, 0, 48),
						text = if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceNudgeUseNewDACopyModule() and IsPromptTypeMatch3 then FeatureSettingsHubActionOk elseif GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and IsPromptTypeMatch and VoiceNudgeUseNewDACopyModule() and p1.state.promptType == PromptTypeModule.VoiceToxicityModalV2 then FeatureSettingsHubActionOk elseif IsPromptTypeMatch then FeatureSettingsHubPromptGotIt else FeatureSettingsHubPromptUnderstand,
						onActivated = p1.handlePrimayActivated,
						Selectable = Selectable
					}),
					SecondaryButton = IsPromptTypeMatch7 and RoactModule.createElement(UIBloxModule.App.Button.LinkButton, {
						colorStyleDefault = "TextMuted",
						colorStyleHover = "TextMuted",
						layoutOrder = if VoiceNudgeUseNewConfirmButton then 2 else 1,
						size = UDim2.new(1, -5, 0, 36),
						text = if IsPromptTypeMatch4 then FeatureSettingsHubPromptIncorrectNudgeV2 else FeatureSettingsHubPromptIncorrectNudge,
						onActivated = p1.handleSecondaryActivated
					})
				})
			})
		}
		
		return (RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			InGameMenuInformationalDialog = if IsPromptTypeMatch6 then if IsPromptTypeMatch5 then RoactModule.createElement(VoiceChatConsentModalModule, {
				titleText = config[p1.state.promptType],
				bodyText = config1[p1.state.promptType],
				handlePrimaryActivated = p1.handlePrimayActivated,
				handleSecondaryActivated = p1.handleSecondaryActivated,
				Analytics = p1.props.Analytics,
				showCheckbox = p1.props.showCheckbox,
				promptStyle = p1.promptStyle,
				showPrompt = p1.state.showPrompt,
				ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then p1.ref else nil
			}) else RoactModule.createElement(DevicePermissionsModalModule, {
				titleText = config[p1.state.promptType],
				bodyText = config1[p1.state.promptType],
				handlePrimaryActivated = p1.handlePrimayActivated,
				handleSecondaryActivated = p1.handleSecondaryActivated,
				Analytics = p1.props.Analytics,
				promptStyle = p1.promptStyle,
				showPrompt = p1.state.showPrompt,
				settingsAppAvailable = p1.props.settingsAppAvailable,
				UserInputService = if p1.props.UserInputService == nil then UserInputService else p1.props.UserInputService,
				ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then p1.ref else nil
			}) elseif IsPromptTypeMatch5 then RoactModule.createElement(VoiceChatConsentModalModule, {
				titleText = config[p1.state.promptType],
				bodyText = config1[p1.state.promptType],
				handlePrimaryActivated = p1.handlePrimayActivated,
				handleSecondaryActivated = p1.handleSecondaryActivated,
				Analytics = p1.props.Analytics,
				showCheckbox = p1.props.showCheckbox,
				promptStyle = p1.promptStyle,
				showPrompt = p1.state.showPrompt,
				ref = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then p1.ref else nil
			}) else CreateElementFunction(v1, config2, config3)
		}))
	elseif p1.state.promptType == PromptTypeModule.JoinVoiceSTUX then
		return (RoactModule.createElement(VoiceChatTooltipModule, {
			titleText = config[p1.state.promptType],
			subtitleText = config1[p1.state.promptType],
			promptStyle = p1.promptStyle,
			showPrompt = p1.state.showPrompt,
			onClose = function()
				-- upvalues: p1 (copy)
				p1:setState({ showPrompt = false })
			end,
			onMenuOpen = p1.hideOnMenuOpen
		}))
	else
		local FIntVoiceToxicityToastDurationSecondsModule = if IsPromptTypeMatch1 then GetFIntVoiceToxicityToastDurationSecondsModule() elseif p1.state.promptType == PromptTypeModule.JoinedVoiceToast then GetFIntVoiceJoinM3ToastDurationSecondsModule() else 3
		local ShowDataConsentToast = if p1.state.promptType == PromptTypeModule.VoiceDataConsentOptOutToast and GetFFlagEnableSeamlessVoiceDataConsentToastModule() then if p1.props.showDataConsentToast then p1.props.showDataConsentToast else false else p1.state.showPrompt
		
		return (RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[RoactModule.Change.AbsoluteSize] = p1.onScreenSizeChanged
		}, {
			Toast = p1.state.promptType ~= PromptTypeModule.None and RoactModule.createElement(Toast, {
				duration = if IsPromptTypeMatch1 then GetFIntVoiceToxicityToastDurationSecondsModule() else FIntVoiceToxicityToastDurationSecondsModule,
				toastContent = p1.state.toastContent,
				show = ShowDataConsentToast
			}),
			EventConnection = p1.props.promptSignal and RoactModule.createElement(ExternalEventConnection, {
				event = p1.props.promptSignal,
				callback = p1.promptSignalCallback
			})
		}))
	end
end

function VoiceChatPromptFrame.didUpdate(p1)
	-- upvalues: GetFFlagSupportGamepadNavInVoiceModalsFunction (copy), ResponsiveModule (copy), GuiService (copy)
	if GetFFlagSupportGamepadNavInVoiceModalsFunction() then
		if p1.props.lastInput == ResponsiveModule.Input.Directional then
			local Value = p1.ref:getValue()
			
			if p1.state.showPrompt and Value then
				GuiService:Select(Value)
			end
			if not p1.state.showPrompt and Value then
				GuiService.SelectedCoreObject = nil
				
				return
			end
		elseif GuiService.SelectedCoreObject then
			GuiService.SelectedCoreObject = nil
		end
	end
end

function VoiceChatPromptFrame.didMount(p1)
	-- upvalues: ContextActionService (copy)
	if p1.props.onReadyForSignal then
		p1.props.onReadyForSignal()
	end
	ContextActionService:BindCoreAction("CloseVoiceBanPrompt", p1.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindCoreAction("CloseVoiceBanPrompt", p1.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB)
end

local v1 = InGameMenuPolicyModule.connect(function(p1, _)
	return {
		showNewContent = p1.getGameInfoShowChatFeatures(),
		showCheckbox = p1.getDisplayCheckboxInVoiceConsent(),
		showDataConsentToast = p1.getDisplayCheckboxInVoiceConsent() ~= nil and p1.getDisplayCheckboxInVoiceConsent()
	}
end)(VoiceChatPromptFrame)

local function WrappedVoiceChatPromptFrame(p1)
	-- upvalues: UseStyleFunction (copy), GetFFlagSupportGamepadNavInVoiceModalsFunction (copy), UseLastInputFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseLastInputResult = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then UseLastInputFunction() else nil
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		appStyle = UseStyleFunction(),
		lastInput = if GetFFlagSupportGamepadNavInVoiceModalsFunction() then UseLastInputResult else nil
	}))
end

return function(p1)
	-- upvalues: RenderWithCoreScriptsStyleProviderModule (copy), RoactModule (copy), WrappedVoiceChatPromptFrame (copy)
	return RenderWithCoreScriptsStyleProviderModule({
		RoactModule.createElement(WrappedVoiceChatPromptFrame, p1)
	})
end