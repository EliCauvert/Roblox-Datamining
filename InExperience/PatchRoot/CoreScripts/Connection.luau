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
local showScreentimeLockoutKickMessage = game:DefineFastFlag("ShowScreentimeLockoutKickMessage", false)
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
local connectionEnableAutoReconnect = game:DefineFastFlag("ConnectionEnableAutoReconnect", false)
local connectionAutoReconnectFirstDelayMs = game:DefineFastInt("ConnectionAutoReconnectFirstDelayMs", 2000)
local connectionAutoReconnectBaseDelayMs = game:DefineFastInt("ConnectionAutoReconnectBaseDelayMs", 5000)
local connectionAutoReconnectMaxDelayMs = game:DefineFastInt("ConnectionAutoReconnectMaxDelayMs", 20000)
local connectionAutoReconnectJitterMs = game:DefineFastInt("ConnectionAutoReconnectJitterMs", 2000)
local connectionAutoReconnectMaxDurationSeconds = game:DefineFastInt("ConnectionAutoReconnectMaxDurationSeconds", 300)
local var26 = if connectionEnableAutoReconnect then Random.new() else nil
local coreGuiOverflowDetectionEngineFeature = game:GetEngineFeature("CoreGuiOverflowDetection")
local fFlagCoreScriptShowTeleportPromptModule = require(robloxGui.Modules.Flags.FFlagCoreScriptShowTeleportPrompt)
local fFlagAllowDisconnectGuiForOkUnknownModule = require(robloxGui.Modules.Flags.FFlagAllowDisconnectGuiForOkUnknown)
local enableExperienceGenericChallengeRenderingConnection2 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingConnection2", false)
local getFFlagDisplayChannelNameOnErrorPromptModule = require(robloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)

local function _(p0, p1) --[[ line: 74 | named "safeGetFInt" ]]
	local ok, status = pcall(function() --[[ line: 75 ]]
		-- upvalues: p0 (ref)
		return tonumber(settings():GetFVariable(p0))
	end)
	
	return if ok then status else p1
end

local _ = function(p2, p3) --[[ line: 81 | named "safeGetFString" ]]
	local ok, status = pcall(function() --[[ line: 82 ]]
		-- upvalues: p2 (ref)
		return settings():GetFVariable(p2)
	end)
	
	return if ok then status else p3
end

local _ = function(p4) --[[ line: 91 | named "computeAutoReconnectDelaySeconds" ]]
	-- upvalues: connectionAutoReconnectFirstDelayMs (ref), connectionAutoReconnectBaseDelayMs (ref), connectionAutoReconnectMaxDelayMs (ref), connectionAutoReconnectJitterMs (ref), var26 (write)
	local var85 = if p4 <= 1 then connectionAutoReconnectFirstDelayMs elseif p4 == 2 then connectionAutoReconnectBaseDelayMs else math.min(connectionAutoReconnectBaseDelayMs * 2 ^ (p4 - 2), connectionAutoReconnectMaxDelayMs)
	
	if connectionAutoReconnectJitterMs > 0 then
		var85 += var26:NextInteger(0, connectionAutoReconnectJitterMs)
	end
	return var85 / 1000
end

local var32 = "DefaultTimeoutTimeMs"
local ok, status = pcall(function() --[[ line: 75 ]]
	-- upvalues: var32 (ref)
	return tonumber(settings():GetFVariable(var32))
end)
local var33 = (if ok then status else 10000) / 1000
local reconnectDisabledFFlag = settings():GetFFlag("ReconnectDisabled")
local var35 = "ReconnectDisabledReason"
local ok_1, status_1 = pcall(function() --[[ line: 82 ]]
	-- upvalues: var35 (ref)
	return settings():GetFVariable(var35)
end)
local var36 = if ok_1 then status_1 else "We're sorry, Roblox is temporarily unavailable.  Please try again later."
local currentTime = tick()
local addPlacelaunchDeviceBlock2 = game:DefineFastFlag("AddPlacelaunchDeviceBlock2", false)
local addContextualPlayabilityConnectionErrors = game:DefineFastFlag("AddContextualPlayabilityConnectionErrors", false)
local addVipOwnerNotPresentConnectionError = game:DefineFastFlag("AddVipOwnerNotPresentConnectionError", false)
local vipOwnerNotPresentEnableReconnect = game:DefineFastFlag("VipOwnerNotPresentEnableReconnect", false)
local RAKickLogic2 = game:DefineFastFlag("RAKickLogic2", false)
local RAMinEngineVersion = game:DefineFastInt("RAMinEngineVersion", 725)
local var44 = false

if RAKickLogic2 then
	local var45 = tonumber(string.match(runService:GetRobloxVersion(), "%.(%d+)%."))
	
	if var45 and RAMinEngineVersion <= var45 then
		var44 = true
	end
end
local fFlagConnectionAmpUpsellOnLeave = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionAmpUpsellOnLeave
local fFlagConnectionAmpParentalApprovalUpsell = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionAmpParentalApprovalUpsell
local fFlagConnectionUpsellAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionUpsellAnalytics
local fFlagUniversalFeatureRestrictionReceivers = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local addCollaborationCoreGatedConnectionError2 = game:DefineFastFlag("AddCollaborationCoreGatedConnectionError2", false)
local placelaunchCollaborationCoreGatedConnectionErrorEngineFeature = game:GetEngineFeature("PlacelaunchCollaborationCoreGatedConnectionError")
local robloxExperienceKickOverride = game:DefineFastFlag("RobloxExperienceKickOverride", false)
local var49 = if fFlagConnectionAmpUpsellOnLeave then require(robloxGui.Modules.ConnectionAmpUpsellOnLeave) else nil
local buildRobloxExperienceKickContentModule = require(corePackagesService.Workspace.Packages.InterventionShared.buildRobloxExperienceKickContent)
local showFeatureRestrictionDirectModule = require(corePackagesService.Workspace.Packages.UniversalFeatureRestrictions.showFeatureRestrictionDirect)

