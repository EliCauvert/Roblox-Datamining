local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local TeleportService = game:GetService("TeleportService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local VRService = game:GetService("VRService")
local CorePackages = game:GetService("CorePackages")
local TelemetryService = game:GetService("TelemetryService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
CorePackages:WaitForChild("Workspace"):WaitForChild("Packages", if game:DefineFastFlag("ConnectionRemoveLoadingTimeout", false) then 1e999 else nil)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ErrorPromptModule = require(RobloxGui.Modules.ErrorPrompt)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local DebugEnableErrorStringTesting = game:DefineFastFlag("DebugEnableErrorStringTesting", false)
local ShouldMuteUnlocalizedError = game:DefineFastFlag("ShouldMuteUnlocalizedError", false)
local ShowScreentimeLockoutKickMessage = game:DefineFastFlag("ShowScreentimeLockoutKickMessage", false)
local config = {
	eventName = "ConnectionEvent",
	description = "Counter to track connection events.",
	links = "https://roblox.atlassian.net/browse/CSC-585",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 7, 31 }
}
local PotentialClientTimeoutSeconds = game:DefineFastInt("PotentialClientTimeoutSeconds", 7200)
local MaxKickMessageLength = game:DefineFastInt("MaxKickMessageLength", 200)
local RefactorReconnectUnblockTeleport = game:DefineFastFlag("RefactorReconnectUnblockTeleport", false)
local ConnectionEnableAutoReconnect = game:DefineFastFlag("ConnectionEnableAutoReconnect", false)
local ConnectionAutoReconnectFirstDelayMs = game:DefineFastInt("ConnectionAutoReconnectFirstDelayMs", 2000)
local ConnectionAutoReconnectBaseDelayMs = game:DefineFastInt("ConnectionAutoReconnectBaseDelayMs", 5000)
local ConnectionAutoReconnectMaxDelayMs = game:DefineFastInt("ConnectionAutoReconnectMaxDelayMs", 20000)
local ConnectionAutoReconnectJitterMs = game:DefineFastInt("ConnectionAutoReconnectJitterMs", 2000)
local ConnectionAutoReconnectMaxDurationSeconds = game:DefineFastInt("ConnectionAutoReconnectMaxDurationSeconds", 300)
local RbxTransportHandleUniqueErrors = game:DefineFastFlag("RbxTransportHandleUniqueErrors", false)
local RbxTransportUniqueConnectionErrorsEngineFeature = game:GetEngineFeature("RbxTransportUniqueConnectionErrors")
local _Random = if ConnectionEnableAutoReconnect then Random.new() else nil
local CoreGuiOverflowDetectionEngineFeature = game:GetEngineFeature("CoreGuiOverflowDetection")
local FFlagCoreScriptShowTeleportPromptModule = require(RobloxGui.Modules.Flags.FFlagCoreScriptShowTeleportPrompt)
local FFlagAllowDisconnectGuiForOkUnknownModule = require(RobloxGui.Modules.Flags.FFlagAllowDisconnectGuiForOkUnknown)
local EnableExperienceGenericChallengeRenderingConnection2 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingConnection2", false)
local GetFFlagDisplayChannelNameOnErrorPromptModule = require(RobloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)

local function _(p1, p2)
	local Success, Result = pcall(function(): number
		-- upvalues: p1 (copy)
		return (tonumber(settings():GetFVariable(p1)))
	end)
	
	return Success and Result or p2
end

local _ = function(p1, p2)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return settings():GetFVariable(p1)
	end)
	
	return Success and Result or p2
end

local _ = function(p1: number)
	-- upvalues: ConnectionAutoReconnectFirstDelayMs (copy), ConnectionAutoReconnectBaseDelayMs (copy), ConnectionAutoReconnectMaxDelayMs (copy), ConnectionAutoReconnectJitterMs (copy), _Random (ref)
	local ConnectionAutoReconnectFirstDelayMs1 = if p1 <= 1 then ConnectionAutoReconnectFirstDelayMs elseif p1 == 2 then ConnectionAutoReconnectBaseDelayMs else math.min(ConnectionAutoReconnectBaseDelayMs * 2 ^ (p1 - 2), ConnectionAutoReconnectMaxDelayMs)
	
	if ConnectionAutoReconnectJitterMs > 0 then
		ConnectionAutoReconnectFirstDelayMs1 += _Random:NextInteger(0, ConnectionAutoReconnectJitterMs)
	end
	return ConnectionAutoReconnectFirstDelayMs1 / 1000
end

local v1 = "DefaultTimeoutTimeMs"
local Success, Result = pcall(function(): number
	-- upvalues: v1 (copy)
	return (tonumber(settings():GetFVariable(v1)))
end)
local v2 = (Success and Result or 10000) / 1000
local ReconnectDisabledFFlag = settings():GetFFlag("ReconnectDisabled")
local v3 = "ReconnectDisabledReason"
local Success1, Result1 = pcall(function()
	-- upvalues: v3 (copy)
	return settings():GetFVariable(v3)
end)
local Result1_1 = Success1 and Result1 or "We're sorry, Roblox is temporarily unavailable.  Please try again later."
local CurrentTime = tick()
local AddPlacelaunchDeviceBlock2 = game:DefineFastFlag("AddPlacelaunchDeviceBlock2", false)
local AddContextualPlayabilityConnectionErrors = game:DefineFastFlag("AddContextualPlayabilityConnectionErrors", false)
local AddVipOwnerNotPresentConnectionError = game:DefineFastFlag("AddVipOwnerNotPresentConnectionError", false)
local VipOwnerNotPresentEnableReconnect = game:DefineFastFlag("VipOwnerNotPresentEnableReconnect", false)
local RAKickLogic2 = game:DefineFastFlag("RAKickLogic2", false)
local RAMinEngineVersion = game:DefineFastInt("RAMinEngineVersion", 725)
local Flag = false

if RAKickLogic2 then
	local Number: number? = tonumber(string.match(RunService:GetRobloxVersion(), "%.(%d+)%."))
	
	if Number and RAMinEngineVersion <= Number then
		Flag = true
	end
end
local FFlagConnectionAmpParentalApprovalUpsell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionAmpParentalApprovalUpsell
local FFlagConnectionParentalApprovalLeaveOnly = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionParentalApprovalLeaveOnly
local FFlagConnectionUpsellAnalytics = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionUpsellAnalytics
local IsPioneerLaunchFunction = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local FFlagErrorPromptUseLeaveGameHelper = require(CorePackages.Workspace.Packages.SharedFlags).FFlagErrorPromptUseLeaveGameHelper or IsPioneerLaunchFunction()
local LeaveGameModule = if FFlagErrorPromptUseLeaveGameHelper then require(RobloxGui.Modules.Settings.leaveGame) else nil
local FFlagConnectionRelaunchBuildPlaytest = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionRelaunchBuildPlaytest
local PlaytestReconnectModule = if FFlagConnectionRelaunchBuildPlaytest then require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.playtestReconnect) else nil
local AddCollaborationCoreGatedConnectionError2 = game:DefineFastFlag("AddCollaborationCoreGatedConnectionError2", false)
local PlacelaunchCollaborationCoreGatedConnectionErrorEngineFeature = game:GetEngineFeature("PlacelaunchCollaborationCoreGatedConnectionError")
local ConnectionAmpUpsellOnLeaveModule = require(RobloxGui.Modules.ConnectionAmpUpsellOnLeave)
local BuildRobloxExperienceKickContentModule = require(CorePackages.Workspace.Packages.InterventionShared.buildRobloxExperienceKickContent)
local ShowFeatureRestrictionDirectModule = require(CorePackages.Workspace.Packages.UniversalFeatureRestrictions.showFeatureRestrictionDirect)

local function fetchUniverseIdFromPlaceId(PlaceId)
	-- upvalues: Url (copy), HttpRbxApiService (copy), HttpService (copy)
	local Success, Result = pcall(HttpRbxApiService.GetAsyncFullUrl, HttpRbxApiService, (string.format("%suniverses/v1/places/%d/universe", Url.APIS_URL, PlaceId)))
	
	if not Success or type(Result) ~= "string" then
		return nil
	end
	local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
	
	if Success1 and type(Result1) == "table" then
		local UniverseId: number = Result1.universeId
		
		return if type(UniverseId) == "number" and UniverseId > 0 then UniverseId else nil
	else
		return nil
	end
end

