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
local var1 = if connectionEnableAutoReconnect then Random.new() else nil
local coreGuiOverflowDetectionEngineFeature = game:GetEngineFeature("CoreGuiOverflowDetection")
local fFlagCoreScriptShowTeleportPromptModule = require(robloxGui.Modules.Flags.FFlagCoreScriptShowTeleportPrompt)
local fFlagAllowDisconnectGuiForOkUnknownModule = require(robloxGui.Modules.Flags.FFlagAllowDisconnectGuiForOkUnknown)
local enableExperienceGenericChallengeRenderingConnection2 = game:DefineFastFlag("EnableExperienceGenericChallengeRenderingConnection2", false)
local getFFlagDisplayChannelNameOnErrorPromptModule = require(robloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)

local function _(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return tonumber(settings():GetFVariable(p1))
	end)
	
	return if ok then status else p2
end

local _ = function(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return settings():GetFVariable(p1)
	end)
	
	return if ok then status else p2
end

local _ = function(p1)
	-- upvalues: connectionAutoReconnectFirstDelayMs (ref), connectionAutoReconnectBaseDelayMs (ref), connectionAutoReconnectMaxDelayMs (ref), connectionAutoReconnectJitterMs (ref), var1 (write)
	local var2 = if p1 <= 1 then connectionAutoReconnectFirstDelayMs elseif p1 == 2 then connectionAutoReconnectBaseDelayMs else math.min(connectionAutoReconnectBaseDelayMs * 2 ^ (p1 - 2), connectionAutoReconnectMaxDelayMs)
	
	if connectionAutoReconnectJitterMs > 0 then
		var2 += var1:NextInteger(0, connectionAutoReconnectJitterMs)
	end
	return var2 / 1000
end

local var2 = "DefaultTimeoutTimeMs"
local ok, status = pcall(function()
	-- upvalues: var2 (ref)
	return tonumber(settings():GetFVariable(var2))
end)
local var3 = (if ok then status else 10000) / 1000
local reconnectDisabledFFlag = settings():GetFFlag("ReconnectDisabled")
local var4 = "ReconnectDisabledReason"
local ok_1, status_1 = pcall(function()
	-- upvalues: var4 (ref)
	return settings():GetFVariable(var4)
end)
local var5 = if ok_1 then status_1 else "We're sorry, Roblox is temporarily unavailable.  Please try again later."
local currentTime = tick()
local addPlacelaunchDeviceBlock2 = game:DefineFastFlag("AddPlacelaunchDeviceBlock2", false)
local addContextualPlayabilityConnectionErrors = game:DefineFastFlag("AddContextualPlayabilityConnectionErrors", false)
local addVipOwnerNotPresentConnectionError = game:DefineFastFlag("AddVipOwnerNotPresentConnectionError", false)
local vipOwnerNotPresentEnableReconnect = game:DefineFastFlag("VipOwnerNotPresentEnableReconnect", false)
local RAKickLogic2 = game:DefineFastFlag("RAKickLogic2", false)
local RAMinEngineVersion = game:DefineFastInt("RAMinEngineVersion", 725)
local var6 = false

if RAKickLogic2 then
	local var7 = tonumber(string.match(runService:GetRobloxVersion(), "%.(%d+)%."))
	
	if var7 and RAMinEngineVersion <= var7 then
		var6 = true
	end
end
local fFlagConnectionAmpUpsellOnLeave = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionAmpUpsellOnLeave
local fFlagConnectionAmpParentalApprovalUpsell = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionAmpParentalApprovalUpsell
local fFlagConnectionParentalApprovalLeaveOnly = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionParentalApprovalLeaveOnly
local fFlagConnectionUpsellAnalytics = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionUpsellAnalytics
local fFlagUniversalFeatureRestrictionReceivers = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local fFlagDebugEnablePioneerUX = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagDebugEnablePioneerUX
local fFlagErrorPromptUseLeaveGameHelper = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagErrorPromptUseLeaveGameHelper
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local addCollaborationCoreGatedConnectionError2 = game:DefineFastFlag("AddCollaborationCoreGatedConnectionError2", false)
local placelaunchCollaborationCoreGatedConnectionErrorEngineFeature = game:GetEngineFeature("PlacelaunchCollaborationCoreGatedConnectionError")
local robloxExperienceKickOverride = game:DefineFastFlag("RobloxExperienceKickOverride", false)
local var8 = if fFlagConnectionAmpUpsellOnLeave then require(robloxGui.Modules.ConnectionAmpUpsellOnLeave) else nil
local buildRobloxExperienceKickContentModule = require(corePackagesService.Workspace.Packages.InterventionShared.buildRobloxExperienceKickContent)
local showFeatureRestrictionDirectModule = require(corePackagesService.Workspace.Packages.UniversalFeatureRestrictions.showFeatureRestrictionDirect)