local function fetchUniverseIdFromPlaceId(p5) --[[ line: 164 ]]
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p5))
	
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

local function translateString(p6, p7) --[[ line: 184 ]]
	-- upvalues: localizationService (ref), localization (ref), logging (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var86 = localization.new(robloxLocaleId)
	var86:SetLocale(robloxLocaleId)
	local ok, status = pcall(function() --[[ line: 189 ]]
		-- upvalues: var86 (ref), p6 (ref), p7 (ref)
		return var86:Format(p6, p7)
	end)
	
	if ok then
		return status
	end
	logging.warn("Failed to translate string with key: " .. p6 .. ", LocaleId: " .. robloxLocaleId)
	
	return ""
end

local var54 = nil
local var55 = -1
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

if connectionEnableAutoReconnect then
	t_1.AUTO_RECONNECTING = 15
end
local NONE = t_1.NONE
local OK = Enum.ConnectionError.OK
local t_2 = {
	[t_1.RECONNECT_PLACELAUNCH] = "Join Error",
	[t_1.RECONNECT_DISABLED_PLACELAUNCH] = "Join Error",
	[t_1.RECONNECT_DISCONNECT] = "Disconnected",
	[t_1.RECONNECT_DISABLED_DISCONNECT] = "Disconnected",
	[t_1.TELEPORT_FAILED] = "Teleport Failed",
	[t_1.RECONNECT_DISABLED] = "Error",
	[t_1.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "Low Memory Warning",
	[t_1.RECONNECT_CONNECT_FAILURE] = "Connection Failed",
	[t_1.RECONNECT_DISABLED_CONNECT_FAILURE] = "Connection Failed"
}

if fFlagConnectionAmpUpsellOnLeave then
	t_2[t_1.RECONNECT_AGE_CHECK_REQUIRED] = "Join Error"
	t_2[t_1.RECONNECT_PARENT_APPROVAL_REQUIRED] = "Join Error"
end
if addCollaborationCoreGatedConnectionError2 then
	t_2[t_1.RECONNECT_COLLABORATION_CORE_GATED] = "Join Error"
end
if connectionEnableAutoReconnect then
	t_2[t_1.AUTO_RECONNECTING] = "Disconnected"
end
local t_3 = {
	[t_1.RECONNECT_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError",
	[t_1.RECONNECT_DISABLED_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError",
	[t_1.RECONNECT_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected",
	[t_1.RECONNECT_DISABLED_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected",
	[t_1.TELEPORT_FAILED] = "InGame.ConnectionError.Title.TeleportFailed",
	[t_1.RECONNECT_DISABLED] = "InGame.CommonUI.Title.Error",
	[t_1.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "InGame.ConnectionError.Title.LowMemoryWarning",
	[t_1.RECONNECT_CONNECT_FAILURE] = "InGame.ConnectionError.Title.ConnectionFailed",
	[t_1.RECONNECT_DISABLED_CONNECT_FAILURE] = "InGame.ConnectionError.Title.ConnectionFailed"
}

if fFlagConnectionAmpUpsellOnLeave then
	t_3[t_1.RECONNECT_AGE_CHECK_REQUIRED] = "InGame.ConnectionError.Title.JoinError"
	t_3[t_1.RECONNECT_PARENT_APPROVAL_REQUIRED] = "InGame.ConnectionError.Title.JoinError"
end
if addCollaborationCoreGatedConnectionError2 then
	t_3[t_1.RECONNECT_COLLABORATION_CORE_GATED] = "InGame.ConnectionError.Title.JoinError"
end
if connectionEnableAutoReconnect then
	t_3[t_1.AUTO_RECONNECTING] = "InGame.ConnectionError.Title.Disconnected"
end
local var59 = create("Frame")({
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
coroutine.wrap(function() --[[ line: 308 ]]
	-- upvalues: robloxGui (ref), var59 (ref)
	local constantsModule = require(robloxGui.Modules.TopBar.Constants)
	local var88 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
	var59.Size = UDim2.new(1, 0, 1, var88)
	var59.Position = UDim2.new(0, 0, 0, -var88)
end)()

local function openCollaboratorsPageForUniverseId(p8) --[[ line: 317 ]]
	-- upvalues: telemetryService (ref), t (ref), url (ref), linkingProtocol (ref)
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "ViewCollaboratorsOpenUrl" }
	}, 1)
	linkingProtocol.default:openURL(string.format("%sdashboard/creations/experiences/%s/safety/collaborators", url.CREATE_URL, tostring(p8)))
end

local var61 = function() --[[ line: 328 ]]
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
		coroutine.wrap(function() --[[ line: 343 ]]
			-- upvalues: fetchUniverseIdFromPlaceId (copy), placeId (ref), telemetryService (copy), t (copy), openCollaboratorsPageForUniverseId (copy)
			local var89 = fetchUniverseIdFromPlaceId(placeId)
			
			if var89 then
				openCollaboratorsPageForUniverseId(var89)
				
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

local var62 = function() --[[ line: 353 ]]
	-- upvalues: NONE (write), t_1 (ref), telemetryService (ref), t (ref), rbxAnalyticsService (ref), var54 (write), teleportService (ref), fFlagCoreScriptShowTeleportPromptModule (ref), refactorReconnectUnblockTeleport (ref), guiService (ref)
	local _ = tick()
	
	if NONE == t_1.IS_RECONNECTING then
		telemetryService:LogCounter(t, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectInitiated" } }, 1)
	rbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectActivated")
	NONE = t_1.IS_RECONNECTING
	var54:primaryShimmerPlay()
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

local var63 = function() --[[ line: 385 ]]
	-- upvalues: NONE (write), t_1 (ref), telemetryService (ref), t (ref), var54 (write), guiService (ref), teleportService (ref)
	if NONE == t_1.IS_RECONNECTING then
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
		NONE = t_1.IS_RECONNECTING
		var54:primaryShimmerPlay()
		guiService:ClearError()
		teleportService:Teleport(placeId)
		
		return
	end
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "PlacelaunchRetryMissingPlaceId" }
	}, 1)
end

local var64 = function() --[[ line: 405 ]]
	-- upvalues: telemetryService (ref), t (ref), guiService (ref), runService (ref)
	telemetryService:LogCounter(t, { customFields = { selectedItem = "LeaveInitiated" } }, 1)
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:wait()
	runService.RenderStepped:wait()
	game:Shutdown()
end

local var65 = function() --[[ line: 414 ]]
	-- upvalues: guiService (ref)
	guiService:ClearError()
end

local t_4 = {
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

local _ = function(p9, p10) --[[ line: 431 | named "pushErrorToPrompt" ]]
	-- upvalues: var54 (write), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	if not var54 then return end
	if getFFlagDisplayChannelNameOnErrorPromptModule() then
		var54:onErrorChanged(p9, p10, true)
		
		return
	end
	var54:onErrorChanged(p9, p10)
end

local function renderAutoReconnectPrompt() --[[ line: 440 ]]
	-- upvalues: var54 (write), NONE (write), t_1 (ref), t_4 (ref), translateString (ref), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	if not var54 then return end
	if NONE ~= t_1.AUTO_RECONNECTING and NONE ~= t_1.IS_RECONNECTING then return end
	local var90 = if NONE == t_1.IS_RECONNECTING then -1 else math.max(0, math.ceil(t_4.nextAttemptAt - tick()))
	
	if var90 == t_4.lastRemaining then return end
	t_4.lastRemaining = var90
	local attempt = t_4.attempt
	local var91 = if var90 <= 0 then translateString("InGame.ConnectionError.ReconnectingAttempt", { RBX_ATTEMPT = attempt }) elseif var90 == 1 then translateString("InGame.ConnectionError.ReconnectingAttemptInSecond", { RBX_ATTEMPT = attempt }) else translateString("InGame.ConnectionError.ReconnectingAttemptInSeconds", { RBX_ATTEMPT = attempt, RBX_SECONDS = var90 })
	local var92 = if t_4.baseMessage and t_4.baseMessage ~= "" then t_4.baseMessage .. "\n" .. var91 else var91
	
	if var92 == t_4.lastRenderedText then return end
	t_4.lastRenderedText = var92
	local errorCode = t_4.errorCode
	
	if not var54 then return end
	if getFFlagDisplayChannelNameOnErrorPromptModule() then
		var54:onErrorChanged(var92, errorCode, true)
		
		return
	end
	var54:onErrorChanged(var92, errorCode)
end

local _ = function() --[[ line: 486 | named "ensureAutoReconnectTicker" ]]
	-- upvalues: t_4 (ref), renderAutoReconnectPrompt (ref)
	if t_4.tickerThread then
		return
	end
	t_4.tickerThread = task.spawn(function() --[[ line: 490 ]]
		-- upvalues: t_4 (copy), renderAutoReconnectPrompt (copy)
		while t_4.active do
			task.wait(0.25)
			renderAutoReconnectPrompt()
		end
		t_4.tickerThread = nil
	end)
end

local _ = function() --[[ line: 499 | named "cancelAutoReconnect" ]]
	-- upvalues: t_4 (ref)
	t_4.active = false
	t_4.attempt = 0
	t_4.nextAttemptAt = 0
	t_4.errorCode = nil
	t_4.baseMessage = nil
	t_4.lastRenderedText = nil
	t_4.lastRemaining = nil
	
	if t_4.pendingThread then
		task.cancel(t_4.pendingThread)
		t_4.pendingThread = nil
	end
	if t_4.tickerThread then
		task.cancel(t_4.tickerThread)
		t_4.tickerThread = nil
	end
end

local _ = function(p11) --[[ line: 518 | named "autoReconnectAttemptBucket" ]]
	return if p11 <= 5 then tostring(p11) elseif p11 <= 8 then "6-8" else "9+"
end

local function fireAutoReconnect() --[[ line: 528 ]]
	-- upvalues: t_4 (ref), NONE (write), t_1 (ref), telemetryService (ref), t (ref), renderAutoReconnectPrompt (ref), var54 (write), teleportService (ref), fFlagCoreScriptShowTeleportPromptModule (ref), refactorReconnectUnblockTeleport (ref), guiService (ref)
	t_4.pendingThread = nil
	
	if NONE == t_1.IS_RECONNECTING then return end
	local var93 = t
	local t_2 = {}
	local t_3 = { selectedItem = "AutoReconnectAttempt" }
	local attempt = t_4.attempt
	t_3.attemptBucket = if attempt <= 5 then tostring(attempt) elseif attempt <= 8 then "6-8" else "9+"
	t_2.customFields = t_3
	telemetryService:LogCounter(var93, t_2, 1)
	NONE = t_1.IS_RECONNECTING
	renderAutoReconnectPrompt()
	
	if var54 then
		var54:primaryShimmerPlay()
	end
	teleportService:TeleportReconnect()
	
	if fFlagCoreScriptShowTeleportPromptModule then
		if refactorReconnectUnblockTeleport then
			teleportService:UnblockAsync()
			
			return
		end
		guiService:SetMenuIsOpen(false, "ErrorPrompt")
	end
end

local function scheduleAutoReconnect() --[[ line: 554 ]]
	-- upvalues: t_4 (ref), connectionAutoReconnectFirstDelayMs (ref), connectionAutoReconnectBaseDelayMs (ref), connectionAutoReconnectMaxDelayMs (ref), connectionAutoReconnectJitterMs (ref), var26 (write), telemetryService (ref), t (ref), renderAutoReconnectPrompt (ref), fireAutoReconnect (ref)
	t_4.active = true
	
	if t_4.pendingThread then
		task.cancel(t_4.pendingThread)
		t_4.pendingThread = nil
	end
	t_4.attempt += 1
	local attempt = t_4.attempt
	local var96 = if attempt <= 1 then connectionAutoReconnectFirstDelayMs elseif attempt == 2 then connectionAutoReconnectBaseDelayMs else math.min(connectionAutoReconnectBaseDelayMs * 2 ^ (attempt - 2), connectionAutoReconnectMaxDelayMs)
	
	if connectionAutoReconnectJitterMs > 0 then
		var96 += var26:NextInteger(0, connectionAutoReconnectJitterMs)
	end
	local var97 = var96 / 1000
	t_4.nextAttemptAt = tick() + var97
	t_4.lastRenderedText = nil
	t_4.lastRemaining = nil
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "AutoReconnectScheduled" }
	}, 1)
	
	if not t_4.tickerThread then
		t_4.tickerThread = task.spawn(function() --[[ line: 490 ]]
			-- upvalues: t_4 (copy), renderAutoReconnectPrompt (copy)
			while true do
				while t_4.active do
					task.wait(0.25)
					renderAutoReconnectPrompt()
				end
				t_4.tickerThread = nil
			end
		end)
	end
	t_4.pendingThread = task.delay(var97, fireAutoReconnect)
end

local function autoReconnectNowFunction() --[[ line: 571 ]]
	-- upvalues: NONE (write), t_1 (ref), telemetryService (ref), t (ref), t_4 (ref), fireAutoReconnect (ref)
	if NONE == t_1.IS_RECONNECTING then
		telemetryService:LogCounter(t, {
			customFields = { selectedItem = "UserClickWhileReconnecting" }
		}, 1)
		
		return
	end
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "AutoReconnectManualNow" }
	}, 1)
	
	if t_4.pendingThread then
		task.cancel(t_4.pendingThread)
		t_4.pendingThread = nil
	end
	fireAutoReconnect()