local function translateString(Text, p1)
	-- upvalues: LocalizationService (copy), Localization (copy), Logging (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	local Success, Result = pcall(function()
		-- upvalues: NewLocalization (copy), Text (copy), p1 (copy)
		return NewLocalization:Format(Text, p1)
	end)
	
	if Success then
		return Result
	else
		Logging.warn("Failed to translate string with key: " .. Text .. ", LocaleId: " .. RobloxLocaleId)
		
		return ""
	end
end

local Default = nil
local NewCurrentTime = -1
local X = RobloxGui.AbsoluteSize.X
local Y = RobloxGui.AbsoluteSize.Y
local config3 = {
	NONE = 1,
	RECONNECT_PLACELAUNCH = 2,
	RECONNECT_DISCONNECT = 3,
	TELEPORT_FAILED = 4,
	IS_RECONNECTING = 5,
	RECONNECT_DISABLED_DISCONNECT = 6,
	RECONNECT_DISABLED_PLACELAUNCH = 7,
	RECONNECT_DISABLED = 8,
	OUT_OF_MEMORY_KEEPPLAYING_LEAVE = 9,
	RECONNECT_CONNECT_FAILURE = 10,
	RECONNECT_DISABLED_CONNECT_FAILURE = 11,
	RECONNECT_AGE_CHECK_REQUIRED = 12,
	RECONNECT_PARENT_APPROVAL_REQUIRED = 13,
	RECONNECT_COLLABORATION_CORE_GATED = 14
}

if ConnectionEnableAutoReconnect then
	config3.AUTO_RECONNECTING = 15
end
local NONE = config3.NONE
local OK = Enum.ConnectionError.OK
local config4 = {
	[config3.RECONNECT_PLACELAUNCH] = "Join Error",
	[config3.RECONNECT_DISABLED_PLACELAUNCH] = "Join Error",
	[config3.RECONNECT_DISCONNECT] = "Disconnected",
	[config3.RECONNECT_DISABLED_DISCONNECT] = "Disconnected",
	[config3.TELEPORT_FAILED] = "Teleport Failed",
	[config3.RECONNECT_DISABLED] = "Error",
	[config3.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "Low Memory Warning",
	[config3.RECONNECT_CONNECT_FAILURE] = "Connection Failed",
	[config3.RECONNECT_DISABLED_CONNECT_FAILURE] = "Connection Failed",
	[config3.RECONNECT_AGE_CHECK_REQUIRED] = "Join Error",
	[config3.RECONNECT_PARENT_APPROVAL_REQUIRED] = "Join Error"
}

if AddCollaborationCoreGatedConnectionError2 then
	config4[config3.RECONNECT_COLLABORATION_CORE_GATED] = "Join Error"
end
if ConnectionEnableAutoReconnect then
	config4[config3.AUTO_RECONNECTING] = "Disconnected"
end
local config5 = {
	[config3.RECONNECT_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError",
	[config3.RECONNECT_DISABLED_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError",
	[config3.RECONNECT_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected",
	[config3.RECONNECT_DISABLED_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected",
	[config3.TELEPORT_FAILED] = "InGame.ConnectionError.Title.TeleportFailed",
	[config3.RECONNECT_DISABLED] = "InGame.CommonUI.Title.Error",
	[config3.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "InGame.ConnectionError.Title.LowMemoryWarning",
	[config3.RECONNECT_CONNECT_FAILURE] = "InGame.ConnectionError.Title.ConnectionFailed",
	[config3.RECONNECT_DISABLED_CONNECT_FAILURE] = "InGame.ConnectionError.Title.ConnectionFailed",
	[config3.RECONNECT_AGE_CHECK_REQUIRED] = "InGame.ConnectionError.Title.JoinError",
	[config3.RECONNECT_PARENT_APPROVAL_REQUIRED] = "InGame.ConnectionError.Title.JoinError"
}

if AddCollaborationCoreGatedConnectionError2 then
	config5[config3.RECONNECT_COLLABORATION_CORE_GATED] = "InGame.ConnectionError.Title.JoinError"
end
if ConnectionEnableAutoReconnect then
	config5[config3.AUTO_RECONNECTING] = "InGame.ConnectionError.Title.Disconnected"
end
local v4 = CreateFunction("Frame")({
	Name = "promptOverlay",
	BackgroundTransparency = 1,
	Active = false,
	BackgroundColor3 = Color3.new(0, 0, 0),
	Size = UDim2.new(1, 0, 1, 36),
	Position = UDim2.new(0, 0, 0, -36),
	Parent = CreateFunction("ScreenGui")({
		Name = "RobloxPromptGui",
		OnTopOfCoreBlur = true,
		DisplayOrder = 9,
		AutoLocalize = false,
		Parent = CoreGui
	})
})
coroutine.wrap(function()
	-- upvalues: RobloxGui (copy), v4 (copy)
	local ConstantsModule = require(RobloxGui.Modules.TopBar.Constants)
	local ApplyDisplayScaleResult = ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight)
	v4.Size = UDim2.new(1, 0, 1, ApplyDisplayScaleResult)
	v4.Position = UDim2.new(0, 0, 0, -ApplyDisplayScaleResult)
end)()

local function openCollaboratorsPageForUniverseId(GameId)
	-- upvalues: TelemetryService (copy), config (copy), Url (copy), LinkingProtocol (copy)
	TelemetryService:LogCounter(config, {
		customFields = { selectedItem = "ViewCollaboratorsOpenUrl" }
	}, 1)
	LinkingProtocol.default:openURL((string.format("%sdashboard/creations/experiences/%s/safety/collaborators", Url.CREATE_URL, (tostring(GameId)))))
end

local function Callback()
	-- upvalues: TelemetryService (copy), config (copy), openCollaboratorsPageForUniverseId (copy), fetchUniverseIdFromPlaceId (copy)
	TelemetryService:LogCounter(config, {
		customFields = { selectedItem = "ViewCollaboratorsInitiated" }
	}, 1)
	local GameId = game.GameId
	
	if GameId and GameId ~= 0 then
		openCollaboratorsPageForUniverseId(GameId)
		
		return
	end
	local PlaceId = game.PlaceId
	
	if PlaceId and PlaceId ~= 0 then
		coroutine.wrap(function()
			-- upvalues: fetchUniverseIdFromPlaceId (upval), PlaceId (copy), TelemetryService (upval), config (upval), openCollaboratorsPageForUniverseId (upval)
			local UniverseIdFromPlaceId = fetchUniverseIdFromPlaceId(PlaceId)
			
			if UniverseIdFromPlaceId then
				openCollaboratorsPageForUniverseId(UniverseIdFromPlaceId)
				
				return
			else
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "ViewCollaboratorsUniverseIdLookupFailed" }
				}, 1)
			end
		end)()
		
		return
	else
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "ViewCollaboratorsMissingPlaceId" }
		}, 1)
	end
end

local function Callback1()
	-- upvalues: NONE (ref), config3 (copy), TelemetryService (copy), config (copy), RbxAnalyticsService (copy), Default (ref), FFlagConnectionRelaunchBuildPlaytest (copy), PlaytestReconnectModule (ref), TeleportService (copy), FFlagCoreScriptShowTeleportPromptModule (copy), RefactorReconnectUnblockTeleport (copy), GuiService (copy)
	local _ = tick()
	
	if NONE == config3.IS_RECONNECTING then
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectInitiated" } }, 1)
	RbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectActivated")
	NONE = config3.IS_RECONNECTING
	Default:primaryShimmerPlay()
	local RelaunchPlaceId = if FFlagConnectionRelaunchBuildPlaytest then PlaytestReconnectModule.getRelaunchPlaceId() else nil
	
	if RelaunchPlaceId ~= nil then
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "ReconnectBuildPlaytestRelaunch" }
		}, 1)
		PlaytestReconnectModule.relaunch(RelaunchPlaceId)
		
		return
	end
	TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectSameServer" } }, 1)
	TeleportService:TeleportReconnect()
	
	if FFlagCoreScriptShowTeleportPromptModule then
		if RefactorReconnectUnblockTeleport then
			TeleportService:UnblockAsync()
			
			return
		end
		GuiService:SetMenuIsOpen(false, "ErrorPrompt")
	end
end

