local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local ScriptContext = game:GetService("ScriptContext")
local NotificationService = game:GetService("NotificationService")

if require(Modules.LuaApp.Flags.FFlagDebugLuaAppValidateProps) then
	_G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = true
end
if math.random(1, 9999) <= game:DefineFastInt("LuaAppEnableReactProfilerHundredthsPercent", 0) then
	_G.__PROFILE__ = true
end
if require(Modules.LuaApp.Navigation.FFlagClosedStartupSequence) then
	game:BindToClose(require(Modules.LuaApp.Navigation.createUniversalApp)())
	
	return
end
if require(CorePackages.Workspace.Packages.SharedFlags).FFlagReactTelemetryEnabled then
	require(CorePackages.Packages.ReactTelemetry).customFields.context = "universal_app"
end
if require(Modules.LuaApp.Flags.FFlagDebugLuaAppsUseDarkTheme) then
	NotificationService.SelectedTheme = "dark"
end
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
LoggingProtocolModule.default:logEventOnce("lua_app_starter_script_requires_begin")
local DiscoveryAppLaunchTracker = require(CorePackages.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker

if DiscoveryAppLaunchTracker.isEnabled() then
	DiscoveryAppLaunchTracker.createDefault(LoggingProtocolModule.default)
	LoggingProtocolModule.default:setDurationLoggerListener(function(p1)
		-- upvalues: DiscoveryAppLaunchTracker (copy)
		DiscoveryAppLaunchTracker.default:onMilestoneChanged(p1)
	end)
	DiscoveryAppLaunchTracker.default:onMilestoneChanged("lua_app_starter_script_requires_begin")
end
require(CorePackages.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager.default:initialize()
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
RoactGamepadModule.Config.Enabled = not IsVRAppBuildFunction()
RoactGamepadModule.Config.DebugKeyboardBindings = {
	[Enum.KeyCode.ButtonA] = { Enum.KeyCode.Space, Enum.KeyCode.Return },
	[Enum.KeyCode.ButtonB] = { Enum.KeyCode.Backspace, Enum.KeyCode.Escape }
}
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))

if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice() then
	require(CorePackages.Workspace.Packages.CrossExperienceVoice).IXPManager.default:initialize()
end
local RoactModule = require(Modules.Common.Roact)
local ReactSchedulerManagerModule = require(CorePackages.Workspace.Packages.ReactSchedulerManager)
local LuaErrorReporterModule = require(Modules.Common.LuaErrorReporter)
local LuaErrorSeverityModule = require(Modules.Common.LuaErrorSeverity)
local LuaAppSentryReporterModule = require(Modules.LuaApp.LuaAppSentryReporter)
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)
local UniversalAppModule = require(Modules.LuaApp.Components.UniversalApp)
local TargetFramerateSetupModule: () -> () = require(Modules.LuaApp.Util.targetFramerateSetup)
local SetUpVRRecenterOnResumeModule: () -> () = require(Modules.LuaApp.Util.setUpVRRecenterOnResume)
local GetIsClientEnrolledInBacktraceRolloutModule = require(Modules.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout)
local FFlagDisableGoogleAnalyticsErrorReporting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting
local IXPService = game:GetService("IXPService")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local IsRandomValueBelow = math.random(1, 100) <= math.clamp(game:DefineFastInt("EnableSentryUARolloutPercentage", 0), 0, 100)
local DebugLuaAppThrowErrorInStarterScript = game:DefineFastFlag("DebugLuaAppThrowErrorInStarterScript", false)