end

local var71 = function() --[[ line: 584 ]]
	-- upvalues: telemetryService (ref), t (ref), t_4 (ref), var64 (ref)
	telemetryService:LogCounter(t, { customFields = { selectedItem = "AutoReconnectLeave" } }, 1)
	t_4.active = false
	t_4.attempt = 0
	t_4.nextAttemptAt = 0
	t_4.errorCode = nil
	t_4.baseMessage = nil
	t_4.lastRenderedText = nil
	t_4.lastRemaining = nil
	
	if t_4.pendingThread then
		task.cancel(t_4.pendingThread)
		t_4.pendingThread = nil
	end
	if t_4.tickerThread then
		task.cancel(t_4.tickerThread)
		t_4.tickerThread = nil
	end
	var64()
end

local t_5 = {
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

if coreGuiOverflowDetectionEngineFeature then
	t_5[Enum.ConnectionError.DisconnectClientFailure] = true
end
if showScreentimeLockoutKickMessage then
	t_5[Enum.ConnectionError.ScreentimeLockoutKick] = true
end
if addPlacelaunchDeviceBlock2 then
	t_5[Enum.ConnectionError.PlacelaunchDeviceBlock] = true
end
if addContextualPlayabilityConnectionErrors then
	t_5[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = true
	t_5[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = true
	t_5[Enum.ConnectionError.PlacelaunchCoreGated] = true
end
if addVipOwnerNotPresentConnectionError and not vipOwnerNotPresentEnableReconnect then
	t_5[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = true
end
local var73 = if addCollaborationCoreGatedConnectionError2 and placelaunchCollaborationCoreGatedConnectionErrorEngineFeature then Enum.ConnectionError.PlacelaunchCollaborationCoreGated else nil

if addCollaborationCoreGatedConnectionError2 and var73 then
	t_5[var73] = true
end
if RAKickLogic2 and var44 then
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = true
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = true
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = true
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = true
end
local var74 = if connectionEnableAutoReconnect then {
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
} else {}
local t_6 = {
	[t_1.RECONNECT_PLACELAUNCH] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = var62
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = var64
		}
	},
	[t_1.RECONNECT_DISCONNECT] = {
		{
			Text = "Reconnect",
			LocalizationKey = "InGame.ConnectionError.Button.Reconnect",
			LayoutOrder = 2,
			Primary = true,
			Callback = var62
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var64
		}
	},
	[t_1.TELEPORT_FAILED] = {
		{
			Text = "OK",
			LocalizationKey = "InGame.CommonUI.Button.Ok",
			LayoutOrder = 1,
			Primary = true,
			Callback = var65
		}
	},
	[t_1.RECONNECT_DISABLED_DISCONNECT] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var64
		}
	},
	[t_1.RECONNECT_DISABLED_PLACELAUNCH] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var64
		}
	},
	[t_1.RECONNECT_DISABLED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var64
		}
	},
	[t_1.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = {
		{
			Text = "Keep Playing",
			LocalizationKey = "InGame.CommonUI.Button.KeepPlaying",
			LayoutOrder = 1,
			Callback = var65
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 2,
			Primary = true,
			Callback = var64
		}
	},
	[t_1.RECONNECT_CONNECT_FAILURE] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = var62
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = var64
		}
	},
	[t_1.RECONNECT_DISABLED_CONNECT_FAILURE] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var64
		}
	}
}