local function v96()
	-- upvalues: NONE (ref), config3 (copy), TelemetryService (copy), config (copy), Default (ref), GuiService (copy), TeleportService (copy)
	if NONE == config3.IS_RECONNECTING then
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	local PlaceId = game.PlaceId
	
	if PlaceId and PlaceId ~= 0 then
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "PlacelaunchRetryInitiated" }
		}, 1)
		NONE = config3.IS_RECONNECTING
		Default:primaryShimmerPlay()
		GuiService:ClearError()
		TeleportService:Teleport(PlaceId)
		
		return
	else
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "PlacelaunchRetryMissingPlaceId" }
		}, 1)
	end
end

local function Callback2()
	-- upvalues: TelemetryService (copy), config (copy), FFlagErrorPromptUseLeaveGameHelper (copy), LeaveGameModule (ref), IsPioneerLaunchFunction (copy), GuiService (copy), RunService (copy)
	TelemetryService:LogCounter(config, { customFields = { selectedItem = "LeaveInitiated" } }, 1)
	
	if FFlagErrorPromptUseLeaveGameHelper then
		LeaveGameModule(false, {
			inhibitAppRating = true,
			telemetryContext = "ErrorPrompt",
			shouldNativeExit = IsPioneerLaunchFunction()
		})
		
		return
	else
		GuiService.SelectedCoreObject = nil
		RunService.RenderStepped:wait()
		RunService.RenderStepped:wait()
		game:Shutdown()
	end
end

local function Callback3()
	-- upvalues: GuiService (copy)
	GuiService:ClearError()
end

local config6 = {
	active = false,
	attempt = 0,
	pendingThread = nil,
	nextAttemptAt = 0,
	tickerThread = nil,
	errorCode = nil,
	baseMessage = nil,
	lastRenderedText = nil,
	lastRemaining = nil
}

local _ = function(p1, p2)
	-- upvalues: Default (ref), GetFFlagDisplayChannelNameOnErrorPromptModule (copy)
	if not Default then return end
	if GetFFlagDisplayChannelNameOnErrorPromptModule() then
		Default:onErrorChanged(p1, p2, true)
		
		return
	else
		Default:onErrorChanged(p1, p2)
	end
end

local function renderAutoReconnectPrompt()
	-- upvalues: Default (ref), NONE (ref), config3 (copy), config6 (copy), translateString (copy), GetFFlagDisplayChannelNameOnErrorPromptModule (copy)
	if not Default then return end
	if NONE ~= config3.AUTO_RECONNECTING and NONE ~= config3.IS_RECONNECTING then return end
	local Largest: number = if NONE == config3.IS_RECONNECTING then -1 else math.max(0, (math.ceil(config6.nextAttemptAt - tick())))
	
	if Largest == config6.lastRemaining then return end
	config6.lastRemaining = Largest
	local Attempt = config6.attempt
	local InGameConnectionErrorReconnectingAttempt = if Largest <= 0 then translateString("InGame.ConnectionError.ReconnectingAttempt", { RBX_ATTEMPT = Attempt }) elseif Largest == 1 then translateString("InGame.ConnectionError.ReconnectingAttemptInSecond", { RBX_ATTEMPT = Attempt }) else translateString("InGame.ConnectionError.ReconnectingAttemptInSeconds", { RBX_ATTEMPT = Attempt, RBX_SECONDS = Largest })
	local Text = if config6.baseMessage and config6.baseMessage ~= "" then config6.baseMessage .. "\n" .. InGameConnectionErrorReconnectingAttempt else InGameConnectionErrorReconnectingAttempt
	
	if Text == config6.lastRenderedText then return end
	config6.lastRenderedText = Text
	local ErrorCode = config6.errorCode
	
	if not Default then return end
	if GetFFlagDisplayChannelNameOnErrorPromptModule() then
		Default:onErrorChanged(Text, ErrorCode, true)
		
		return
	else
		Default:onErrorChanged(Text, ErrorCode)
	end
end

local _ = function()
	-- upvalues: config6 (copy), renderAutoReconnectPrompt (copy)
	if not config6.tickerThread then
		config6.tickerThread = task.spawn(function()
			-- upvalues: config6 (upval), renderAutoReconnectPrompt (upval)
			while config6.active do
				task.wait(0.25)
				renderAutoReconnectPrompt()
			end
			config6.tickerThread = nil
		end)
		
		return
	end
end

local _ = function()
	-- upvalues: config6 (copy)
	config6.active = false
	config6.attempt = 0
	config6.nextAttemptAt = 0
	config6.errorCode = nil
	config6.baseMessage = nil
	config6.lastRenderedText = nil
	config6.lastRemaining = nil
	
	if config6.pendingThread then
		task.cancel(config6.pendingThread)
		config6.pendingThread = nil
	end
	if config6.tickerThread then
		task.cancel(config6.tickerThread)
		config6.tickerThread = nil
	end
end

local _ = function(p1: number): string
	return if p1 <= 5 then tostring(p1) elseif p1 <= 8 then "6-8" else "9+"
end

local function fireAutoReconnect()
	-- upvalues: config6 (copy), NONE (ref), config3 (copy), TelemetryService (copy), config (copy), renderAutoReconnectPrompt (copy), Default (ref), TeleportService (copy), FFlagCoreScriptShowTeleportPromptModule (copy), RefactorReconnectUnblockTeleport (copy), GuiService (copy)
	config6.pendingThread = nil
	
	if NONE == config3.IS_RECONNECTING then return end
	local Attempt: number = config6.attempt
	TelemetryService:LogCounter(config, {
		customFields = {
			selectedItem = "AutoReconnectAttempt",
			attemptBucket = if Attempt <= 5 then tostring(Attempt) elseif Attempt <= 8 then "6-8" else "9+"
		}
	}, 1)
	NONE = config3.IS_RECONNECTING
	renderAutoReconnectPrompt()
	
	if Default then
		Default:primaryShimmerPlay()
	end
	TeleportService:TeleportReconnect()
	
	if FFlagCoreScriptShowTeleportPromptModule then
		if RefactorReconnectUnblockTeleport then
			TeleportService:UnblockAsync()
			
			return
		end
		GuiService:SetMenuIsOpen(false, "ErrorPrompt")
	end
end

local function scheduleAutoReconnect()
	-- upvalues: config6 (copy), ConnectionAutoReconnectFirstDelayMs (copy), ConnectionAutoReconnectBaseDelayMs (copy), ConnectionAutoReconnectMaxDelayMs (copy), ConnectionAutoReconnectJitterMs (copy), _Random (ref), TelemetryService (copy), config (copy), renderAutoReconnectPrompt (copy), fireAutoReconnect (copy)
	config6.active = true
	
	if config6.pendingThread then
		task.cancel(config6.pendingThread)
		config6.pendingThread = nil
	end
	config6.attempt += 1
	local Attempt: number = config6.attempt
	local ConnectionAutoReconnectFirstDelayMs1 = if Attempt <= 1 then ConnectionAutoReconnectFirstDelayMs elseif Attempt == 2 then ConnectionAutoReconnectBaseDelayMs else math.min(ConnectionAutoReconnectBaseDelayMs * 2 ^ (Attempt - 2), ConnectionAutoReconnectMaxDelayMs)
	
	if ConnectionAutoReconnectJitterMs > 0 then
		ConnectionAutoReconnectFirstDelayMs1 += _Random:NextInteger(0, ConnectionAutoReconnectJitterMs)
	end
	local Delay = ConnectionAutoReconnectFirstDelayMs1 / 1000
	config6.nextAttemptAt = tick() + Delay
	config6.lastRenderedText = nil
	config6.lastRemaining = nil
	TelemetryService:LogCounter(config, {
		customFields = { selectedItem = "AutoReconnectScheduled" }
	}, 1)
	
	if not config6.tickerThread then
		config6.tickerThread = task.spawn(function()
			-- upvalues: config6 (upval), renderAutoReconnectPrompt (upval)
			while config6.active do
				task.wait(0.25)
				renderAutoReconnectPrompt()
			end
			config6.tickerThread = nil
		end)
	end
	config6.pendingThread = task.delay(Delay, fireAutoReconnect)
end

local function autoReconnectNowFunction()
	-- upvalues: NONE (ref), config3 (copy), TelemetryService (copy), config (copy), config6 (copy), fireAutoReconnect (copy)
	if NONE == config3.IS_RECONNECTING then
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	TelemetryService:LogCounter(config, {
		customFields = { selectedItem = "AutoReconnectManualNow" }
	}, 1)
	
	if config6.pendingThread then
		task.cancel(config6.pendingThread)
		config6.pendingThread = nil
	end
	fireAutoReconnect()
