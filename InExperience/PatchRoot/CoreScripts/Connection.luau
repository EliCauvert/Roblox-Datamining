local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local teleportService = game:GetService("TeleportService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localizationService = game:GetService("LocalizationService")
local VRService = game:GetService("VRService")
local corePackagesService = game:GetService("CorePackages")
local telemetryService = game:GetService("TelemetryService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
corePackagesService:WaitForChild("Workspace"):WaitForChild("Packages", if game:DefineFastFlag("ConnectionRemoveLoadingTimeout", false) then 1e999 else nil)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local errorPromptModule = require(robloxGui.Modules.ErrorPrompt)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local logging = require(corePackagesService.Workspace.Packages.AppCommonLib).Logging
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local mutedError = require(corePackagesService.Workspace.Packages.Loggers).mutedError
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local debugEnableErrorStringTesting = game:DefineFastFlag("DebugEnableErrorStringTesting", false)
local shouldMuteUnlocalizedError = game:DefineFastFlag("ShouldMuteUnlocalizedError", false)
local updateConnectionErrorLoc = game:DefineFastFlag("UpdateConnectionErrorLoc", false)
local showScreentimeLockoutKickMessage = game:DefineFastFlag("ShowScreentimeLockoutKickMessage", false)
local addConnectionErrorLocalizationKeys = game:DefineFastFlag("AddConnectionErrorLocalizationKeys", false)
local t = {
	eventName = "ConnectionEvent",
	description = "Counter to track connection events.",
	links = "https://roblox.atlassian.net/browse/CSC-585",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 7, 31 }
}
local potentialClientTimeoutSeconds = game:DefineFastInt("PotentialClientTimeoutSeconds", 7200)
local maxKickMessageLength = game:DefineFastInt("MaxKickMessageLength", 200)
local refactorReconnectUnblockTeleport = game:DefineFastFlag("RefactorReconnectUnblockTeleport", false)
local coreGuiOverflowDetectionEngineFeature = game:GetEngineFeature("CoreGuiOverflowDetection")
local fFlagCoreScriptShowTeleportPromptModule = require(robloxGui.Modules.Flags.FFlagCoreScriptShowTeleportPrompt)
local fFlagAllowDisconnectGuiForOkUnknownModule = require(robloxGui.Modules.Flags.FFlagAllowDisconnectGuiForOkUnknown)
local enableExperienceGenericChallengeRenderingConnection2 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingConnection2", false)
local getFFlagDisplayChannelNameOnErrorPromptModule = require(robloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)

local function _(p0, p1) --[[ line: 62 | named "safeGetFInt" ]]
	local ok, status = pcall(function() --[[ line: 63 ]]
		-- upvalues: p0 (ref)
		return tonumber(settings():GetFVariable(p0))
	end)
	
	return if ok then status else p1
end

local _ = function(p2, p3) --[[ line: 69 | named "safeGetFString" ]]
	local ok, status = pcall(function() --[[ line: 70 ]]
		-- upvalues: p2 (ref)
		return settings():GetFVariable(p2)
	end)
	
	return if ok then status else p3
end

local var27 = "DefaultTimeoutTimeMs"
local ok, status = pcall(function() --[[ line: 63 ]]
	-- upvalues: var27 (ref)
	return tonumber(settings():GetFVariable(var27))
end)
local var28 = (if ok then status else 10000) / 1000
local reconnectDisabledFFlag = settings():GetFFlag("ReconnectDisabled")
local var30 = "ReconnectDisabledReason"
local ok_1, status_1 = pcall(function() --[[ line: 70 ]]
	-- upvalues: var30 (ref)
	return settings():GetFVariable(var30)
end)
local var31 = if ok_1 then status_1 else "We're sorry, Roblox is temporarily unavailable.  Please try again later."
local currentTime = tick()
local updateConnectionLocWarning = game:DefineFastFlag("UpdateConnectionLocWarning", false)
local addPlacelaunchDeviceBlock2 = game:DefineFastFlag("AddPlacelaunchDeviceBlock2", false)
local addContextualPlayabilityConnectionErrors = game:DefineFastFlag("AddContextualPlayabilityConnectionErrors", false)
local addVipOwnerNotPresentConnectionError = game:DefineFastFlag("AddVipOwnerNotPresentConnectionError", false)
local vipOwnerNotPresentEnableReconnect = game:DefineFastFlag("VipOwnerNotPresentEnableReconnect", false)
local RAKickLogic2 = game:DefineFastFlag("RAKickLogic2", false)
local RAMinEngineVersion = game:DefineFastInt("RAMinEngineVersion", 725)
local var40 = false

if RAKickLogic2 then
	local var41 = tonumber(string.match(runService:GetRobloxVersion(), "%.(%d+)%."))
	
	if var41 and RAMinEngineVersion <= var41 then
		var40 = true
	end
end
local fFlagConnectionAmpUpsellOnLeave = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionAmpUpsellOnLeave
local fFlagConnectionAmpParentalApprovalUpsell = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionAmpParentalApprovalUpsell
local fFlagConnectionUpsellAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionUpsellAnalytics
local addCollaborationCoreGatedConnectionError2 = game:DefineFastFlag("AddCollaborationCoreGatedConnectionError2", false)
local placelaunchCollaborationCoreGatedConnectionErrorEngineFeature = game:GetEngineFeature("PlacelaunchCollaborationCoreGatedConnectionError")
local var44 = if fFlagConnectionAmpUpsellOnLeave then require(robloxGui.Modules.ConnectionAmpUpsellOnLeave) else nil

local function fetchUniverseIdFromPlaceId(p4) --[[ line: 128 ]]
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p4))
	
	if not ok or type(status) ~= "string" then
		return nil
	end
	local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, status)
	
	if not ok_1 or type(status_1) ~= "table" then
		return nil
	end
	local universeId = status_1.universeId
	
	return if type(universeId) == "number" and universeId > 0 then universeId else nil
