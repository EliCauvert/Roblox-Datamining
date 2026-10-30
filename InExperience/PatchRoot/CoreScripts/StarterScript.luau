local CorePackages = game:GetService("CorePackages")
local ScriptContext = game:GetService("ScriptContext")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui:WaitForChild("Modules")
ScriptContext:AddCoreScriptLocal("CoreScripts/CoreScriptErrorReporter", RobloxGui)
local RoactModule = require(CorePackages.Packages.Roact)
local SchedulerModule = require(CorePackages.Packages.Scheduler)
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local FFlagUseRoactGlobalConfigInCoreScriptsModule = require(RobloxGui.Modules.Flags.FFlagUseRoactGlobalConfigInCoreScripts)
local GetFFlagScreenshotHudApiModule = require(RobloxGui.Modules.Flags.GetFFlagScreenshotHudApi)
local GetFFlagEnableNewInviteMenuIXPModule = require(Modules.Flags.GetFFlagEnableNewInviteMenuIXP)
local NewInviteMenuExperimentManagerModule = require(Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
local GetFFlagEnableSoundSessionTelemetryModule = require(Modules.Flags.GetFFlagEnableSoundSessionTelemetry)
local GetFFlagReportAnythingAnnotationIXPFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local TrustAndSafetyIXPManager = require(CorePackages.Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager
local GetCoreScriptsLayersModule = require(Modules.Experiment.GetCoreScriptsLayers)
local GetFFlagRtMessagingModule = require(RobloxGui.Modules.Flags.GetFFlagRtMessaging)
local AddPublishAssetPrompt6 = game:DefineFastFlag("AddPublishAssetPrompt6", false)
local EnablePromptAgeCheckListener = game:DefineFastFlag("EnablePromptAgeCheckListener", false)
local IsCharacterNameHandlerEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).isCharacterNameHandlerEnabled
local GetFFlagEnableSocialContextToastFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableSocialContextToast
local GetFFlagEnableAppChatInExperienceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local GetFFlagChromeCentralizedConfigurationFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagChromeCentralizedConfiguration
local GetFFlagEnableCrossExpVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local FStringReactSchedulingContext = require(CorePackages.Workspace.Packages.SharedFlags).FStringReactSchedulingContext
local FFlagFriendsCallingClientGateDEV = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFriendsCallingClientGate_DEV
local LuaAppEnableToastNotificationsCoreScripts4 = game:DefineFastFlag("LuaAppEnableToastNotificationsCoreScripts4", false)
local DisableLuobuWarningToast = game:DefineFastFlag("DisableLuobuWarningToast", false)
local FFlagDebugDisableExperienceChatMainModule = require(RobloxGui.Modules.Flags.FFlagDebugDisableExperienceChatMain)
local GetFFlagVoiceUserAgency3Module = require(RobloxGui.Modules.Flags.GetFFlagVoiceUserAgency3)
local GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(RobloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local EnableSendCameraAccessAnalytics = game:DefineFastFlag("EnableSendCameraAccessAnalytics", false)
local EnableExperienceNotificationPrompts2 = game:DefineFastFlag("EnableExperienceNotificationPrompts2", false)
local EnableCancelSubscriptionAppEngineFeature = game:GetEngineFeature("EnableCancelSubscriptionApp")
local EnableCancelSubscriptionAppLua = game:DefineFastFlag("EnableCancelSubscriptionAppLua", false)
local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local EnableExperienceGenericChallengeRenderingOnLoadingScript = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false)
local EnableRobloxCommerceEngineFeature = game:GetEngineFeature("EnableRobloxCommerce")
local EnableLinkSharingEvent = game:DefineFastFlag("EnableLinkSharingEvent", false)
local FFlagEnableShareSheet = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareSheet
local PlayerFeedbackEnabledEngineFeature = game:GetEngineFeature("PlayerFeedbackEnabled")
local FFlagLuaAppInExperienceDetailsPrompt = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local EnableSystemScrim = game:DefineFastFlag("EnableSystemScrim", false)
local EnableCoreUISystemV2 = game:DefineFastFlag("EnableCoreUISystemV2", false)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local EnableCorescriptsProfiler = game:DefineFastFlag("EnableCorescriptsProfiler", false)
local CoreScriptsProfilerTelemetryContext = game:DefineFastFlag("CoreScriptsProfilerTelemetryContext", false)
local EnableSelfieQRCodeEngineFeature = game:DefineFastFlag("SelfieFrontendConsoleDesktop3", false) and game:GetEngineFeature("EnableSelfieQRCode")
local GetEngineFeatureEnablePromptRobuxTransferFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetEngineFeatureEnablePromptRobuxTransfer
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UIBloxInGameConfig = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig
UIBloxModule.init(UIBloxInGameConfig)

if EnableCoreUISystemV2 then
	require(CorePackages.Workspace.Packages.System)
end
local FFlagTopBarRefactor = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize()

if game:DefineFastFlag("LuaAppUseAppHttpStoreInExperience", false) then
	require(CorePackages.Workspace.Packages.HttpStore).Instance._create({})
end
local ReactSchedulerIXPConfig = require(CorePackages.Workspace.Packages.SharedFlags).GetReactSchedulerIXPConfig()

if ReactSchedulerIXPConfig then
	SchedulerModule.unstable_setSchedulerFlags(ReactSchedulerIXPConfig)
end
if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSchedulerFlagOverrides then
	local InExp = require(CorePackages.Workspace.Packages.SharedFlags).GetSchedulerFlagOverrides.getInExp()
	
	if InExp then
		SchedulerModule.unstable_setSchedulerFlags(InExp)
	end
end
local FFlagEnableAEGIS2CommsFAEUpsell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagInitializeSduiForInExperience then
	require(Modules.ServerDrivenUi.initializeSduiForInExperience)()
end
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local IsViewer = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.teamCreateUtils).isViewer()