end

local function Callback4()
	-- upvalues: TelemetryService (copy), config (copy), config6 (copy), Callback2 (copy)
	TelemetryService:LogCounter(config, { customFields = { selectedItem = "AutoReconnectLeave" } }, 1)
	config6.active = false
	config6.attempt = 0
	config6.nextAttemptAt = 0
	config6.errorCode = nil
	config6.baseMessage = nil
	config6.lastRenderedText = nil
	config6.lastRemaining = nil
	
	if config6.pendingThread then
		task.cancel(config6.pendingThread)
		config6.pendingThread = nil
	end
	if config6.tickerThread then
		task.cancel(config6.tickerThread)
		config6.tickerThread = nil
	end
	Callback2()
end

local config7 = {
	[Enum.ConnectionError.IPRecentlyConnected] = true,
	[Enum.ConnectionError.ConnectionBanned] = true,
	[Enum.ConnectionError.InvalidPassword] = true,
	[Enum.ConnectionError.OurSystemRequiresSecurity] = true,
	[Enum.ConnectionError.IncompatibleProtocolVersion] = true,
	[Enum.ConnectionError.DisconnectLuaKick] = true,
	[Enum.ConnectionError.DisconnectSecurityKeyMismatch] = true,
	[Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = true,
	[Enum.ConnectionError.DisconnectDuplicateTicket] = true,
	[Enum.ConnectionError.DisconnectWrongVersion] = true,
	[Enum.ConnectionError.DisconnectProtocolMismatch] = true,
	[Enum.ConnectionError.DisconnectBadhash] = true,
	[Enum.ConnectionError.DisconnectIllegalTeleport] = true,
	[Enum.ConnectionError.DisconnectDuplicatePlayer] = true,
	[Enum.ConnectionError.DisconnectCloudEditKick] = true,
	[Enum.ConnectionError.DisconnectOnRemoteSysStats] = true,
	[Enum.ConnectionError.DisconnectBySecurityPolicy] = true,
	[Enum.ConnectionError.DisconnectBlockedIP] = true,
	[Enum.ConnectionError.DisconnectPrivateServerKickout] = true,
	[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = true,
	[Enum.ConnectionError.DisconnectCollaboratorUnderage] = true,
	[Enum.ConnectionError.PlacelaunchFlooded] = true,
	[Enum.ConnectionError.PlacelaunchHashException] = true,
	[Enum.ConnectionError.PlacelaunchHashExpired] = true,
	[Enum.ConnectionError.PlacelaunchUnauthorized] = true,
	[Enum.ConnectionError.PlacelaunchUserLeft] = true,
	[Enum.ConnectionError.PlacelaunchRestricted] = true,
	[Enum.ConnectionError.PlacelaunchUserPrivacyUnauthorized] = true,
	[Enum.ConnectionError.PlacelaunchCreatorBan] = true,
	[Enum.ConnectionError.AndroidAnticheatKick] = true,
	[Enum.ConnectionError.AndroidEmulatorKick] = true,
	[Enum.ConnectionError.AndroidRootedKick] = true
}

if CoreGuiOverflowDetectionEngineFeature then
	config7[Enum.ConnectionError.DisconnectClientFailure] = true
end
if ShowScreentimeLockoutKickMessage then
	config7[Enum.ConnectionError.ScreentimeLockoutKick] = true
end
if AddPlacelaunchDeviceBlock2 then
	config7[Enum.ConnectionError.PlacelaunchDeviceBlock] = true
end
if AddContextualPlayabilityConnectionErrors then
	config7[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = true
	config7[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = true
	config7[Enum.ConnectionError.PlacelaunchCoreGated] = true
end
if AddVipOwnerNotPresentConnectionError and not VipOwnerNotPresentEnableReconnect then
	config7[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = true
end
local PlacelaunchCollaborationCoreGated = if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGatedConnectionErrorEngineFeature then Enum.ConnectionError.PlacelaunchCollaborationCoreGated else nil

if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGated then
	config7[PlacelaunchCollaborationCoreGated] = true
end
if RAKickLogic2 and Flag then
	config7[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = true
	config7[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = true
	config7[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = true
	config7[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = true
end
local t = {}

if ConnectionEnableAutoReconnect then
	t = {
		[Enum.ConnectionError.DisconnectConnectionLost] = true,
		[Enum.ConnectionError.DisconnectTimeout] = true,
		[Enum.ConnectionError.DisconnectRaknetErrors] = true,
		[Enum.ConnectionError.DisconnectReceivePacketError] = true,
		[Enum.ConnectionError.DisconnectReceivePacketStreamError] = true,
		[Enum.ConnectionError.DisconnectSendPacketError] = true,
		[Enum.ConnectionError.DisconnectHashTimeout] = true,
		[Enum.ConnectionError.ReplicatorTimeout] = true,
		[Enum.ConnectionError.NetworkTimeout] = true,
		[Enum.ConnectionError.NetworkInternal] = true,
		[Enum.ConnectionError.NetworkSend] = true
	}
	
	if RbxTransportHandleUniqueErrors and RbxTransportUniqueConnectionErrorsEngineFeature then
		t[Enum.ConnectionError.DisconnectTransportIoInternetError] = true
	end
end
local config8 = {
	[config3.RECONNECT_PLACELAUNCH] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = Callback1
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = Callback2
		}
	},
	[config3.RECONNECT_DISCONNECT] = {
		{
			Text = "Reconnect",
			LocalizationKey = "InGame.ConnectionError.Button.Reconnect",
			LayoutOrder = 2,
			Primary = true,
			Callback = Callback1
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = Callback2
		}
	},
	[config3.TELEPORT_FAILED] = {
		{
			Text = "OK",
			LocalizationKey = "InGame.CommonUI.Button.Ok",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback3
		}
	},
	[config3.RECONNECT_DISABLED_DISCONNECT] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[config3.RECONNECT_DISABLED_PLACELAUNCH] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[config3.RECONNECT_DISABLED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[config3.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = {
		{
			Text = "Keep Playing",
			LocalizationKey = "InGame.CommonUI.Button.KeepPlaying",
			LayoutOrder = 1,
			Callback = Callback3
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 2,
			Primary = true,
			Callback = Callback2
		}
	},
	[config3.RECONNECT_CONNECT_FAILURE] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = Callback1
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = Callback2
		}
	},
	[config3.RECONNECT_DISABLED_CONNECT_FAILURE] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[config3.RECONNECT_AGE_CHECK_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = Callback2
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = ConnectionAmpUpsellOnLeaveModule.PrimaryButtonText,
			LocalizationKey = ConnectionAmpUpsellOnLeaveModule.PrimaryButtonLocalizationKey,
			Callback = ConnectionAmpUpsellOnLeaveModule.createAgeCheckCallback(config, v96, 9)
		}
	}
}

if FFlagConnectionAmpParentalApprovalUpsell then
	config8[config3.RECONNECT_PARENT_APPROVAL_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = Callback2
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = ConnectionAmpUpsellOnLeaveModule.PrimaryButtonText,
			LocalizationKey = ConnectionAmpUpsellOnLeaveModule.PrimaryButtonLocalizationKey,
			Callback = ConnectionAmpUpsellOnLeaveModule.createParentalApprovalCallback(config, v96, 9)
		}
	}
end
if FFlagConnectionParentalApprovalLeaveOnly then
	config8[config3.RECONNECT_PARENT_APPROVAL_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	}
end
if AddCollaborationCoreGatedConnectionError2 then
	config8[config3.RECONNECT_COLLABORATION_CORE_GATED] = {
		{
			Text = "Ok",
			LocalizationKey = "InGame.ConnectionError.Action.Ok",
			LayoutOrder = 1,
			Callback = Callback2
		},
		{
			Text = "View collaborators",
			LocalizationKey = "InGame.ConnectionError.Action.ViewCollaborators",
			LayoutOrder = 2,
			Primary = true,
			Callback = Callback
		}
	}
end
if ConnectionEnableAutoReconnect then
	config8[config3.AUTO_RECONNECTING] = {
		{
			Text = "Reconnect Now",
			LocalizationKey = "InGame.ConnectionError.Button.ReconnectNow",
			LayoutOrder = 2,
			Primary = true,
			Callback = autoReconnectNowFunction
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = Callback4
		}
	}
end
if IsPioneerLaunchFunction() then
	for _, value in pairs(config8) do
		for _, value1 in ipairs(value) do
			if value1.Callback == Callback2 or value1.Callback == Callback4 then
				value1.Text = "Quit"
				value1.LocalizationKey = "Feature.SettingsHub.Label.QuitButton"
			end
		end
	end
end
local config1 = {
	[config3.NONE] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = false
		v4.Transparency = 1
	end,
	[config3.RECONNECT_DISCONNECT] = function()
		-- upvalues: VRService (copy), RunService (copy), v4 (copy)
		if VRService.VREnabled then
			RunService:SetRobloxGuiFocused(false)
		else
			RunService:SetRobloxGuiFocused(true)
		end
		v4.Active = true
		v4.Transparency = 1
	end,
	[config3.RECONNECT_PLACELAUNCH] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[config3.TELEPORT_FAILED] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[config3.RECONNECT_DISABLED_DISCONNECT] = function()
		-- upvalues: VRService (copy), RunService (copy), v4 (copy)
		if VRService.VREnabled then
			RunService:SetRobloxGuiFocused(false)
		else
			RunService:SetRobloxGuiFocused(true)
		end
		v4.Active = true
		v4.Transparency = 1
	end,
	[config3.RECONNECT_DISABLED_PLACELAUNCH] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[config3.RECONNECT_DISABLED] = function()
		-- upvalues: VRService (copy), RunService (copy), v4 (copy)
		if VRService.VREnabled then
			RunService:SetRobloxGuiFocused(false)
		else
			RunService:SetRobloxGuiFocused(true)
		end
		v4.Active = true
		v4.Transparency = 1
	end,
	[config3.RECONNECT_CONNECT_FAILURE] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[config3.RECONNECT_DISABLED_CONNECT_FAILURE] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end
}
local Entry = config1[config3.RECONNECT_PLACELAUNCH]
config1[config3.RECONNECT_AGE_CHECK_REQUIRED] = Entry

if FFlagConnectionAmpParentalApprovalUpsell then
	config1[config3.RECONNECT_PARENT_APPROVAL_REQUIRED] = Entry
end
if AddCollaborationCoreGatedConnectionError2 then
	config1[config3.RECONNECT_COLLABORATION_CORE_GATED] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end
end
if ConnectionEnableAutoReconnect then
	config1[config3.AUTO_RECONNECTING] = config1[config3.RECONNECT_DISCONNECT]
end
local function onEnter(AUTORECONNECTING)
	-- upvalues: Default (ref), DebugEnableErrorStringTesting (copy), ErrorPromptModule (copy), v4 (copy), X (ref), Y (ref), config1 (copy), config4 (copy), config5 (copy), config8 (copy)
	if not Default then
		Default = ErrorPromptModule.new("Default", {
			MenuIsOpenKey = "ConnectionErrorPrompt",
			PlayAnimation = not DebugEnableErrorStringTesting
		})
		Default:setParent(v4)
		Default:resizeWidthAndHeight(X, Y)
	end
	if config1[AUTORECONNECTING] then
		config1[AUTORECONNECTING]()
	end
	Default:setErrorTitle(config4[AUTORECONNECTING], config5[AUTORECONNECTING])
	Default:updateButtons(config8[AUTORECONNECTING])
end

local _ = function(ISRECONNECTING)
	-- upvalues: config3 (copy), Default (ref)
	if ISRECONNECTING == config3.IS_RECONNECTING then
		Default:primaryShimmerStop()
	end
end

local function stateTransit(ConnectionError, ConnectionError1, NONE)
	-- upvalues: FFlagAllowDisconnectGuiForOkUnknownModule (copy), config3 (copy), ReconnectDisabledFFlag (copy), CurrentTime (ref), NewCurrentTime (ref), v2 (copy), OK (ref), config7 (copy), TelemetryService (copy), config (copy), RbxAnalyticsService (copy), FFlagConnectionRelaunchBuildPlaytest (copy), PlaytestReconnectModule (ref), ConnectionEnableAutoReconnect (copy), t (ref), ConnectionAmpUpsellOnLeaveModule (copy), FFlagConnectionUpsellAnalytics (copy), FFlagConnectionAmpParentalApprovalUpsell (copy), AddCollaborationCoreGatedConnectionError2 (copy), PlacelaunchCollaborationCoreGated (copy), PotentialClientTimeoutSeconds (copy), config6 (copy), ConnectionAutoReconnectMaxDurationSeconds (copy)
	if FFlagAllowDisconnectGuiForOkUnknownModule then
		if ConnectionError1 == Enum.ConnectionError.OK then
			return config3.NONE
		end
	elseif ConnectionError == Enum.ConnectionError.OK then
		return config3.NONE
	end
	if NONE == config3.NONE then
		if ReconnectDisabledFFlag then
			return config3.RECONNECT_DISABLED
		end
		CurrentTime = tick()
		
		if FFlagAllowDisconnectGuiForOkUnknownModule then
			assert(ConnectionError1 ~= Enum.ConnectionError.OK)
			
			if ConnectionError == Enum.ConnectionError.OK then
				return config3.RECONNECT_DISCONNECT
			end
		end
		if ConnectionError == Enum.ConnectionError.ConnectErrors then
			NewCurrentTime = tick() + v2
			OK = Enum.ConnectionError.ConnectErrors
			
			if config7[ConnectionError1] then
				return config3.RECONNECT_DISABLED_CONNECT_FAILURE
			else
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "ConnectError" } }, 1)
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "ConnectFailed" } }, 1)
				
				return config3.RECONNECT_CONNECT_FAILURE
			end
		elseif ConnectionError == Enum.ConnectionError.DisconnectErrors then
			NewCurrentTime = tick() + v2
			OK = Enum.ConnectionError.DisconnectErrors
			
			if ConnectionError1 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
				return config3.OUT_OF_MEMORY_KEEPPLAYING_LEAVE
			elseif config7[ConnectionError1] then
				return config3.RECONNECT_DISABLED_DISCONNECT
			else
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "Disconnected" } }, 1)
				RbxAnalyticsService:ReportCounter("ReconnectPrompt-Disconnect")
				
				return if FFlagConnectionRelaunchBuildPlaytest and PlaytestReconnectModule.getRelaunchPlaceId() ~= nil then config3.RECONNECT_DISCONNECT elseif ConnectionEnableAutoReconnect and t[ConnectionError1] then config3.AUTO_RECONNECTING else config3.RECONNECT_DISCONNECT
			end
		elseif ConnectionError == Enum.ConnectionError.PlacelaunchErrors then
			OK = Enum.ConnectionError.PlacelaunchErrors
			local AgeVerificationRequiredEnum = ConnectionAmpUpsellOnLeaveModule.AgeVerificationRequiredEnum
			
			if AgeVerificationRequiredEnum and ConnectionError1 == AgeVerificationRequiredEnum then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "PlaceLaunchAgeVerificationRequired" }
				}, 1)
				
				if FFlagConnectionUpsellAnalytics then
					ConnectionAmpUpsellOnLeaveModule.fireImpressionAgeCheck(config, game.PlaceId)
				end
				return config3.RECONNECT_AGE_CHECK_REQUIRED
			else
				if FFlagConnectionAmpParentalApprovalUpsell then
					local ParentalApprovalRequiredEnum = ConnectionAmpUpsellOnLeaveModule.ParentalApprovalRequiredEnum
					
					if ParentalApprovalRequiredEnum and ConnectionError1 == ParentalApprovalRequiredEnum then
						TelemetryService:LogCounter(config, {
							customFields = { selectedItem = "PlaceLaunchParentalApprovalRequired" }
						}, 1)
						
						if FFlagConnectionUpsellAnalytics then
							ConnectionAmpUpsellOnLeaveModule.fireImpressionParentalApproval(config, game.PlaceId)
						end
						return config3.RECONNECT_PARENT_APPROVAL_REQUIRED
					end
				end
				if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGated and ConnectionError1 == PlacelaunchCollaborationCoreGated then
					TelemetryService:LogCounter(config, {
						customFields = { selectedItem = "PlaceLaunchCollaborationCoreGated" }
					}, 1)
					
					return config3.RECONNECT_COLLABORATION_CORE_GATED
				elseif config7[ConnectionError1] then
					return config3.RECONNECT_DISABLED_PLACELAUNCH
				else
					TelemetryService:LogCounter(config, { customFields = { selectedItem = "PlaceLaunchError" } }, 1)
					RbxAnalyticsService:ReportCounter("ReconnectPrompt-PlaceLaunch")
					
					return config3.RECONNECT_PLACELAUNCH
				end
			end
		elseif ConnectionError == Enum.ConnectionError.TeleportErrors then
			TelemetryService:LogCounter(config, { customFields = { selectedItem = "TeleportError" } }, 1)
			RbxAnalyticsService:ReportCounter("ReconnectPrompt-TeleportFailed")
			
			return config3.TELEPORT_FAILED
		end
	end
	if NONE == config3.IS_RECONNECTING then
		TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectFailed" } }, 1)
		RbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectFailed")
		
		if ConnectionError == Enum.ConnectionError.TeleportErrors then
			if CurrentTime + PotentialClientTimeoutSeconds < tick() then
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectTimedOut" } }, 1)
				
				return if OK == Enum.ConnectionError.PlacelaunchErrors then config3.RECONNECT_DISABLED_PLACELAUNCH else config3.RECONNECT_DISABLED_DISCONNECT
			end
			if OK == Enum.ConnectionError.PlacelaunchErrors then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "PlaceLaunchReconnectFailed" }
				}, 1)
				
				return config3.RECONNECT_PLACELAUNCH
			end
			if OK == Enum.ConnectionError.DisconnectErrors then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "DisconnectReconnectFailed" }
				}, 1)
				
				if ConnectionEnableAutoReconnect and config6.active then
					if ConnectionAutoReconnectMaxDurationSeconds <= 0 or tick() <= CurrentTime + ConnectionAutoReconnectMaxDurationSeconds then
						return config3.AUTO_RECONNECTING
					end
					TelemetryService:LogCounter(config, {
						customFields = { selectedItem = "AutoReconnectExhausted" }
					}, 1)
				end
				return config3.RECONNECT_DISCONNECT
			elseif OK == Enum.ConnectionError.ConnectErrors then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "ConnectReconnectFailed" }
				}, 1)
				
				return config3.RECONNECT_CONNECT_FAILURE
			end
		end
	end
	return if ConnectionEnableAutoReconnect and NONE == config3.AUTO_RECONNECTING then if ReconnectDisabledFFlag then config3.RECONNECT_DISABLED elseif ConnectionError == Enum.ConnectionError.DisconnectErrors and config7[ConnectionError1] then config3.RECONNECT_DISABLED_DISCONNECT else NONE else NONE
