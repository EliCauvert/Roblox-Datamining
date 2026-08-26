local corePackagesService = game:GetService("CorePackages")
local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local httpService = game:GetService("HttpService")
local promiseModule = require(corePackagesService.Packages.Promise)
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local crossExperienceModule = require(corePackagesService.Workspace.Packages.CrossExperience)
local fStringTimeoutLoadingLocalPlayerInBackgroundDM = require(corePackagesService.Workspace.Packages.SharedFlags).FStringTimeoutLoadingLocalPlayerInBackgroundDM
local getMemStorageKey = crossExperienceModule.Utils.getMemStorageKey
local CEV_JOIN_ATTEMPT_ID_KEY = crossExperienceModule.Constants.CEV_JOIN_ATTEMPT_ID_KEY
local LOCAL_PLAYER_LOADING_TIMEOUT_ENUM = crossExperienceModule.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM
local backgroundDMLocalPlayerLoadingTimeoutSeconds = game:DefineFastInt("BackgroundDMLocalPlayerLoadingTimeoutSeconds", 12)
local delayAudioFocusReplication = game:DefineFastFlag("DelayAudioFocusReplication", false)
local playerAudioFocusReplicationTimeoutSeconds = game:DefineFastInt("PlayerAudioFocusReplicationTimeoutSeconds", 10)
local var1 = if fStringTimeoutLoadingLocalPlayerInBackgroundDM == LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then if playersService.LocalPlayer then playersService.LocalPlayer.UserId else -1 else nil

local function sendAnalyticsEvent(p1, p2)
	-- upvalues: getMemStorageKey (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (ref), var1 (write), rbxAnalyticsService (ref)
	p2 = p2 or {}
	p2.cevJoinAttemptId = getMemStorageKey(CEV_JOIN_ATTEMPT_ID_KEY)
	p2.clientTimeStamp = os.time()
	p2.userId = if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then var1 else nil
	rbxAnalyticsService:SendEventDeferred("client", "partyVoice", p1, p2)
end

if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then
	sendAnalyticsEvent("partyVoiceCEVChannelFileLoaded")
end
local var2 = crossExperienceModule.EventManager.new(crossExperienceModule.Constants.EXPERIENCE_TYPE_VOICE, true)

local function _(p1, p2)
	-- upvalues: var2 (ref), crossExperienceModule (ref)
	var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, { status = p1, detail = p2 })
end

local function ensureLocalPlayerWithTimeout()
	-- upvalues: playersService (ref), promiseModule (ref), backgroundDMLocalPlayerLoadingTimeoutSeconds (ref), sendAnalyticsEvent (ref), crossExperienceModule (ref), var2 (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then
		promiseModule.race({
			promiseModule.new(function(p1)
				-- upvalues: playersService (copy)
				if playersService.LocalPlayer then
					p1("loaded")
					
					return
				end
				local var3 = nil
				var3 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
					-- upvalues: playersService (copy), var3 (write), p1 (ref)
					if playersService.LocalPlayer then
						var3:Disconnect()
						p1("loaded")
					end
				end)
			end),
			promiseModule.delay(backgroundDMLocalPlayerLoadingTimeoutSeconds):andThen(function()
				return "timeout"
			end)
		}):andThen(function(p1)
			-- upvalues: localPlayer (write), playersService (copy), sendAnalyticsEvent (copy), backgroundDMLocalPlayerLoadingTimeoutSeconds (copy), crossExperienceModule (copy), var2 (copy)
			if p1 == "loaded" then
				localPlayer = playersService.LocalPlayer
				sendAnalyticsEvent("cevDefaultChannelBackgroundDMLocalPlayerLoaded", {
					timeoutSeconds = backgroundDMLocalPlayerLoadingTimeoutSeconds
				})
				
				return
			end
			sendAnalyticsEvent("backgroundDMLocalPlayerLoadingTimeout", {
				timeoutSeconds = backgroundDMLocalPlayerLoadingTimeoutSeconds
			})
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				status = crossExperienceModule.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT,
				detail = "LocalPlayer loading timed out after " .. backgroundDMLocalPlayerLoadingTimeoutSeconds .. " seconds"
			})
			localPlayer = nil
		end):await()
	end
	if not localPlayer then
		promiseModule.new(function() end):await()
	end
	return localPlayer.UserId
end

if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then
	var1 = -1
end
if fStringTimeoutLoadingLocalPlayerInBackgroundDM == LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then
	sendAnalyticsEvent("partyVoiceCEVChannelFileLoaded")
end
local playerAudioFocusChanged = nil

if not delayAudioFocusReplication then
	playerAudioFocusChanged = replicatedStorageService:WaitForChild("PlayerAudioFocusChanged")
	sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedLoaded")
