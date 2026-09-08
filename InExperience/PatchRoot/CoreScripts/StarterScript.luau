local corePackagesService = game:GetService("CorePackages")
local scriptContextService = game:GetService("ScriptContext")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
scriptContextService:AddCoreScriptLocal("CoreScripts/CoreScriptErrorReporter", robloxGui)
local roactModule = require(corePackagesService.Packages.Roact)
local schedulerModule = require(corePackagesService.Packages.Scheduler)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local fFlagUseRoactGlobalConfigInCoreScriptsModule = require(robloxGui.Modules.Flags.FFlagUseRoactGlobalConfigInCoreScripts)
local getFFlagScreenshotHudApiModule = require(robloxGui.Modules.Flags.GetFFlagScreenshotHudApi)
local getFFlagEnableNewInviteMenuIXPModule = require(modules.Flags.GetFFlagEnableNewInviteMenuIXP)
local newInviteMenuExperimentManagerModule = require(modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
local getFFlagEnableSoundSessionTelemetryModule = require(modules.Flags.GetFFlagEnableSoundSessionTelemetry)
local getFFlagReportAnythingAnnotationIXP = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local trustAndSafetyIXPManager = require(corePackagesService.Workspace.Packages.TrustAndSafetyIxp).TrustAndSafetyIXPManager
local getCoreScriptsLayersModule = require(modules.Experiment.GetCoreScriptsLayers)
local getFFlagRtMessagingModule = require(robloxGui.Modules.Flags.GetFFlagRtMessaging)
local addPublishAssetPrompt6 = game:DefineFastFlag("AddPublishAssetPrompt6", false)
local enablePromptAgeCheckListener = game:DefineFastFlag("EnablePromptAgeCheckListener", false)
local isCharacterNameHandlerEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).isCharacterNameHandlerEnabled
local getFFlagEnableSocialContextToast = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableSocialContextToast
local getFFlagEnableAppChatInExperience = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local getFFlagChromeCentralizedConfiguration = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagChromeCentralizedConfiguration
local getFFlagEnableCrossExpVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice
local fStringReactSchedulingContext = require(corePackagesService.Workspace.Packages.SharedFlags).FStringReactSchedulingContext
local luaAppEnableToastNotificationsCoreScripts4 = game:DefineFastFlag("LuaAppEnableToastNotificationsCoreScripts4", false)
local disableLuobuWarningToast = game:DefineFastFlag("DisableLuobuWarningToast", false)
local fFlagDebugDisableExperienceChatMainModule = require(robloxGui.Modules.Flags.FFlagDebugDisableExperienceChatMain)
local getFFlagVoiceUserAgency3Module = require(robloxGui.Modules.Flags.GetFFlagVoiceUserAgency3)
local getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(robloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local enableSendCameraAccessAnalytics = game:DefineFastFlag("EnableSendCameraAccessAnalytics", false)
local enableExperienceNotificationPrompts2 = game:DefineFastFlag("EnableExperienceNotificationPrompts2", false)
local enableCancelSubscriptionAppEngineFeature = game:GetEngineFeature("EnableCancelSubscriptionApp")
local enableCancelSubscriptionAppLua = game:DefineFastFlag("EnableCancelSubscriptionAppLua", false)
local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local enableExperienceGenericChallengeRenderingOnLoadingScript = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false)
local enableRobloxCommerceEngineFeature = game:GetEngineFeature("EnableRobloxCommerce")
local enableLinkSharingEvent = game:DefineFastFlag("EnableLinkSharingEvent", false)
local fFlagEnableShareSheet = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableShareSheet
local playerFeedbackEnabledEngineFeature = game:GetEngineFeature("PlayerFeedbackEnabled")
local fFlagLuaAppInExperienceDetailsPrompt = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local enableSystemScrim = game:DefineFastFlag("EnableSystemScrim", false)
local enableCoreUISystemV2 = game:DefineFastFlag("EnableCoreUISystemV2", false)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local enableCorescriptsProfiler = game:DefineFastFlag("EnableCorescriptsProfiler", false)
local coreScriptsProfilerTelemetryContext = game:DefineFastFlag("CoreScriptsProfilerTelemetryContext", false)
local enableSelfieQRCode = game:DefineFastFlag("SelfieFrontendConsoleDesktop3", false) and game:GetEngineFeature("EnableSelfieQRCode")
local getEngineFeatureEnablePromptRobuxTransfer = require(corePackagesService.Workspace.Packages.SharedFlags).GetEngineFeatureEnablePromptRobuxTransfer
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local UIBloxInGameConfig = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig
UIBloxModule.init(UIBloxInGameConfig)