end

local function translateString(p5, p6) --[[ line: 148 ]]
	-- upvalues: localizationService (ref), localization (ref), updateConnectionLocWarning (ref), logging (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var73 = localization.new(robloxLocaleId)
	var73:SetLocale(robloxLocaleId)
	local ok, status = pcall(function() --[[ line: 153 ]]
		-- upvalues: var73 (ref), p5 (ref), p6 (ref)
		return var73:Format(p5, p6)
	end)
	
	if ok then
		return status
	elseif updateConnectionLocWarning then
		logging.warn("Failed to translate string with key: " .. p5 .. ", LocaleId: " .. robloxLocaleId)
	else
		logging.warn("Failed to translate string with key: " .. p5)
	end
	return ""
end

local var47 = nil
local var48 = -1
local x = robloxGui.AbsoluteSize.X
local y = robloxGui.AbsoluteSize.Y
local t_1 = {
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
local var50 = 1
local OK = Enum.ConnectionError.OK
local t_2 = {
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

if fFlagConnectionAmpUpsellOnLeave then
	t_2[12] = "Join Error"
	t_2[13] = "Join Error"
end
if addCollaborationCoreGatedConnectionError2 then
	t_2[14] = "Join Error"
end
local t_3 = {
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

if fFlagConnectionAmpUpsellOnLeave then
	t_3[12] = "InGame.ConnectionError.Title.JoinError"
	t_3[13] = "InGame.ConnectionError.Title.JoinError"
end
if addCollaborationCoreGatedConnectionError2 then
	t_3[14] = "InGame.ConnectionError.Title.JoinError"
end
local var53 = create("Frame")({
	Name = "promptOverlay",
	BackgroundTransparency = 1,
	Active = false,
	BackgroundColor3 = Color3.new(0, 0, 0),
	Size = UDim2.new(1, 0, 1, 36),
	Position = UDim2.new(0, 0, 0, -36),
	Parent = create("ScreenGui")({
		Name = "RobloxPromptGui",
		OnTopOfCoreBlur = true,
		DisplayOrder = 9,
		AutoLocalize = false,
		Parent = coreGuiService
	})
})
coroutine.wrap(function() --[[ line: 264 ]]
	-- upvalues: robloxGui (ref), var53 (ref)
	local constantsModule = require(robloxGui.Modules.TopBar.Constants)
	local var75 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
	var53.Size = UDim2.new(1, 0, 1, var75)
	var53.Position = UDim2.new(0, 0, 0, -var75)
end)()

local function openCollaboratorsPageForUniverseId(p7) --[[ line: 273 ]]
	-- upvalues: telemetryService (ref), t (ref), url (ref), linkingProtocol (ref)
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "ViewCollaboratorsOpenUrl" }
	}, 1)
	linkingProtocol.default:openURL(string.format("%sdashboard/creations/experiences/%s/safety/collaborators", url.CREATE_URL, tostring(p7)))
end

local var55 = function() --[[ line: 284 ]]
	-- upvalues: telemetryService (ref), t (ref), openCollaboratorsPageForUniverseId (ref), fetchUniverseIdFromPlaceId (ref)
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "ViewCollaboratorsInitiated" }
	}, 1)
	local gameId = game.GameId
	
	if gameId and gameId ~= 0 then
		openCollaboratorsPageForUniverseId(gameId)
		
		return
	end
	local placeId = game.PlaceId
	
	if placeId and placeId ~= 0 then
		coroutine.wrap(function() --[[ line: 299 ]]
			-- upvalues: fetchUniverseIdFromPlaceId (copy), placeId (ref), telemetryService (copy), t (copy), openCollaboratorsPageForUniverseId (copy)
			local var76 = fetchUniverseIdFromPlaceId(placeId)
			
			if var76 then
				openCollaboratorsPageForUniverseId(var76)
				
				return
			end
			telemetryService:LogCounter(t, {
				customFields = { selectedItem = "ViewCollaboratorsUniverseIdLookupFailed" }
			}, 1)
		end)()
		
		return
	end
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "ViewCollaboratorsMissingPlaceId" }
	}, 1)