local function fetchUniverseIdFromPlaceId(p1)
	-- upvalues: url (ref), httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(httpRbxApiService.GetAsyncFullUrl, httpRbxApiService, string.format("%suniverses/v1/places/%d/universe", url.APIS_URL, p1))
	
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

local function translateString(p1, p2)
	-- upvalues: localizationService (ref), localization (ref), logging (ref)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var9 = localization.new(robloxLocaleId)
	var9:SetLocale(robloxLocaleId)
	local ok, status = pcall(function()
		-- upvalues: var9 (ref), p1 (ref), p2 (ref)
		return var9:Format(p1, p2)
	end)
	
	if ok then
		return status
	end
	logging.warn("Failed to translate string with key: " .. p6 .. ", LocaleId: " .. robloxLocaleId)
	
	return ""
end

local var9 = nil
local var10 = -1
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
local var11 = create("Frame")({
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
coroutine.wrap(function()
	-- upvalues: robloxGui (ref), var11 (ref)
	local constantsModule = require(robloxGui.Modules.TopBar.Constants)
	local var12 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
	var11.Size = UDim2.new(1, 0, 1, var12)
	var11.Position = UDim2.new(0, 0, 0, -var12)
end)()

local function openCollaboratorsPageForUniverseId(p1)
	-- upvalues: telemetryService (ref), t (ref), url (ref), linkingProtocol (ref)
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "ViewCollaboratorsOpenUrl" }
	}, 1)
	linkingProtocol.default:openURL(string.format("%sdashboard/creations/experiences/%s/safety/collaborators", url.CREATE_URL, tostring(p1)))
end

local var12 = function()
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
		coroutine.wrap(function()
			-- upvalues: fetchUniverseIdFromPlaceId (copy), placeId (ref), telemetryService (copy), t (copy), openCollaboratorsPageForUniverseId (copy)
			local var13 = fetchUniverseIdFromPlaceId(placeId)
			
			if var13 then
				openCollaboratorsPageForUniverseId(var13)
				
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

local var13 = function()
	-- upvalues: NONE (write), t_1 (ref), telemetryService (ref), t (ref), rbxAnalyticsService (ref), var9 (write), teleportService (ref), fFlagCoreScriptShowTeleportPromptModule (ref), refactorReconnectUnblockTeleport (ref), guiService (ref)
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
	var9:primaryShimmerPlay()
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

local var14 = function()
	-- upvalues: NONE (write), t_1 (ref), telemetryService (ref), t (ref), var9 (write), guiService (ref), teleportService (ref)
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
		var9:primaryShimmerPlay()
		guiService:ClearError()
		teleportService:Teleport(placeId)
		
		return
	end
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "PlacelaunchRetryMissingPlaceId" }
	}, 1)
end

local var15 = function()
	-- upvalues: telemetryService (ref), t (ref), fFlagErrorPromptUseLeaveGameHelper (ref), leaveGameModule (ref), fFlagDebugEnablePioneerUX (ref), guiService (ref), runService (ref)
	telemetryService:LogCounter(t, { customFields = { selectedItem = "LeaveInitiated" } }, 1)
	
	if fFlagErrorPromptUseLeaveGameHelper then
		leaveGameModule(false, {
			inhibitAppRating = true,
			telemetryContext = "ErrorPrompt",
			shouldNativeExit = fFlagDebugEnablePioneerUX
		})
		
		return
	end
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:wait()
	runService.RenderStepped:wait()
	game:Shutdown()
end

local var16 = function()
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

local _ = function(p1, p2)
	-- upvalues: var9 (write), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	if not var9 then return end
	if getFFlagDisplayChannelNameOnErrorPromptModule() then
		var9:onErrorChanged(p1, p2, true)
		
		return
	end
	var9:onErrorChanged(p1, p2)