if IsViewer then
	require(CorePackages.Workspace.Packages.BuildExperience.mountTeamCreateViewer)(game.PlaceId, UserInputService)
end
if game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
	ScriptContext:AddCoreScriptLocal("CoreScripts/DefaultListenerLocation", script.Parent)
end
if GetFFlagEnableAppChatInExperienceFunction() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/AppChatMain", RobloxGui)
end
if FFlagFriendsCallingClientGateDEV then
	ScriptContext:AddCoreScriptLocal("CoreScripts/FriendsCallingMain", RobloxGui)
end
if GetFFlagEnableCrossExpVoiceFunction() then
	require(CorePackages.Workspace.Packages.CrossExperienceVoice).IXPManager.default:initialize()
end
local _ = require(CorePackages.Workspace.Packages.InExperienceSessionization)

if require(CorePackages.Workspace.Packages.Chrome).Enabled() then
	local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
	ExpChatModule.GlobalFlags.AvatarChatEnabled = false
	ExpChatModule.GlobalFlags.ChromeEnabled = true
end
if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions() then
	require(CorePackages.Workspace.Packages.ExpChat).GlobalFlags.JoinWithoutMicPermissions = true
end
local InExperienceInterventionApp = game:DefineFastFlag("InExperienceInterventionApp", false)
local FFlagLuaAppEnableInExperienceDataModelStreamStarter = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableInExperienceDataModelStreamStarter

if FFlagUseRoactGlobalConfigInCoreScriptsModule and RunService:IsStudio() then
	RoactModule.setGlobalConfig({ propValidation = true, elementTracing = true })
end
local UIBlox = require(CorePackages.Packages.InGameMenuDependencies).UIBlox

if UIBlox ~= UIBloxModule then
	UIBlox.init(UIBloxInGameConfig)
end
local Sounds = Instance.new("Folder")
Sounds.Name = "Sounds"
Sounds.Parent = RobloxGui

