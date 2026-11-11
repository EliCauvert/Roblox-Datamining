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
local UpdateConnectionErrorLoc = game:DefineFastFlag("UpdateConnectionErrorLoc", false)
local ShowScreentimeLockoutKickMessage = game:DefineFastFlag("ShowScreentimeLockoutKickMessage", false)
local AddConnectionErrorLocalizationKeys = game:DefineFastFlag("AddConnectionErrorLocalizationKeys", false)
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
local UpdateConnectionLocWarning = game:DefineFastFlag("UpdateConnectionLocWarning", false)
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
local FFlagConnectionAmpUpsellOnLeave = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionAmpUpsellOnLeave
local FFlagConnectionAmpParentalApprovalUpsell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionAmpParentalApprovalUpsell
local FFlagConnectionUpsellAnalytics = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionUpsellAnalytics
local AddCollaborationCoreGatedConnectionError2 = game:DefineFastFlag("AddCollaborationCoreGatedConnectionError2", false)
local PlacelaunchCollaborationCoreGatedConnectionErrorEngineFeature = game:GetEngineFeature("PlacelaunchCollaborationCoreGatedConnectionError")
local ConnectionAmpUpsellOnLeaveModule = if FFlagConnectionAmpUpsellOnLeave then require(RobloxGui.Modules.ConnectionAmpUpsellOnLeave) else nil

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