if enableCoreUISystemV2 then
	require(corePackagesService.Workspace.Packages.System)
end
local fFlagTopBarRefactor = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
require(corePackagesService.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize()

if game:DefineFastFlag("LuaAppUseAppHttpStoreInExperience", false) then
	require(corePackagesService.Workspace.Packages.HttpStore).Instance._create({})
end
local reactSchedulerIXPConfig = require(corePackagesService.Workspace.Packages.SharedFlags).GetReactSchedulerIXPConfig()

if reactSchedulerIXPConfig then
	schedulerModule.unstable_setSchedulerFlags(reactSchedulerIXPConfig)
end
if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableSchedulerFlagOverrides then
	local inExp = require(corePackagesService.Workspace.Packages.SharedFlags).GetSchedulerFlagOverrides.getInExp()
	
	if inExp then
		schedulerModule.unstable_setSchedulerFlags(inExp)
	end
end
local fFlagEnableAEGIS2CommsFAEUpsell = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
if game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
	scriptContextService:AddCoreScriptLocal("CoreScripts/DefaultListenerLocation", script.Parent)
end
if getFFlagEnableAppChatInExperience() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/AppChatMain", robloxGui)
end
if getFFlagEnableCrossExpVoice() then
	require(corePackagesService.Workspace.Packages.CrossExperienceVoice).IXPManager.default:initialize()
end
local _ = require(corePackagesService.Workspace.Packages.InExperienceSessionization)

if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then
	local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
	expChatModule.GlobalFlags.AvatarChatEnabled = false
	expChatModule.GlobalFlags.ChromeEnabled = true
end
if require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions() then
	require(corePackagesService.Workspace.Packages.ExpChat).GlobalFlags.JoinWithoutMicPermissions = true
end
local inExperienceInterventionApp = game:DefineFastFlag("InExperienceInterventionApp", false)
local fFlagLuaAppEnableInExperienceDataModelStreamStarter = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaAppEnableInExperienceDataModelStreamStarter

if fFlagUseRoactGlobalConfigInCoreScriptsModule and runService:IsStudio() then
	roactModule.setGlobalConfig({ propValidation = true, elementTracing = true })
end
local UIBlox = require(corePackagesService.Packages.InGameMenuDependencies).UIBlox

if UIBlox ~= UIBloxModule then
	UIBlox.init(UIBloxInGameConfig)
end
local sounds = Instance.new("Folder")
sounds.Name = "Sounds"
sounds.Parent = robloxGui

local function safeRequire(p1)
	local ok, status = pcall(require, p1)
	
	if ok then
		return status
	end
	warn("Failure to Start CoreScript module " .. p0.Name .. ".\n" .. status)
end

scriptContextService:AddCoreScriptLocal("CoreScripts/NotificationScript2", robloxGui)

if fFlagLuaAppEnableInExperienceDataModelStreamStarter then
	scriptContextService:AddCoreScriptLocal("CoreScripts/InExperienceDataModelStreamStarter", script.Parent)
end
if game:GetEngineFeature("ProtocolLaunchPrivateChannelUpdateCheckEngineFeature") then
	local var1
	local channelUpdatePrompt = modules.ChannelUpdatePrompt
	local ok, status = pcall(require, channelUpdatePrompt)
	
	if ok then
		var1 = status
	else
		warn("Failure to Start CoreScript module " .. channelUpdatePrompt.Name .. ".\n" .. status)
		var1 = nil
	end
	if var1 then
		var1.init()
	end
end
if getFFlagChromeCentralizedConfiguration() then
	coroutine.wrap(safeRequire)(modules.Chrome.ConfigureChrome)
end
coroutine.wrap(safeRequire)(modules.SelfieView)
coroutine.wrap(safeRequire)(modules.TopBar)

if require(corePackagesService.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled) then
	coroutine.wrap(safeRequire)(modules.InExperienceSideSheet)
end
if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableWhatsNew then
	coroutine.wrap(safeRequire)(modules.InGameWhatsNew)
end
if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAppNavMyStatsTab then
	local var2 = coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
	local var3 = coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.BuildExperience)
	local var4 = var3 and (var2 and var2:hasBuildMode())
	
	if var3 then
		var3.mountCreatorAgentResumeToastReceiver(var4 == true)
	end
	if var3 and var4 then
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		var3.mountChatSheet()
	end