end

local var56 = function() --[[ line: 309 ]]
	-- upvalues: var50 (write), telemetryService (ref), t (ref), rbxAnalyticsService (ref), var47 (write), teleportService (ref), fFlagCoreScriptShowTeleportPromptModule (ref), refactorReconnectUnblockTeleport (ref), guiService (ref)
	local _ = tick()
	
	if var50 == 5 then
		telemetryService:LogCounter(t, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectInitiated" } }, 1)
	rbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectActivated")
	var50 = 5
	var47:primaryShimmerPlay()
	telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectSameServer" } }, 1)
	teleportService:TeleportReconnect()
	
	if fFlagCoreScriptShowTeleportPromptModule then
		if refactorReconnectUnblockTeleport then
			teleportService:UnblockAsync()
			
			return
		end
		guiService:SetMenuIsOpen(false, "ErrorPrompt")
	end
end

local var57 = function() --[[ line: 341 ]]
	-- upvalues: var50 (write), telemetryService (ref), t (ref), var47 (write), guiService (ref), teleportService (ref)
	if var50 == 5 then
		telemetryService:LogCounter(t, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	local placeId = game.PlaceId
	
	if placeId and placeId ~= 0 then
		telemetryService:LogCounter(t, {
			customFields = { selectedItem = "PlacelaunchRetryInitiated" }
		}, 1)
		var50 = 5
		var47:primaryShimmerPlay()
		guiService:ClearError()
		teleportService:Teleport(placeId)
		
		return
	end
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "PlacelaunchRetryMissingPlaceId" }
	}, 1)
end

local var58 = function() --[[ line: 361 ]]
	-- upvalues: telemetryService (ref), t (ref), guiService (ref), runService (ref)
	telemetryService:LogCounter(t, { customFields = { selectedItem = "LeaveInitiated" } }, 1)
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:wait()
	runService.RenderStepped:wait()
	game:Shutdown()
end

local var59 = function() --[[ line: 370 ]]
	-- upvalues: guiService (ref)
	guiService:ClearError()
end

local t_4 = {
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

if coreGuiOverflowDetectionEngineFeature then
	t_4[Enum.ConnectionError.DisconnectClientFailure] = true
end
if showScreentimeLockoutKickMessage then
	t_4[Enum.ConnectionError.ScreentimeLockoutKick] = true
end
if addConnectionErrorLocalizationKeys then
	t_4[Enum.ConnectionError.DisconnectBySecurityPolicy] = true
	t_4[Enum.ConnectionError.DisconnectBlockedIP] = true
	t_4[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = true
	t_4[Enum.ConnectionError.DisconnectCollaboratorUnderage] = true
end
if addPlacelaunchDeviceBlock2 then
	t_4[Enum.ConnectionError.PlacelaunchDeviceBlock] = true
end
if addContextualPlayabilityConnectionErrors then
	t_4[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = true
	t_4[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = true
	t_4[Enum.ConnectionError.PlacelaunchCoreGated] = true
end
if addVipOwnerNotPresentConnectionError and not vipOwnerNotPresentEnableReconnect then
	t_4[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = true
end
local var61 = if addCollaborationCoreGatedConnectionError2 and placelaunchCollaborationCoreGatedConnectionErrorEngineFeature then Enum.ConnectionError.PlacelaunchCollaborationCoreGated else nil

if addCollaborationCoreGatedConnectionError2 and var61 then
	t_4[var61] = true
end
if RAKickLogic2 and var40 then
	t_4[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = true
	t_4[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = true
	t_4[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = true
	t_4[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = true
end
local t_5 = {
	[2] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = var56
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = var58
		}
	},
	[3] = {
		{
			Text = "Reconnect",
			LocalizationKey = "InGame.ConnectionError.Button.Reconnect",
			LayoutOrder = 2,
			Primary = true,
			Callback = var56
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var58
		}
	},
	[4] = {
		{
			Text = "OK",
			LocalizationKey = "InGame.CommonUI.Button.Ok",
			LayoutOrder = 1,
			Primary = true,
			Callback = var59
		}
	},
	[6] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var58
		}
	},
	[7] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var58
		}
	},
	[8] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var58
		}
	},
	[9] = {
		{
			Text = "Keep Playing",
			LocalizationKey = "InGame.CommonUI.Button.KeepPlaying",
			LayoutOrder = 1,
			Callback = var59
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 2,
			Primary = true,
			Callback = var58
		}
	},
	[10] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = var56
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = var58
		}
	},
	[11] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var58
		}
	}
}