end
local voiceChatCoreModule = require(corePackagesService.Workspace.Packages.VoiceChatCore)
local default = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local default_1 = voiceChatCoreModule.CoreVoiceManager.default
local createPersistenceMiddleware = crossExperienceModule.Middlewares.createPersistenceMiddleware
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local var3 = if sharedFlagsModule.GetFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil
local _ = require(corePackagesService.Packages.LuauPolyfill)
local fFlagPartyVoiceBlockSync = sharedFlagsModule.FFlagPartyVoiceBlockSync
local getFFlagVoiceChatClientRewriteMasterLua = sharedFlagsModule.GetFFlagVoiceChatClientRewriteMasterLua
local useNotificationServiceIsConnected = game:DefineFastFlag("UseNotificationServiceIsConnected", false)
local defaultChannelEnableDefaultVoice = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true)
local enableCrossExpVoiceDebug = game:DefineFastFlag("EnableCrossExpVoiceDebug", false)
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local getFFlagEnableCrossExperienceVoiceCaptureMute = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute
local logPartyVoiceReconnect = game:DefineFastFlag("LogPartyVoiceReconnect", false)
local partyVoiceFixCaptureVideoCheck = game:DefineFastFlag("PartyVoiceFixCaptureVideoCheck", false)
local fIntPartyVoiceUndeafenDelayMS = sharedFlagsModule.FIntPartyVoiceUndeafenDelayMS
local partyVoiceExecuteVoiceActionsPostAsyncInit = game:DefineFastFlag("PartyVoiceExecuteVoiceActionsPostAsyncInit", false)
local voiceJoinTimeoutInSeconds = game:DefineFastInt("VoiceJoinTimeoutInSeconds", 15)
local voiceServiceEnableDefaultVoiceAvailableEngineFeature = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable")
local notificationServiceIsConnectedAvailableEngineFeature = game:GetEngineFeature("NotificationServiceIsConnectedAvailable")
local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local cevReadinessSyncEngineFeature = game:GetEngineFeature("CevReadinessSync")
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local var4 = voiceChatCoreModule.Analytics.new()
local observeCurrentContextId = crossExperienceModule.Utils.observeCurrentContextId
local voiceChatService = game:GetService("VoiceChatService")
local constants = crossExperienceModule.Constants
local VOICE_STATUS = constants.VOICE_STATUS
local fFlagFixPartyVoiceGetPermissions = sharedFlagsModule.GetFFlagFixPartyVoiceGetPermissions()
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local enableCEVPersistMuteStateForAFM = game:DefineFastFlag("EnableCEVPersistMuteStateForAFM", false)
local var5 = nil

if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	default_1:setOptions({
		allowSeamlessVoice = false,
		passInitErrorInPromiseReject = true,
		forceVoiceEnabled = true
	})
end
local var6 = createPersistenceMiddleware({
	storeKey = crossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
})
sendAnalyticsEvent("partyVoicePersistenceMiddlewareCreated")
local default_2 = crossExperienceModule.PartyAudioPlayer.default

local var7 = function()
	-- upvalues: roduxModule (ref), crossExperienceModule (ref)
	return roduxModule.combineReducers({
		Squad = roduxModule.combineReducers({
			CrossExperienceVoice = crossExperienceModule.installReducer()
		})
	})
end

sendAnalyticsEvent("partyVoiceCrossExperienceReducerLoaded")

local var8 = function(p1)
	-- upvalues: default_1 (ref), name (ref)
	default_1:asyncInit():andThen(function()
		-- upvalues: p1 (ref)
		p1()
	end):catch(function(p2)
		-- upvalues: name (copy)
		name:info("CoreVoiceManager did not initialize {}", p2)
	end)
end

local t = { previousGroupId = nil, previousMutedState = false }
local bindableEvent = Instance.new("BindableEvent")
local var9 = false
local foreground_ui_ready = nil

if cevReadinessSyncEngineFeature then
	name:info("Registering early observer for foreground readiness signal.")
	foreground_ui_ready = var2:addObserver(crossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY, function()
		-- upvalues: var9 (write), name (ref), bindableEvent (ref)
		if not var9 then
			name:info("Received foreground UI readiness signal.")
			var9 = true
			bindableEvent:Fire()
		end
	end)
end
local var10 = roduxModule.Store.new(var7(), nil, { roduxModule.thunkMiddleware, var6.getMiddleware() })
sendAnalyticsEvent("partyVoicePersistenceMiddlewareReducerLoaded")
var2:subscribe(var10)

if not game:IsLoaded() then
	game.Loaded:Wait()
end
sendAnalyticsEvent("partyVoiceGameLoaded")
var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
	detail = nil,
	status = constants.VOICE_STATUS.RCC_CONNECTED
})
sendAnalyticsEvent("partyVoiceRCCConnectedSignalFired")
var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
	jobId = if game.JobId == "" or game.JobId == nil then httpService:GenerateGUID(true) else game.JobId,
	placeId = game.PlaceId,
	gameId = game.GameId
})

if delayAudioFocusReplication then
	local var11 = nil
	local var12 = false
	observeCurrentContextId(function(p1)
		-- upvalues: var11 (write), var12 (write), playerAudioFocusChanged (write)
		var11 = p1
		print("CurrentContextId changed to", p1, "isReplicationReady:", var12)
		
		if var12 and playerAudioFocusChanged then
			playerAudioFocusChanged:FireServer(p1)
			print("Fired PlayerAudioFocusChanged with contextId:", p1)
		end
	end)
	print("Waiting for PlayerAudioFocusChanged to replicate...")
	playerAudioFocusChanged = replicatedStorageService:WaitForChild("PlayerAudioFocusChanged", playerAudioFocusReplicationTimeoutSeconds)
	
	if playerAudioFocusChanged then
		print("PlayerAudioFocusChanged replicated successfully.")
		sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedLoaded")
		playerAudioFocusChanged.OnClientEvent:Connect(function(p1, p2, p3)
			-- upvalues: var2 (ref), crossExperienceModule (ref)
			print("Received PlayerAudioFocusChanged OnClientEvent:", p1, p2)
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, { userId = p1, contextId = p2, contextIds = p3 })
		end)
		var12 = true
	else
		print("PlayerAudioFocusChanged did not replicate within timeout of ", playerAudioFocusReplicationTimeoutSeconds, " seconds.")
		sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedReplicationTimeout", {
			timeoutSeconds = playerAudioFocusReplicationTimeoutSeconds
		})
	end