if fFlagConnectionAmpUpsellOnLeave then
	t_6[t_1.RECONNECT_AGE_CHECK_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var64
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = var49.PrimaryButtonText,
			LocalizationKey = var49.PrimaryButtonLocalizationKey,
			Callback = var49.createAgeCheckCallback(t, var63, 9)
		}
	}
end
if fFlagConnectionAmpParentalApprovalUpsell then
	t_6[t_1.RECONNECT_PARENT_APPROVAL_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var64
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = var49.PrimaryButtonText,
			LocalizationKey = var49.PrimaryButtonLocalizationKey,
			Callback = var49.createParentalApprovalCallback(t, var63, 9)
		}
	}
end
if addCollaborationCoreGatedConnectionError2 then
	t_6[t_1.RECONNECT_COLLABORATION_CORE_GATED] = {
		{
			Text = "Ok",
			LocalizationKey = "InGame.ConnectionError.Action.Ok",
			LayoutOrder = 1,
			Callback = var64
		},
		{
			Text = "View collaborators",
			LocalizationKey = "InGame.ConnectionError.Action.ViewCollaborators",
			LayoutOrder = 2,
			Primary = true,
			Callback = var61
		}
	}
end
if connectionEnableAutoReconnect then
	t_6[t_1.AUTO_RECONNECTING] = {
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
			Callback = var71
		}
	}