end
if fFlagTopBarRefactor then
	local var5 = coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.InExperienceOverlay)
	
	if var5 then
		var5.createOverlay()
	end
end
if game:GetEngineFeature("LuobuModerationStatus") then
	coroutine.wrap(function()
		-- upvalues: modules (ref)
		local watermark = modules.Watermark
		local ok, status = pcall(require, watermark)
		
		if ok then
			return
		end
		warn("Failure to Start CoreScript module " .. watermark.Name .. ".\n" .. status)
	end)()
end
if inExperienceInterventionApp then
	coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.InExperienceIntervention)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/MainBotChatScript2", robloxGui)

if game:GetEngineFeature("ProximityPrompts") then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ProximityPrompt", robloxGui)
end
if game:GetEngineFeature("ValidateUGCBodyAPIFeature") then
	require(modules.Server.UGCValidation.UGCValidationFunctionInstaller)()
end
coroutine.wrap(function()
	-- upvalues: scriptContextService (ref), robloxGui (ref)
	scriptContextService:AddCoreScriptLocal("CoreScripts/ScreenTimeInGame", robloxGui)
end)()

if not disableLuobuWarningToast then
	coroutine.wrap(function()
		-- upvalues: cachedPolicyServiceModule (ref), modules (ref)
		if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
			if not game:IsLoaded() then
				game.Loaded:Wait()
			end
			local luobuWarningToast = modules.LuobuWarningToast
			local ok, status = pcall(require, luobuWarningToast)
			
			if ok then return end
			warn("Failure to Start CoreScript module " .. luobuWarningToast.Name .. ".\n" .. status)
		end
	end)()
end
scriptContextService:AddCoreScriptLocal("CoreScripts/PerformanceStatsManagerScript", robloxGui)
scriptContextService:AddCoreScriptLocal("CoreScripts/PlayerRagdoll", robloxGui)
coroutine.wrap(safeRequire)(robloxGui.Modules.ChatSelector)
coroutine.wrap(safeRequire)(robloxGui.Modules.PlayerList.PlayerListManager)
local _ = nil
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta")
end)

if game:GetEngineFeature("EnableBubbleChatFromChatService") or ok and status then
	scriptContextService:AddCoreScriptLocal("CoreScripts/PlayerBillboards", robloxGui)
end
coroutine.wrap(function()
	-- upvalues: corePackagesService (ref)
	local var6
	local purchasePrompt = corePackagesService.Workspace.Packages.PurchasePrompt
	local ok, status = pcall(require, purchasePrompt)
	
	if ok then
		var6 = status
	else
		warn("Failure to Start CoreScript module " .. purchasePrompt.Name .. ".\n" .. status)
		var6 = nil
	end
	if var6 then
		var6.mountPurchasePrompt()
	end
end)()

if addPublishAssetPrompt6 then
	coroutine.wrap(safeRequire)(modules.PublishAssetPrompt)
end
coroutine.wrap(safeRequire)(modules.ExperienceEvents.ExperienceEventsApp)

if playerFeedbackEnabledEngineFeature then
	coroutine.wrap(safeRequire)(modules.PlayerFeedback)
end
coroutine.wrap(safeRequire)(modules.Groups.GroupsApp)
coroutine.wrap(safeRequire)(modules.AvatarGeneration.SelfieConsent)

if enableSelfieQRCode then
	coroutine.wrap(safeRequire)(modules.AvatarGeneration.SelfieQr)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/BlockPlayerPrompt", robloxGui)
scriptContextService:AddCoreScriptLocal("CoreScripts/FriendPlayerPrompt", robloxGui)