if fFlagConnectionAmpUpsellOnLeave then
	t_5[12] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var58
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = var44.PrimaryButtonText,
			LocalizationKey = var44.PrimaryButtonLocalizationKey,
			Callback = var44.createAgeCheckCallback(t, var57, 9)
		}
	}
end
if fFlagConnectionAmpParentalApprovalUpsell then
	t_5[13] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var58
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = var44.PrimaryButtonText,
			LocalizationKey = var44.PrimaryButtonLocalizationKey,
			Callback = var44.createParentalApprovalCallback(t, var57, 9)
		}
	}
end
if addCollaborationCoreGatedConnectionError2 then
	t_5[14] = {
		{
			Text = "Ok",
			LocalizationKey = "InGame.ConnectionError.Action.Ok",
			LayoutOrder = 1,
			Callback = var58
		},
		{
			Text = "View collaborators",
			LocalizationKey = "InGame.ConnectionError.Action.ViewCollaborators",
			LayoutOrder = 2,
			Primary = true,
			Callback = var55
		}
	}
end
local t_6 = {
	[1] = function() --[[ line: 627 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = false
		var53.Transparency = 1
	end,
	[3] = function() --[[ line: 632 ]]
		-- upvalues: VRService (ref), runService (ref), var53 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var53.Active = true
		var53.Transparency = 1
	end,
	[2] = function() --[[ line: 641 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = true
		var53.Transparency = 0.3
	end,
	[4] = function() --[[ line: 646 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = true
		var53.Transparency = 0.3
	end,
	[6] = function() --[[ line: 651 ]]
		-- upvalues: VRService (ref), runService (ref), var53 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var53.Active = true
		var53.Transparency = 1
	end,
	[7] = function() --[[ line: 660 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = true
		var53.Transparency = 0.3
	end,
	[8] = function() --[[ line: 665 ]]
		-- upvalues: VRService (ref), runService (ref), var53 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var53.Active = true
		var53.Transparency = 1
	end,
	[10] = function() --[[ line: 674 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = true
		var53.Transparency = 0.3
	end,
	[11] = function() --[[ line: 679 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = true
		var53.Transparency = 0.3
	end
}

if fFlagConnectionAmpUpsellOnLeave then
	local var64 = t_6[2]
	t_6[12] = var64
	
	if fFlagConnectionAmpParentalApprovalUpsell then
		t_6[13] = var64
	end
end
if addCollaborationCoreGatedConnectionError2 then
	t_6[14] = function() --[[ line: 699 ]]
		-- upvalues: runService (ref), var53 (ref)
		runService:SetRobloxGuiFocused(false)
		var53.Active = true
		var53.Transparency = 0.3
	end
end
local function onEnter(p8) --[[ line: 706 ]]
	-- upvalues: var47 (write), debugEnableErrorStringTesting (ref), errorPromptModule (ref), var53 (ref), x (write), y (write), t_6 (ref), t_2 (ref), t_3 (ref), t_5 (ref)
	if not var47 then
		var47 = errorPromptModule.new("Default", {
			MenuIsOpenKey = "ConnectionErrorPrompt",
			PlayAnimation = not debugEnableErrorStringTesting
		})
		var47:setParent(var53)
		var47:resizeWidthAndHeight(x, y)
	end
	if t_6[p8] then
		t_6[p8]()
	end
	var47:setErrorTitle(t_2[p8], t_3[p8])
	var47:updateButtons(t_5[p8])
end

local _ = function(p9) --[[ line: 723 | named "onExit" ]]
	-- upvalues: var47 (write)
	if p9 == 5 then
		var47:primaryShimmerStop()
	end
end

local function stateTransit(p10, p11, p12) --[[ line: 730 ]]
	-- upvalues: fFlagAllowDisconnectGuiForOkUnknownModule (ref), reconnectDisabledFFlag (ref), currentTime (write), var48 (write), var28 (ref), OK (write), t_4 (ref), telemetryService (ref), t (ref), rbxAnalyticsService (ref), fFlagConnectionAmpUpsellOnLeave (ref), var44 (write), fFlagConnectionUpsellAnalytics (ref), fFlagConnectionAmpParentalApprovalUpsell (ref), addCollaborationCoreGatedConnectionError2 (ref), var61 (ref), potentialClientTimeoutSeconds (ref)
	if fFlagAllowDisconnectGuiForOkUnknownModule then
		if p11 == Enum.ConnectionError.OK then
			return 1
		elseif p12 == 1 then
			if reconnectDisabledFFlag then
				return 8
			end
			currentTime = tick()
			
			if fFlagAllowDisconnectGuiForOkUnknownModule then
				assert(p11 ~= Enum.ConnectionError.OK)
				
				if p10 == Enum.ConnectionError.OK then
					return 3
				elseif p10 == Enum.ConnectionError.ConnectErrors then
					var48 = tick() + var28
					OK = Enum.ConnectionError.ConnectErrors
					
					if t_4[p11] then
						return 11
					end
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ConnectError" } }, 1)
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ConnectFailed" } }, 1)
					
					return 10
				elseif p10 == Enum.ConnectionError.DisconnectErrors then
					var48 = tick() + var28
					OK = Enum.ConnectionError.DisconnectErrors
					
					if p11 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
						return 9
					elseif t_4[p11] then
						return 6
					end
					telemetryService:LogCounter(t, { customFields = { selectedItem = "Disconnected" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-Disconnect")
					
					return 3
				elseif p10 == Enum.ConnectionError.PlacelaunchErrors then
					OK = Enum.ConnectionError.PlacelaunchErrors
					
					if fFlagConnectionAmpUpsellOnLeave then
						local ageVerificationRequiredEnum = var44.AgeVerificationRequiredEnum
						
						if ageVerificationRequiredEnum and p11 == ageVerificationRequiredEnum then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "PlaceLaunchAgeVerificationRequired" }
							}, 1)
							
							if fFlagConnectionUpsellAnalytics then
								var44.fireImpressionAgeCheck(t, game.PlaceId)
							end
							return 12
						elseif fFlagConnectionAmpParentalApprovalUpsell then
							local parentalApprovalRequiredEnum = var44.ParentalApprovalRequiredEnum
							
							if parentalApprovalRequiredEnum and p11 == parentalApprovalRequiredEnum then
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "PlaceLaunchParentalApprovalRequired" }
								}, 1)
								
								if fFlagConnectionUpsellAnalytics then
									var44.fireImpressionParentalApproval(t, game.PlaceId)
								end
								return 13
							elseif addCollaborationCoreGatedConnectionError2 and var61 and p11 == var61 then
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "PlaceLaunchCollaborationCoreGated" }
								}, 1)
								
								return 14
							elseif t_4[p11] then
								return 7
							end
							telemetryService:LogCounter(t, { customFields = { selectedItem = "PlaceLaunchError" } }, 1)
							rbxAnalyticsService:ReportCounter("ReconnectPrompt-PlaceLaunch")
							
							return 2
						end
					end
				elseif p10 == Enum.ConnectionError.TeleportErrors then
					telemetryService:LogCounter(t, { customFields = { selectedItem = "TeleportError" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-TeleportFailed")
					
					return 4
				elseif p12 == 5 then
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectFailed" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectFailed")
					
					if p10 == Enum.ConnectionError.TeleportErrors then
						if currentTime + potentialClientTimeoutSeconds < tick() then
							telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectTimedOut" } }, 1)
							
							return if OK == Enum.ConnectionError.PlacelaunchErrors then 7 else 6
						elseif OK == Enum.ConnectionError.PlacelaunchErrors then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "PlaceLaunchReconnectFailed" }
							}, 1)
							
							return 2
						elseif OK == Enum.ConnectionError.DisconnectErrors then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "DisconnectReconnectFailed" }
							}, 1)
							
							return 3
						elseif OK == Enum.ConnectionError.ConnectErrors then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "ConnectReconnectFailed" }
							}, 1)
							
							return 10
						end
					end
				end
				return p12
			end
		end
	elseif p10 == Enum.ConnectionError.OK then
		return 1
	end