end
local t_7 = {
	[t_1.NONE] = function() --[[ line: 876 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = false
		var59.Transparency = 1
	end,
	[t_1.RECONNECT_DISCONNECT] = function() --[[ line: 881 ]]
		-- upvalues: VRService (ref), runService (ref), var59 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var59.Active = true
		var59.Transparency = 1
	end,
	[t_1.RECONNECT_PLACELAUNCH] = function() --[[ line: 890 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = true
		var59.Transparency = 0.3
	end,
	[t_1.TELEPORT_FAILED] = function() --[[ line: 895 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = true
		var59.Transparency = 0.3
	end,
	[t_1.RECONNECT_DISABLED_DISCONNECT] = function() --[[ line: 900 ]]
		-- upvalues: VRService (ref), runService (ref), var59 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var59.Active = true
		var59.Transparency = 1
	end,
	[t_1.RECONNECT_DISABLED_PLACELAUNCH] = function() --[[ line: 909 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = true
		var59.Transparency = 0.3
	end,
	[t_1.RECONNECT_DISABLED] = function() --[[ line: 914 ]]
		-- upvalues: VRService (ref), runService (ref), var59 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var59.Active = true
		var59.Transparency = 1
	end,
	[t_1.RECONNECT_CONNECT_FAILURE] = function() --[[ line: 923 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = true
		var59.Transparency = 0.3
	end,
	[t_1.RECONNECT_DISABLED_CONNECT_FAILURE] = function() --[[ line: 928 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = true
		var59.Transparency = 0.3
	end
}

if fFlagConnectionAmpUpsellOnLeave then
	local RECONNECT_PLACELAUNCH = t_7[t_1.RECONNECT_PLACELAUNCH]
	t_7[t_1.RECONNECT_AGE_CHECK_REQUIRED] = RECONNECT_PLACELAUNCH
	
	if fFlagConnectionAmpParentalApprovalUpsell then
		t_7[t_1.RECONNECT_PARENT_APPROVAL_REQUIRED] = RECONNECT_PLACELAUNCH
	end
end
if addCollaborationCoreGatedConnectionError2 then
	t_7[t_1.RECONNECT_COLLABORATION_CORE_GATED] = function() --[[ line: 948 ]]
		-- upvalues: runService (ref), var59 (ref)
		runService:SetRobloxGuiFocused(false)
		var59.Active = true
		var59.Transparency = 0.3
	end
end
if connectionEnableAutoReconnect then
	t_7[t_1.AUTO_RECONNECTING] = t_7[t_1.RECONNECT_DISCONNECT]
end
local function onEnter(p12) --[[ line: 962 ]]
	-- upvalues: var54 (write), debugEnableErrorStringTesting (ref), errorPromptModule (ref), var59 (ref), x (write), y (write), t_7 (ref), t_2 (ref), t_3 (ref), t_6 (ref)
	if not var54 then
		var54 = errorPromptModule.new("Default", {
			MenuIsOpenKey = "ConnectionErrorPrompt",
			PlayAnimation = not debugEnableErrorStringTesting
		})
		var54:setParent(var59)
		var54:resizeWidthAndHeight(x, y)
	end
	if t_7[p12] then
		t_7[p12]()
	end
	var54:setErrorTitle(t_2[p12], t_3[p12])
	var54:updateButtons(t_6[p12])
end

local _ = function(p13) --[[ line: 979 | named "onExit" ]]
	-- upvalues: t_1 (ref), var54 (write)
	if p13 == t_1.IS_RECONNECTING then
		var54:primaryShimmerStop()
	end
end

local function stateTransit(p14, p15, p16) --[[ line: 986 ]]
	-- upvalues: fFlagAllowDisconnectGuiForOkUnknownModule (ref), t_1 (ref), reconnectDisabledFFlag (ref), currentTime (write), var55 (write), var33 (ref), OK (write), t_5 (ref), telemetryService (ref), t (ref), rbxAnalyticsService (ref), connectionEnableAutoReconnect (ref), var74 (write), fFlagConnectionAmpUpsellOnLeave (ref), var49 (write), fFlagConnectionUpsellAnalytics (ref), fFlagConnectionAmpParentalApprovalUpsell (ref), addCollaborationCoreGatedConnectionError2 (ref), var73 (ref), potentialClientTimeoutSeconds (ref), t_4 (ref), connectionAutoReconnectMaxDurationSeconds (ref)
	if fFlagAllowDisconnectGuiForOkUnknownModule then
		if p15 == Enum.ConnectionError.OK then
			return t_1.NONE
		elseif p16 == t_1.NONE then
			if reconnectDisabledFFlag then
				return t_1.RECONNECT_DISABLED
			end
			currentTime = tick()
			
			if fFlagAllowDisconnectGuiForOkUnknownModule then
				assert(p15 ~= Enum.ConnectionError.OK)
				
				if p14 == Enum.ConnectionError.OK then
					return t_1.RECONNECT_DISCONNECT
				elseif p14 == Enum.ConnectionError.ConnectErrors then
					var55 = tick() + var33
					OK = Enum.ConnectionError.ConnectErrors
					
					if t_5[p15] then
						return t_1.RECONNECT_DISABLED_CONNECT_FAILURE
					end
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ConnectError" } }, 1)
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ConnectFailed" } }, 1)
					
					return t_1.RECONNECT_CONNECT_FAILURE
				elseif p14 == Enum.ConnectionError.DisconnectErrors then
					var55 = tick() + var33
					OK = Enum.ConnectionError.DisconnectErrors
					
					if p15 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
						return t_1.OUT_OF_MEMORY_KEEPPLAYING_LEAVE
					elseif t_5[p15] then
						return t_1.RECONNECT_DISABLED_DISCONNECT
					end
					telemetryService:LogCounter(t, { customFields = { selectedItem = "Disconnected" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-Disconnect")
					
					return if connectionEnableAutoReconnect and var74[p15] then t_1.AUTO_RECONNECTING else t_1.RECONNECT_DISCONNECT
				elseif p14 == Enum.ConnectionError.PlacelaunchErrors then
					OK = Enum.ConnectionError.PlacelaunchErrors
					
					if fFlagConnectionAmpUpsellOnLeave then
						local ageVerificationRequiredEnum = var49.AgeVerificationRequiredEnum
						
						if ageVerificationRequiredEnum and p15 == ageVerificationRequiredEnum then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "PlaceLaunchAgeVerificationRequired" }
							}, 1)
							
							if fFlagConnectionUpsellAnalytics then
								var49.fireImpressionAgeCheck(t, game.PlaceId)
							end
							return t_1.RECONNECT_AGE_CHECK_REQUIRED
						elseif fFlagConnectionAmpParentalApprovalUpsell then
							local parentalApprovalRequiredEnum = var49.ParentalApprovalRequiredEnum
							
							if parentalApprovalRequiredEnum and p15 == parentalApprovalRequiredEnum then
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "PlaceLaunchParentalApprovalRequired" }
								}, 1)
								
								if fFlagConnectionUpsellAnalytics then
									var49.fireImpressionParentalApproval(t, game.PlaceId)
								end
								return t_1.RECONNECT_PARENT_APPROVAL_REQUIRED
							elseif addCollaborationCoreGatedConnectionError2 and var73 and p15 == var73 then
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "PlaceLaunchCollaborationCoreGated" }
								}, 1)
								
								return t_1.RECONNECT_COLLABORATION_CORE_GATED
							elseif t_5[p15] then
								return t_1.RECONNECT_DISABLED_PLACELAUNCH
							end
							telemetryService:LogCounter(t, { customFields = { selectedItem = "PlaceLaunchError" } }, 1)
							rbxAnalyticsService:ReportCounter("ReconnectPrompt-PlaceLaunch")
							
							return t_1.RECONNECT_PLACELAUNCH
						end
					end
				elseif p14 == Enum.ConnectionError.TeleportErrors then
					telemetryService:LogCounter(t, { customFields = { selectedItem = "TeleportError" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-TeleportFailed")
					
					return t_1.TELEPORT_FAILED
				elseif p16 == t_1.IS_RECONNECTING then
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectFailed" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectFailed")
					
					if p14 == Enum.ConnectionError.TeleportErrors then
						if currentTime + potentialClientTimeoutSeconds < tick() then
							telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectTimedOut" } }, 1)
							
							return if OK == Enum.ConnectionError.PlacelaunchErrors then t_1.RECONNECT_DISABLED_PLACELAUNCH else t_1.RECONNECT_DISABLED_DISCONNECT
						elseif OK == Enum.ConnectionError.PlacelaunchErrors then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "PlaceLaunchReconnectFailed" }
							}, 1)
							
							return t_1.RECONNECT_PLACELAUNCH
						elseif OK == Enum.ConnectionError.DisconnectErrors then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "DisconnectReconnectFailed" }
							}, 1)
							
							if connectionEnableAutoReconnect and t_4.active then
								local var98 = connectionAutoReconnectMaxDurationSeconds
								
								if var98 <= 0 or tick() <= currentTime + var98 then
									return t_1.AUTO_RECONNECTING
								end
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "AutoReconnectExhausted" }
								}, 1)
							end
							return t_1.RECONNECT_DISCONNECT
						elseif OK == Enum.ConnectionError.ConnectErrors then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "ConnectReconnectFailed" }
							}, 1)
							
							return t_1.RECONNECT_CONNECT_FAILURE
						end
					end
				end
				return if not (not connectionEnableAutoReconnect or p16 ~= t_1.AUTO_RECONNECTING) then if reconnectDisabledFFlag then t_1.RECONNECT_DISABLED elseif p14 == Enum.ConnectionError.DisconnectErrors and t_5[p15] then t_1.RECONNECT_DISABLED_DISCONNECT else p16 else p16
			end
		end
	elseif p14 == Enum.ConnectionError.OK then
		return t_1.NONE
	end