else
	observeCurrentContextId(function(p1)
		-- upvalues: playerAudioFocusChanged (write)
		playerAudioFocusChanged:FireServer(p1)
	end)
	playerAudioFocusChanged.OnClientEvent:Connect(function(p1, p2, p3)
		-- upvalues: var2 (ref), crossExperienceModule (ref)
		var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, { userId = p1, contextId = p2, contextIds = p3 })
	end)
end
local var11 = function(p1)
	-- upvalues: var2 (ref), crossExperienceModule (ref), var1 (write), fFlagEnablePartyVoiceChangersInLua (ref)
	var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
		userId = p1.UserId,
		isLocalUser = p1.UserId == var1,
		username = p1.Name,
		displayname = p1.DisplayName,
		isVoiceChangerActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
		isVoiceChangerHearMyselfActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
		selectedVoicePack = if fFlagEnablePartyVoiceChangersInLua then "None" else nil
	})
end

local var13 = function(p1)
	-- upvalues: var2 (ref), crossExperienceModule (ref), var1 (write), default_2 (ref)
	var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, { userId = p1.UserId, isLocalUser = p1.UserId == var1 })
	default_2:playSound("leave")
end

local var14 = function(p1)
	-- upvalues: crossExperienceModule (ref), var2 (ref), var1 (write)
	var2:notify(if p1.isActive then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, { isLocalUser = true, userId = var1 })
end

local var15 = function(p1)
	-- upvalues: enableCEVPersistMuteStateForAFM (ref), t (write), crossExperienceModule (ref), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var8 (ref), var2 (ref), var1 (write)
	if not enableCEVPersistMuteStateForAFM then
		t.previousMutedState = p1
	end
	local var16 = if p1 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED
	
	if partyVoiceExecuteVoiceActionsPostAsyncInit then
		var8(function()
			-- upvalues: var2 (copy), var16 (ref), var1 (copy)
			var2:notify(var16, { isLocalUser = true, userId = var1 })
		end)
		
		return
	end
	var2:notify(var16, { isLocalUser = true, userId = var1 })
end

local function onLocalVoiceChangerChanged(p1)
	-- upvalues: crossExperienceModule (ref), var2 (ref), var1 (write)
	var2:notify(if p1 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, { isLocalUser = true, userId = var1 })
end

local function onLocalVoiceChangerHearMyselfChanged(p1)
	-- upvalues: crossExperienceModule (ref), var2 (ref), var1 (write)
	var2:notify(if p1 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, { isLocalUser = true, userId = var1 })
end

local var16 = function(p1)
	-- upvalues: fFlagEnablePartyVoiceChangersInLua (ref), crossExperienceModule (ref), var1 (write), var2 (ref)
	for i, v in pairs(p1) do
		local isSignalActive = v.isSignalActive
		local isMuted = v.isMuted
		local var17 = if fFlagEnablePartyVoiceChangersInLua then v.isVoiceChangerActive else nil
		local var18 = if isSignalActive then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE
		local var19 = if isMuted then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED
		local var20 = if fFlagEnablePartyVoiceChangersInLua then if var17 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED else nil
		local t = { userId = i, isLocalUser = i == var1 }
		var2:notify(var19, t)
		var2:notify(var18, t)
		
		if fFlagEnablePartyVoiceChangersInLua then
			var2:notify(var20, t)
		end
	end
end

local var21 = function(p2)
	-- upvalues: var1 (write), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var8 (ref), enableCEVPersistMuteStateForAFM (ref), t (write), default_1 (ref)
	local var22 = tonumber(p2.userId)
	local var23 = var1 == var22
	
	if partyVoiceExecuteVoiceActionsPostAsyncInit then
		var8(function()
			-- upvalues: var23 (ref), enableCEVPersistMuteStateForAFM (copy), t (copy), default_1 (copy), var22 (ref)
			if not var23 then
				default_1:ToggleMutePlayer(var22)
				
				return
			elseif enableCEVPersistMuteStateForAFM then
				t.previousMutedState = not default_1.localMuted
			end
			default_1:ToggleMic("Squads")
		end)
		
		return
	elseif var23 then
		default_1:ToggleMic("Squads")
		
		return
	end
	default_1:ToggleMutePlayer(var22)
end

local function setVoicePack(value)
	-- upvalues: default_1 (ref), var2 (ref), crossExperienceModule (ref), var1 (write)
	local voicePackName = value.voicePackName
	default_1:SetVoicePack(voicePackName)
	var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PACK_WAS_SET, {
		isLocalUser = true,
		userId = var1,
		voicePackName = voicePackName
	})
end

local function toggleVoiceChanger(p2)
	-- upvalues: var1 (write), default_1 (ref)
	local var22 = tonumber(p2.userId)
	
	if var1 == var22 then
		default_1:ToggleVoiceChanger("Squads")
		
		return
	end
	default_1:ToggleVoiceChanger(var22)
end

local function toggleVoiceChangerHearMyself(p2)
	-- upvalues: var1 (write), default_1 (ref)
	local var22 = tonumber(p2.userId)
	
	if var1 == var22 then
		default_1:ToggleVoiceChangerHearMyself("Squads")
		
		return
	end
	default_1:ToggleVoiceChangerHearMyself(var22)
end