end

local function getCreatorBanString(p1)
	-- upvalues: GuiService (copy), translateString (copy)
	local ErrorDetails = GuiService:GetErrorDetails()
	
	if not ErrorDetails then
		return p1
	end
	local InGameConnectionErrorCreatorBanNoTime = nil
	if ErrorDetails.time then
		local Minutes = ErrorDetails.minutes
		local Hours: number = ErrorDetails.hours
		local Days: number = ErrorDetails.days
		local InGameConnectionErrorCreatorBanMinutesSingular = if Minutes == 1 then translateString("InGame.ConnectionError.CreatorBanMinutesSingular") else translateString("InGame.ConnectionError.CreatorBanMinutesPlural", { RBX_TIME_MINUTES = Minutes })
		local InGameConnectionErrorCreatorBanHoursSingular = if Hours == 1 then translateString("InGame.ConnectionError.CreatorBanHoursSingular") else translateString("InGame.ConnectionError.CreatorBanHoursPlural", { RBX_TIME_HOURS = Hours })
		local InGameConnectionErrorCreatorBanDaysSingular = if Days == 1 then translateString("InGame.ConnectionError.CreatorBanDaysSingular") else translateString("InGame.ConnectionError.CreatorBanDaysPlural", { RBX_TIME_DAYS = Days })
		
		if InGameConnectionErrorCreatorBanMinutesSingular == "" or InGameConnectionErrorCreatorBanHoursSingular == "" or InGameConnectionErrorCreatorBanDaysSingular == "" then
			return p1
		end
		local InGameConnectionErrorCreatorBanMinutesSingular1: string = InGameConnectionErrorCreatorBanMinutesSingular
		
		if Hours > 0 then
			InGameConnectionErrorCreatorBanMinutesSingular1 = InGameConnectionErrorCreatorBanHoursSingular .. ", " .. InGameConnectionErrorCreatorBanMinutesSingular1
		end
		if Days > 0 then
			InGameConnectionErrorCreatorBanMinutesSingular1 = InGameConnectionErrorCreatorBanDaysSingular .. ", " .. InGameConnectionErrorCreatorBanMinutesSingular1
		end
		InGameConnectionErrorCreatorBanNoTime = translateString("InGame.ConnectionError.CreatorBanWithTime", {
			RBX_TIME_REMAINING = InGameConnectionErrorCreatorBanMinutesSingular1
		})
	else
		InGameConnectionErrorCreatorBanNoTime = translateString("InGame.ConnectionError.CreatorBanNoTime")
	end
	if InGameConnectionErrorCreatorBanNoTime == "" then
		return p1
	end
	local DisplayReason = ErrorDetails.displayReason
	
	if DisplayReason and DisplayReason ~= "" then
		local InGameConnectionErrorCreatorBanMessage = translateString("InGame.ConnectionError.CreatorBanMessage", { RBX_STR = DisplayReason })
		
		return if InGameConnectionErrorCreatorBanMessage == "" then p1 else InGameConnectionErrorCreatorBanNoTime .. " " .. InGameConnectionErrorCreatorBanMessage
	else
		return InGameConnectionErrorCreatorBanNoTime
	end