local function translateString(Replaced, p1)
	-- upvalues: LocalizationService (copy), Localization (copy), UpdateConnectionLocWarning (copy), Logging (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	local Success, Result = pcall(function()
		-- upvalues: NewLocalization (copy), Replaced (copy), p1 (copy)
		return NewLocalization:Format(Replaced, p1)
	end)
	
	if Success then
		return Result
	end
	if UpdateConnectionLocWarning then
		Logging.warn("Failed to translate string with key: " .. Replaced .. ", LocaleId: " .. RobloxLocaleId)
	else
		Logging.warn("Failed to translate string with key: " .. Replaced)
	end
	return ""
end

local Default = nil
local NewCurrentTime = -1
local X = RobloxGui.AbsoluteSize.X
local Y = RobloxGui.AbsoluteSize.Y
local config1 = {
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
local ISRECONNECTING = 1
local OK = Enum.ConnectionError.OK
local config2 = {
	[2] = "Join Error",
	[7] = "Join Error",
	[3] = "Disconnected",
	[6] = "Disconnected",
	[4] = "Teleport Failed",
	[8] = "Error",
	[9] = "Low Memory Warning",
	[10] = "Connection Failed",
	[11] = "Connection Failed"
}

if FFlagConnectionAmpUpsellOnLeave then
	config2[12] = "Join Error"
	config2[13] = "Join Error"
end
if AddCollaborationCoreGatedConnectionError2 then
	config2[14] = "Join Error"
end
local config3 = {
	[2] = "InGame.ConnectionError.Title.JoinError",
	[7] = "InGame.ConnectionError.Title.JoinError",
	[3] = "InGame.ConnectionError.Title.Disconnected",
	[6] = "InGame.ConnectionError.Title.Disconnected",
	[4] = "InGame.ConnectionError.Title.TeleportFailed",
	[8] = "InGame.CommonUI.Title.Error",
	[9] = "InGame.ConnectionError.Title.LowMemoryWarning",
	[10] = "InGame.ConnectionError.Title.ConnectionFailed",
	[11] = "InGame.ConnectionError.Title.ConnectionFailed"
}

if FFlagConnectionAmpUpsellOnLeave then
	config3[12] = "InGame.ConnectionError.Title.JoinError"
	config3[13] = "InGame.ConnectionError.Title.JoinError"
end
if AddCollaborationCoreGatedConnectionError2 then
	config3[14] = "InGame.ConnectionError.Title.JoinError"
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
	-- upvalues: ISRECONNECTING (ref), TelemetryService (copy), config (copy), RbxAnalyticsService (copy), Default (ref), TeleportService (copy), FFlagCoreScriptShowTeleportPromptModule (copy), RefactorReconnectUnblockTeleport (copy), GuiService (copy)
	local _ = tick()
	
	if ISRECONNECTING == 5 then
		TelemetryService:LogCounter(config, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectInitiated" } }, 1)
	RbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectActivated")
	ISRECONNECTING = 5
	Default:primaryShimmerPlay()
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

local function v74()
	-- upvalues: ISRECONNECTING (ref), TelemetryService (copy), config (copy), Default (ref), GuiService (copy), TeleportService (copy)
	if ISRECONNECTING == 5 then
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
		ISRECONNECTING = 5
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
	-- upvalues: TelemetryService (copy), config (copy), GuiService (copy), RunService (copy)
	TelemetryService:LogCounter(config, { customFields = { selectedItem = "LeaveInitiated" } }, 1)
	GuiService.SelectedCoreObject = nil
	RunService.RenderStepped:wait()
	RunService.RenderStepped:wait()
	game:Shutdown()
end

local function Callback3()
	-- upvalues: GuiService (copy)
	GuiService:ClearError()
end

local config4 = {
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
	[Enum.ConnectionError.DisconnectPrivateServerKickout] = true,
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
	config4[Enum.ConnectionError.DisconnectClientFailure] = true
end
if ShowScreentimeLockoutKickMessage then
	config4[Enum.ConnectionError.ScreentimeLockoutKick] = true
end
if AddConnectionErrorLocalizationKeys then
	config4[Enum.ConnectionError.DisconnectBySecurityPolicy] = true
	config4[Enum.ConnectionError.DisconnectBlockedIP] = true
	config4[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = true
	config4[Enum.ConnectionError.DisconnectCollaboratorUnderage] = true
end
if AddPlacelaunchDeviceBlock2 then
	config4[Enum.ConnectionError.PlacelaunchDeviceBlock] = true
end
if AddContextualPlayabilityConnectionErrors then
	config4[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = true
	config4[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = true
	config4[Enum.ConnectionError.PlacelaunchCoreGated] = true
end
if AddVipOwnerNotPresentConnectionError and not VipOwnerNotPresentEnableReconnect then
	config4[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = true
end
local PlacelaunchCollaborationCoreGated = if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGatedConnectionErrorEngineFeature then Enum.ConnectionError.PlacelaunchCollaborationCoreGated else nil

if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGated then
	config4[PlacelaunchCollaborationCoreGated] = true
end
if RAKickLogic2 and Flag then
	config4[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = true
	config4[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = true
	config4[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = true
	config4[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = true
end
local config5 = {
	[2] = {
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
	[3] = {
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
	[4] = {
		{
			Text = "OK",
			LocalizationKey = "InGame.CommonUI.Button.Ok",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback3
		}
	},
	[6] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[7] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[8] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	},
	[9] = {
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
	[10] = {
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
	[11] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = Callback2
		}
	}
}

if FFlagConnectionAmpUpsellOnLeave then
	config5[12] = {
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
			Callback = ConnectionAmpUpsellOnLeaveModule.createAgeCheckCallback(config, v74, 9)
		}
	}
end
if FFlagConnectionAmpParentalApprovalUpsell then
	config5[13] = {
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
			Callback = ConnectionAmpUpsellOnLeaveModule.createParentalApprovalCallback(config, v74, 9)
		}
	}
end
if AddCollaborationCoreGatedConnectionError2 then
	config5[14] = {
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
local config6 = {
	[1] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = false
		v4.Transparency = 1
	end,
	[3] = function()
		-- upvalues: VRService (copy), RunService (copy), v4 (copy)
		if VRService.VREnabled then
			RunService:SetRobloxGuiFocused(false)
		else
			RunService:SetRobloxGuiFocused(true)
		end
		v4.Active = true
		v4.Transparency = 1
	end,
	[2] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[4] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[6] = function()
		-- upvalues: VRService (copy), RunService (copy), v4 (copy)
		if VRService.VREnabled then
			RunService:SetRobloxGuiFocused(false)
		else
			RunService:SetRobloxGuiFocused(true)
		end
		v4.Active = true
		v4.Transparency = 1
	end,
	[7] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[8] = function()
		-- upvalues: VRService (copy), RunService (copy), v4 (copy)
		if VRService.VREnabled then
			RunService:SetRobloxGuiFocused(false)
		else
			RunService:SetRobloxGuiFocused(true)
		end
		v4.Active = true
		v4.Transparency = 1
	end,
	[10] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end,
	[11] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end
}

if FFlagConnectionAmpUpsellOnLeave then
	local v5 = config6[2]
	config6[12] = v5
	
	if FFlagConnectionAmpParentalApprovalUpsell then
		config6[13] = v5
	end
end
if AddCollaborationCoreGatedConnectionError2 then
	config6[14] = function()
		-- upvalues: RunService (copy), v4 (copy)
		RunService:SetRobloxGuiFocused(false)
		v4.Active = true
		v4.Transparency = 0.3
	end
end
local function onEnter(p1)
	-- upvalues: Default (ref), DebugEnableErrorStringTesting (copy), ErrorPromptModule (copy), v4 (copy), X (ref), Y (ref), config6 (copy), config2 (copy), config3 (copy), config5 (copy)
	if not Default then
		Default = ErrorPromptModule.new("Default", {
			MenuIsOpenKey = "ConnectionErrorPrompt",
			PlayAnimation = not DebugEnableErrorStringTesting
		})
		Default:setParent(v4)
		Default:resizeWidthAndHeight(X, Y)
	end
	if config6[p1] then
		config6[p1]()
	end
	Default:setErrorTitle(config2[p1], config3[p1])
	Default:updateButtons(config5[p1])
end

local _ = function(p1)
	-- upvalues: Default (ref)
	if p1 == 5 then
		Default:primaryShimmerStop()
	end
end

local function stateTransit(ConnectionError, ConnectionError1, ISRECONNECTING)
	-- upvalues: FFlagAllowDisconnectGuiForOkUnknownModule (copy), ReconnectDisabledFFlag (copy), CurrentTime (ref), NewCurrentTime (ref), v2 (copy), OK (ref), config4 (copy), TelemetryService (copy), config (copy), RbxAnalyticsService (copy), FFlagConnectionAmpUpsellOnLeave (copy), ConnectionAmpUpsellOnLeaveModule (ref), FFlagConnectionUpsellAnalytics (copy), FFlagConnectionAmpParentalApprovalUpsell (copy), AddCollaborationCoreGatedConnectionError2 (copy), PlacelaunchCollaborationCoreGated (copy), PotentialClientTimeoutSeconds (copy)
	if FFlagAllowDisconnectGuiForOkUnknownModule then
		if ConnectionError1 == Enum.ConnectionError.OK then
			return 1
		end
	elseif ConnectionError == Enum.ConnectionError.OK then
		return 1
	end
	if ISRECONNECTING == 1 then
		if ReconnectDisabledFFlag then
			return 8
		end
		CurrentTime = tick()
		
		if FFlagAllowDisconnectGuiForOkUnknownModule then
			assert(ConnectionError1 ~= Enum.ConnectionError.OK)
			
			if ConnectionError == Enum.ConnectionError.OK then
				return 3
			end
		end
		if ConnectionError == Enum.ConnectionError.ConnectErrors then
			NewCurrentTime = tick() + v2
			OK = Enum.ConnectionError.ConnectErrors
			
			if config4[ConnectionError1] then
				return 11
			else
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "ConnectError" } }, 1)
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "ConnectFailed" } }, 1)
				
				return 10
			end
		elseif ConnectionError == Enum.ConnectionError.DisconnectErrors then
			NewCurrentTime = tick() + v2
			OK = Enum.ConnectionError.DisconnectErrors
			
			if ConnectionError1 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
				return 9
			elseif config4[ConnectionError1] then
				return 6
			else
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "Disconnected" } }, 1)
				RbxAnalyticsService:ReportCounter("ReconnectPrompt-Disconnect")
				
				return 3
			end
		elseif ConnectionError == Enum.ConnectionError.PlacelaunchErrors then
			OK = Enum.ConnectionError.PlacelaunchErrors
			
			if FFlagConnectionAmpUpsellOnLeave then
				local AgeVerificationRequiredEnum = ConnectionAmpUpsellOnLeaveModule.AgeVerificationRequiredEnum
				
				if AgeVerificationRequiredEnum and ConnectionError1 == AgeVerificationRequiredEnum then
					TelemetryService:LogCounter(config, {
						customFields = { selectedItem = "PlaceLaunchAgeVerificationRequired" }
					}, 1)
					
					if FFlagConnectionUpsellAnalytics then
						ConnectionAmpUpsellOnLeaveModule.fireImpressionAgeCheck(config, game.PlaceId)
					end
					return 12
				end
			end
			if FFlagConnectionAmpParentalApprovalUpsell then
				local ParentalApprovalRequiredEnum = ConnectionAmpUpsellOnLeaveModule.ParentalApprovalRequiredEnum
				
				if ParentalApprovalRequiredEnum and ConnectionError1 == ParentalApprovalRequiredEnum then
					TelemetryService:LogCounter(config, {
						customFields = { selectedItem = "PlaceLaunchParentalApprovalRequired" }
					}, 1)
					
					if FFlagConnectionUpsellAnalytics then
						ConnectionAmpUpsellOnLeaveModule.fireImpressionParentalApproval(config, game.PlaceId)
					end
					return 13
				end
			end
			if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGated and ConnectionError1 == PlacelaunchCollaborationCoreGated then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "PlaceLaunchCollaborationCoreGated" }
				}, 1)
				
				return 14
			elseif config4[ConnectionError1] then
				return 7
			else
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "PlaceLaunchError" } }, 1)
				RbxAnalyticsService:ReportCounter("ReconnectPrompt-PlaceLaunch")
				
				return 2
			end
		elseif ConnectionError == Enum.ConnectionError.TeleportErrors then
			TelemetryService:LogCounter(config, { customFields = { selectedItem = "TeleportError" } }, 1)
			RbxAnalyticsService:ReportCounter("ReconnectPrompt-TeleportFailed")
			
			return 4
		end
	end
	if ISRECONNECTING == 5 then
		TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectFailed" } }, 1)
		RbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectFailed")
		
		if ConnectionError == Enum.ConnectionError.TeleportErrors then
			if CurrentTime + PotentialClientTimeoutSeconds < tick() then
				TelemetryService:LogCounter(config, { customFields = { selectedItem = "ReconnectTimedOut" } }, 1)
				
				return if OK == Enum.ConnectionError.PlacelaunchErrors then 7 else 6
			elseif OK == Enum.ConnectionError.PlacelaunchErrors then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "PlaceLaunchReconnectFailed" }
				}, 1)
				
				return 2
			elseif OK == Enum.ConnectionError.DisconnectErrors then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "DisconnectReconnectFailed" }
				}, 1)
				
				return 3
			elseif OK == Enum.ConnectionError.ConnectErrors then
				TelemetryService:LogCounter(config, {
					customFields = { selectedItem = "ConnectReconnectFailed" }
				}, 1)
				
				return 10
			end
		end
	end
	return ISRECONNECTING
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
local config7 = {
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
	[Enum.ConnectionError.DisconnectBySecurityPolicy] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectBySecurityPolicy",
	[Enum.ConnectionError.DisconnectBlockedIP] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectBlockedIP",
	[Enum.ConnectionError.DisconnectClientFailure] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectClientFailure",
	[Enum.ConnectionError.DisconnectClientRequest] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectClientRequest",
	[Enum.ConnectionError.DisconnectPrivateServerKickout] = "InGame.ConnectionError.DisconnectPrivateServerKickout",
	[Enum.ConnectionError.DisconnectModeratedGame] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectModeratedGame",
	[Enum.ConnectionError.ServerShutdown] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.ServerShutdown",
	[Enum.ConnectionError.ReplicatorTimeout] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.ReplicatorTimeout",
	[Enum.ConnectionError.PlayerRemoved] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.PlayerRemoved",
	[Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave] = "InGame.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave",
	[Enum.ConnectionError.DisconnectRomarkEndOfTest] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectRomarkEndOfTest",
	[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked",
	[Enum.ConnectionError.DisconnectCollaboratorUnderage] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectCollaboratorUnderage",
	[Enum.ConnectionError.NetworkInternal] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkInternal",
	[Enum.ConnectionError.NetworkSend] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkSend",
	[Enum.ConnectionError.NetworkTimeout] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkTimeout",
	[Enum.ConnectionError.NetworkMisbehavior] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkMisbehavior",
	[Enum.ConnectionError.NetworkSecurity] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkSecurity",
	[Enum.ConnectionError.ReplacementReady] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.ReplacementReady",
	[Enum.ConnectionError.ServerEmpty] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.ServerEmpty",
	[Enum.ConnectionError.PhantomFreeze] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.PhantomFreeze",
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
	[Enum.ConnectionError.PlacelaunchCreatorBan] = if RemoveRefToMissingLocInConnection then nil else "InGame.ConnectionError.PlacelaunchCreatorBan",
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
	config7[Enum.ConnectionError.ScreentimeLockoutKick] = "Feature.Screentime.Content.ScreentimeLimitDialog"
end
if AddConnectionErrorLocalizationKeys then
	config7[Enum.ConnectionError.DisconnectBySecurityPolicy] = "InGame.ConnectionError.DisconnectBlockedConnection"
	config7[Enum.ConnectionError.DisconnectBlockedIP] = "InGame.ConnectionError.DisconnectBlockedConnection"
	config7[Enum.ConnectionError.DisconnectClientFailure] = "InGame.ConnectionError.DisconnectClientFailure"
	config7[Enum.ConnectionError.DisconnectClientRequest] = "InGame.ConnectionError.DisconnectClientRequest"
	config7[Enum.ConnectionError.DisconnectModeratedGame] = "InGame.ConnectionError.ServerShutdown"
	config7[Enum.ConnectionError.ServerShutdown] = "InGame.ConnectionError.ServerShutdown"
	config7[Enum.ConnectionError.ReplicatorTimeout] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.PlayerRemoved] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.DisconnectRomarkEndOfTest] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked"
	config7[Enum.ConnectionError.DisconnectCollaboratorUnderage] = "InGame.ConnectionError.DisconnectCollaboratorUnderage"
	config7[Enum.ConnectionError.NetworkInternal] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.NetworkSend] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.NetworkTimeout] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.NetworkMisbehavior] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.NetworkSecurity] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.ReplacementReady] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.ServerEmpty] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.PhantomFreeze] = "InGame.ConnectionError.DisconnectTryAgain"
	config7[Enum.ConnectionError.PlacelaunchCreatorBan] = "InGame.ConnectionError.CreatorBanNoTime"