end

local function renderAutoReconnectPrompt()
	-- upvalues: var9 (write), NONE (write), t_1 (ref), t_4 (ref), translateString (ref), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	if not var9 then return end
	if NONE ~= t_1.AUTO_RECONNECTING and NONE ~= t_1.IS_RECONNECTING then return end
	local var17 = if NONE == t_1.IS_RECONNECTING then -1 else math.max(0, math.ceil(t_4.nextAttemptAt - tick()))
	
	if var17 == t_4.lastRemaining then return end
	t_4.lastRemaining = var17
	local attempt = t_4.attempt
	local var18 = if var17 <= 0 then translateString("InGame.ConnectionError.ReconnectingAttempt", { RBX_ATTEMPT = attempt }) elseif var17 == 1 then translateString("InGame.ConnectionError.ReconnectingAttemptInSecond", { RBX_ATTEMPT = attempt }) else translateString("InGame.ConnectionError.ReconnectingAttemptInSeconds", { RBX_ATTEMPT = attempt, RBX_SECONDS = var17 })
	local var19 = if t_4.baseMessage and t_4.baseMessage ~= "" then t_4.baseMessage .. "\n" .. var91 else var18
	
	if var19 == t_4.lastRenderedText then return end
	t_4.lastRenderedText = var19
	local errorCode = t_4.errorCode
	
	if not var9 then return end
	if getFFlagDisplayChannelNameOnErrorPromptModule() then
		var9:onErrorChanged(var19, errorCode, true)
		
		return
	end
	var9:onErrorChanged(var19, errorCode)
end

local _ = function()
	-- upvalues: t_4 (ref), renderAutoReconnectPrompt (ref)
	if t_4.tickerThread then
		return
	end
	t_4.tickerThread = task.spawn(function()
		-- upvalues: t_4 (copy), renderAutoReconnectPrompt (copy)
		while t_4.active do
			task.wait(0.25)
			renderAutoReconnectPrompt()
		end
		t_4.tickerThread = nil
	end)
end

local _ = function()
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

local _ = function(p1)
	return if p1 <= 5 then tostring(p1) elseif p1 <= 8 then "6-8" else "9+"
end

local function fireAutoReconnect()
	-- upvalues: t_4 (ref), NONE (write), t_1 (ref), telemetryService (ref), t (ref), renderAutoReconnectPrompt (ref), var9 (write), teleportService (ref), fFlagCoreScriptShowTeleportPromptModule (ref), refactorReconnectUnblockTeleport (ref), guiService (ref)
	t_4.pendingThread = nil
	
	if NONE == t_1.IS_RECONNECTING then return end
	local var17 = t
	local t_2 = {}
	local t_3 = { selectedItem = "AutoReconnectAttempt" }
	local attempt = t_4.attempt
	t_3.attemptBucket = if attempt <= 5 then tostring(attempt) elseif attempt <= 8 then "6-8" else "9+"
	t_2.customFields = t_3
	telemetryService:LogCounter(var17, t_2, 1)
	NONE = t_1.IS_RECONNECTING
	renderAutoReconnectPrompt()
	
	if var9 then
		var9:primaryShimmerPlay()
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