local function safeRequire(p1)
	local Success, Result = pcall(require, p1)
	
	if Success then
		return Result
	else
		warn("Failure to Start CoreScript module " .. p1.Name .. ".\n" .. Result)
	end
end

ScriptContext:AddCoreScriptLocal("CoreScripts/NotificationScript2", RobloxGui)

if FFlagLuaAppEnableInExperienceDataModelStreamStarter then
	ScriptContext:AddCoreScriptLocal("CoreScripts/InExperienceDataModelStreamStarter", script.Parent)
end
if game:GetEngineFeature("ProtocolLaunchPrivateChannelUpdateCheckEngineFeature") then
	local ChannelUpdatePrompt = Modules.ChannelUpdatePrompt
	local Success1, Result1 = pcall(require, ChannelUpdatePrompt)
	local Result2 = nil
	
	if Success1 then
		Result2 = Result1
	else
		warn("Failure to Start CoreScript module " .. ChannelUpdatePrompt.Name .. ".\n" .. Result1)
		Result2 = nil
	end
	if Result2 then
		Result2.init()
	end
end
if not IsViewer and GetFFlagChromeCentralizedConfigurationFunction() then
	coroutine.wrap(safeRequire)(Modules.Chrome.ConfigureChrome)
end
coroutine.wrap(safeRequire)(Modules.SelfieView)

if not IsViewer then
	coroutine.wrap(safeRequire)(Modules.TopBar)
end
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)

if not IsViewer and IsSideSheetEnabledModule then
	coroutine.wrap(safeRequire)(Modules.InExperienceSideSheet)
end
if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableWhatsNew then
	coroutine.wrap(safeRequire)(Modules.InGameWhatsNew)
end
if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppNavMyStatsTab then
	local v1 = coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
	local v2 = coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.BuildExperience)
	local HasBuildMode = v2 and (v1 and v1:hasBuildMode())
	
	if v2 then
		v2.mountCreatorAgentResumeToastReceiver(HasBuildMode == true)
	end
	if v2 and HasBuildMode and not IsViewer then
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		v2.mountChatSheet(if require(CorePackages.Workspace.Packages.SharedFlags).FFlagBuildExperienceInGameCaptureToChat then {
			takeCapture = function(p1)
				-- upvalues: RobloxGui (copy)
				require(RobloxGui.Modules.Captures.CapturesApp).takeCapture(p1)
			end
		} else nil)
	end
end
if FFlagTopBarRefactor then
	local v3 = coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.InExperienceOverlay)
	
	if v3 then
		v3.createOverlay()
	end
end
if game:GetEngineFeature("LuobuModerationStatus") then
	coroutine.wrap(function()
		-- upvalues: Modules (copy)
		local Watermark = Modules.Watermark
		local Success, Result = pcall(require, Watermark)
		
		if not Success then
			warn("Failure to Start CoreScript module " .. Watermark.Name .. ".\n" .. Result)
			
			return
		end
	end)()
end
if InExperienceInterventionApp then
	coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.InExperienceIntervention)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/MainBotChatScript2", RobloxGui)

if game:GetEngineFeature("ProximityPrompts") then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ProximityPrompt", RobloxGui)
end
if game:GetEngineFeature("ValidateUGCBodyAPIFeature") then
	require(Modules.Server.UGCValidation.UGCValidationFunctionInstaller)()
end
coroutine.wrap(function()
	-- upvalues: ScriptContext (copy), RobloxGui (copy)
	ScriptContext:AddCoreScriptLocal("CoreScripts/ScreenTimeInGame", RobloxGui)
end)()

if not DisableLuobuWarningToast then
	coroutine.wrap(function()
		-- upvalues: CachedPolicyServiceModule (copy), Modules (copy)
		if CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			if not game:IsLoaded() then
				game.Loaded:Wait()
			end
			local LuobuWarningToast = Modules.LuobuWarningToast
			local Success, Result = pcall(require, LuobuWarningToast)
			
			if Success then return end
			warn("Failure to Start CoreScript module " .. LuobuWarningToast.Name .. ".\n" .. Result)
		end
	end)()