if enablePromptAgeCheckListener then
	local var6
	local promptAgeCheckHandler = modules.PromptAgeCheckHandler
	local ok_1, status_1 = pcall(require, promptAgeCheckHandler)
	
	if ok_1 then
		var6 = status_1
	else
		warn("Failure to Start CoreScript module " .. promptAgeCheckHandler.Name .. ".\n" .. status_1)
		var6 = nil
	end
	if var6 then
		var6.init()
	end
end
scriptContextService:AddCoreScriptLocal("CoreScripts/AvatarContextMenu", robloxGui)

if fFlagEnableNewBackpack then
	require(corePackagesService.Workspace.Packages.Backpack)
else
	coroutine.wrap(safeRequire)(robloxGui.Modules.BackpackScript)
end
coroutine.wrap(safeRequire)(robloxGui.Modules.KeyboardUINavigation)
coroutine.wrap(safeRequire)(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
coroutine.wrap(safeRequire)(robloxGui.Modules.Captures.CapturesApp)
coroutine.wrap(safeRequire)(modules.AvatarEditorPrompts)

if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagVirtualCursorModularization then
	coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.VirtualCursorModular)
else
	coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.VirtualCursor)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/VehicleHud", robloxGui)
scriptContextService:AddCoreScriptLocal("CoreScripts/InviteToGamePrompt", robloxGui)

if if game:GetEngineFeature("TouchScreenEnabled") then userInputService.TouchScreenEnabled else userInputService.TouchEnabled then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ContextActionTouch", robloxGui)
	robloxGui:WaitForChild("ControlFrame")
	robloxGui.ControlFrame:WaitForChild("BottomLeftControl")
	robloxGui.ControlFrame.BottomLeftControl.Visible = false
end
scriptContextService:AddCoreScriptLocal("CoreScripts/InspectAndBuy", robloxGui)
coroutine.wrap(function()
	-- upvalues: VRService (ref), robloxGui (ref)
	if not VRService.VREnabled then
		VRService:GetPropertyChangedSignal("VREnabled"):Wait()
	end
	local VRAvatarHeightScaling = robloxGui.Modules.VR.VRAvatarHeightScaling
	local ok, status = pcall(require, VRAvatarHeightScaling)
	
	if not ok then
		warn("Failure to Start CoreScript module " .. VRAvatarHeightScaling.Name .. ".\n" .. status)
	end
	local virtualKeyboard = robloxGui.Modules.VR.VirtualKeyboard
	local ok_1, status_1 = pcall(require, virtualKeyboard)
	
	if not ok_1 then
		warn("Failure to Start CoreScript module " .. virtualKeyboard.Name .. ".\n" .. status_1)
	end
	local userGui = robloxGui.Modules.VR.UserGui
	local ok_2, status_2 = pcall(require, userGui)
	
	if ok_2 then
		return
	end
	warn("Failure to Start CoreScript module " .. userGui.Name .. ".\n" .. status_2)
end)()
coroutine.wrap(safeRequire)(robloxGui.Modules.VR.VRAvatarGestures.VRAvatarGesturesClient)
scriptContextService:AddCoreScriptLocal("CoreScripts/NetworkPause", robloxGui)

if getFFlagScreenshotHudApiModule() and not cachedPolicyServiceModule:IsSubjectToChinaPolicies() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ScreenshotHud", robloxGui)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/MicrophoneDevicePermissionsLoggingInitializer", robloxGui)

if game:GetEngineFeature("VoiceChatSupported") then
	scriptContextService:AddCoreScriptLocal("CoreScripts/VoiceDefaultChannel", robloxGui)
end
coroutine.wrap(function()
	-- upvalues: corePackagesService (ref), localPlayer (write), getCoreScriptsLayersModule (ref), getFFlagEnableNewInviteMenuIXPModule (ref), newInviteMenuExperimentManagerModule (ref), getFFlagReportAnythingAnnotationIXP (ref), trustAndSafetyIXPManager (ref)
	require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper:InitializeAsync(localPlayer.UserId, getCoreScriptsLayersModule())
	
	if getFFlagEnableNewInviteMenuIXPModule() then
		newInviteMenuExperimentManagerModule.default:initialize()
	end
	if getFFlagReportAnythingAnnotationIXP() then
		trustAndSafetyIXPManager.default:initialize()
	end
end)()

if not fFlagDebugDisableExperienceChatMainModule then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ExperienceChatMain", robloxGui)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/ChatEmoteUsage", script.Parent)