function handleParticipants()
	-- upvalues: playersService (ref), var11 (ref), default_2 (ref), var13 (ref), var1 (write)
	playersService.PlayerAdded:Connect(function(p2)
		-- upvalues: var11 (copy), default_2 (copy)
		var11(p2)
		default_2:playSound("join")
	end)
	playersService.PlayerRemoving:Connect(var13)
	
	for i, v in pairs(playersService:GetPlayers()) do
		if v:IsA("Player") then
			var11(v)
			
			if v.UserId == var1 then
				default_2:playSound("join")
			end
		end
	end
end

function handleMicrophone()
	-- upvalues: default_1 (ref), var15 (ref), var2 (ref), crossExperienceModule (ref), var21 (ref)
	default_1.muteChanged.Event:Connect(var15)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, var21)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, var21)
end

function handleVoiceChanger()
	-- upvalues: default_1 (ref), onLocalVoiceChangerChanged (ref), var2 (ref), crossExperienceModule (ref), toggleVoiceChanger (ref), setVoicePack (ref), onLocalVoiceChangerHearMyselfChanged (ref), toggleVoiceChangerHearMyself (ref)
	default_1.voiceChangerChanged.Event:Connect(onLocalVoiceChangerChanged)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, toggleVoiceChanger)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, toggleVoiceChanger)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.SET_PARTY_VOICE_PACK, setVoicePack)
	default_1.voiceChangerHearMyselfChanged.Event:Connect(onLocalVoiceChangerHearMyselfChanged)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, toggleVoiceChangerHearMyself)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, toggleVoiceChangerHearMyself)
end

local var22 = function(p2)
	-- upvalues: playersService (ref), blockingUtilityModule (ref), name (ref)
	local var23 = playersService:GetPlayerByUserId(tonumber(p2.userId) or 0)
	
	if var23 then
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), var23 (ref), name (copy)
			if blockingUtilityModule:AddPlayerToBlockList(var23) then
				name:info("Participant {} was blocked from party voice", var23.DisplayName)
			end
		end)()
	end
end

local var23 = function(p2)
	-- upvalues: playersService (ref), blockingUtilityModule (ref), name (ref)
	local var24 = playersService:GetPlayerByUserId(tonumber(p2.userId) or 0)
	
	if var24 then
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), var24 (ref), name (copy)
			if blockingUtilityModule:RemovePlayerFromBlockList(var24) then
				name:info("Participant {} was unblocked from party voice", var24.DisplayName)
			end
		end)()
	end
end

local var24 = function()
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), var3 (ref)
	return getFFlagEnableCrossExperienceVoiceCaptureMute() and (var3 and var3:IsCapturingVideo())
end

local _ = function(p2, p3)
	-- upvalues: cryoModule (ref)
	return if p2.missingPermissions then not cryoModule.List.find(p2.missingPermissions, p3) else false
end

local _ = function(p2)
	-- upvalues: promiseModule (ref), default (ref), cryoModule (ref)
	local t = { hasMicPermissions = false }
	
	return promiseModule.new(function(p3, _)
		-- upvalues: default (copy), p2 (ref), t (ref), cryoModule (copy)
		default:requestPermissions(p2):andThen(function(p4)
			-- upvalues: t (copy), default (copy), cryoModule (copy), p3 (ref)
			t.hasMicPermissions = if p4.missingPermissions then not cryoModule.List.find(p4.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
			p3(t)
		end):catch(function()
			-- upvalues: p3 (ref), t (copy)
			p3(t)
		end)
	end)
end

local _ = function()
	-- upvalues: var2 (ref), crossExperienceModule (ref), var22 (ref), var23 (ref)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, var22)
	var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, var23)
end

function onCoreVoiceManagerInitialized()
	-- upvalues: default_1 (ref), var14 (ref), var16 (ref)
	default_1:getService().PlayerMicActivitySignalChange:Connect(var14)
	default_1.participantsUpdate.Event:Connect(var16)
end

local _ = function()
	-- upvalues: default_1 (ref), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var8 (ref)
	default_1.muteChanged.Event:Once(function(p2)
		-- upvalues: partyVoiceExecuteVoiceActionsPostAsyncInit (copy), var8 (copy), default_1 (copy)
		if p2 ~= nil then
			if partyVoiceExecuteVoiceActionsPostAsyncInit then
				var8(function()
					-- upvalues: default_1 (copy)
					default_1:ToggleMic("BackgroundDM")
				end)
				
				return
			end
			default_1:ToggleMic("BackgroundDM")
		end
	end)
end

local function initializeDefaultChannel(p2)
	-- upvalues: default_1 (ref), name (ref), var4 (ref)
	local service = default_1:getService()
	
	if not service then
		return nil
	end
	name:info("Joining default channel")
	local default = service:JoinByGroupIdToken("default", p2)
	
	if default then
		var4:reportVoiceChatJoinResult(true, "defaultJoinSuccess")
		
		return default
	end
	var4:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error")
	
	return default
end