end

local function getCreatorBanString(p17) --[[ line: 1133 ]]
	-- upvalues: guiService (ref), translateString (ref)
	local errorDetails = guiService:GetErrorDetails()
	
	if not errorDetails then
		return p17
	end
	local var104
	local _ = nil
	
	if errorDetails.time then
		local minutes = errorDetails.minutes
		local hours = errorDetails.hours
		local days = errorDetails.days
		local var100 = if minutes == 1 then translateString("InGame.ConnectionError.CreatorBanMinutesSingular") else translateString("InGame.ConnectionError.CreatorBanMinutesPlural", { RBX_TIME_MINUTES = minutes })
		local var101 = if hours == 1 then translateString("InGame.ConnectionError.CreatorBanHoursSingular") else translateString("InGame.ConnectionError.CreatorBanHoursPlural", { RBX_TIME_HOURS = hours })
		local var102 = if days == 1 then translateString("InGame.ConnectionError.CreatorBanDaysSingular") else translateString("InGame.ConnectionError.CreatorBanDaysPlural", { RBX_TIME_DAYS = days })
		
		if var100 == "" or var101 == "" or var102 == "" then
			return p17
		end
		local var103 = var100
		
		if hours > 0 then
			var103 = var101 .. ", " .. var103
		end
		if days > 0 then
			var103 = var102 .. ", " .. var103
		end
		var104 = translateString("InGame.ConnectionError.CreatorBanWithTime", { RBX_TIME_REMAINING = var103 })
	else
		var104 = translateString("InGame.ConnectionError.CreatorBanNoTime")
	end
	if var104 == "" then
		return p17
	end
	local displayReason = errorDetails.displayReason
	
	if not displayReason or displayReason == "" then
		return var104
	end
	local var105 = translateString("InGame.ConnectionError.CreatorBanMessage", { RBX_STR = displayReason })
	
	return if var105 == "" then p17 else var104 .. " " .. var105