end
ScriptContext:AddCoreScriptLocal("CoreScripts/PerformanceStatsManagerScript", RobloxGui)
ScriptContext:AddCoreScriptLocal("CoreScripts/PlayerRagdoll", RobloxGui)
coroutine.wrap(safeRequire)(RobloxGui.Modules.ChatSelector)
coroutine.wrap(safeRequire)(RobloxGui.Modules.PlayerList.PlayerListManager)
local Success2, Result3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta")
end)

if game:GetEngineFeature("EnableBubbleChatFromChatService") or Success2 and Result3 then
	ScriptContext:AddCoreScriptLocal("CoreScripts/PlayerBillboards", RobloxGui)
end
coroutine.wrap(function()
	-- upvalues: CorePackages (copy)
	local PurchasePrompt = CorePackages.Workspace.Packages.PurchasePrompt
	local Success, Result = pcall(require, PurchasePrompt)
	local Result1 = nil
	
	if Success then
		Result1 = Result
	else
		warn("Failure to Start CoreScript module " .. PurchasePrompt.Name .. ".\n" .. Result)
		Result1 = nil
	end
	if Result1 then
		Result1.mountPurchasePrompt()
	end
end)()

if AddPublishAssetPrompt6 then
	coroutine.wrap(safeRequire)(Modules.PublishAssetPrompt)
end
coroutine.wrap(safeRequire)(Modules.ExperienceEvents.ExperienceEventsApp)

if PlayerFeedbackEnabledEngineFeature then
	coroutine.wrap(safeRequire)(Modules.PlayerFeedback)
end
coroutine.wrap(safeRequire)(Modules.Groups.GroupsApp)
coroutine.wrap(safeRequire)(Modules.AvatarGeneration.SelfieConsent)

if EnableSelfieQRCodeEngineFeature then
	coroutine.wrap(safeRequire)(Modules.AvatarGeneration.SelfieQr)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/BlockPlayerPrompt", RobloxGui)
ScriptContext:AddCoreScriptLocal("CoreScripts/FriendPlayerPrompt", RobloxGui)

if EnablePromptAgeCheckListener then
	local PromptAgeCheckHandler = Modules.PromptAgeCheckHandler
	local Success, Result = pcall(require, PromptAgeCheckHandler)
	local v4 = nil
	
	if Success then
		v4 = Result
	else
		warn("Failure to Start CoreScript module " .. PromptAgeCheckHandler.Name .. ".\n" .. Result)
		v4 = nil
	end
	if v4 then
		v4.init()
	end
end
ScriptContext:AddCoreScriptLocal("CoreScripts/AvatarContextMenu", RobloxGui)

if FFlagEnableNewBackpack then
	require(CorePackages.Workspace.Packages.Backpack)
else
	coroutine.wrap(safeRequire)(RobloxGui.Modules.BackpackScript)
end
coroutine.wrap(safeRequire)(RobloxGui.Modules.KeyboardUINavigation)
coroutine.wrap(safeRequire)(RobloxGui.Modules.EmotesMenu.EmotesMenuMaster)
coroutine.wrap(safeRequire)(RobloxGui.Modules.Captures.CapturesApp)
coroutine.wrap(safeRequire)(Modules.AvatarEditorPrompts)

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagVirtualCursorModularization then
	coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.VirtualCursorModular)
else
	coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.VirtualCursor)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/VehicleHud", RobloxGui)
ScriptContext:AddCoreScriptLocal("CoreScripts/InviteToGamePrompt", RobloxGui)

if if game:GetEngineFeature("TouchScreenEnabled") then UserInputService.TouchScreenEnabled else UserInputService.TouchEnabled then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ContextActionTouch", RobloxGui)
	RobloxGui:WaitForChild("ControlFrame")
	RobloxGui.ControlFrame:WaitForChild("BottomLeftControl")
	RobloxGui.ControlFrame.BottomLeftControl.Visible = false