local function validateSetup()
	-- upvalues: notificationServiceIsConnectedAvailableEngineFeature (ref), useNotificationServiceIsConnected (ref), notificationService (ref), name (ref), voiceChatService (ref), playersService (ref), voiceServiceEnableDefaultVoiceAvailableEngineFeature (ref), defaultChannelEnableDefaultVoice (ref), var4 (ref), constants (ref), var2 (ref), crossExperienceModule (ref)
	if notificationServiceIsConnectedAvailableEngineFeature and useNotificationServiceIsConnected then
		if not notificationService.IsConnected then
			name:debug("NotificationService is not yet connected")
			notificationService:GetPropertyChangedSignal("IsConnected"):Wait()
		end
		name:debug("NotificationService connected")
	end
	if not voiceChatService.UseNewAudioApi then
		if playersService.LocalPlayer.Character then
			name:debug("Player character already loaded")
		else
			playersService.LocalPlayer.CharacterAdded:Wait()
			name:debug("Player character loaded")
		end
	end
	if voiceServiceEnableDefaultVoiceAvailableEngineFeature and defaultChannelEnableDefaultVoice then
		local voiceChatService_1 = game:FindService("VoiceChatService")
		
		if voiceChatService_1 then
			if voiceChatService_1.EnableDefaultVoice or voiceChatService_1.UseNewAudioApi then
				return true
			else
				name:debug("Default channel is disabled.")
				var4:reportVoiceChatJoinResult(false, "defaultDisabled")
				var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
					detail = "Default channel disabled",
					status = constants.VOICE_STATUS.ERROR_VOICE_SETUP
				})
				
				return false
			end
		else
			name:info("VoiceChatService not found. Assuming default values.")
		end
	end
end

local function getPlayerUsersIds()
	-- upvalues: playersService (ref)
	local t = {}
	
	for i, v in ipairs(playersService:GetPlayers()) do
		table.insert(t, v.UserId)
	end
	return table.concat(t, ", ")
end