end

local removeRefToMissingLocInConnection = game:DefineFastFlag("RemoveRefToMissingLocInConnection", false)
local t_8 = {
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
	t_8[Enum.ConnectionError.ScreentimeLockoutKick] = "Feature.Screentime.Content.ScreentimeLimitDialog"
end
if addPlacelaunchDeviceBlock2 then
	t_8[Enum.ConnectionError.PlacelaunchDeviceBlock] = "InGame.ConnectionError.PlacelaunchDeviceBlock"
end
if addContextualPlayabilityConnectionErrors then
	t_8[Enum.ConnectionError.PlacelaunchAgeVerificationRequired] = "InGame.ConnectionError.Description.AgeCheckRequired"
	t_8[Enum.ConnectionError.PlacelaunchParentalApprovalRequired] = "InGame.ConnectionError.Description.ParentalApprovalRequired"
	t_8[Enum.ConnectionError.PlacelaunchCoreGated] = "InGame.ConnectionError.Description.LockedByAge"
end
if addVipOwnerNotPresentConnectionError then
	t_8[Enum.ConnectionError.PlacelaunchVipOwnerNotPresent] = "InGame.ConnectionError.Description.VipOwnerNotPresent"
end
if addCollaborationCoreGatedConnectionError2 and var73 then
	t_8[var73] = "InGame.ConnectionError.Description.CollaborationRequiresTrustedFriends"
end
if RAKickLogic2 and var44 then
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationTimeout] = "InGame.ConnectionError.RemoteAttestationTimeout"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = "InGame.ConnectionError.RemoteAttestationUnsupported"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = "InGame.ConnectionError.RemoteAttestationGeneralFailure"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = "InGame.ConnectionError.RemoteAttestationOSOutOfDate"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = "InGame.ConnectionError.RemoteAttestationBootValidationFailure"
end
local function getErrorString(p18, p19, p20) --[[ line: 1321 ]]
	-- upvalues: translateString (ref), maxKickMessageLength (ref), t_8 (ref), mutedError (ref), shouldMuteUnlocalizedError (ref)
	if p19 == Enum.ConnectionError.OK then
		return ""
	elseif p20 then
		local var106 = translateString("InGame.ConnectionError.ReconnectFailed")
		
		return if var106 == "" then "Reconnect was unsuccessful. Please try again." else var106
	elseif p19 == Enum.ConnectionError.DisconnectLuaKick and p18 ~= "" then
		p18 = p18:sub(1, maxKickMessageLength)
		local var109 = translateString("InGame.ConnectionError.DisconnectLuaKickWithMessage", { RBX_STR = p18 })
		
		return if var109 == "" then p18 else var109
	end
	local var107 = t_8[p19]
	
	if not var107 then
		mutedError("Cannot find localization key for " .. tostring(p19))
		var107 = "InGame.ConnectionError.UnknownError"
	end
	local var108 = if p19 == Enum.ConnectionError.DisconnectIdle then translateString(var107, { RBX_NUM = tostring(20) }) else translateString(var107)
	
	return if var108 == "" then if shouldMuteUnlocalizedError then translateString("InGame.ConnectionError.UnknownError") else p18 else var108
end