end
ScriptContext:AddCoreScriptLocal("CoreScripts/InspectAndBuy", RobloxGui)
coroutine.wrap(function()
	-- upvalues: VRService (copy), RobloxGui (copy)
	if not VRService.VREnabled then
		VRService:GetPropertyChangedSignal("VREnabled"):Wait()
	end
	local VRAvatarHeightScaling = RobloxGui.Modules.VR.VRAvatarHeightScaling
	local Success, Result = pcall(require, VRAvatarHeightScaling)
	
	if not Success then
		warn("Failure to Start CoreScript module " .. VRAvatarHeightScaling.Name .. ".\n" .. Result)
	end
	local VirtualKeyboard = RobloxGui.Modules.VR.VirtualKeyboard
	local Success1, Result1 = pcall(require, VirtualKeyboard)
	
	if not Success1 then
		warn("Failure to Start CoreScript module " .. VirtualKeyboard.Name .. ".\n" .. Result1)
	end
	local UserGui = RobloxGui.Modules.VR.UserGui
	local Success2, Result2 = pcall(require, UserGui)
	
	if not Success2 then
		warn("Failure to Start CoreScript module " .. UserGui.Name .. ".\n" .. Result2)
		
		return
	end
end)()
coroutine.wrap(safeRequire)(RobloxGui.Modules.VR.VRAvatarGestures.VRAvatarGesturesClient)
ScriptContext:AddCoreScriptLocal("CoreScripts/NetworkPause", RobloxGui)

if GetFFlagScreenshotHudApiModule() and not CachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ScreenshotHud", RobloxGui)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/MicrophoneDevicePermissionsLoggingInitializer", RobloxGui)

if game:GetEngineFeature("VoiceChatSupported") then
	ScriptContext:AddCoreScriptLocal("CoreScripts/VoiceDefaultChannel", RobloxGui)
end
coroutine.wrap(function()
	-- upvalues: CorePackages (copy), LocalPlayer (ref), GetCoreScriptsLayersModule (copy), GetFFlagEnableNewInviteMenuIXPModule (copy), NewInviteMenuExperimentManagerModule (copy), GetFFlagReportAnythingAnnotationIXPFunction (copy), TrustAndSafetyIXPManager (copy)
	require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper:InitializeAsync(LocalPlayer.UserId, GetCoreScriptsLayersModule())
	
	if GetFFlagEnableNewInviteMenuIXPModule() then
		NewInviteMenuExperimentManagerModule.default:initialize()
	end
	if GetFFlagReportAnythingAnnotationIXPFunction() then
		TrustAndSafetyIXPManager.default:initialize()
	end
end)()

if not FFlagDebugDisableExperienceChatMainModule then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ExperienceChatMain", RobloxGui)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/ChatEmoteUsage", script.Parent)

if LuaAppEnableToastNotificationsCoreScripts4 then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ToastNotificationGUI", script.Parent)
end
if GetFFlagRtMessagingModule() then
	game:GetService("RtMessagingService")
end
if game:GetEngineFeature("FacialAnimationStreaming2") then
	ScriptContext:AddCoreScriptLocal("CoreScripts/FacialAnimationStreaming", script.Parent)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/AvatarMood", script.Parent)
ScriptContext:AddCoreScriptLocal("CoreScripts/PortalTeleportGUI", RobloxGui)
coroutine.wrap(function()
	-- upvalues: CorePackages (copy)
	local AdsEudsa = CorePackages.Workspace.Packages.AdsEudsa
	local Success, Result = pcall(require, AdsEudsa)
	local Result1 = nil
	
	if Success then
		Result1 = Result
	else
		warn("Failure to Start CoreScript module " .. AdsEudsa.Name .. ".\n" .. Result)
		Result1 = nil
	end
	if Result1 and Result1.starterScript then
		Result1.starterScript()
	end
end)()