if not game:DefineFastFlag("GranularExportsBucket", false) then
	if not require(Modules.LuaApp.Flags.FFlagProfilePlatformGranularExports) then
		require(CorePackages.Workspace.Packages.ProfilePlatform)
	end
	if not game:DefineFastFlag("LoginV2GranularExports", false) then
		require(CorePackages.Workspace.Packages.LoginV2)
	end
	if not require(CorePackages.Workspace.Packages.SharedFlags).FFlagGenericAbuseReportingGranularExports then
		require(CorePackages.Workspace.Packages.GenericAbuseReporting)
	end
	if not game:DefineFastFlag("SquadsGranularExports", false) then
		require(CorePackages.Workspace.Packages.Squads)
		require(CorePackages.Workspace.Packages.SquadsCore)
	end
	if not game:DefineFastFlag("AppChatGranularExports", false) then
		require(CorePackages.Workspace.Packages.AppChat)
	end
	if not game:DefineFastFlag("FriendsLandingExports", false) then
		require(CorePackages.Workspace.Packages.FriendsLanding)
	end
	if not game:DefineFastFlag("EditProfileGranularExports", false) then
		require(CorePackages.Workspace.Packages.EditProfile)
	end
end
LoggingProtocolModule.default:logEventOnce("lua_app_starter_script_requires_end")

if not UserSettings().GameSettings:InStudioMode() then
	local v1 = nil
	local ErrorDetailed = nil
	local v2 = nil
	
	if GetIsClientEnrolledInBacktraceRolloutModule() then
		v1 = LuaAppBacktraceReporterModule
		ErrorDetailed = ScriptContext.ErrorDetailed
	end
	if IsRandomValueBelow then
		v2 = LuaAppSentryReporterModule
		ErrorDetailed = ScriptContext.ErrorDetailed
	end
	local NewLuaErrorReporter = LuaErrorReporterModule.new(ErrorDetailed, nil, v1, LuaErrorSeverityModule.ERROR, v2)
	NewLuaErrorReporter:setCurrentApp("LuaApp")
	
	if not FFlagDisableGoogleAnalyticsErrorReporting then
		NewLuaErrorReporter:startQueueTimers()
	end
end
require(CorePackages.Workspace.Packages.DataModelStreaming).initDataModelStreamWsClient()

if DebugLuaAppThrowErrorInStarterScript then
	error("This is a test error raised by FFlagDebugLuaAppThrowErrorInStarterScript")
end
LoggingProtocolModule.default:logEventOnce("lua_app_starter_script_wait_for_player_begin")

if game.Players.LocalPlayer == nil then
	game.Players.PlayerAdded:Wait()
end
LoggingProtocolModule.default:logEventOnce("lua_app_starter_script_wait_for_player_end")
local Connection = nil
Connection = game:GetService("RunService").RenderStepped:Connect(function()
	-- upvalues: Connection (ref), GetDefaultQualityLevelFunction (copy)
	if Connection then
		Connection:Disconnect()
	end
	settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
end)
ReactSchedulerManagerModule.startup()
local _ = RoactModule.mount(RoactModule.createElement(UniversalAppModule, { appName = "LuaApp" }), CoreGui, "App")

if UserSettings().GameSettings:InStudioMode() then
	local RegisteredUserLayersToStatus = IXPService:GetRegisteredUserLayersToStatus()
	
	for appUserLayer in AppUserLayers do
		if not RegisteredUserLayersToStatus[AppUserLayers[appUserLayer]] then
			warn("IXP layer has not been registered: " .. AppUserLayers[appUserLayer])
		end
	end
end
if IsVRAppBuildFunction() then
	TargetFramerateSetupModule()
	SetUpVRRecenterOnResumeModule()
end
SoundManager.init()

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagDebugForceConsoleSafeInsets and UserSettings().GameSettings:InStudioMode() then
	require(CorePackages.Workspace.Packages.Display).GetDisplayStore().forceConsoleSafeInsets()
end
if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAvatarJointUpgradeInUA and require(CorePackages.Packages.Thumbnailing).EmoteUtility.EmoteUtilitySupportAJU then
	game:GetService("StarterPlayer").AvatarJointUpgrade = Enum.RolloutState.Enabled
end
local MemoryModule = require(CorePackages.Workspace.Packages.Memory)

if game:DefineFastFlag("EnableCorescriptTrackerForLuaApp", false) then
	MemoryModule.start(true, nil, MemoryModule.MemoryScope.UniversalApp)
else
	MemoryModule.start(false)
end
LoggingProtocolModule.default:logEventOnce("lua_app_starter_script_end")