local _ = function(p2)
	-- upvalues: promiseModule (ref), default (ref), cryoModule (ref)
	local t = { hasMicPermissions = false }
	
	return promiseModule.new(function(p3, _)
		-- upvalues: default (copy), p2 (ref), t (ref), cryoModule (copy), promiseModule (copy)
		default:hasPermissions(p2):andThen(function(p4)
			-- upvalues: t (copy), default (copy), cryoModule (copy), p2 (copy), promiseModule (copy), p3 (ref)
			t.hasMicPermissions = if p4.missingPermissions then not cryoModule.List.find(p4.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
			
			if t.hasMicPermissions then
				p3(t)
				
				return
			end
			local var25 = p2
			local t_1 = { hasMicPermissions = false }
			promiseModule.new(function(p5, _)
				-- upvalues: default (copy), var25 (ref), t_1 (ref), cryoModule (copy)
				default:requestPermissions(var25):andThen(function(p6)
					-- upvalues: t_1 (copy), default (copy), cryoModule (copy), p5 (ref)
					t_1.hasMicPermissions = if p6.missingPermissions then not cryoModule.List.find(p6.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
					p5(t_1)
				end):catch(function()
					-- upvalues: p5 (ref), t_1 (copy)
					p5(t_1)
				end)
			end):andThen(p3)
		end):catch(function()
			-- upvalues: p3 (ref), t (copy)
			p3(t)
		end)
	end)
end

local var25 = false

local function setupListeners()
	-- upvalues: var25 (write), name (ref), default_1 (ref), fFlagFixPartyVoiceGetPermissions (ref), promiseModule (ref), default (ref), cryoModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), fFlagPartyVoiceBlockSync (ref), var2 (ref), crossExperienceModule (ref), var22 (ref), var23 (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), var8 (ref), enableCrossExpVoiceDebug (ref), httpService (ref), var10 (ref), constants (ref), logPartyVoiceReconnect (ref), getPlayerUsersIds (ref), var1 (write), rbxAnalyticsService (ref), playersService (ref), getMemStorageKey (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref), t (write)
	if var25 then
		name:debug("listeners already registered, skipping duplicate setup")
		
		return
	end
	var25 = true
	name:debug("setting up listeners for the first time")
	default_1:subscribe("GetPermissions", function(p2, p3)
		-- upvalues: fFlagFixPartyVoiceGetPermissions (copy), promiseModule (copy), default (copy), cryoModule (copy)
		if fFlagFixPartyVoiceGetPermissions then
			local t = { hasMicPermissions = false }
			promiseModule.new(function(p4, _)
				-- upvalues: default (copy), p3 (ref), t (ref), cryoModule (copy), promiseModule (copy)
				default:hasPermissions(p3):andThen(function(p5)
					-- upvalues: t (copy), default (copy), cryoModule (copy), p3 (copy), promiseModule (copy), p4 (ref)
					t.hasMicPermissions = if p5.missingPermissions then not cryoModule.List.find(p5.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
					
					if t.hasMicPermissions then
						p4(t)
						
						return
					end
					local var26 = p3
					local t_1 = { hasMicPermissions = false }
					promiseModule.new(function(p6, _)
						-- upvalues: default (copy), var26 (ref), t_1 (ref), cryoModule (copy)
						default:requestPermissions(var26):andThen(function(p7)
							-- upvalues: t_1 (copy), default (copy), cryoModule (copy), p6 (ref)
							t_1.hasMicPermissions = if p7.missingPermissions then not cryoModule.List.find(p7.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
							p6(t_1)
						end):catch(function()
							-- upvalues: p6 (ref), t_1 (copy)
							p6(t_1)
						end)
					end):andThen(p4)
				end):catch(function()
					-- upvalues: p4 (ref), t (copy)
					p4(t)
				end)
			end):andThen(p2)
			
			return
		end
		p2({ hasMicPermissions = true })
	end)
	handleParticipants()
	handleMicrophone()
	
	if fFlagEnablePartyVoiceChangersInLua then
		handleVoiceChanger()
	end
	if fFlagPartyVoiceBlockSync then
		var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, var22)
		var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, var23)
	end
	if getFFlagEnableCrossExperienceVoiceCaptureMute() then
		var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, function(p2)
			-- upvalues: var8 (copy), default_1 (copy)
			var8(function()
				-- upvalues: default_1 (copy), p2 (ref)
				default_1:MuteAll(true, p2.context)
			end)
		end)
		var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, function(p2)
			-- upvalues: var8 (copy), default_1 (copy)
			var8(function()
				-- upvalues: default_1 (copy), p2 (ref)
				default_1:MuteAll(false, p2.context)
			end)
		end)
	end
	if enableCrossExpVoiceDebug then
		var2:addObserver(crossExperienceModule.Constants.EVENTS.DEBUG_COMMAND, function(p2)
			-- upvalues: httpService (copy), var10 (copy), default_1 (copy)
			if p2.name == "dump_session" then
				print("----------- CEV BACKGROUND -----------")
				print("Store State", httpService:JSONEncode(var10:getState()))
				print("--------------------------------------")
				print("CoreVoiceManager State:")
				print("Participants", httpService:JSONEncode(default_1.participants))
				print("Local Muted", httpService:JSONEncode({ value = default_1.localMuted }))
				print("Mute All", httpService:JSONEncode({ value = default_1.muteAll }))
				print("Muted Anyone", httpService:JSONEncode({ value = default_1._mutedAnyone }))
				print("Is Talking", httpService:JSONEncode({ value = default_1.isTalking }))
				print("Muted Players", httpService:JSONEncode(default_1.mutedPlayers))
				
				for i in default_1.audioDevices do
					if i.Player then
						print("Audio Device ", i.Player.UserId, " Active:", i.Active, " MutedByLocalPlayer:", i.MutedByLocalUser)
					end
				end
				print("Voice Enabled", httpService:JSONEncode({ value = default_1.voiceEnabled }))
				print("Permissions Result", httpService:JSONEncode(default_1.communicationPermissionsResult))
				print("Voice Join Progress", httpService:JSONEncode({ value = default_1.VoiceJoinProgress }))
				print("-----------------------------")
			end
		end)
	end
	default_1:subscribe("OnRequestMicPermissionRejected", function()
		-- upvalues: constants (copy), var2 (copy), crossExperienceModule (copy)
		var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = nil,
			status = constants.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED
		})
	end)
	default_1:subscribe("OnPlayerModerated", function()
		-- upvalues: constants (copy), var2 (copy), crossExperienceModule (copy)
		var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "On Player Moderated",
			status = constants.VOICE_STATUS.ERROR_VOICE_MODERATED
		})
	end)
	default_1:subscribe("OnInitialJoinFailed", function()
		-- upvalues: constants (copy), var2 (copy), crossExperienceModule (copy)
		var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "Initial Join failed",
			status = constants.VOICE_STATUS.ERROR_VOICE_JOIN
		})
	end)
	default_1:subscribe("OnRetryRequested", function()
		-- upvalues: logPartyVoiceReconnect (copy), constants (copy), var2 (copy), crossExperienceModule (copy)
		if logPartyVoiceReconnect then
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Retry requested",
				status = constants.VOICE_STATUS.VOICE_RECONNECTING
			})
			
			return
		end
		var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "Retry requested",
			status = constants.VOICE_STATUS.VOICE_CONNECTING
		})
	end)
	default_1:subscribe("OnStateChanged", function(_, p2)
		-- upvalues: default_1 (copy), getPlayerUsersIds (copy), var2 (copy), crossExperienceModule (copy), var1 (copy), constants (copy), rbxAnalyticsService (copy), playersService (copy), getMemStorageKey (copy), CEV_JOIN_ATTEMPT_ID_KEY (copy), t (copy)
		if p2 == Enum.VoiceChatState.Joined then
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				userId = var1,
				status = constants.VOICE_STATUS.VOICE_CONNECTED,
				voiceChannelId = default_1:GetChannelId(),
				voiceSessionId = default_1:GetSessionId(),
				voicePlaySessionId = rbxAnalyticsService:GetPlaySessionId(),
				participants = getPlayerUsersIds(),
				numberActive = #playersService:GetPlayers(),
				cevJoinAttemptId = getMemStorageKey(CEV_JOIN_ATTEMPT_ID_KEY)
			})
			t.previousGroupId = default_1.service:GetGroupId()
			
			return
		elseif p2 == Enum.VoiceChatState.Failed then
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = nil,
				status = constants.VOICE_STATUS.ERROR_VOICE_FAILED
			})
			
			return
		elseif p2 == Enum.VoiceChatState.Ended then
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = nil,
				status = constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED
			})
		end
	end)
	default_1:subscribe("OnReportJoinFailed", function(p2)
		-- upvalues: name (copy), constants (copy), var2 (copy), crossExperienceModule (copy)
		name:error("CEV OnReportJoinFailed " .. p51)
		var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			status = constants.VOICE_STATUS.ERROR_VOICE_JOIN,
			detail = p2
		})
	end)
end