if luaAppEnableToastNotificationsCoreScripts4 then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ToastNotificationGUI", script.Parent)
end
if getFFlagRtMessagingModule() then
	game:GetService("RtMessagingService")
end
if game:GetEngineFeature("FacialAnimationStreaming2") then
	scriptContextService:AddCoreScriptLocal("CoreScripts/FacialAnimationStreaming", script.Parent)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/AvatarMood", script.Parent)
scriptContextService:AddCoreScriptLocal("CoreScripts/PortalTeleportGUI", robloxGui)
coroutine.wrap(function()
	-- upvalues: corePackagesService (ref)
	local var7
	local adsEudsa = corePackagesService.Workspace.Packages.AdsEudsa
	local ok, status = pcall(require, adsEudsa)
	
	if ok then
		var7 = status
	else
		warn("Failure to Start CoreScript module " .. adsEudsa.Name .. ".\n" .. status)
		var7 = nil
	end
	if var7 and var7.starterScript then
		var7.starterScript()
	end
end)()

if game:GetEngineFeature("EnableAdGuiInteractivityControlRefactor") then
	coroutine.wrap(function()
		-- upvalues: corePackagesService (ref)
		local var7
		local adGuiInteractivity = corePackagesService.Workspace.Packages.AdGuiInteractivity
		local ok, status = pcall(require, adGuiInteractivity)
		
		if ok then
			var7 = status
		else
			warn("Failure to Start CoreScript module " .. adGuiInteractivity.Name .. ".\n" .. status)
			var7 = nil
		end
		if var7 and var7.starterScript then
			var7.starterScript()
		end
	end)()
end
coroutine.wrap(function()
	-- upvalues: corePackagesService (ref)
	local var7
	local enhancedVideo = corePackagesService.Workspace.Packages.EnhancedVideo
	local ok, status = pcall(require, enhancedVideo)
	
	if ok then
		var7 = status
	else
		warn("Failure to Start CoreScript module " .. enhancedVideo.Name .. ".\n" .. status)
		var7 = nil
	end
	if var7 and var7.starterScript then
		var7.starterScript()
	end
end)()
coroutine.wrap(function()
	-- upvalues: corePackagesService (ref)
	local var7
	local inExperienceClickout = corePackagesService.Workspace.Packages.InExperienceClickout
	local ok, status = pcall(require, inExperienceClickout)
	
	if ok then
		var7 = status
	else
		warn("Failure to Start CoreScript module " .. inExperienceClickout.Name .. ".\n" .. status)
		var7 = nil
	end
	if var7 and var7.starterScript then
		var7.starterScript()
	end
end)()

if game:GetEngineFeature("EnableLuaAdPlayer") then
	local var7
	local adPlayer = corePackagesService.Workspace.Packages.AdPlayer
	local ok_1, status_1 = pcall(require, adPlayer)
	
	if ok_1 then
		var7 = status_1
	else
		warn("Failure to Start CoreScript module " .. adPlayer.Name .. ".\n" .. status_1)
		var7 = nil
	end
	var7.init()
end
if game:GetEngineFeature("EnableVoiceAttention") then
	scriptContextService:AddCoreScriptLocal("CoreScripts/VoiceAttention", script.Parent)
end
if getFFlagEnableSoundSessionTelemetryModule() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/SoundTelemetry", script.Parent)
end
coroutine.wrap(safeRequire)(modules.ApolloClient)

if isCharacterNameHandlerEnabled() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/CharacterNameHandler", script.Parent)
end
if getFFlagVoiceUserAgency3Module() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/VoiceUserAgency", robloxGui)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/CoreScriptsGlobalEffects", script.Parent)
require(corePackagesService.Workspace.Packages.SoundManager).SoundManager.init()

if getFFlagEnableSocialContextToast() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/SocialContextToast", robloxGui)
end
if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/GameInviteModalGUI", script.Parent)
end
if enableExperienceNotificationPrompts2 then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ExperienceNotifications", script.Parent)
end
require(corePackagesService.Workspace.Packages.Achievements).InExpAchievementManager.new():startUp()

if require(robloxGui.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled)() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/PlayerView", robloxGui)
end
if enableSendCameraAccessAnalytics then
	scriptContextService:AddCoreScriptLocal("CoreScripts/SendCameraAccessAnalytics", robloxGui)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/BulkPurchaseApp", robloxGui)