local function scheduleAutoReconnect()
	-- upvalues: t_4 (ref), connectionAutoReconnectFirstDelayMs (ref), connectionAutoReconnectBaseDelayMs (ref), connectionAutoReconnectMaxDelayMs (ref), connectionAutoReconnectJitterMs (ref), var1 (write), telemetryService (ref), t (ref), renderAutoReconnectPrompt (ref), fireAutoReconnect (ref)
	t_4.active = true
	
	if t_4.pendingThread then
		task.cancel(t_4.pendingThread)
		t_4.pendingThread = nil
	end
	t_4.attempt += 1
	local attempt = t_4.attempt
	local var17 = if attempt <= 1 then connectionAutoReconnectFirstDelayMs elseif attempt == 2 then connectionAutoReconnectBaseDelayMs else math.min(connectionAutoReconnectBaseDelayMs * 2 ^ (attempt - 2), connectionAutoReconnectMaxDelayMs)
	
	if connectionAutoReconnectJitterMs > 0 then
		var17 += var1:NextInteger(0, connectionAutoReconnectJitterMs)
	end
	local var18 = var17 / 1000
	t_4.nextAttemptAt = tick() + var18
	t_4.lastRenderedText = nil
	t_4.lastRemaining = nil
	telemetryService:LogCounter(t, {
		customFields = { selectedItem = "AutoReconnectScheduled" }
	}, 1)
	
	if not t_4.tickerThread then
		t_4.tickerThread = task.spawn(function()
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
	t_4.pendingThread = task.delay(var18, fireAutoReconnect)
end

local function autoReconnectNowFunction()
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

local var19 = function()
	-- upvalues: telemetryService (ref), t (ref), t_4 (ref), var15 (ref)
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
	var15()
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
local var20 = if addCollaborationCoreGatedConnectionError2 and placelaunchCollaborationCoreGatedConnectionErrorEngineFeature then Enum.ConnectionError.PlacelaunchCollaborationCoreGated else nil

if addCollaborationCoreGatedConnectionError2 and var20 then
	t_5[var20] = true
end
if RAKickLogic2 and var6 then
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = true
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = true
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = true
	t_5[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = true
end
local var21 = if connectionEnableAutoReconnect then {
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
			Callback = var13
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = var15
		}
	},
	[t_1.RECONNECT_DISCONNECT] = {
		{
			Text = "Reconnect",
			LocalizationKey = "InGame.ConnectionError.Button.Reconnect",
			LayoutOrder = 2,
			Primary = true,
			Callback = var13
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var15
		}
	},
	[t_1.TELEPORT_FAILED] = {
		{
			Text = "OK",
			LocalizationKey = "InGame.CommonUI.Button.Ok",
			LayoutOrder = 1,
			Primary = true,
			Callback = var16
		}
	},
	[t_1.RECONNECT_DISABLED_DISCONNECT] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var15
		}
	},
	[t_1.RECONNECT_DISABLED_PLACELAUNCH] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var15
		}
	},
	[t_1.RECONNECT_DISABLED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var15
		}
	},
	[t_1.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = {
		{
			Text = "Keep Playing",
			LocalizationKey = "InGame.CommonUI.Button.KeepPlaying",
			LayoutOrder = 1,
			Callback = var16
		},
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 2,
			Primary = true,
			Callback = var15
		}
	},
	[t_1.RECONNECT_CONNECT_FAILURE] = {
		{
			Text = "Retry",
			LocalizationKey = "InGame.CommonUI.Button.Retry",
			LayoutOrder = 2,
			Primary = true,
			Callback = var13
		},
		{
			Text = "Cancel",
			LocalizationKey = "Feature.SettingsHub.Action.CancelSearch",
			LayoutOrder = 1,
			Callback = var15
		}
	},
	[t_1.RECONNECT_DISABLED_CONNECT_FAILURE] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var15
		}
	}
}

if fFlagConnectionAmpUpsellOnLeave then
	t_6[t_1.RECONNECT_AGE_CHECK_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var15
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = var8.PrimaryButtonText,
			LocalizationKey = var8.PrimaryButtonLocalizationKey,
			Callback = var8.createAgeCheckCallback(t, var14, 9)
		}
	}
end
if fFlagConnectionAmpParentalApprovalUpsell then
	t_6[t_1.RECONNECT_PARENT_APPROVAL_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Callback = var15
		},
		{
			LayoutOrder = 2,
			Primary = true,
			Text = var8.PrimaryButtonText,
			LocalizationKey = var8.PrimaryButtonLocalizationKey,
			Callback = var8.createParentalApprovalCallback(t, var14, 9)
		}
	}
end
if fFlagConnectionParentalApprovalLeaveOnly then
	t_6[t_1.RECONNECT_PARENT_APPROVAL_REQUIRED] = {
		{
			Text = "Leave",
			LocalizationKey = "Feature.SettingsHub.Label.LeaveButton",
			LayoutOrder = 1,
			Primary = true,
			Callback = var15
		}
	}
end
if addCollaborationCoreGatedConnectionError2 then
	t_6[t_1.RECONNECT_COLLABORATION_CORE_GATED] = {
		{
			Text = "Ok",
			LocalizationKey = "InGame.ConnectionError.Action.Ok",
			LayoutOrder = 1,
			Callback = var15
		},
		{
			Text = "View collaborators",
			LocalizationKey = "InGame.ConnectionError.Action.ViewCollaborators",
			LayoutOrder = 2,
			Primary = true,
			Callback = var12
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
			Callback = var19
		}
	}