function initializeAFM()
	-- upvalues: audioFocusManagementEngineFeature (ref), crossExperienceModule (ref), fIntPartyVoiceUndeafenDelayMS (ref), var5 (write), partyVoiceFixCaptureVideoCheck (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), var3 (ref), var24 (ref), default_1 (ref), enableCEVPersistMuteStateForAFM (ref), t (write), name (ref), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var8 (ref), promiseModule (ref)
	if audioFocusManagementEngineFeature then
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			local CONTEXT_ID = crossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
			local FOCUS_PRIORITY = crossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY
			status:RegisterContextIdFromLua(CONTEXT_ID)
			
			local var26 = function()
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var5 (copy), partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var3 (copy), var24 (copy), default_1 (copy), enableCEVPersistMuteStateForAFM (copy), t (copy)
				if fIntPartyVoiceUndeafenDelayMS > 0 and var5 then
					task.cancel(var5)
					var5 = nil
				end
				if partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var3 or not var3:IsCapturingVideo())) or not var24 then
					default_1:MuteAll(true, "AudioFocusManagement - CEV deafenAll")
				end
				if not default_1.localMuted and (not enableCEVPersistMuteStateForAFM or t.previousMutedState == default_1.localMuted) then
					default_1:ToggleMic("AudioFocusManagement - CEV deafenAll")
				end
			end
			
			local var27 = function()
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var5 (copy), partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var3 (copy), var24 (copy), default_1 (copy), name (copy), partyVoiceExecuteVoiceActionsPostAsyncInit (copy), var8 (copy), enableCEVPersistMuteStateForAFM (copy), t (copy)
				if fIntPartyVoiceUndeafenDelayMS > 0 and var5 then
					task.cancel(var5)
					var5 = nil
				end
				if partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var3 or not var3:IsCapturingVideo())) or not var24 then
					default_1:MuteAll(false, "AudioFocusManagement - CEV Mute All")
				end
				if default_1.localMuted == nil then
					name:info("CEV undeafenAll - Voice not connected yet - calling unmuteMicrophoneOnce")
					default_1.muteChanged.Event:Once(function(p2)
						-- upvalues: partyVoiceExecuteVoiceActionsPostAsyncInit (copy), var8 (copy), default_1 (copy)
						if p2 ~= nil then
							if partyVoiceExecuteVoiceActionsPostAsyncInit then
								var8(function()
									-- upvalues: default_1 (copy)
									default_1:ToggleMic("BackgroundDM")
								end)
								
								return
							end
							default_1:ToggleMic("BackgroundDM")
						end
					end)
					
					return
				elseif default_1.localMuted and (not enableCEVPersistMuteStateForAFM or t.previousMutedState ~= default_1.localMuted) then
					name:info("CEV undeafenAll - Voice connected and muted - unmuting immediately")
					default_1:ToggleMic("AudioFocusManagement - CEV undeafenAll")
				end
			end
			
			status.OnDeafenVoiceAudio:Connect(function(p2)
				-- upvalues: CONTEXT_ID (ref), fIntPartyVoiceUndeafenDelayMS (copy), var5 (copy), name (copy), var26 (ref)
				if p2 == CONTEXT_ID then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var5 then
						task.cancel(var5)
						var5 = nil
					end
					name:info("CEV OnDeafenVoiceAudio fired" .. p53)
					var26()
				end
			end)
			status.OnUndeafenVoiceAudio:Connect(function(p2)
				-- upvalues: CONTEXT_ID (ref), name (copy), fIntPartyVoiceUndeafenDelayMS (copy), var5 (copy), var27 (ref)
				if p2 == CONTEXT_ID then
					name:info("CEV OnUndeafenVoiceAudio fired for context: {} - expected: {}", p2, CONTEXT_ID)
					
					if fIntPartyVoiceUndeafenDelayMS > 0 then
						if var5 then
							task.cancel(var5)
						end
						var5 = task.delay(fIntPartyVoiceUndeafenDelayMS / 1000, function()
							-- upvalues: var5 (copy), name (copy), p2 (ref), var27 (copy)
							var5 = nil
							name:info("CEV OnUndeafenVoiceAudio fired delayed" .. p54)
							var27()
						end)
						
						return
					else
						name:info("CEV OnUndeafenVoiceAudio fired" .. p54)
						var27()
					end
				end
			end)
			
			local _ = function(p2, p3)
				-- upvalues: name (copy), promiseModule (copy), status (ref)
				name:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", p2, p3)
				
				return promiseModule.new(function(p4, p5)
					-- upvalues: status (copy), p2 (ref), p3 (ref), name (copy)
					local ok, status_1 = pcall(status.RequestFocus, status, p2, p3)
					
					if ok then
						name:info("CEV requestAudioFocusWithPromise - focusGranted: {}", status_1)
						p4(status_1)
						
						return
					end
					name:info("CEV requestAudioFocusWithPromise - rejected")
					p5("Failed to call RequestFocus due to an error")
				end)
			end
			
			name:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", CONTEXT_ID, FOCUS_PRIORITY)
			promiseModule.new(function(p2, p3)
				-- upvalues: status (ref), CONTEXT_ID (ref), FOCUS_PRIORITY (ref), name (copy)
				local ok, status_1 = pcall(status.RequestFocus, status, CONTEXT_ID, FOCUS_PRIORITY)
				
				if ok then
					name:info("CEV requestAudioFocusWithPromise - focusGranted: {}", status_1)
					p2(status_1)
					
					return
				end
				name:info("CEV requestAudioFocusWithPromise - rejected")
				p3("Failed to call RequestFocus due to an error")
			end):andThen(function(p2)
				-- upvalues: name (copy), default_1 (copy), partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var3 (copy), var24 (copy)
				if p2 then
					name:info("CEV audio focus request granted, preparing to undeafen.")
					default_1.muteChanged.Event:Once(function(p3)
						-- upvalues: partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var3 (copy), var24 (copy), default_1 (copy)
						if p3 ~= nil and partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var3 or not var3:IsCapturingVideo())) or not var24 then
							default_1:MuteAll(false, "AudioFocusManagement CEV")
						end
					end)
					
					return
				end
				name:info("CEV audio focus request denied, preparing to deafen.")
				default_1.muteChanged.Event:Once(function(p3)
					-- upvalues: partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var3 (copy), var24 (copy), default_1 (copy)
					if p3 ~= nil and partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var3 or not var3:IsCapturingVideo())) or not var24 then
						default_1:MuteAll(true, "AudioFocusManagement CEV")
					end
				end)
			end):catch(function()
				-- upvalues: name (copy)
				name:info("[CEV] Error requesting focus inside CEV")
			end)
			
			return
		end
		name:info("AudioFocusService did not initialize")
	end