if getEngineFeatureEnablePromptRobuxTransfer() then
	scriptContextService:AddCoreScriptLocal("CoreScripts/InExperienceTransferApp", robloxGui)
end
if audioFocusManagementEngineFeature then
	scriptContextService:AddCoreScriptLocal("CoreScripts/ExperienceAudioFocusBinder", robloxGui)
end
if enableCancelSubscriptionAppEngineFeature and enableCancelSubscriptionAppLua then
	scriptContextService:AddCoreScriptLocal("CoreScripts/CancelSubscriptionApp", robloxGui)
end
if enableRobloxCommerceEngineFeature then
	scriptContextService:AddCoreScriptLocal("CoreScripts/CommercePurchaseApp", robloxGui)
end
if enableSystemScrim then
	scriptContextService:AddCoreScriptLocal("CoreScripts/SystemScrim", robloxGui)
end
scriptContextService:AddCoreScriptLocal("CoreScripts/CoreGuiEnableAnalytics", robloxGui)

if enableLinkSharingEvent then
	scriptContextService:AddCoreScriptLocal("CoreScripts/OpenShareSheetWithLink", robloxGui)
end
if fFlagEnableShareSheet then
	scriptContextService:AddCoreScriptLocal("CoreScripts/UniversalShareSheetScreenGui", robloxGui)
end
if fFlagLuaAppInExperienceDetailsPrompt then
	scriptContextService:AddCoreScriptLocal("CoreScripts/InExperienceDetailsPrompt", robloxGui)
end
if not enableExperienceGenericChallengeRenderingOnLoadingScript then
	coroutine.wrap(function()
		-- upvalues: corePackagesService (ref)
		require(corePackagesService.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end
local reactPerfTrackerModule = require(modules.Common.ReactPerfTracker)

if reactPerfTrackerModule then
	local var8 = reactPerfTrackerModule.new()
	task.delay(5, function()
		-- upvalues: var8 (ref)
		var8:start()
	end)
end
local reactSchedulingTrackerModule = require(modules.Common.ReactSchedulingTracker)
task.delay(game:DefineFastInt("ReactSchedulingTrackerStartUpDelayMs", 5000) / 1000, function()
	-- upvalues: reactSchedulingTrackerModule (ref)
	reactSchedulingTrackerModule:start()
end)
local memoryModule = require(corePackagesService.Workspace.Packages.Memory)
memoryModule.start(true, fStringReactSchedulingContext, memoryModule.MemoryScope.InExperience)

if game:GetEngineFeature("RecordingServicePlaybackApiLua") then
	coroutine.wrap(safeRequire)(corePackagesService.Workspace.Packages.ExperienceStateReplay)
end
if fFlagEnableAEGIS2CommsFAEUpsell then
	coroutine.wrap(function()
		-- upvalues: corePackagesService (ref)
		local var9
		local socialUpsell = corePackagesService.Workspace.Packages.SocialUpsell
		local ok, status = pcall(require, socialUpsell)
		
		if ok then
			var9 = status
		else
			warn("Failure to Start CoreScript module " .. socialUpsell.Name .. ".\n" .. status)
			var9 = nil
		end
		if var9 then
			var9.Overlay.initializeInExpOverlay()
		end
	end)()
end
coroutine.wrap(function()
	-- upvalues: corePackagesService (ref), guiService (ref)
	local var9
	local display = corePackagesService.Workspace.Packages.Display
	local ok, status = pcall(require, display)
	
	if ok then
		var9 = status
	else
		warn("Failure to Start CoreScript module " .. display.Name .. ".\n" .. status)
		var9 = nil
	end
	guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function()
		-- upvalues: var9 (ref), guiService (copy)
		var9.GetDisplayStore().setTopBarHeight(guiService.TopbarInset.Height)
	end)
end)()

if enableCorescriptsProfiler then
	local coreScriptsProfilerTelemetry = require(corePackagesService.Workspace.Packages.CoreScriptsProfiler).CoreScriptsProfilerTelemetry
	
	if coreScriptsProfilerTelemetry then
		coreScriptsProfilerTelemetry(if coreScriptsProfilerTelemetryContext then fStringReactSchedulingContext else nil):start()
	end
end