end
if AddPlacelaunchDeviceBlock2 then
	config7[Enum.ConnectionError.PlacelaunchDeviceBlock] = "InGame.ConnectionError.PlacelaunchDeviceBlock"
end
if AddContextualPlayabilityConnectionErrors then
	config7[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = "InGame.ConnectionError.Description.AgeCheckRequired"
	config7[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = "InGame.ConnectionError.Description.ParentalApprovalRequired"
	config7[Enum.ConnectionError.PlacelaunchCoreGated] = "InGame.ConnectionError.Description.LockedByAge"
end
if AddVipOwnerNotPresentConnectionError then
	config7[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = "InGame.ConnectionError.Description.VipOwnerNotPresent"
end
if AddCollaborationCoreGatedConnectionError2 and PlacelaunchCollaborationCoreGated then
	config7[PlacelaunchCollaborationCoreGated] = "InGame.ConnectionError.Description.CollaborationRequiresTrustedFriends"
end
if RAKickLogic2 and Flag then
	config7[Enum.ConnectionError.DisconnectRemoteAttestationTimeout] = "InGame.ConnectionError.RemoteAttestationTimeout"
	config7[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = "InGame.ConnectionError.RemoteAttestationUnsupported"
	config7[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = "InGame.ConnectionError.RemoteAttestationGeneralFailure"
	config7[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = "InGame.ConnectionError.RemoteAttestationOSOutOfDate"
	config7[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = "InGame.ConnectionError.RemoteAttestationBootValidationFailure"
end
local function getErrorString(Text: string, ConnectionError, p1)
	-- upvalues: translateString (copy), MaxKickMessageLength (copy), UpdateConnectionErrorLoc (copy), config7 (copy), MutedErrorFunction (copy), ShouldMuteUnlocalizedError (copy)
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
	local Entry = nil
	if UpdateConnectionErrorLoc then
		Entry = config7[ConnectionError]
		
		if not Entry then
			MutedErrorFunction("Cannot find localization key for " .. tostring(ConnectionError))
			Entry = "InGame.ConnectionError.UnknownError"
		end
	else
		Entry = string.gsub(tostring(ConnectionError), "Enum", "InGame")
	end
	local TranslateStringResult = if ConnectionError == Enum.ConnectionError.DisconnectIdle then translateString(Entry, { RBX_NUM = tostring(20) }) else translateString(Entry)
	
	return if TranslateStringResult == "" then if ShouldMuteUnlocalizedError then translateString("InGame.ConnectionError.UnknownError") else Text else TranslateStringResult
end

local function updateErrorPrompt(ErrorMessage, ConnectionError, ConnectionError1)
	-- upvalues: stateTransit (copy), ISRECONNECTING (ref), config1 (copy), Default (ref), onEnter (copy), getCreatorBanString (copy), translateString (copy), getErrorString (copy), Result1_1 (copy), GetFFlagDisplayChannelNameOnErrorPromptModule (copy)
	local StateTransitResult = stateTransit(ConnectionError1, ConnectionError, ISRECONNECTING)
	
	if StateTransitResult ~= ISRECONNECTING then
		if ISRECONNECTING == config1.IS_RECONNECTING then
			Default:primaryShimmerStop()
		end
		ISRECONNECTING = StateTransitResult
		onEnter(StateTransitResult)
	end
	local CreatorBanString = nil
	if ConnectionError == Enum.ConnectionError.PlacelaunchCreatorBan then
		CreatorBanString = getCreatorBanString(ErrorMessage)
	elseif ConnectionError1 == Enum.ConnectionError.TeleportErrors and ISRECONNECTING ~= 4 then
		if ConnectionError == Enum.ConnectionError.OK then
			CreatorBanString = ""
		else
			local InGameConnectionErrorReconnectFailed = translateString("InGame.ConnectionError.ReconnectFailed")
			CreatorBanString = if InGameConnectionErrorReconnectFailed == "" then "Reconnect was unsuccessful. Please try again." else InGameConnectionErrorReconnectFailed
		end
	else
		CreatorBanString = getErrorString(ErrorMessage, ConnectionError)
	end
	if ISRECONNECTING == 8 then
		CreatorBanString = Result1_1
	end
	if Default then
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
	for i, value in pairs((require(RobloxGui.Modules.ErrorTestSets))) do
		for _, value1 in pairs(value) do
			updateErrorPrompt("Should show localized strings, please file a jira ticket for missing translation.", value1, i)
			wait(2)
			ISRECONNECTING = 1
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