end

local function getCreatorBanString(p13) --[[ line: 853 ]]
	-- upvalues: guiService (ref), translateString (ref)
	local errorDetails = guiService:GetErrorDetails()
	
	if not errorDetails then
		return p13
	end
	local var82
	local _ = nil
	
	if errorDetails.time then
		local minutes = errorDetails.minutes
		local hours = errorDetails.hours
		local days = errorDetails.days
		local var78 = if minutes == 1 then translateString("InGame.ConnectionError.CreatorBanMinutesSingular") else translateString("InGame.ConnectionError.CreatorBanMinutesPlural", { RBX_TIME_MINUTES = minutes })
		local var79 = if hours == 1 then translateString("InGame.ConnectionError.CreatorBanHoursSingular") else translateString("InGame.ConnectionError.CreatorBanHoursPlural", { RBX_TIME_HOURS = hours })
		local var80 = if days == 1 then translateString("InGame.ConnectionError.CreatorBanDaysSingular") else translateString("InGame.ConnectionError.CreatorBanDaysPlural", { RBX_TIME_DAYS = days })
		
		if var78 == "" or var79 == "" or var80 == "" then
			return p13
		end
		local var81 = var78
		
		if hours > 0 then
			var81 = var79 .. ", " .. var81
		end
		if days > 0 then
			var81 = var80 .. ", " .. var81
		end
		var82 = translateString("InGame.ConnectionError.CreatorBanWithTime", { RBX_TIME_REMAINING = var81 })
	else
		var82 = translateString("InGame.ConnectionError.CreatorBanNoTime")
	end
	if var82 == "" then
		return p13
	end
	local displayReason = errorDetails.displayReason
	
	if not displayReason or displayReason == "" then
		return var82
	end
	local var83 = translateString("InGame.ConnectionError.CreatorBanMessage", { RBX_STR = displayReason })
	
	return if var83 == "" then p13 else var82 .. " " .. var83