end

local RemoveRefToMissingLocInConnection = game:DefineFastFlag("RemoveRefToMissingLocInConnection", false)
local config2 = {
	[Enum.ConnectionError.ConnectErrors] = "InGame.ConnectionError.ConnectErrors",
	[Enum.ConnectionError.AlreadyConnected] = "InGame.ConnectionError.ConnectionFailedWaitAndTry",
	[Enum.ConnectionError.NoFreeIncomingConnections] = "InGame.ConnectionError.ConnectionFailedWaitAndTry",
	[Enum.ConnectionError.IPRecentlyConnected] = "InGame.ConnectionError.ConnectErrors",
	[Enum.ConnectionError.ConnectionBanned] = "InGame.ConnectionError.ConnectionBanned",
	[Enum.ConnectionError.InvalidPassword] = "InGame.ConnectionError.ConnectionFailedRobloxVersion",
	[Enum.ConnectionError.OurSystemRequiresSecurity] = "InGame.ConnectionError.ConnectionFailedRobloxVersion",
	[Enum.ConnectionError.IncompatibleProtocolVersion] = "InGame.ConnectionError.ConnectionFailedRobloxVersion",
	[Enum.ConnectionError.DisconnectErrors] = "InGame.ConnectionError.DisconnectErrors",
	[Enum.ConnectionError.DisconnectBadhash] = "InGame.ConnectionError.DisconnectBadhash",
	[Enum.ConnectionError.DisconnectSecurityKeyMismatch] = "InGame.ConnectionError.DisconnectSecurityKeyMismatch",
	[Enum.ConnectionError.DisconnectProtocolMismatch] = "InGame.ConnectionError.DisconnectProtocolMismatch",
	[Enum.ConnectionError.DisconnectReceivePacketError] = "InGame.ConnectionError.DisconnectReceivePacketError",
	[Enum.ConnectionError.DisconnectReceivePacketStreamError] = "InGame.ConnectionError.DisconnectReceivePacketStreamError",
	[Enum.ConnectionError.DisconnectSendPacketError] = "InGame.ConnectionError.DisconnectSendPacketError",
	[Enum.ConnectionError.DisconnectIllegalTeleport] = "InGame.ConnectionError.DisconnectIllegalTeleport",
	[Enum.ConnectionError.DisconnectDuplicatePlayer] = "InGame.ConnectionError.DisconnectDuplicatePlayer",
	[Enum.ConnectionError.DisconnectDuplicateTicket] = "InGame.ConnectionError.DisconnectDuplicateTicket",
	[Enum.ConnectionError.DisconnectTimeout] = "InGame.ConnectionError.DisconnectTimeout",
	[Enum.ConnectionError.DisconnectLuaKick] = "InGame.ConnectionError.DisconnectLuaKick",
	[Enum.ConnectionError.DisconnectOnRemoteSysStats] = "InGame.ConnectionError.DisconnectOnRemoteSysStats",
	[Enum.ConnectionError.DisconnectHashTimeout] = "InGame.ConnectionError.DisconnectHashTimeout",
	[Enum.ConnectionError.DisconnectCloudEditKick] = "InGame.ConnectionError.DisconnectCloudEditKick",
	[Enum.ConnectionError.DisconnectPlayerless] = "InGame.ConnectionError.DisconnectPlayerless",
	[Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = "InGame.ConnectionError.DisconnectNewSecurityKeyMismatch",
	[Enum.ConnectionError.DisconnectEvicted] = "InGame.ConnectionError.DisconnectEvicted",
	[Enum.ConnectionError.DisconnectDevMaintenance] = "InGame.ConnectionError.DisconnectDevMaintenance",
	[Enum.ConnectionError.DisconnectRobloxMaintenance] = "InGame.ConnectionError.DisconnectRobloxMaintenance",
	[Enum.ConnectionError.DisconnectRejoin] = "InGame.ConnectionError.DisconnectRejoin",
	[Enum.ConnectionError.DisconnectConnectionLost] = "InGame.ConnectionError.DisconnectConnectionLost",
	[Enum.ConnectionError.DisconnectIdle] = "InGame.ConnectionError.DisconnectIdle",
	[Enum.ConnectionError.DisconnectRaknetErrors] = "InGame.ConnectionError.DisconnectRaknetErrors",
	[Enum.ConnectionError.DisconnectWrongVersion] = "InGame.ConnectionError.DisconnectWrongVersion",
	[Enum.ConnectionError.DisconnectBySecurityPolicy] = "InGame.ConnectionError.DisconnectBlockedConnection",
	[Enum.ConnectionError.DisconnectBlockedIP] = "InGame.ConnectionError.DisconnectBlockedConnection",
	[Enum.ConnectionError.DisconnectClientFailure] = "InGame.ConnectionError.DisconnectClientFailure",
	[Enum.ConnectionError.DisconnectClientRequest] = "InGame.ConnectionError.DisconnectClientRequest",
	[Enum.ConnectionError.DisconnectPrivateServerKickout] = "InGame.ConnectionError.DisconnectPrivateServerKickout",
	[Enum.ConnectionError.DisconnectModeratedGame] = "InGame.ConnectionError.ServerShutdown",
	[Enum.ConnectionError.ServerShutdown] = "InGame.ConnectionError.ServerShutdown",
	[Enum.ConnectionError.ReplicatorTimeout] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.PlayerRemoved] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave] = "InGame.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave",
	[Enum.ConnectionError.DisconnectRomarkEndOfTest] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked",
	[Enum.ConnectionError.DisconnectCollaboratorUnderage] = "InGame.ConnectionError.DisconnectCollaboratorUnderage",
	[Enum.ConnectionError.NetworkInternal] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.NetworkSend] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.NetworkTimeout] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.NetworkMisbehavior] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.NetworkSecurity] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.ReplacementReady] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.ServerEmpty] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.PhantomFreeze] = "InGame.ConnectionError.DisconnectTryAgain",
	[Enum.ConnectionError.AndroidAnticheatKick] = "InGame.ConnectionError.AndroidAnticheatKick",
	[Enum.ConnectionError.AndroidEmulatorKick] = "InGame.ConnectionError.AndroidEmulatorKick",
	[Enum.ConnectionError.PlacelaunchErrors] = "InGame.ConnectionError.PlacelaunchErrors",
	[Enum.ConnectionError.PlacelaunchDisabled] = "InGame.ConnectionError.PlacelaunchDisabled",
	[Enum.ConnectionError.PlacelaunchError] = "InGame.ConnectionError.PlacelaunchError",
	[Enum.ConnectionError.PlacelaunchGameEnded] = "InGame.ConnectionError.PlacelaunchGameEnded",
	[Enum.ConnectionError.PlacelaunchGameFull] = "InGame.ConnectionError.PlacelaunchGameFull",
	[Enum.ConnectionError.PlacelaunchUserLeft] = "InGame.ConnectionError.PlacelaunchUserLeft",
	[Enum.ConnectionError.PlacelaunchRestricted] = "InGame.ConnectionError.PlacelaunchRestricted",
	[Enum.ConnectionError.PlacelaunchUnauthorized] = "InGame.ConnectionError.PlacelaunchUnauthorized",
	[Enum.ConnectionError.PlacelaunchFlooded] = "InGame.ConnectionError.PlacelaunchFlooded",
	[Enum.ConnectionError.PlacelaunchHashExpired] = "InGame.ConnectionError.PlacelaunchHashExpired",
	[Enum.ConnectionError.PlacelaunchHashException] = "InGame.ConnectionError.PlacelaunchHashException",
	[Enum.ConnectionError.PlacelaunchPartyCannotFit] = "InGame.ConnectionError.PlacelaunchPartyCannotFit",
	[Enum.ConnectionError.PlacelaunchHttpError] = "InGame.ConnectionError.PlacelaunchHttpError",
	[Enum.ConnectionError.PlacelaunchUserPrivacyUnauthorized] = "InGame.ConnectionError.PlacelaunchUserPrivacyUnauthorized",
	[Enum.ConnectionError.PlacelaunchCreatorBan] = "InGame.ConnectionError.CreatorBanNoTime",
	[Enum.ConnectionError.PlacelaunchCustomMessage] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.PlacelaunchCustomMessage",
	[Enum.ConnectionError.PlacelaunchOtherError] = "InGame.ConnectionError.PlacelaunchOtherError",
	[Enum.ConnectionError.TeleportErrors] = "InGame.ConnectionError.TeleportErrors",
	[Enum.ConnectionError.TeleportFailure] = "InGame.ConnectionError.TeleportFailure",
	[Enum.ConnectionError.TeleportGameNotFound] = "InGame.ConnectionError.TeleportGameNotFound",
	[Enum.ConnectionError.TeleportGameEnded] = "InGame.ConnectionError.TeleportGameEnded",
	[Enum.ConnectionError.TeleportGameFull] = "InGame.ConnectionError.TeleportGameFull",
	[Enum.ConnectionError.TeleportUnauthorized] = "InGame.ConnectionError.TeleportUnauthorized",
	[Enum.ConnectionError.TeleportFlooded] = "InGame.ConnectionError.TeleportFlooded",
	[Enum.ConnectionError.TeleportIsTeleporting] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.TeleportIsTeleporting",
	[Enum.ConnectionError.DisconnectVerboselyModeratedGame] = "InGame.ConnectionError.DisconnectVerboselyModeratedGame"
}