end
if fFlagDebugEnablePioneerUX then
	for i, v in pairs(t_6) do
		for i_1, v_1 in ipairs(v) do
			if v_1.Callback == var15 or v_1.Callback == var19 then
				v_1.Text = "Quit"
				v_1.LocalizationKey = "Feature.SettingsHub.Label.QuitButton"
			end
		end
	end
end
local t_7 = {
	[t_1.NONE] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = false
		var11.Transparency = 1
	end,
	[t_1.RECONNECT_DISCONNECT] = function()
		-- upvalues: VRService (ref), runService (ref), var11 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var11.Active = true
		var11.Transparency = 1
	end,
	[t_1.RECONNECT_PLACELAUNCH] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = true
		var11.Transparency = 0.3
	end,
	[t_1.TELEPORT_FAILED] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = true
		var11.Transparency = 0.3
	end,
	[t_1.RECONNECT_DISABLED_DISCONNECT] = function()
		-- upvalues: VRService (ref), runService (ref), var11 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var11.Active = true
		var11.Transparency = 1
	end,
	[t_1.RECONNECT_DISABLED_PLACELAUNCH] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = true
		var11.Transparency = 0.3
	end,
	[t_1.RECONNECT_DISABLED] = function()
		-- upvalues: VRService (ref), runService (ref), var11 (ref)
		if VRService.VREnabled then
			runService:SetRobloxGuiFocused(false)
		else
			runService:SetRobloxGuiFocused(true)
		end
		var11.Active = true
		var11.Transparency = 1
	end,
	[t_1.RECONNECT_CONNECT_FAILURE] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = true
		var11.Transparency = 0.3
	end,
	[t_1.RECONNECT_DISABLED_CONNECT_FAILURE] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = true
		var11.Transparency = 0.3
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
	t_7[t_1.RECONNECT_COLLABORATION_CORE_GATED] = function()
		-- upvalues: runService (ref), var11 (ref)
		runService:SetRobloxGuiFocused(false)
		var11.Active = true
		var11.Transparency = 0.3
	end
end
if connectionEnableAutoReconnect then
	t_7[t_1.AUTO_RECONNECTING] = t_7[t_1.RECONNECT_DISCONNECT]
end
local function onEnter(p1)
	-- upvalues: var9 (write), debugEnableErrorStringTesting (ref), errorPromptModule (ref), var11 (ref), x (write), y (write), t_7 (ref), t_2 (ref), t_3 (ref), t_6 (ref)
	if not var9 then
		var9 = errorPromptModule.new("Default", {
			MenuIsOpenKey = "ConnectionErrorPrompt",
			PlayAnimation = not debugEnableErrorStringTesting
		})
		var9:setParent(var11)
		var9:resizeWidthAndHeight(x, y)
	end
	if t_7[p1] then
		t_7[p1]()
	end
	var9:setErrorTitle(t_2[p1], t_3[p1])
	var9:updateButtons(t_6[p1])
end

local _ = function(p1)
	-- upvalues: t_1 (ref), var9 (write)
	if p1 == t_1.IS_RECONNECTING then
		var9:primaryShimmerStop()
	end
end

local function stateTransit(p1, p2, p3)
	-- upvalues: fFlagAllowDisconnectGuiForOkUnknownModule (ref), t_1 (ref), reconnectDisabledFFlag (ref), currentTime (write), var10 (write), var3 (ref), OK (write), t_5 (ref), telemetryService (ref), t (ref), rbxAnalyticsService (ref), connectionEnableAutoReconnect (ref), var21 (write), fFlagConnectionAmpUpsellOnLeave (ref), var8 (write), fFlagConnectionUpsellAnalytics (ref), fFlagConnectionAmpParentalApprovalUpsell (ref), addCollaborationCoreGatedConnectionError2 (ref), var20 (ref), potentialClientTimeoutSeconds (ref), t_4 (ref), connectionAutoReconnectMaxDurationSeconds (ref)
	if fFlagAllowDisconnectGuiForOkUnknownModule then
		if p2 == Enum.ConnectionError.OK then
			return t_1.NONE
		elseif p3 == t_1.NONE then
			if reconnectDisabledFFlag then
				return t_1.RECONNECT_DISABLED
			end
			currentTime = tick()
			
			if fFlagAllowDisconnectGuiForOkUnknownModule then
				assert(p2 ~= Enum.ConnectionError.OK)
				
				if p1 == Enum.ConnectionError.OK then
					return t_1.RECONNECT_DISCONNECT
				elseif p1 == Enum.ConnectionError.ConnectErrors then
					var10 = tick() + var3
					OK = Enum.ConnectionError.ConnectErrors
					
					if t_5[p2] then
						return t_1.RECONNECT_DISABLED_CONNECT_FAILURE
					end
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ConnectError" } }, 1)
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ConnectFailed" } }, 1)
					
					return t_1.RECONNECT_CONNECT_FAILURE
				elseif p1 == Enum.ConnectionError.DisconnectErrors then
					var10 = tick() + var3
					OK = Enum.ConnectionError.DisconnectErrors
					
					if p2 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
						return t_1.OUT_OF_MEMORY_KEEPPLAYING_LEAVE
					elseif t_5[p2] then
						return t_1.RECONNECT_DISABLED_DISCONNECT
					end
					telemetryService:LogCounter(t, { customFields = { selectedItem = "Disconnected" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-Disconnect")
					
					return if connectionEnableAutoReconnect and var21[p2] then t_1.AUTO_RECONNECTING else t_1.RECONNECT_DISCONNECT
				elseif p1 == Enum.ConnectionError.PlacelaunchErrors then
					OK = Enum.ConnectionError.PlacelaunchErrors
					
					if fFlagConnectionAmpUpsellOnLeave then
						local ageVerificationRequiredEnum = var8.AgeVerificationRequiredEnum
						
						if ageVerificationRequiredEnum and p2 == ageVerificationRequiredEnum then
							telemetryService:LogCounter(t, {
								customFields = { selectedItem = "PlaceLaunchAgeVerificationRequired" }
							}, 1)
							
							if fFlagConnectionUpsellAnalytics then
								var8.fireImpressionAgeCheck(t, game.PlaceId)
							end
							return t_1.RECONNECT_AGE_CHECK_REQUIRED
						elseif fFlagConnectionAmpParentalApprovalUpsell then
							local parentalApprovalRequiredEnum = var8.ParentalApprovalRequiredEnum
							
							if parentalApprovalRequiredEnum and p2 == parentalApprovalRequiredEnum then
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "PlaceLaunchParentalApprovalRequired" }
								}, 1)
								
								if fFlagConnectionUpsellAnalytics then
									var8.fireImpressionParentalApproval(t, game.PlaceId)
								end
								return t_1.RECONNECT_PARENT_APPROVAL_REQUIRED
							elseif addCollaborationCoreGatedConnectionError2 and var20 and p2 == var20 then
								telemetryService:LogCounter(t, {
									customFields = { selectedItem = "PlaceLaunchCollaborationCoreGated" }
								}, 1)
								
								return t_1.RECONNECT_COLLABORATION_CORE_GATED
							elseif t_5[p2] then
								return t_1.RECONNECT_DISABLED_PLACELAUNCH
							end
							telemetryService:LogCounter(t, { customFields = { selectedItem = "PlaceLaunchError" } }, 1)
							rbxAnalyticsService:ReportCounter("ReconnectPrompt-PlaceLaunch")
							
							return t_1.RECONNECT_PLACELAUNCH
						end
					end
				elseif p1 == Enum.ConnectionError.TeleportErrors then
					telemetryService:LogCounter(t, { customFields = { selectedItem = "TeleportError" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-TeleportFailed")
					
					return t_1.TELEPORT_FAILED
				elseif p3 == t_1.IS_RECONNECTING then
					telemetryService:LogCounter(t, { customFields = { selectedItem = "ReconnectFailed" } }, 1)
					rbxAnalyticsService:ReportCounter("ReconnectPrompt-ReconnectFailed")
					
					if p1 == Enum.ConnectionError.TeleportErrors then
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
								local var22 = connectionAutoReconnectMaxDurationSeconds
								
								if var22 <= 0 or tick() <= currentTime + var22 then
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
				return if not (not connectionEnableAutoReconnect or p3 ~= t_1.AUTO_RECONNECTING) then if reconnectDisabledFFlag then t_1.RECONNECT_DISABLED elseif p1 == Enum.ConnectionError.DisconnectErrors and t_5[p2] then t_1.RECONNECT_DISABLED_DISCONNECT else p3 else p3
			end
		end
	elseif p1 == Enum.ConnectionError.OK then
		return t_1.NONE
	end
end

local function getCreatorBanString(p1)
	-- upvalues: guiService (ref), translateString (ref)
	local errorDetails = guiService:GetErrorDetails()
	
	if not errorDetails then
		return p1
	end
	local var22
	local _ = nil
	
	if errorDetails.time then
		local minutes = errorDetails.minutes
		local hours = errorDetails.hours
		local days = errorDetails.days
		local var23 = if minutes == 1 then translateString("InGame.ConnectionError.CreatorBanMinutesSingular") else translateString("InGame.ConnectionError.CreatorBanMinutesPlural", { RBX_TIME_MINUTES = minutes })
		local var24 = if hours == 1 then translateString("InGame.ConnectionError.CreatorBanHoursSingular") else translateString("InGame.ConnectionError.CreatorBanHoursPlural", { RBX_TIME_HOURS = hours })
		local var25 = if days == 1 then translateString("InGame.ConnectionError.CreatorBanDaysSingular") else translateString("InGame.ConnectionError.CreatorBanDaysPlural", { RBX_TIME_DAYS = days })
		
		if var23 == "" or var24 == "" or var25 == "" then
			return p1
		end
		local var26 = var23
		
		if hours > 0 then
			var26 = var24 .. ", " .. var103
		end
		if days > 0 then
			var26 = var25 .. ", " .. var103
		end
		var22 = translateString("InGame.ConnectionError.CreatorBanWithTime", { RBX_TIME_REMAINING = var26 })
	else
		var22 = translateString("InGame.ConnectionError.CreatorBanNoTime")
	end
	if var22 == "" then
		return p1
	end
	local displayReason = errorDetails.displayReason
	
	if not displayReason or displayReason == "" then
		return var22
	end
	local var27 = translateString("InGame.ConnectionError.CreatorBanMessage", { RBX_STR = displayReason })
	
	return if var27 == "" then p1 else var22 .. " " .. var105
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
if addCollaborationCoreGatedConnectionError2 and var20 then
	t_8[var20] = "InGame.ConnectionError.Description.CollaborationRequiresTrustedFriends"
end
if RAKickLogic2 and var6 then
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationTimeout] = "InGame.ConnectionError.RemoteAttestationTimeout"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationUnsupported] = "InGame.ConnectionError.RemoteAttestationUnsupported"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationGeneralFailure] = "InGame.ConnectionError.RemoteAttestationGeneralFailure"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationOSOutOfDate] = "InGame.ConnectionError.RemoteAttestationOSOutOfDate"
	t_8[Enum.ConnectionError.DisconnectRemoteAttestationBootValidationFailure] = "InGame.ConnectionError.RemoteAttestationBootValidationFailure"