end

local removeRefToMissingLocInConnection = game:DefineFastFlag("RemoveRefToMissingLocInConnection", false)
local t_7 = {
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
	[Enum.ConnectionError.DisconnectBySecurityPolicy] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectBySecurityPolicy",
	[Enum.ConnectionError.DisconnectBlockedIP] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectBlockedIP",
	[Enum.ConnectionError.DisconnectClientFailure] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectClientFailure",
	[Enum.ConnectionError.DisconnectClientRequest] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectClientRequest",
	[Enum.ConnectionError.DisconnectPrivateServerKickout] = "InGame.ConnectionError.DisconnectPrivateServerKickout",
	[Enum.ConnectionError.DisconnectModeratedGame] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectModeratedGame",
	[Enum.ConnectionError.ServerShutdown] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.ServerShutdown",
	[Enum.ConnectionError.ReplicatorTimeout] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.ReplicatorTimeout",
	[Enum.ConnectionError.PlayerRemoved] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.PlayerRemoved",
	[Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave] = "InGame.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave",
	[Enum.ConnectionError.DisconnectRomarkEndOfTest] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectRomarkEndOfTest",
	[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked",
	[Enum.ConnectionError.DisconnectCollaboratorUnderage] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.DisconnectCollaboratorUnderage",
	[Enum.ConnectionError.NetworkInternal] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkInternal",
	[Enum.ConnectionError.NetworkSend] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkSend",
	[Enum.ConnectionError.NetworkTimeout] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkTimeout",
	[Enum.ConnectionError.NetworkMisbehavior] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkMisbehavior",
	[Enum.ConnectionError.NetworkSecurity] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.NetworkSecurity",
	[Enum.ConnectionError.ReplacementReady] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.ReplacementReady",
	[Enum.ConnectionError.ServerEmpty] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.ServerEmpty",
	[Enum.ConnectionError.PhantomFreeze] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.PhantomFreeze",
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
	[Enum.ConnectionError.PlacelaunchCreatorBan] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.PlacelaunchCreatorBan",
	[Enum.ConnectionError.PlacelaunchCustomMessage] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.PlacelaunchCustomMessage",
	[Enum.ConnectionError.PlacelaunchOtherError] = "InGame.ConnectionError.PlacelaunchOtherError",
	[Enum.ConnectionError.TeleportErrors] = "InGame.ConnectionError.TeleportErrors",
	[Enum.ConnectionError.TeleportFailure] = "InGame.ConnectionError.TeleportFailure",
	[Enum.ConnectionError.TeleportGameNotFound] = "InGame.ConnectionError.TeleportGameNotFound",
	[Enum.ConnectionError.TeleportGameEnded] = "InGame.ConnectionError.TeleportGameEnded",
	[Enum.ConnectionError.TeleportGameFull] = "InGame.ConnectionError.TeleportGameFull",
	[Enum.ConnectionError.TeleportUnauthorized] = "InGame.ConnectionError.TeleportUnauthorized",
	[Enum.ConnectionError.TeleportFlooded] = "InGame.ConnectionError.TeleportFlooded",
	[Enum.ConnectionError.TeleportIsTeleporting] = if removeRefToMissingLocInConnection then nil else "InGame.ConnectionError.TeleportIsTeleporting",
	[Enum.ConnectionError.DisconnectVerboselyModeratedGame] = "InGame.ConnectionError.DisconnectVerboselyModeratedGame"
}

if showScreentimeLockoutKickMessage then
	t_7[Enum.ConnectionError.ScreentimeLockoutKick] = "Feature.Screentime.Content.ScreentimeLimitDialog"
end
if addConnectionErrorLocalizationKeys then
	t_7[Enum.ConnectionError.DisconnectBySecurityPolicy] = "InGame.ConnectionError.DisconnectBlockedConnection"
	t_7[Enum.ConnectionError.DisconnectBlockedIP] = "InGame.ConnectionError.DisconnectBlockedConnection"
	t_7[Enum.ConnectionError.DisconnectClientFailure] = "InGame.ConnectionError.DisconnectClientFailure"
	t_7[Enum.ConnectionError.DisconnectClientRequest] = "InGame.ConnectionError.DisconnectClientRequest"
	t_7[Enum.ConnectionError.DisconnectModeratedGame] = "InGame.ConnectionError.ServerShutdown"
	t_7[Enum.ConnectionError.ServerShutdown] = "InGame.ConnectionError.ServerShutdown"
	t_7[Enum.ConnectionError.ReplicatorTimeout] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.PlayerRemoved] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.DisconnectRomarkEndOfTest] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.DisconnectCollaboratorPermissionRevoked] = "InGame.ConnectionError.DisconnectCollaboratorPermissionRevoked"
	t_7[Enum.ConnectionError.DisconnectCollaboratorUnderage] = "InGame.ConnectionError.DisconnectCollaboratorUnderage"
	t_7[Enum.ConnectionError.NetworkInternal] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.NetworkSend] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.NetworkTimeout] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.NetworkMisbehavior] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.NetworkSecurity] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.ReplacementReady] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.ServerEmpty] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.PhantomFreeze] = "InGame.ConnectionError.DisconnectTryAgain"
	t_7[Enum.ConnectionError.PlacelaunchCreatorBan] = "InGame.ConnectionError.CreatorBanNoTime"