if ShowScreentimeLockoutKickMessage then
	config2[Enum.ConnectionError.ScreentimeLockoutKick] = "Feature.Screentime.Content.ScreentimeLimitDialog"
end
if AddPlacelaunchDeviceBlock2 then
	config2[Enum.ConnectionError.PlacelaunchDeviceBlock] = "InGame.ConnectionError.PlacelaunchDeviceBlock"
end
if AddContextualPlayabilityConnectionErrors then
	config2[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = "InGame.ConnectionError.Description.AgeCheckRequired"
	config2[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = "InGame.ConnectionError.Description.ParentalApprovalRequired"
	config2[Enum.ConnectionError.PlacelaunchCoreGated] = "InGame.ConnectionError.Description.LockedByAge"
end
if AddVipOwnerNotPresentConnectionError then
	config2[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = "InGame.ConnectionError.Description.VipOwnerNotPresent"
end
if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGated then
	config2[PlacelaunchCollaborationCoreGated] = "InGame.ConnectionError.Description.CollaborationRequiresTrustedFriends"
end
if RAKickLogic2 and Flag then
	config2[Enum.ConnectionError.DisconnectRemoteAttestationTimeout] = "InGame.ConnectionError.RemoteAttestationTimeout"
	config2[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = "InGame.ConnectionError.RemoteAttestationUnsupported"
	config2[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = "InGame.ConnectionError.RemoteAttestationGeneralFailure"
	config2[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = "InGame.ConnectionError.RemoteAttestationOSOutOfDate"
	config2[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = "InGame.ConnectionError.RemoteAttestationBootValidationFailure"
end
if RbxTransportHandleUniqueErrors and RbxTransportUniqueConnectionErrorsEngineFeature then
	config2[Enum.ConnectionError.DisconnectTransportIoError] = "InGame.ConnectionError.DisconnectTryAgain"
	config2[Enum.ConnectionError.DisconnectTransportIoInternetError] = "InGame.ConnectionError.DisconnectConnectionLost"
	config2[Enum.ConnectionError.DisconnectTransportProtocolError] = "InGame.ConnectionError.DisconnectTryAgain"
	config2[Enum.ConnectionError.DisconnectTransportNgtcp2Error] = "InGame.ConnectionError.DisconnectTryAgain"
	config2[Enum.ConnectionError.DisconnectTransportQuicError] = "InGame.ConnectionError.DisconnectTryAgain"
	config2[Enum.ConnectionError.DisconnectTransportRnaError] = "InGame.ConnectionError.DisconnectTryAgain"
end
local function getErrorString(Text: string, ConnectionError, p1)
	-- upvalues: translateString (copy), MaxKickMessageLength (copy), config2 (copy), MutedErrorFunction (copy), ShouldMuteUnlocalizedError (copy)
	if ConnectionError == Enum.ConnectionError.OK then
		return ""
	end
	if p1 then
		local InGameConnectionErrorReconnectFailed = translateString("InGame.ConnectionError.ReconnectFailed")
		
		return if InGameConnectionErrorReconnectFailed == "" then "Reconnect was unsuccessful. Please try again." else InGameConnectionErrorReconnectFailed
	end
	if ConnectionError == Enum.ConnectionError.DisconnectLuaKick and Text ~= "" then
		Text = Text:sub(1, MaxKickMessageLength)
		local InGameConnectionErrorDisconnectLuaKickWithMessage = translateString("InGame.ConnectionError.DisconnectLuaKickWithMessage", { RBX_STR = Text })
		
		return if InGameConnectionErrorDisconnectLuaKickWithMessage == "" then Text else InGameConnectionErrorDisconnectLuaKickWithMessage
	end
	local Entry = config2[ConnectionError]
	
	if not Entry then
		MutedErrorFunction("Cannot find localization key for " .. tostring(ConnectionError))
		Entry = "InGame.ConnectionError.UnknownError"
	end
	local TranslateStringResult = if ConnectionError == Enum.ConnectionError.DisconnectIdle then translateString(Entry, { RBX_NUM = tostring(20) }) else translateString(Entry)
	
	return if TranslateStringResult == "" then if ShouldMuteUnlocalizedError then translateString("InGame.ConnectionError.UnknownError") else Text else TranslateStringResult
end

local function updateErrorPrompt(ErrorMessage, ConnectionError, ConnectionError1)
	-- upvalues: GuiService (copy), BuildRobloxExperienceKickContentModule (copy), translateString (copy), ShowFeatureRestrictionDirectModule (copy), Callback2 (copy), TelemetryService (copy), config (copy), stateTransit (copy), NONE (ref), config3 (copy), Default (ref), onEnter (copy), ConnectionEnableAutoReconnect (copy), scheduleAutoReconnect (copy), config6 (copy), getCreatorBanString (copy), getErrorString (copy), Result1_1 (copy), renderAutoReconnectPrompt (copy), GetFFlagDisplayChannelNameOnErrorPromptModule (copy)
	if ConnectionError == Enum.ConnectionError.DisconnectLuaKick then
		local ErrorDetails = GuiService:GetErrorDetails()
		
		if ErrorDetails and ErrorDetails.moderatorType == "roblox" then
			local RobloxExperienceKickContentModule = BuildRobloxExperienceKickContentModule(ErrorMessage, ErrorDetails, translateString)
			ShowFeatureRestrictionDirectModule(RobloxExperienceKickContentModule.abuseVector, RobloxExperienceKickContentModule.moderationDetail, {
				onDismiss = Callback2,
				titleOverride = RobloxExperienceKickContentModule.options.titleOverride,
				bodyOverride = RobloxExperienceKickContentModule.options.bodyOverride
			})
			TelemetryService:LogCounter(config, { customFields = { selectedItem = "RobloxExperienceKick" } }, 1)
			
			return
		end
	end
	local StateTransitResult = stateTransit(ConnectionError1, ConnectionError, NONE)
	
	if StateTransitResult ~= NONE then
		if NONE == config3.IS_RECONNECTING then
			Default:primaryShimmerStop()
		end
		NONE = StateTransitResult
		onEnter(StateTransitResult)
		
		if ConnectionEnableAutoReconnect then
			if StateTransitResult == config3.AUTO_RECONNECTING then
				scheduleAutoReconnect()
			else
				config6.active = false
				config6.attempt = 0
				config6.nextAttemptAt = 0
				config6.errorCode = nil
				config6.baseMessage = nil
				config6.lastRenderedText = nil
				config6.lastRemaining = nil
				
				if config6.pendingThread then
					task.cancel(config6.pendingThread)
					config6.pendingThread = nil
				end
				if config6.tickerThread then
					task.cancel(config6.tickerThread)
					config6.tickerThread = nil
				end
			end
		end
	end
	local CreatorBanString = nil
	if ConnectionError == Enum.ConnectionError.PlacelaunchCreatorBan then
		CreatorBanString = getCreatorBanString(ErrorMessage)
	elseif ConnectionError1 == Enum.ConnectionError.TeleportErrors and NONE ~= config3.TELEPORT_FAILED then
		if ConnectionError == Enum.ConnectionError.OK then
			CreatorBanString = ""
		else
			local InGameConnectionErrorReconnectFailed = translateString("InGame.ConnectionError.ReconnectFailed")
			CreatorBanString = if InGameConnectionErrorReconnectFailed == "" then "Reconnect was unsuccessful. Please try again." else InGameConnectionErrorReconnectFailed
		end
	else
		CreatorBanString = getErrorString(ErrorMessage, ConnectionError)
	end
	if NONE == config3.RECONNECT_DISABLED then
		CreatorBanString = Result1_1
	end
	if ConnectionEnableAutoReconnect and NONE == config3.AUTO_RECONNECTING then
		if config6.baseMessage == nil then
			config6.baseMessage = CreatorBanString
			config6.errorCode = ConnectionError
		end
		renderAutoReconnectPrompt()
		
		return
	elseif Default then
		if GetFFlagDisplayChannelNameOnErrorPromptModule() then
			Default:onErrorChanged(CreatorBanString, ConnectionError, true)
			
			return
		end
		Default:onErrorChanged(CreatorBanString, ConnectionError)
	end
end

local function onErrorMessageChanged()
	-- upvalues: GuiService (copy), updateErrorPrompt (copy)
	updateErrorPrompt(GuiService:GetErrorMessage(), GuiService:GetErrorCode(), (GuiService:GetErrorType()))
end

RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
	-- upvalues: Default (ref), RobloxGui (copy), X (ref), Y (ref)
	if not Default then return end
	local X1 = RobloxGui.AbsoluteSize.X
	local Y1 = RobloxGui.AbsoluteSize.Y
	
	if X ~= X1 or Y ~= Y1 then
		X = X1
		Y = Y1
		Default:resizeWidthAndHeight(X, Y)
	end
end)
updateErrorPrompt(GuiService:GetErrorMessage(), GuiService:GetErrorCode(), (GuiService:GetErrorType()))
GuiService.ErrorMessageChanged:connect(onErrorMessageChanged)

if DebugEnableErrorStringTesting then
	for i, value2 in pairs((require(RobloxGui.Modules.ErrorTestSets))) do
		for _, value3 in pairs(value2) do
			updateErrorPrompt("Should show localized strings, please file a jira ticket for missing translation.", value3, i)
			wait(2)
			
			if ConnectionEnableAutoReconnect then
				config6.active = false
				config6.attempt = 0
				config6.nextAttemptAt = 0
				config6.errorCode = nil
				config6.baseMessage = nil
				config6.lastRenderedText = nil
				config6.lastRemaining = nil
				
				if config6.pendingThread then
					task.cancel(config6.pendingThread)
					config6.pendingThread = nil
				end
				if config6.tickerThread then
					task.cancel(config6.tickerThread)
					config6.tickerThread = nil
				end
			end
			NONE = config3.NONE
		end
	end
end
if CoreGuiOverflowDetectionEngineFeature then
	GuiService.CoreGuiRenderOverflowed:Connect(function()
		-- upvalues: CoreGui (copy)
		for _, ScreenGui in pairs(CoreGui:GetChildren()) do
			if ScreenGui:IsA("ScreenGui") and ScreenGui.Name ~= "RobloxPromptGui" then
				ScreenGui.Enabled = false
			end
		end
	end)
end
if EnableExperienceGenericChallengeRenderingConnection2 then
	coroutine.wrap(function()
		-- upvalues: CorePackages (copy)
		require(CorePackages.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end