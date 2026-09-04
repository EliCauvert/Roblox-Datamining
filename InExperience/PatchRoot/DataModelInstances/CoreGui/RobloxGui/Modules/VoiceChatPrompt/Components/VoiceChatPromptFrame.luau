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
local getFFlagEnableVoiceTrustedConnectionsToastsModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts)
local getFFlagVoiceConnectToastCapturesTrustedFriendsSubtitleModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceConnectToastCapturesTrustedFriendsSubtitle)
local getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module = require(script.Parent.Parent.Parent.VoiceChat.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local voiceNudgeUseNewDACopyModule = require(script.Parent.Parent.Parent.VoiceChat.Helpers.VoiceNudgeUseNewDACopy)
local voiceNudgeUseNewConfirmButton = game:DefineFastFlag("VoiceNudgeUseNewConfirmButton", false)
local fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule = require(script.Parent.Parent.Parent.VoiceChat.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local _ = nil
local var1 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(220, 220, 220)
local _ = roactModule.PureComponent:extend("VoiceChatPromptFrame")
local t = {
	[promptTypeModule.None] = "",
	[promptTypeModule.NotAudible] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.NotAudible"),
	[promptTypeModule.NotAudibleVoiceChatVolume] = if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule then var1:Format("Feature.SettingsHub.Prompt.NotAudible") else nil,
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
	[promptTypeModule.LeaveVoice] = var1:Format("Feature.SettingsHub.Prompt.LeaveVoiceChatV2"),
	[promptTypeModule.JoinVoice] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.JoinedVoiceChatV2"),
	[promptTypeModule.DevicePermissionsModal] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.NeedMicrophoneAccess"),
	[promptTypeModule.VoiceDataConsentOptOutToast] = if getFFlagEnableSeamlessVoiceDataConsentToastModule() then var1:Format("Feature.SettingsHub.Prompt.Title.ImproveVoiceChat") else nil,
	[promptTypeModule.UnifiedJoinVoiceToast] = var1:Format("Feature.SettingsHub.Prompt.JoinedVoiceChatV3"),
	[promptTypeModule.AgeCheckForVoiceToast] = var1:Format("Feature.SettingsHub.Prompt.Title.AgeCheckForVoiceToast"),
	[promptTypeModule.UpdateOnAutoJoinToast] = if getFFlagEnableVoiceTrustedConnectionsToastsModule() then var1:Format("Feature.SettingsHub.Prompt.UpdateToVoiceChat") else nil,
	[promptTypeModule.VoiceChatSuspendedTemporaryBV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.VoiceChatSuspendedV2") else nil,
	[promptTypeModule.VoiceToxicityModalV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat") else nil,
	[promptTypeModule.VoiceToxicityToastV2] = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.RememberRulesVoiceChat") else nil
}
local t_1 = {
	[promptTypeModule.None] = "",
	[promptTypeModule.NotAudible] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.NotAudible"),
	[promptTypeModule.NotAudibleVoiceChatVolume] = if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule then var1:Format("Feature.SettingsHub.Prompt.Subtitle.NotAudibleVoiceChatVolume") else nil,
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
	[promptTypeModule.VoiceChatSuspendedTemporaryToast] = function(p1)
		-- upvalues: robloxTranslatorModule (ref)
		return robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Description.ChatWithVoiceDisabledUntil", { dateTime = p1 })
	end,
	[promptTypeModule.VoiceConsentDeclinedToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.JoinVoiceLater"),
	[promptTypeModule.VoiceConsentAcceptedToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.MuteAnyoneAnytime"),
	[promptTypeModule.VoiceConsentModalV1] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell1"),
	[promptTypeModule.VoiceConsentModalV2] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"),
	[promptTypeModule.VoiceConsentModalV3] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.InExpVoiceUpsell2"),
	[promptTypeModule.JoinedVoiceToast] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMute"),
	[promptTypeModule.JoinVoiceSTUX] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.DisconnectOrMuteHere"),
	[promptTypeModule.DevicePermissionsModal] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess"),
	[promptTypeModule.VoiceDataConsentOptOutToast] = if getFFlagEnableSeamlessVoiceDataConsentToastModule() then var1:Format("Feature.SettingsHub.Prompt.Subtitle.ThanksForVoiceData") else nil,
	[promptTypeModule.UnifiedJoinVoiceToast] = if getFFlagVoiceConnectToastCapturesTrustedFriendsSubtitleModule then robloxTranslatorModule:FormatByKey("Feature.Captures.Prompt.Subtitle.VoiceChatRecordingTrustedFriendsAgeGroup") elseif getFFlagEnableVoiceTrustedConnectionsToastsModule() then var1:Format(if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedFriends" else "Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupTrustedConnections") else var1:Format("Feature.SettingsHub.Prompt.Subtitle.TalkInAgeGroupV2"),
	[promptTypeModule.AgeCheckForVoiceToast] = var1:Format("Feature.SettingsHub.Prompt.Subtitle.GoToAccountInfo"),
	[promptTypeModule.UpdateOnAutoJoinToast] = if getFFlagEnableVoiceTrustedConnectionsToastsModule() then var1:Format(if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedFriendsUpdate" else "Feature.SettingsHub.Prompt.Subtitle.TalkAgeGroupTrustedConnectionsUpdate") else nil,
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
local var2 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.FutureViolations")
local var3 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.EffectiveUntil")
local var4 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Understand")
local var5 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.GotIt")
local var6 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudge")
local var7 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2")
local var8 = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Ok") else nil
local var9 = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporaryVoiceBan2V2") else nil
local var10 = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.IncorrectNudgeV2") else nil

local function _(p1)
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	return if p1 ~= promptTypeModule.VoiceChatSuspendedPermanent then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	return if p1 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceToxicityModalV2 else true
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref)
	return if p1 ~= promptTypeModule.VoiceConsentModalV1 then if p1 ~= promptTypeModule.VoiceConsentModalV2 then p1 == promptTypeModule.VoiceConsentModalV3 else true else true
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref)
	return p1 == promptTypeModule.DevicePermissionsModal
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	local var11 = if p1 ~= promptTypeModule.VoiceChatSuspendedPermanent then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
	
	if not var11 then
		var11 = if p1 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceToxicityModalV2 else true
		
		if not var11 then
			var11 = if p1 ~= promptTypeModule.VoiceConsentModalV1 then if p1 ~= promptTypeModule.VoiceConsentModalV2 then p1 == promptTypeModule.VoiceConsentModalV3 else true else true
			var11 = var11 or p1 == promptTypeModule.DevicePermissionsModal
		end
	end
	return var11
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref)
	return if p1 ~= promptTypeModule.VoiceConsentDeclinedToast then p1 == promptTypeModule.VoiceConsentAcceptedToast else true
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref)
	return p1 == promptTypeModule.VoiceDataConsentOptOutToast
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref)
	return if p1 ~= promptTypeModule.JoinVoice then if p1 ~= promptTypeModule.LeaveVoice then p1 == promptTypeModule.UnifiedJoinVoiceToast else true else true
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	return if p1 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryToast then if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
end

local _ = function(p1)
	-- upvalues: promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref)
	local var11 = true
	
	if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
			var11 = true
			
			if p1 ~= promptTypeModule.VoiceChatSuspendedTemporaryBV2 then
				var11 = if p1 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1 == promptTypeModule.VoiceToxicityModalV2 else true
			end
		end
	end
	return var11
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

function voiceChatPromptFrame.init(p1)
	-- upvalues: promptTypeModule (ref), getFFlagSupportGamepadNavInVoiceModals (ref), roactModule (ref), robloxTranslatorModule (ref), t (ref), t_1 (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (ref), images (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), contextActionService (ref), voiceNudgeUseNewDACopyModule (ref), voiceChatOnlyReportVoiceBans (ref)
	p1.promptStyle = {
		Theme = p1.props.appStyle.Theme,
		Font = p1.props.appStyle.Font
	}
	p1.state = {
		toastContent = nil,
		banEnd = "",
		showPrompt = true,
		screenSize = Vector2.new(0, 0),
		promptType = promptTypeModule.None
	}
	p1.ref = if getFFlagSupportGamepadNavInVoiceModals() then roactModule.createRef() else nil
	
	if p1.props.showNewContent then
		local var11 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.MicUseSuspended")
		local var12 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.TemporarySuspension2")
		t[promptTypeModule.VoiceChatSuspendedTemporary] = var11
		t[promptTypeModule.VoiceChatSuspendedPermanent] = var11
		t_1[promptTypeModule.VoiceChatSuspendedTemporary] = var12
	end
	function p11.onScreenSizeChanged(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	function p11.promptSignalCallback(p2)
		-- upvalues: promptTypeModule (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), p1 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), t (copy), t_1 (copy), getFFlagEnableVoiceTrustedConnectionsToastsModule (copy), images (copy), getFFlagEnableSeamlessVoiceDataConsentToastModule (copy), robloxTranslatorModule (copy), roactModule (copy)
		if if p2 ~= promptTypeModule.VoiceChatSuspendedPermanent then if p2 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p2 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p2 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p2 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true then
			if p1.props.Analytics then
				p1.props.Analytics:reportBanMessageEvent("Shown")
			end
			if p1.props.VoiceChatServiceManager then
				p1.props.VoiceChatServiceManager:reportBanMessage("Shown")
			end
		end
		if (if p2 ~= promptTypeModule.VoiceConsentModalV1 then if p2 ~= promptTypeModule.VoiceConsentModalV2 then p2 == promptTypeModule.VoiceConsentModalV3 else true else true) and p1.props.Analytics then
			p1.props.Analytics:reportInExpConsent("shown", p1.props.VoiceChatServiceManager.inExpUpsellEntrypoint, game.GameId, game.PlaceId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else "")
		end
		if p2 == promptTypeModule.DevicePermissionsModal and p1.props.Analytics and p1.props.VoiceChatServiceManager then
			p1.props.Analytics:reportDevicePermissionsModalEvent("Shown", p1.props.VoiceChatServiceManager:GetSessionId(), p1.props.VoiceChatServiceManager:GetInExpUpsellAnalyticsData())
		end
		if p2 and p2 ~= promptTypeModule.None then
			local var13 = t[p2]
			local var14 = t_1[p2]
			
			if (if p2 ~= promptTypeModule.JoinVoice then if p2 ~= promptTypeModule.LeaveVoice then p2 == promptTypeModule.UnifiedJoinVoiceToast else true else true) and p1.props.VoiceChatServiceManager and p1.props.VoiceChatServiceManager:HasSeamlessVoiceFeature("HideJoinToastSubtitle") then
				var14 = nil
			end
			if typeof(var13) == "function" then
				var13 = var13(p1.props.bannedUntil)
			end
			if typeof(var14) == "function" then
				var14 = var14(p1.props.bannedUntil)
			end
			local var15, var16
			local _ = nil
			
			if getFFlagEnableVoiceTrustedConnectionsToastsModule() and p2 == promptTypeModule.UpdateOnAutoJoinToast then
				var16 = images["icons/controls/microphone"]
			else
				var15 = if p2 ~= promptTypeModule.VoiceConsentDeclinedToast then p2 == promptTypeModule.VoiceConsentAcceptedToast else true
				
				if var15 or p2 == promptTypeModule.JoinedVoiceToast or p2 == promptTypeModule.UnifiedJoinVoiceToast then
					var16 = images["icons/controls/publicAudioJoin"]
				else
					var15 = if p2 ~= promptTypeModule.JoinVoice then if p2 ~= promptTypeModule.LeaveVoice then p2 == promptTypeModule.UnifiedJoinVoiceToast else true else true
					var16 = if var15 then images["icons/actions/info"] elseif p2 == promptTypeModule.VoiceDataConsentOptOutToast and getFFlagEnableSeamlessVoiceDataConsentToastModule() then nil else images["icons/status/alert"]
				end
			end
			p1:setState({
				showPrompt = true,
				promptType = p2,
				toastContent = {
					iconImage = var16,
					toastTitle = var13,
					toastSubtitle = var14,
					onActivated = function()
						-- upvalues: p1 (copy)
						if p1.props.onPrimaryActivated then
							p1.props.onPrimaryActivated()
						end
					end,
					onDismissed = function() end
				}
			})
			var15 = if p2 ~= promptTypeModule.VoiceChatSuspendedTemporary then if p2 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if p2 ~= promptTypeModule.VoiceChatSuspendedTemporaryToast then if p2 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p2 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
			
			if not var15 then return end
			var15 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspension", { banDurationInMinutes = p1.props.bannedUntil })
			p1:setState({
				banEnd = if p2 == promptTypeModule.VoiceChatSuspendedTemporaryB then var15 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p2 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 then if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.XMinuteSuspensionV2", { banDurationInMinutes = p1.props.bannedUntil }) else nil else " " .. p11.props.bannedUntil .. "."
			})
			
			return
		else
			p1:setState({
				promptType = promptTypeModule.None,
				toastContent = roactModule.None
			})
		end
	end
	
	function p11.closeVoiceBanPrompt()
		-- upvalues: p1 (ref), contextActionService (copy), promptTypeModule (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), voiceChatOnlyReportVoiceBans (copy)
		p1:setState({ showPrompt = false })
		
		if p1.props.onContinueFunc then
			p1.props.onContinueFunc()
		end
		contextActionService:UnbindCoreAction("CloseVoiceBanPrompt")
		local var13 = p1.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryB
		local var14 = getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (voiceNudgeUseNewDACopyModule() and p1.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2)
		
		if voiceChatOnlyReportVoiceBans then
			local promptType = p1.state.promptType
			
			if (if promptType ~= promptTypeModule.VoiceChatSuspendedPermanent then if promptType ~= promptTypeModule.VoiceChatSuspendedTemporary then if promptType ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if promptType ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true) and not var13 and not var14 then
				if p1.props.Analytics then
					p1.props.Analytics:reportBanMessageEvent("Acknowledged")
				end
				if p1.props.VoiceChatServiceManager then
					p1.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
					
					return
				end
			end
		elseif not var13 and not var14 then
			if p1.props.Analytics then
				p1.props.Analytics:reportBanMessageEvent("Acknowledged")
			end
			if p1.props.VoiceChatServiceManager then
				p1.props.VoiceChatServiceManager:reportBanMessage("Acknowledged")
			end
		end
	end
	
	function p11.checkInputStateForClosePrompt(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.closeVoiceBanPrompt()
		end
	end
	
	function p11.handlePrimayActivated()
		-- upvalues: p1 (ref)
		p1.closeVoiceBanPrompt()
		
		if p1.props.onPrimaryActivated then
			p1.props.onPrimaryActivated()
		end
	end
	
	function p11.handleSecondaryActivated()
		-- upvalues: p1 (ref)
		p1.closeVoiceBanPrompt()
		
		if p1.props.onSecondaryActivated then
			p1.props.onSecondaryActivated()
		end
	end
end

function voiceChatPromptFrame.render(p1)
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagShowDevicePermissionsModal (ref), textService (ref), var3 (ref), var7 (ref), var9 (ref), var2 (ref), getFFlagSupportGamepadNavInVoiceModals (ref), voiceNudgeUseNewConfirmButton (ref), roactModule (ref), var8 (ref), var5 (ref), var4 (ref), color_1 (ref), color (ref), button (ref), buttonType (ref), UIBloxModule (ref), assetsModule (ref), var10 (ref), var6 (ref), devicePermissionsModalModule (ref), t (ref), t_1 (ref), userInputService (ref), voiceChatConsentModalModule (ref), coreGuiService (ref), voiceChatTooltipModule (ref), getFIntVoiceToxicityToastDurationSecondsModule (ref), getFIntVoiceJoinM3ToastDurationSecondsModule (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), toast (ref), externalEventConnection (ref)
	local var11 = if getFFlagEnableVoicePromptReasonTextModule() then p1.props.errorText else nil
	local promptType = p1.state.promptType
	local var12 = if promptType ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType == promptTypeModule.VoiceToxicityModalV2 else true
	local var13 = if p1.state.promptType ~= promptTypeModule.VoiceToxicityToast then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p1.state.promptType == promptTypeModule.VoiceToxicityToastV2 else true
	local var14 = p1.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryB
	local var15 = getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (voiceNudgeUseNewDACopyModule() and p1.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2)
	local var16 = getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (voiceNudgeUseNewDACopyModule() and (if p1.state.promptType ~= promptTypeModule.VoiceToxicityModalV2 then p1.state.promptType == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true))
	local promptType_1 = p1.state.promptType
	local var17 = if promptType_1 ~= promptTypeModule.VoiceConsentModalV1 then if promptType_1 ~= promptTypeModule.VoiceConsentModalV2 then promptType_1 == promptTypeModule.VoiceConsentModalV3 else true else true
	local var18 = getFFlagShowDevicePermissionsModal() and p1.state.promptType == promptTypeModule.DevicePermissionsModal
	local y = Enum.AutomaticSize.Y
	local _ = nil
	local promptType_2 = p1.state.promptType
	local var19 = if promptType_2 ~= promptTypeModule.VoiceChatSuspendedPermanent then if promptType_2 ~= promptTypeModule.VoiceChatSuspendedTemporary then if promptType_2 ~= promptTypeModule.VoiceChatSuspendedTemporaryAvatarChat then if promptType_2 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType_2 == promptTypeModule.VoiceChatSuspendedTemporaryBV2 else true else true else true else true
	
	if not var19 then
		var19 = if promptType_2 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType_2 == promptTypeModule.VoiceToxicityModalV2 else true
		
		if not var19 then
			var19 = if promptType_2 ~= promptTypeModule.VoiceConsentModalV1 then if promptType_2 ~= promptTypeModule.VoiceConsentModalV2 then promptType_2 == promptTypeModule.VoiceConsentModalV3 else true else true
			var19 = var19 or promptType_2 == promptTypeModule.DevicePermissionsModal
		end
	end
	if var19 then
		local toastTitle = p1.state.toastContent.toastTitle
		local var20 = 20 + textService:GetTextSize(toastTitle, p1.promptStyle.Font.Header1.RelativeSize * p1.promptStyle.Font.BaseSize, p1.promptStyle.Font.Header1.Font, Vector2.new(325, 1e999)).Y
		local var21 = var11 or (if p1.state.banEnd ~= "" then p1.state.toastContent.toastSubtitle .. p15.state.banEnd else "<b>" .. (if var14 or getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var15 then p1.state.banEnd else var3 .. p15.state.banEnd) .. "</b><br />" .. p15.state.toastContent.toastSubtitle)
		local font = p1.promptStyle.Font.Body.Font
		local var22 = p1.promptStyle.Font.Body.RelativeSize * p1.promptStyle.Font.BaseSize
		local var23 = 20 + textService:GetTextSize(var21, var22, font, Vector2.new(325, 1e999)).Y
		
		if var14 or var15 then
			var23 += 20
		end
		local var24 = if var14 then var7 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var15 then var9 else var2
		local var25 = 20 + textService:GetTextSize(var24, var22, font, Vector2.new(325, 1e999)).Y
		local promptType_3 = p1.state.promptType
		local var26 = true
		
		if promptType_3 ~= promptTypeModule.VoiceChatSuspendedTemporaryB then
			if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
				var26 = true
				
				if promptType_3 ~= promptTypeModule.VoiceChatSuspendedTemporaryBV2 then
					var26 = if promptType_3 ~= promptTypeModule.VoiceToxicityModal then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and promptType_3 == promptTypeModule.VoiceToxicityModalV2 else true
				end
			end
		end
		local var27 = if getFFlagSupportGamepadNavInVoiceModals() then Enum.SelectionBehavior.Stop else nil
		local var28 = if getFFlagSupportGamepadNavInVoiceModals() then true else nil
		local _ = nil
		
		return roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
			InGameMenuInformationalDialog = if var17 then roactModule.createElement(voiceChatConsentModalModule, {
				titleText = t[p1.state.promptType],
				bodyText = t_1[p1.state.promptType],
				handlePrimaryActivated = p1.handlePrimayActivated,
				handleSecondaryActivated = p1.handleSecondaryActivated,
				Analytics = p1.props.Analytics,
				showCheckbox = p1.props.showCheckbox,
				promptStyle = p1.promptStyle,
				showPrompt = p1.state.showPrompt,
				ref = if getFFlagSupportGamepadNavInVoiceModals() then p1.ref else nil
			}) elseif var18 then roactModule.createElement(devicePermissionsModalModule, {
				titleText = t[p1.state.promptType],
				bodyText = t_1[p1.state.promptType],
				handlePrimaryActivated = p1.handlePrimayActivated,
				handleSecondaryActivated = p1.handleSecondaryActivated,
				Analytics = p1.props.Analytics,
				promptStyle = p1.promptStyle,
				showPrompt = p1.state.showPrompt,
				settingsAppAvailable = p1.props.settingsAppAvailable,
				UserInputService = if p1.props.UserInputService ~= nil then userInputService else p1.props.UserInputService,
				ref = if getFFlagSupportGamepadNavInVoiceModals() then p1.ref else nil
			}) else roactModule.createElement("ScreenGui", {
				DisplayOrder = 8,
				IgnoreGuiInset = true,
				OnTopOfCoreBlur = true,
				Enabled = p1.state.showPrompt,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Overlay = roactModule.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					BackgroundColor3 = p1.promptStyle.Theme.Overlay.Color,
					BackgroundTransparency = p1.promptStyle.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = roactModule.createElement(UIBloxModule.Core.ImageSet.ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p1.promptStyle.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p1.promptStyle.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 365, 0, 55 + var20 + 1 + var23 + 14 + var25 + 36 + 40),
					AutomaticSize = y,
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter,
					SelectionBehaviorDown = var27,
					SelectionBehaviorLeft = var27,
					SelectionBehaviorRight = var27,
					SelectionBehaviorUp = var27,
					SelectionGroup = var28,
					ref = if getFFlagSupportGamepadNavInVoiceModals() then p1.ref else nil
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
						Image = p1.state.toastContent.iconImage,
						Size = UDim2.new(0, 55, 0, 55)
					}),
					TitleTextContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, var20),
						AutomaticSize = y
					}, {
						TitleText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
							fontStyle = p1.promptStyle.Font.Header1,
							colorStyle = p1.promptStyle.Theme.SystemPrimaryDefault,
							textXAlignment = Enum.TextXAlignment.Center,
							size = UDim2.new(1, 0, 1, 0),
							text = toastTitle
						})
					}),
					Divider = roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						BackgroundColor3 = p1.promptStyle.Theme.Divider.Color,
						BackgroundTransparency = p1.promptStyle.Theme.Divider.Transparency,
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
						Size = UDim2.new(1, 0, 0, var23)
					}, {
						BodyText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
							fontStyle = p1.promptStyle.Font.Body,
							colorStyle = p1.promptStyle.Theme.TextDefault,
							textXAlignment = Enum.TextXAlignment.Center,
							size = UDim2.new(1, 0, 1, 0),
							text = var21
						})
					}),
					TextSpaceContainer = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 6,
						Size = UDim2.new(1, 0, 0, 7)
					}),
					SubBodyTextContainer = not var12 and roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 7,
						Size = UDim2.new(1, 0, 0, var25),
						AutomaticSize = y
					}, {
						BodyText = roactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
							fontStyle = p1.promptStyle.Font.Body,
							colorStyle = p1.promptStyle.Theme.TextDefault,
							textXAlignment = Enum.TextXAlignment.Center,
							size = UDim2.new(1, 0, 1, 0),
							text = var24
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
							Text = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() and var15 then var8 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var12 and (voiceNudgeUseNewDACopyModule() and p1.state.promptType == promptTypeModule.VoiceToxicityModalV2) then var8 elseif var12 then var5 else var4,
							[roactModule.Event.Activated] = p1.handlePrimayActivated,
							[roactModule.Event.MouseEnter] = function(p2)
								-- upvalues: color_1 (copy)
								p2.BackgroundColor3 = color_1
							end,
							[roactModule.Event.MouseLeave] = function(p2)
								-- upvalues: color (copy)
								p2.BackgroundColor3 = color
							end,
							Selectable = var28,
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
							text = if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() and var15 then var8 elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and var12 and (voiceNudgeUseNewDACopyModule() and p1.state.promptType == promptTypeModule.VoiceToxicityModalV2) then var8 elseif var12 then var5 else var4,
							onActivated = p1.handlePrimayActivated,
							Selectable = var28
						}),
						SecondaryButton = var26 and roactModule.createElement(UIBloxModule.App.Button.LinkButton, {
							colorStyleDefault = "TextMuted",
							colorStyleHover = "TextMuted",
							layoutOrder = if voiceNudgeUseNewConfirmButton then 2 else 1,
							size = UDim2.new(1, -5, 0, 36),
							text = if var16 then var10 else var6,
							onActivated = p1.handleSecondaryActivated
						})
					})
				})
			})
		})
	else
		return if p1.state.promptType == promptTypeModule.JoinVoiceSTUX then roactModule.createElement(voiceChatTooltipModule, {
			titleText = t[p1.state.promptType],
			subtitleText = t_1[p1.state.promptType],
			promptStyle = p1.promptStyle,
			showPrompt = p1.state.showPrompt,
			onClose = function()
				-- upvalues: p1 (ref)
				p1:setState({ showPrompt = false })
			end,
			onMenuOpen = p1.hideOnMenuOpen
		}) else roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			[roactModule.Change.AbsoluteSize] = p1.onScreenSizeChanged
		}, {
			Toast = p1.state.promptType ~= promptTypeModule.None and roactModule.createElement(toast, {
				duration = if var13 then getFIntVoiceToxicityToastDurationSecondsModule() elseif var13 then getFIntVoiceToxicityToastDurationSecondsModule() elseif p1.state.promptType == promptTypeModule.JoinedVoiceToast then getFIntVoiceJoinM3ToastDurationSecondsModule() else 3,
				toastContent = p1.state.toastContent,
				show = if p1.state.promptType == promptTypeModule.VoiceDataConsentOptOutToast and getFFlagEnableSeamlessVoiceDataConsentToastModule() then if p1.props.showDataConsentToast then p1.props.showDataConsentToast else false else p1.state.showPrompt
			}),
			EventConnection = p1.props.promptSignal and roactModule.createElement(externalEventConnection, {
				event = p1.props.promptSignal,
				callback = p1.promptSignalCallback
			})
		})
	end