end
if addPlacelaunchDeviceBlock2 then
	t_7[Enum.ConnectionError.PlacelaunchDeviceBlock] = "InGame.ConnectionError.PlacelaunchDeviceBlock"
end
if addContextualPlayabilityConnectionErrors then
	t_7[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = "InGame.ConnectionError.Description.AgeCheckRequired"
	t_7[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = "InGame.ConnectionError.Description.ParentalApprovalRequired"
	t_7[Enum.ConnectionError.PlacelaunchCoreGated] = "InGame.ConnectionError.Description.LockedByAge"
end
if addVipOwnerNotPresentConnectionError then
	t_7[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = "InGame.ConnectionError.Description.VipOwnerNotPresent"
end
if addCollaborationCoreGatedConnectionError2 and var61 then
	t_7[var61] = "InGame.ConnectionError.Description.CollaborationRequiresTrustedFriends"
end
if RAKickLogic2 and var40 then
	t_7[Enum.ConnectionError.DisconnectRemoteAttestationTimeout] = "InGame.ConnectionError.RemoteAttestationTimeout"
	t_7[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = "InGame.ConnectionError.RemoteAttestationUnsupported"
	t_7[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = "InGame.ConnectionError.RemoteAttestationGeneralFailure"
	t_7[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = "InGame.ConnectionError.RemoteAttestationOSOutOfDate"
	t_7[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = "InGame.ConnectionError.RemoteAttestationBootValidationFailure"
end
local function getErrorString(p14, p15, p16) --[[ line: 1064 ]]
	-- upvalues: translateString (ref), maxKickMessageLength (ref), updateConnectionErrorLoc (ref), t_7 (ref), mutedError (ref), shouldMuteUnlocalizedError (ref)
	if p15 == Enum.ConnectionError.OK then
		return ""
	elseif p16 then
		local var84 = translateString("InGame.ConnectionError.ReconnectFailed")
		
		return if var84 == "" then "Reconnect was unsuccessful. Please try again." else var84
	elseif p15 == Enum.ConnectionError.DisconnectLuaKick and p14 ~= "" then
		p14 = p14:sub(1, maxKickMessageLength)
		local var87 = translateString("InGame.ConnectionError.DisconnectLuaKickWithMessage", { RBX_STR = p14 })
		
		return if var87 == "" then p14 else var87
	end
	local var85
	local _ = nil
	
	if updateConnectionErrorLoc then
		var85 = t_7[p15]
		
		if not var85 then
			mutedError("Cannot find localization key for " .. tostring(p15))
			var85 = "InGame.ConnectionError.UnknownError"
		end
	else
		var85 = string.gsub(tostring(p15), "Enum", "InGame")
	end
	local var86 = if p15 == Enum.ConnectionError.DisconnectIdle then translateString(var85, { RBX_NUM = tostring(20) }) else translateString(var85)
	
	return if var86 == "" then if shouldMuteUnlocalizedError then translateString("InGame.ConnectionError.UnknownError") else p14 else var86
end

local function updateErrorPrompt(p17, p18, p19) --[[ line: 1118 ]]
	-- upvalues: stateTransit (ref), var50 (write), t_1 (ref), var47 (write), onEnter (ref), getCreatorBanString (ref), translateString (ref), getErrorString (ref), var31 (ref), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	local var88 = stateTransit(p19, p18, var50)
	
	if var88 ~= var50 then
		if var50 == t_1.IS_RECONNECTING then
			var47:primaryShimmerStop()
		end
		var50 = var88
		onEnter(var88)
	end
	if p18 == Enum.ConnectionError.PlacelaunchCreatorBan then
		p17 = getCreatorBanString(p17)
	elseif p19 == Enum.ConnectionError.TeleportErrors and var50 ~= 4 then
		local _ = p17
		
		if p18 == Enum.ConnectionError.OK then
			p17 = ""
		else
			local var89 = translateString("InGame.ConnectionError.ReconnectFailed")
			p17 = if var89 ~= "" then "Reconnect was unsuccessful. Please try again." else var89
		end
	else
		p17 = getErrorString(p17, p18)
	end
	if var50 == 8 then
		p17 = var31
	end
	if var47 then
		if getFFlagDisplayChannelNameOnErrorPromptModule() then
			var47:onErrorChanged(p17, p18, true)
			
			return
		end
		var47:onErrorChanged(p17, p18)
	end
end

local function onErrorMessageChanged() --[[ line: 1149 ]]
	-- upvalues: guiService (ref), updateErrorPrompt (ref)
	updateErrorPrompt(guiService:GetErrorMessage(), guiService:GetErrorCode(), guiService:GetErrorType())
end

robloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ line: 1156 | named "onScreenSizeChanged" ]]
	-- upvalues: var47 (write), robloxGui (ref), x (write), y (write)
	if not var47 then return end
	local x_1 = robloxGui.AbsoluteSize.X
	local y_1 = robloxGui.AbsoluteSize.Y
	
	if x ~= x_1 or y ~= y_1 then
		x = x_1
		y = y_1
		var47:resizeWidthAndHeight(x, y)
	end
end)
updateErrorPrompt(guiService:GetErrorMessage(), guiService:GetErrorCode(), guiService:GetErrorType())
guiService.ErrorMessageChanged:connect(onErrorMessageChanged)

if debugEnableErrorStringTesting then
	for i, v in pairs(require(robloxGui.Modules.ErrorTestSets)) do
		for i_1, v_1 in pairs(v) do
			updateErrorPrompt("Should show localized strings, please file a jira ticket for missing translation.", v_1, i)
			wait(2)
			var50 = 1
		end
	end
end
if coreGuiOverflowDetectionEngineFeature then
	guiService.CoreGuiRenderOverflowed:Connect(function() --[[ line: 1192 ]]
		-- upvalues: coreGuiService (ref)
		for i, v in pairs(coreGuiService:GetChildren()) do
			if v:IsA("ScreenGui") and v.Name ~= "RobloxPromptGui" then
				v.Enabled = false
			end
		end
	end)
end
if enableExperienceGenericChallengeRenderingConnection2 then
	coroutine.wrap(function() --[[ line: 1209 ]]
		-- upvalues: corePackagesService (ref)
		require(corePackagesService.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end