if game:GetEngineFeature("EnableAdGuiInteractivityControlRefactor") then
	coroutine.wrap(function()
		-- upvalues: CorePackages (copy)
		local AdGuiInteractivity = CorePackages.Workspace.Packages.AdGuiInteractivity
		local Success, Result = pcall(require, AdGuiInteractivity)
		local Result1 = nil
		
		if Success then
			Result1 = Result
		else
			warn("Failure to Start CoreScript module " .. AdGuiInteractivity.Name .. ".\n" .. Result)
			Result1 = nil
		end
		if Result1 and Result1.starterScript then
			Result1.starterScript()
		end
	end)()
end
coroutine.wrap(function()
	-- upvalues: CorePackages (copy)
	local EnhancedVideo = CorePackages.Workspace.Packages.EnhancedVideo
	local Success, Result = pcall(require, EnhancedVideo)
	local Result1 = nil
	
	if Success then
		Result1 = Result
	else
		warn("Failure to Start CoreScript module " .. EnhancedVideo.Name .. ".\n" .. Result)
		Result1 = nil
	end
	if Result1 and Result1.starterScript then
		Result1.starterScript()
	end
end)()
coroutine.wrap(function()
	-- upvalues: CorePackages (copy)
	local InExperienceClickout = CorePackages.Workspace.Packages.InExperienceClickout
	local Success, Result = pcall(require, InExperienceClickout)
	local Result1 = nil
	
	if Success then
		Result1 = Result
	else
		warn("Failure to Start CoreScript module " .. InExperienceClickout.Name .. ".\n" .. Result)
		Result1 = nil
	end
	if Result1 and Result1.starterScript then
		Result1.starterScript()
	end
end)()

if game:GetEngineFeature("EnableLuaAdPlayer") then
	local AdPlayer = CorePackages.Workspace.Packages.AdPlayer
	local Success3, Result4 = pcall(require, AdPlayer)
	local v5 = nil
	
	if Success3 then
		v5 = Result4
	else
		warn("Failure to Start CoreScript module " .. AdPlayer.Name .. ".\n" .. Result4)
		v5 = nil
	end
	v5.init()
end
if game:GetEngineFeature("EnableVoiceAttention") then
	ScriptContext:AddCoreScriptLocal("CoreScripts/VoiceAttention", script.Parent)
end
if GetFFlagEnableSoundSessionTelemetryModule() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/SoundTelemetry", script.Parent)
end
coroutine.wrap(safeRequire)(Modules.ApolloClient)

if IsCharacterNameHandlerEnabledFunction() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/CharacterNameHandler", script.Parent)
end
if GetFFlagVoiceUserAgency3Module() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/VoiceUserAgency", RobloxGui)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/CoreScriptsGlobalEffects", script.Parent)
require(CorePackages.Workspace.Packages.SoundManager).SoundManager.init()

if GetFFlagEnableSocialContextToastFunction() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/SocialContextToast", RobloxGui)
end
if GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/GameInviteModalGUI", script.Parent)
end
if EnableExperienceNotificationPrompts2 then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ExperienceNotifications", script.Parent)
end
require(CorePackages.Workspace.Packages.Achievements).InExpAchievementManager.new():startUp()