local function updateErrorPrompt(p21, p22, p23) --[[ line: 1370 ]]
	-- upvalues: robloxExperienceKickOverride (ref), fFlagUniversalFeatureRestrictionReceivers (ref), guiService (ref), buildRobloxExperienceKickContentModule (ref), translateString (ref), showFeatureRestrictionDirectModule (ref), var64 (ref), telemetryService (ref), t (ref), stateTransit (ref), NONE (write), t_1 (ref), var54 (write), onEnter (ref), connectionEnableAutoReconnect (ref), scheduleAutoReconnect (ref), t_4 (ref), getCreatorBanString (ref), getErrorString (ref), var36 (ref), renderAutoReconnectPrompt (ref), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	if robloxExperienceKickOverride and fFlagUniversalFeatureRestrictionReceivers and p22 == Enum.ConnectionError.DisconnectLuaKick then
		local errorDetails = guiService:GetErrorDetails()
		
		if errorDetails and errorDetails.moderatorType == "roblox" then
			local var111 = buildRobloxExperienceKickContentModule(p21, errorDetails, translateString)
			showFeatureRestrictionDirectModule(var111.abuseVector, var111.moderationDetail, {
				onDismiss = var64,
				titleOverride = var111.options.titleOverride,
				bodyOverride = var111.options.bodyOverride
			})
			telemetryService:LogCounter(t, { customFields = { selectedItem = "RobloxExperienceKick" } }, 1)
			
			return
		end
	end
	local var112 = stateTransit(p23, p22, NONE)
	
	if var112 ~= NONE then
		if NONE == t_1.IS_RECONNECTING then
			var54:primaryShimmerStop()
		end
		NONE = var112
		onEnter(var112)
		
		if connectionEnableAutoReconnect then
			if var112 == t_1.AUTO_RECONNECTING then
				scheduleAutoReconnect()
			else
				t_4.active = false
				t_4.attempt = 0
				t_4.nextAttemptAt = 0
				t_4.errorCode = nil
				t_4.baseMessage = nil
				t_4.lastRenderedText = nil
				t_4.lastRemaining = nil
				
				if t_4.pendingThread then
					task.cancel(t_4.pendingThread)
					t_4.pendingThread = nil
				end
				if t_4.tickerThread then
					task.cancel(t_4.tickerThread)
					t_4.tickerThread = nil
				end
			end
		end
	end
	if p22 == Enum.ConnectionError.PlacelaunchCreatorBan then
		p21 = getCreatorBanString(p21)
	elseif p23 == Enum.ConnectionError.TeleportErrors and NONE ~= t_1.TELEPORT_FAILED then
		local _ = p21
		
		if p22 == Enum.ConnectionError.OK then
			p21 = ""
		else
			local var113 = translateString("InGame.ConnectionError.ReconnectFailed")
			p21 = if var113 ~= "" then "Reconnect was unsuccessful. Please try again." else var113
		end
	else
		p21 = getErrorString(p21, p22)
	end
	if NONE == t_1.RECONNECT_DISABLED then
		p21 = var36
	end
	if connectionEnableAutoReconnect and NONE == t_1.AUTO_RECONNECTING then
		if t_4.baseMessage == nil then
			t_4.baseMessage = p21
			t_4.errorCode = p22
		end
		renderAutoReconnectPrompt()
		
		return
	elseif var54 then
		if getFFlagDisplayChannelNameOnErrorPromptModule() then
			var54:onErrorChanged(p21, p22, true)
			
			return
		end
		var54:onErrorChanged(p21, p22)
	end
end

local function onErrorMessageChanged() --[[ line: 1445 ]]
	-- upvalues: guiService (ref), updateErrorPrompt (ref)
	updateErrorPrompt(guiService:GetErrorMessage(), guiService:GetErrorCode(), guiService:GetErrorType())
end

robloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ line: 1452 | named "onScreenSizeChanged" ]]
	-- upvalues: var54 (write), robloxGui (ref), x (write), y (write)
	if not var54 then return end
	local x_1 = robloxGui.AbsoluteSize.X
	local y_1 = robloxGui.AbsoluteSize.Y
	
	if x ~= x_1 or y ~= y_1 then
		x = x_1
		y = y_1
		var54:resizeWidthAndHeight(x, y)
	end
end)
updateErrorPrompt(guiService:GetErrorMessage(), guiService:GetErrorCode(), guiService:GetErrorType())
guiService.ErrorMessageChanged:connect(onErrorMessageChanged)

if debugEnableErrorStringTesting then
	for i, v in pairs(require(robloxGui.Modules.ErrorTestSets)) do
		for i_1, v_1 in pairs(v) do
			updateErrorPrompt("Should show localized strings, please file a jira ticket for missing translation.", v_1, i)
			wait(2)
			
			if connectionEnableAutoReconnect then
				t_4.active = false
				t_4.attempt = 0
				t_4.nextAttemptAt = 0
				t_4.errorCode = nil
				t_4.baseMessage = nil
				t_4.lastRenderedText = nil
				t_4.lastRemaining = nil
				
				if t_4.pendingThread then
					task.cancel(t_4.pendingThread)
					t_4.pendingThread = nil
				end
				if t_4.tickerThread then
					task.cancel(t_4.tickerThread)
					t_4.tickerThread = nil
				end
			end
			NONE = t_1.NONE
		end
	end
end
if coreGuiOverflowDetectionEngineFeature then
	guiService.CoreGuiRenderOverflowed:Connect(function() --[[ line: 1491 ]]
		-- upvalues: coreGuiService (ref)
		for i, v in pairs(coreGuiService:GetChildren()) do
			if v:IsA("ScreenGui") and v.Name ~= "RobloxPromptGui" then
				v.Enabled = false
			end
		end
	end)
end
if enableExperienceGenericChallengeRenderingConnection2 then
	coroutine.wrap(function() --[[ line: 1508 ]]
		-- upvalues: corePackagesService (ref)
		require(corePackagesService.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end