end
local function getErrorString(p1, p2, p3)
	-- upvalues: translateString (ref), maxKickMessageLength (ref), t_8 (ref), mutedError (ref), shouldMuteUnlocalizedError (ref)
	if p2 == Enum.ConnectionError.OK then
		return ""
	elseif p3 then
		local var22 = translateString("InGame.ConnectionError.ReconnectFailed")
		
		return if var22 == "" then "Reconnect was unsuccessful. Please try again." else var22
	elseif p2 == Enum.ConnectionError.DisconnectLuaKick and p1 ~= "" then
		p1 = p1:sub(1, maxKickMessageLength)
		local var23 = translateString("InGame.ConnectionError.DisconnectLuaKickWithMessage", { RBX_STR = p1 })
		
		return if var23 == "" then p1 else var23
	end
	local var24 = t_8[p2]
	
	if not var24 then
		mutedError("Cannot find localization key for " .. tostring(p2))
		var24 = "InGame.ConnectionError.UnknownError"
	end
	local var25 = if p2 == Enum.ConnectionError.DisconnectIdle then translateString(var24, { RBX_NUM = tostring(20) }) else translateString(var24)
	
	return if var25 == "" then if shouldMuteUnlocalizedError then translateString("InGame.ConnectionError.UnknownError") else p1 else var25