if require(RobloxGui.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/PlayerView", RobloxGui)
end
if EnableSendCameraAccessAnalytics then
	ScriptContext:AddCoreScriptLocal("CoreScripts/SendCameraAccessAnalytics", RobloxGui)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/BulkPurchaseApp", RobloxGui)

if GetEngineFeatureEnablePromptRobuxTransferFunction() then
	ScriptContext:AddCoreScriptLocal("CoreScripts/InExperienceTransferApp", RobloxGui)
end
if AudioFocusManagementEngineFeature then
	ScriptContext:AddCoreScriptLocal("CoreScripts/ExperienceAudioFocusBinder", RobloxGui)
end
if EnableCancelSubscriptionAppEngineFeature and EnableCancelSubscriptionAppLua then
	ScriptContext:AddCoreScriptLocal("CoreScripts/CancelSubscriptionApp", RobloxGui)
end
if EnableRobloxCommerceEngineFeature then
	ScriptContext:AddCoreScriptLocal("CoreScripts/CommercePurchaseApp", RobloxGui)
end
if EnableSystemScrim then
	ScriptContext:AddCoreScriptLocal("CoreScripts/SystemScrim", RobloxGui)
end
ScriptContext:AddCoreScriptLocal("CoreScripts/CoreGuiEnableAnalytics", RobloxGui)

if EnableLinkSharingEvent then
	ScriptContext:AddCoreScriptLocal("CoreScripts/OpenShareSheetWithLink", RobloxGui)
end
if FFlagEnableShareSheet then
	ScriptContext:AddCoreScriptLocal("CoreScripts/UniversalShareSheetScreenGui", RobloxGui)
end
if FFlagLuaAppInExperienceDetailsPrompt then
	ScriptContext:AddCoreScriptLocal("CoreScripts/InExperienceDetailsPrompt", RobloxGui)
end
if not EnableExperienceGenericChallengeRenderingOnLoadingScript then
	coroutine.wrap(function()
		-- upvalues: CorePackages (copy)
		require(CorePackages.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end
local ReactPerfTrackerModule = require(Modules.Common.ReactPerfTracker)

if ReactPerfTrackerModule then
	local NewReactPerfTracker = ReactPerfTrackerModule.new()
	task.delay(5, function()
		-- upvalues: NewReactPerfTracker (copy)
		NewReactPerfTracker:start()
	end)
end
local ReactSchedulingTrackerModule = require(Modules.Common.ReactSchedulingTracker)
task.delay(game:DefineFastInt("ReactSchedulingTrackerStartUpDelayMs", 5000) / 1000, function()
	-- upvalues: ReactSchedulingTrackerModule (copy)
	ReactSchedulingTrackerModule:start()
end)
local MemoryModule = require(CorePackages.Workspace.Packages.Memory)
MemoryModule.start(true, FStringReactSchedulingContext, MemoryModule.MemoryScope.InExperience)

if game:GetEngineFeature("RecordingServicePlaybackApiLua") then
	coroutine.wrap(safeRequire)(CorePackages.Workspace.Packages.ExperienceStateReplay)
end
if FFlagEnableAEGIS2CommsFAEUpsell then
	coroutine.wrap(function()
		-- upvalues: CorePackages (copy)
		local SocialUpsell = CorePackages.Workspace.Packages.SocialUpsell
		local Success, Result = pcall(require, SocialUpsell)
		local Result1 = nil
		
		if Success then
			Result1 = Result
		else
			warn("Failure to Start CoreScript module " .. SocialUpsell.Name .. ".\n" .. Result)
			Result1 = nil
		end
		if Result1 then
			Result1.Overlay.initializeInExpOverlay()
		end
	end)()
end
coroutine.wrap(function()
	-- upvalues: CorePackages (copy), GuiService (copy)
	local Display = CorePackages.Workspace.Packages.Display
	local Success, Result = pcall(require, Display)
	local Result1 = nil
	
	if Success then
		Result1 = Result
	else
		warn("Failure to Start CoreScript module " .. Display.Name .. ".\n" .. Result)
		Result1 = nil
	end
	GuiService:GetPropertyChangedSignal("TopbarInset"):Connect(function()
		-- upvalues: Result1 (copy), GuiService (upval)
		Result1.GetDisplayStore().setTopBarHeight(GuiService.TopbarInset.Height)
	end)
end)()

if EnableCorescriptsProfiler then
	local CoreScriptsProfilerTelemetryFunction = require(CorePackages.Workspace.Packages.CoreScriptsProfiler).CoreScriptsProfilerTelemetry
	
	if CoreScriptsProfilerTelemetryFunction then
		CoreScriptsProfilerTelemetryFunction(if CoreScriptsProfilerTelemetryContext then FStringReactSchedulingContext else nil):start()
	end
end