end

function voiceChatPromptFrame.didUpdate(p1)
	-- upvalues: getFFlagSupportGamepadNavInVoiceModals (ref), responsiveModule (ref), guiService (ref)
	if getFFlagSupportGamepadNavInVoiceModals() then
		if p1.props.lastInput == responsiveModule.Input.Directional then
			local value = p1.ref:getValue()
			
			if p1.state.showPrompt and value then
				guiService:Select(value)
			end
			if p1.state.showPrompt or not value then
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

function voiceChatPromptFrame.didMount(p1)
	-- upvalues: contextActionService (ref)
	if p1.props.onReadyForSignal then
		p1.props.onReadyForSignal()
	end
	contextActionService:BindCoreAction("CloseVoiceBanPrompt", p1.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("CloseVoiceBanPrompt", p1.checkInputStateForClosePrompt, false, Enum.KeyCode.ButtonB)
end

voiceChatPromptFrame = inGameMenuPolicyModule.connect(function(p1, _)
	return {
		showNewContent = p1.getGameInfoShowChatFeatures(),
		showCheckbox = p1.getDisplayCheckboxInVoiceConsent(),
		showDataConsentToast = if p1.getDisplayCheckboxInVoiceConsent() == nil then false else p1.getDisplayCheckboxInVoiceConsent()
	}
end)(voiceChatPromptFrame)

local function WrappedVoiceChatPromptFrame(p1)
	-- upvalues: useStyle (ref), getFFlagSupportGamepadNavInVoiceModals (ref), useLastInput (ref), roactModule (ref), voiceChatPromptFrame (write), cryoModule (ref)
	return roactModule.createElement(voiceChatPromptFrame, cryoModule.Dictionary.join(p1, {
		appStyle = useStyle(),
		lastInput = if getFFlagSupportGamepadNavInVoiceModals() then if getFFlagSupportGamepadNavInVoiceModals() then useLastInput() else nil else nil
	}))
end

return function(p1)
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), WrappedVoiceChatPromptFrame (ref)
	return renderWithCoreScriptsStyleProviderModule({
		roactModule.createElement(WrappedVoiceChatPromptFrame, p1)
	})
end