end

local function updateErrorPrompt(p1, p2, p3)
	-- upvalues: robloxExperienceKickOverride (ref), fFlagUniversalFeatureRestrictionReceivers (ref), guiService (ref), buildRobloxExperienceKickContentModule (ref), translateString (ref), showFeatureRestrictionDirectModule (ref), var15 (ref), telemetryService (ref), t (ref), stateTransit (ref), NONE (write), t_1 (ref), var9 (write), onEnter (ref), connectionEnableAutoReconnect (ref), scheduleAutoReconnect (ref), t_4 (ref), getCreatorBanString (ref), getErrorString (ref), var5 (ref), renderAutoReconnectPrompt (ref), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	if robloxExperienceKickOverride and fFlagUniversalFeatureRestrictionReceivers and p2 == Enum.ConnectionError.DisconnectLuaKick then
		local errorDetails = guiService:GetErrorDetails()
		
		if errorDetails and errorDetails.moderatorType == "roblox" then
			local var22 = buildRobloxExperienceKickContentModule(p1, errorDetails, translateString)
			showFeatureRestrictionDirectModule(var22.abuseVector, var22.moderationDetail, {
				onDismiss = var15,
				titleOverride = var22.options.titleOverride,
				bodyOverride = var22.options.bodyOverride
			})
			telemetryService:LogCounter(t, { customFields = { selectedItem = "RobloxExperienceKick" } }, 1)
			
			return
		end
	end
	local var23 = stateTransit(p3, p2, NONE)
	
	if var23 ~= NONE then
		if NONE == t_1.IS_RECONNECTING then
			var9:primaryShimmerStop()
		end
		NONE = var23
		onEnter(var23)
		
		if connectionEnableAutoReconnect then
			if var23 == t_1.AUTO_RECONNECTING then
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
	if p2 == Enum.ConnectionError.PlacelaunchCreatorBan then
		p1 = getCreatorBanString(p1)
	elseif p3 == Enum.ConnectionError.TeleportErrors and NONE ~= t_1.TELEPORT_FAILED then
		local _ = p1
		
		if p2 == Enum.ConnectionError.OK then
			p1 = ""
		else
			local var24 = translateString("InGame.ConnectionError.ReconnectFailed")
			p1 = if var24 ~= "" then "Reconnect was unsuccessful. Please try again." else var24
		end
	else
		p1 = getErrorString(p1, p2)
	end
	if NONE == t_1.RECONNECT_DISABLED then
		p1 = var5
	end
	if connectionEnableAutoReconnect and NONE == t_1.AUTO_RECONNECTING then
		if t_4.baseMessage == nil then
			t_4.baseMessage = p1
			t_4.errorCode = p2
		end
		renderAutoReconnectPrompt()
		
		return
	elseif var9 then
		if getFFlagDisplayChannelNameOnErrorPromptModule() then
			var9:onErrorChanged(p1, p2, true)
			
			return
		end
		var9:onErrorChanged(p1, p2)
	end