end

function initializeVoice()
	-- upvalues: constants (ref), var2 (ref), crossExperienceModule (ref), default_1 (ref), initializeDefaultChannel (ref), name (ref)
	var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
		detail = nil,
		status = constants.VOICE_STATUS.VOICE_CONNECTING
	})
	default_1:asyncInit():andThen(function()
		-- upvalues: initializeDefaultChannel (copy), constants (copy), var2 (copy), crossExperienceModule (copy)
		if initializeDefaultChannel(false) == false then
			var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Initial Join failed",
				status = constants.VOICE_STATUS.ERROR_VOICE_JOIN
			})
		else
			onCoreVoiceManagerInitialized()
		end
		initializeAFM()
	end):catch(function(_)
		-- upvalues: name (copy), constants (copy), var2 (copy), crossExperienceModule (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 749
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end)
end

function rejoinVoice()
	-- upvalues: constants (ref), var2 (ref), crossExperienceModule (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), default_1 (ref), t (write)
	var2:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
		detail = nil,
		status = constants.VOICE_STATUS.VOICE_CONNECTING
	})
	
	if getFFlagVoiceChatClientRewriteMasterLua() then
		default_1:RejoinVoice()
	else
		default_1:RejoinChannel(t.previousGroupId, t.previousMutedState)
	end
	t = { previousGroupId = nil, previousMutedState = nil }
end

function startVoice()
	-- upvalues: validateSetup (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (ref), var1 (write), ensureLocalPlayerWithTimeout (ref), name (ref), setupListeners (ref)
	if validateSetup() then
		if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then
			var1 = ensureLocalPlayerWithTimeout()
			name:info("Delayed loading of LocalPlayer loaded with UserId: {}", var1)
		end
		setupListeners()
		initializeVoice()
	end
end

var2:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function()
	-- upvalues: var10 (ref), VOICE_STATUS (ref), fFlagFixPartyVoiceGetPermissions (ref)
	local voiceStatus = var10:getState().Squad.CrossExperienceVoice.Experience.voiceStatus
	
	if voiceStatus == VOICE_STATUS.ERROR_VOICE_SETUP then
		startVoice()
		
		return
	elseif voiceStatus == VOICE_STATUS.ERROR_VOICE_INIT or fFlagFixPartyVoiceGetPermissions and voiceStatus == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED then
		initializeVoice()
		
		return
	elseif voiceStatus == VOICE_STATUS.ERROR_VOICE_JOIN or not fFlagFixPartyVoiceGetPermissions and voiceStatus == VOICE_STATUS.ERROR_VOICE_MIC_REJECTED or (voiceStatus == VOICE_STATUS.ERROR_VOICE_MODERATED or voiceStatus == VOICE_STATUS.ERROR_VOICE_FAILED or voiceStatus == VOICE_STATUS.ERROR_VOICE_DISCONNECTED) then
		rejoinVoice()
	end
end)
local var26 = false

local _ = function()
	-- upvalues: var26 (write), foreground_ui_ready (write), var2 (ref), crossExperienceModule (ref), name (ref)
	if var26 then return end
	var26 = true
	
	if foreground_ui_ready then
		var2:removeObserver(foreground_ui_ready, crossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
		foreground_ui_ready = nil
	end
	name:info("Proceeding to start voice connection.")
	startVoice()
end

sendAnalyticsEvent("startingVoiceFromCEVDefaultChannel")

if cevReadinessSyncEngineFeature then
	name:info("Waiting for foreground UI readiness signal (with promise race)...")
	promiseModule.race({
		promiseModule.new(function(p2)
			-- upvalues: bindableEvent (ref)
			bindableEvent.Event:Once(function()
				-- upvalues: p2 (ref)
				p2("signal")
			end)
		end),
		promiseModule.delay(voiceJoinTimeoutInSeconds):andThen(function()
			return "timeout"
		end)
	}):andThen(function(p2)
		-- upvalues: name (ref), sendAnalyticsEvent (ref), voiceJoinTimeoutInSeconds (ref), var26 (write), foreground_ui_ready (write), var2 (ref), crossExperienceModule (ref)
		if p2 == "signal" then
			name:info("Readiness signal received within timeout.")
		else
			name:info("Timed out waiting for readiness signal. Starting voice anyway.")
			sendAnalyticsEvent("partyVoiceInitTimedOut", { timeout = voiceJoinTimeoutInSeconds })
		end
		if var26 then return end
		var26 = true
		
		if foreground_ui_ready then
			var2:removeObserver(foreground_ui_ready, crossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
			foreground_ui_ready = nil
		end
		name:info("Proceeding to start voice connection.")
		startVoice()
	end)
else
	name:info("Foreground UI not using readiness sync. Starting voice connection immediately.")
	startVoice()
end