end

local function v_1()
	-- upvalues: guiService (ref), updateErrorPrompt (ref)
	updateErrorPrompt(guiService:GetErrorMessage(), guiService:GetErrorCode(), guiService:GetErrorType())
end

robloxGui:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
	-- upvalues: var9 (write), robloxGui (ref), x (write), y (write)
	if not var9 then return end
	local x_1 = robloxGui.AbsoluteSize.X
	local y_1 = robloxGui.AbsoluteSize.Y
	
	if x ~= x_1 or y ~= y_1 then
		x = x_1
		y = y_1
		var9:resizeWidthAndHeight(x, y)
	end
end)
updateErrorPrompt(guiService:GetErrorMessage(), guiService:GetErrorCode(), guiService:GetErrorType())
guiService.ErrorMessageChanged:connect(v_1)

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
	guiService.CoreGuiRenderOverflowed:Connect(function()
		-- upvalues: coreGuiService (ref)
		for i, v in pairs(coreGuiService:GetChildren()) do
			if v:IsA("ScreenGui") and v.Name ~= "RobloxPromptGui" then
				v.Enabled = false
			end
		end
	end)
end
if enableExperienceGenericChallengeRenderingConnection2 then
	coroutine.wrap(function()
		-- upvalues: corePackagesService (ref)
		require(corePackagesService.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor()
	end)()
end