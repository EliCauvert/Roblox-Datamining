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
local var11 = if fStringTimeoutLoadingLocalPlayerInBackgroundDM == LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then if playersService.LocalPlayer then playersService.LocalPlayer.UserId else -1 else nil

local function sendAnalyticsEvent(p0, p1)
	-- upvalues: getMemStorageKey (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (ref), var11 (write), rbxAnalyticsService (ref)
	p1 = p1 or {}
	p1.cevJoinAttemptId = getMemStorageKey(CEV_JOIN_ATTEMPT_ID_KEY)
	p1.clientTimeStamp = os.time()
	p1.userId = if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then var11 else nil
	rbxAnalyticsService:SendEventDeferred("client", "partyVoice", p0, p1)
end

if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then
	sendAnalyticsEvent("partyVoiceCEVChannelFileLoaded")
end
local var13 = crossExperienceModule.EventManager.new(crossExperienceModule.Constants.EXPERIENCE_TYPE_VOICE, true)

local function _(p2, p3)
	-- upvalues: var13 (ref), crossExperienceModule (ref)
	var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, { status = p2, detail = p3 })
end

local function ensureLocalPlayerWithTimeout()
	-- upvalues: playersService (ref), promiseModule (ref), backgroundDMLocalPlayerLoadingTimeoutSeconds (ref), sendAnalyticsEvent (ref), crossExperienceModule (ref), var13 (ref)
	local localPlayer = playersService.LocalPlayer
	
	if not localPlayer then
		promiseModule.race({
			promiseModule.new(function(p5)
				-- upvalues: playersService (copy)
				if playersService.LocalPlayer then
					p5("loaded")
					
					return
				end
				local var68 = nil
				var68 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
					-- upvalues: playersService (copy), var68 (write), p5 (ref)
					if playersService.LocalPlayer then
						var68:Disconnect()
						p5("loaded")
					end
				end)
			end),
			promiseModule.delay(backgroundDMLocalPlayerLoadingTimeoutSeconds):andThen(function()
				return "timeout"
			end)
		}):andThen(function(p4)
			-- upvalues: localPlayer (write), playersService (copy), sendAnalyticsEvent (copy), backgroundDMLocalPlayerLoadingTimeoutSeconds (copy), crossExperienceModule (copy), var13 (copy)
			if p4 == "loaded" then
				localPlayer = playersService.LocalPlayer
				sendAnalyticsEvent("cevDefaultChannelBackgroundDMLocalPlayerLoaded", {
					timeoutSeconds = backgroundDMLocalPlayerLoadingTimeoutSeconds
				})
				
				return
			end
			sendAnalyticsEvent("backgroundDMLocalPlayerLoadingTimeout", {
				timeoutSeconds = backgroundDMLocalPlayerLoadingTimeoutSeconds
			})
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
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
	var11 = -1
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
local var21 = if sharedFlagsModule.GetFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil
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
local var34 = voiceChatCoreModule.Analytics.new()
local observeCurrentContextId = crossExperienceModule.Utils.observeCurrentContextId
local voiceChatService = game:GetService("VoiceChatService")
local constants = crossExperienceModule.Constants
local VOICE_STATUS = constants.VOICE_STATUS
local fFlagFixPartyVoiceGetPermissions = sharedFlagsModule.GetFFlagFixPartyVoiceGetPermissions()
local fFlagEnablePartyVoiceChangersInLua = sharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local enableCEVPersistMuteStateForAFM = game:DefineFastFlag("EnableCEVPersistMuteStateForAFM", false)
local var38 = nil

if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	default_1:setOptions({
		allowSeamlessVoice = false,
		passInitErrorInPromiseReject = true,
		forceVoiceEnabled = true
	})
end
local var39 = createPersistenceMiddleware({
	storeKey = crossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
})
sendAnalyticsEvent("partyVoicePersistenceMiddlewareCreated")
local default_2 = crossExperienceModule.PartyAudioPlayer.default

local var40 = function()
	-- upvalues: roduxModule (ref), crossExperienceModule (ref)
	return roduxModule.combineReducers({
		Squad = roduxModule.combineReducers({
			CrossExperienceVoice = crossExperienceModule.installReducer()
		})
	})
end

sendAnalyticsEvent("partyVoiceCrossExperienceReducerLoaded")

local var41 = function(p6)
	-- upvalues: default_1 (ref), name (ref)
	default_1:asyncInit():andThen(function()
		-- upvalues: p6 (ref)
		p6()
	end):catch(function(p7)
		-- upvalues: name (copy)
		name:info("CoreVoiceManager did not initialize {}", p7)
	end)
end

local t = { previousGroupId = nil, previousMutedState = false }
local bindableEvent = Instance.new("BindableEvent")
local var44 = false
local foreground_ui_ready = nil

if cevReadinessSyncEngineFeature then
	name:info("Registering early observer for foreground readiness signal.")
	foreground_ui_ready = var13:addObserver(crossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY, function()
		-- upvalues: var44 (write), name (ref), bindableEvent (ref)
		if not var44 then
			name:info("Received foreground UI readiness signal.")
			var44 = true
			bindableEvent:Fire()
		end
	end)
end
local var46 = roduxModule.Store.new(var40(), nil, { roduxModule.thunkMiddleware, var39.getMiddleware() })
sendAnalyticsEvent("partyVoicePersistenceMiddlewareReducerLoaded")
var13:subscribe(var46)

if not game:IsLoaded() then
	game.Loaded:Wait()
end
sendAnalyticsEvent("partyVoiceGameLoaded")
var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
	detail = nil,
	status = constants.VOICE_STATUS.RCC_CONNECTED
})
sendAnalyticsEvent("partyVoiceRCCConnectedSignalFired")
var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
	jobId = if game.JobId == "" or game.JobId == nil then httpService:GenerateGUID(true) else game.JobId,
	placeId = game.PlaceId,
	gameId = game.GameId
})

if delayAudioFocusReplication then
	local var47 = nil
	local var48 = false
	observeCurrentContextId(function(p8)
		-- upvalues: var47 (write), var48 (write), playerAudioFocusChanged (write)
		var47 = p8
		print("CurrentContextId changed to", p8, "isReplicationReady:", var48)
		
		if var48 and playerAudioFocusChanged then
			playerAudioFocusChanged:FireServer(p8)
			print("Fired PlayerAudioFocusChanged with contextId:", p8)
		end
	end)
	print("Waiting for PlayerAudioFocusChanged to replicate...")
	playerAudioFocusChanged = replicatedStorageService:WaitForChild("PlayerAudioFocusChanged", playerAudioFocusReplicationTimeoutSeconds)
	
	if playerAudioFocusChanged then
		print("PlayerAudioFocusChanged replicated successfully.")
		sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedLoaded")
		playerAudioFocusChanged.OnClientEvent:Connect(function(p9, p10, p11)
			-- upvalues: var13 (ref), crossExperienceModule (ref)
			print("Received PlayerAudioFocusChanged OnClientEvent:", p9, p10)
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, { userId = p9, contextId = p10, contextIds = p11 })
		end)
		var48 = true
	else
		print("PlayerAudioFocusChanged did not replicate within timeout of ", playerAudioFocusReplicationTimeoutSeconds, " seconds.")
		sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedReplicationTimeout", {
			timeoutSeconds = playerAudioFocusReplicationTimeoutSeconds
		})
	end
else
	observeCurrentContextId(function(p12)
		-- upvalues: playerAudioFocusChanged (write)
		playerAudioFocusChanged:FireServer(p12)
	end)
	playerAudioFocusChanged.OnClientEvent:Connect(function(p13, p14, p15)
		-- upvalues: var13 (ref), crossExperienceModule (ref)
		var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, { userId = p13, contextId = p14, contextIds = p15 })
	end)
end
local var47 = function(p16)
	-- upvalues: var13 (ref), crossExperienceModule (ref), var11 (write), fFlagEnablePartyVoiceChangersInLua (ref)
	var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
		userId = p16.UserId,
		isLocalUser = p16.UserId == var11,
		username = p16.Name,
		displayname = p16.DisplayName,
		isVoiceChangerActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
		isVoiceChangerHearMyselfActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
		selectedVoicePack = if fFlagEnablePartyVoiceChangersInLua then "None" else nil
	})
end

local var48 = function(p17)
	-- upvalues: var13 (ref), crossExperienceModule (ref), var11 (write), default_2 (ref)
	var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, { userId = p17.UserId, isLocalUser = p17.UserId == var11 })
	default_2:playSound("leave")
end

local var49 = function(p18)
	-- upvalues: crossExperienceModule (ref), var13 (ref), var11 (write)
	var13:notify(if p18.isActive then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, { isLocalUser = true, userId = var11 })
end

local var50 = function(p19)
	-- upvalues: enableCEVPersistMuteStateForAFM (ref), t (write), crossExperienceModule (ref), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var41 (ref), var13 (ref), var11 (write)
	if not enableCEVPersistMuteStateForAFM then
		t.previousMutedState = p19
	end
	local var69 = if p19 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED
	
	if partyVoiceExecuteVoiceActionsPostAsyncInit then
		var41(function()
			-- upvalues: var13 (copy), var69 (ref), var11 (copy)
			var13:notify(var69, { isLocalUser = true, userId = var11 })
		end)
		
		return
	end
	var13:notify(var69, { isLocalUser = true, userId = var11 })
end

local function onLocalVoiceChangerChanged(p20)
	-- upvalues: crossExperienceModule (ref), var13 (ref), var11 (write)
	var13:notify(if p20 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, { isLocalUser = true, userId = var11 })
end

local function onLocalVoiceChangerHearMyselfChanged(p21)
	-- upvalues: crossExperienceModule (ref), var13 (ref), var11 (write)
	var13:notify(if p21 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, { isLocalUser = true, userId = var11 })
end

local var53 = function(p22)
	-- upvalues: fFlagEnablePartyVoiceChangersInLua (ref), crossExperienceModule (ref), var11 (write), var13 (ref)
	for i, v in pairs(p22) do
		local isSignalActive = v.isSignalActive
		local isMuted = v.isMuted
		local var70 = if fFlagEnablePartyVoiceChangersInLua then v.isVoiceChangerActive else nil
		local var71 = if isSignalActive then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE
		local var72 = if isMuted then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED
		local var73 = if fFlagEnablePartyVoiceChangersInLua then if var70 then crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else crossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED else nil
		local t = { userId = i, isLocalUser = i == var11 }
		var13:notify(var72, t)
		var13:notify(var71, t)
		
		if fFlagEnablePartyVoiceChangersInLua then
			var13:notify(var73, t)
		end
	end
end

local var54 = function(p23)
	-- upvalues: var11 (write), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var41 (ref), enableCEVPersistMuteStateForAFM (ref), t (write), default_1 (ref)
	local var75 = tonumber(p23.userId)
	local var76 = var11 == var75
	
	if partyVoiceExecuteVoiceActionsPostAsyncInit then
		var41(function()
			-- upvalues: var76 (ref), enableCEVPersistMuteStateForAFM (copy), t (copy), default_1 (copy), var75 (ref)
			if not var76 then
				default_1:ToggleMutePlayer(var75)
				
				return
			elseif enableCEVPersistMuteStateForAFM then
				t.previousMutedState = not default_1.localMuted
			end
			default_1:ToggleMic("Squads")
		end)
		
		return
	elseif var76 then
		default_1:ToggleMic("Squads")
		
		return
	end
	default_1:ToggleMutePlayer(var75)
end

local function setVoicePack(value)
	-- upvalues: default_1 (ref), var13 (ref), crossExperienceModule (ref), var11 (write)
	local voicePackName = value.voicePackName
	default_1:SetVoicePack(voicePackName)
	var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_PACK_WAS_SET, {
		isLocalUser = true,
		userId = var11,
		voicePackName = voicePackName
	})
end

local function toggleVoiceChanger(p24)
	-- upvalues: var11 (write), default_1 (ref)
	local var77 = tonumber(p24.userId)
	
	if var11 == var77 then
		default_1:ToggleVoiceChanger("Squads")
		
		return
	end
	default_1:ToggleVoiceChanger(var77)
end

local function toggleVoiceChangerHearMyself(p25)
	-- upvalues: var11 (write), default_1 (ref)
	local var78 = tonumber(p25.userId)
	
	if var11 == var78 then
		default_1:ToggleVoiceChangerHearMyself("Squads")
		
		return
	end
	default_1:ToggleVoiceChangerHearMyself(var78)
end

function handleParticipants()
	-- upvalues: playersService (ref), var47 (ref), default_2 (ref), var48 (ref), var11 (write)
	playersService.PlayerAdded:Connect(function(p26)
		-- upvalues: var47 (copy), default_2 (copy)
		var47(p26)
		default_2:playSound("join")
	end)
	playersService.PlayerRemoving:Connect(var48)
	
	for i, v in pairs(playersService:GetPlayers()) do
		if v:IsA("Player") then
			var47(v)
			
			if v.UserId == var11 then
				default_2:playSound("join")
			end
		end
	end
end

function handleMicrophone()
	-- upvalues: default_1 (ref), var50 (ref), var13 (ref), crossExperienceModule (ref), var54 (ref)
	default_1.muteChanged.Event:Connect(var50)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, var54)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, var54)
end

function handleVoiceChanger()
	-- upvalues: default_1 (ref), onLocalVoiceChangerChanged (ref), var13 (ref), crossExperienceModule (ref), toggleVoiceChanger (ref), setVoicePack (ref), onLocalVoiceChangerHearMyselfChanged (ref), toggleVoiceChangerHearMyself (ref)
	default_1.voiceChangerChanged.Event:Connect(onLocalVoiceChangerChanged)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, toggleVoiceChanger)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, toggleVoiceChanger)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.SET_PARTY_VOICE_PACK, setVoicePack)
	default_1.voiceChangerHearMyselfChanged.Event:Connect(onLocalVoiceChangerHearMyselfChanged)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, toggleVoiceChangerHearMyself)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, toggleVoiceChangerHearMyself)
end

local var58 = function(p27)
	-- upvalues: playersService (ref), blockingUtilityModule (ref), name (ref)
	local var79 = playersService:GetPlayerByUserId(tonumber(p27.userId) or 0)
	
	if var79 then
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), var79 (ref), name (copy)
			if blockingUtilityModule:AddPlayerToBlockList(var79) then
				name:info("Participant {} was blocked from party voice", var79.DisplayName)
			end
		end)()
	end
end

local var59 = function(p28)
	-- upvalues: playersService (ref), blockingUtilityModule (ref), name (ref)
	local var80 = playersService:GetPlayerByUserId(tonumber(p28.userId) or 0)
	
	if var80 then
		coroutine.wrap(function()
			-- upvalues: blockingUtilityModule (copy), var80 (ref), name (copy)
			if blockingUtilityModule:RemovePlayerFromBlockList(var80) then
				name:info("Participant {} was unblocked from party voice", var80.DisplayName)
			end
		end)()
	end
end

local var60 = function()
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), var21 (ref)
	return getFFlagEnableCrossExperienceVoiceCaptureMute() and (var21 and var21:IsCapturingVideo())
end

local _ = function(p29, p30)
	-- upvalues: cryoModule (ref)
	return if p29.missingPermissions then not cryoModule.List.find(p29.missingPermissions, p30) else false
end

local _ = function(p31)
	-- upvalues: promiseModule (ref), default (ref), cryoModule (ref)
	local t = { hasMicPermissions = false }
	
	return promiseModule.new(function(p32, _)
		-- upvalues: default (copy), p31 (ref), t (ref), cryoModule (copy)
		default:requestPermissions(p31):andThen(function(p33)
			-- upvalues: t (copy), default (copy), cryoModule (copy), p32 (ref)
			t.hasMicPermissions = if p33.missingPermissions then not cryoModule.List.find(p33.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
			p32(t)
		end):catch(function()
			-- upvalues: p32 (ref), t (copy)
			p32(t)
		end)
	end)
end

local _ = function()
	-- upvalues: var13 (ref), crossExperienceModule (ref), var58 (ref), var59 (ref)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, var58)
	var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, var59)
end

function onCoreVoiceManagerInitialized()
	-- upvalues: default_1 (ref), var49 (ref), var53 (ref)
	default_1:getService().PlayerMicActivitySignalChange:Connect(var49)
	default_1.participantsUpdate.Event:Connect(var53)
end

local _ = function()
	-- upvalues: default_1 (ref), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var41 (ref)
	default_1.muteChanged.Event:Once(function(p34)
		-- upvalues: partyVoiceExecuteVoiceActionsPostAsyncInit (copy), var41 (copy), default_1 (copy)
		if p34 ~= nil then
			if partyVoiceExecuteVoiceActionsPostAsyncInit then
				var41(function()
					-- upvalues: default_1 (copy)
					default_1:ToggleMic("BackgroundDM")
				end)
				
				return
			end
			default_1:ToggleMic("BackgroundDM")
		end
	end)
end

local function initializeDefaultChannel(p35)
	-- upvalues: default_1 (ref), name (ref), var34 (ref)
	local service = default_1:getService()
	
	if not service then
		return nil
	end
	name:info("Joining default channel")
	local default = service:JoinByGroupIdToken("default", p35)
	
	if default then
		var34:reportVoiceChatJoinResult(true, "defaultJoinSuccess")
		
		return default
	end
	var34:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error")
	
	return default
end

local function validateSetup()
	-- upvalues: notificationServiceIsConnectedAvailableEngineFeature (ref), useNotificationServiceIsConnected (ref), notificationService (ref), name (ref), voiceChatService (ref), playersService (ref), voiceServiceEnableDefaultVoiceAvailableEngineFeature (ref), defaultChannelEnableDefaultVoice (ref), var34 (ref), constants (ref), var13 (ref), crossExperienceModule (ref)
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
				var34:reportVoiceChatJoinResult(false, "defaultDisabled")
				var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
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

local _ = function(p36)
	-- upvalues: promiseModule (ref), default (ref), cryoModule (ref)
	local t = { hasMicPermissions = false }
	
	return promiseModule.new(function(p37, _)
		-- upvalues: default (copy), p36 (ref), t (ref), cryoModule (copy), promiseModule (copy)
		default:hasPermissions(p36):andThen(function(p38)
			-- upvalues: t (copy), default (copy), cryoModule (copy), p36 (copy), promiseModule (copy), p37 (ref)
			t.hasMicPermissions = if p38.missingPermissions then not cryoModule.List.find(p38.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
			
			if t.hasMicPermissions then
				p37(t)
				
				return
			end
			local var87 = p36
			local t_1 = { hasMicPermissions = false }
			promiseModule.new(function(p39, _)
				-- upvalues: default (copy), var87 (ref), t_1 (ref), cryoModule (copy)
				default:requestPermissions(var87):andThen(function(p40)
					-- upvalues: t_1 (copy), default (copy), cryoModule (copy), p39 (ref)
					t_1.hasMicPermissions = if p40.missingPermissions then not cryoModule.List.find(p40.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
					p39(t_1)
				end):catch(function()
					-- upvalues: p39 (ref), t_1 (copy)
					p39(t_1)
				end)
			end):andThen(p37)
		end):catch(function()
			-- upvalues: p37 (ref), t (copy)
			p37(t)
		end)
	end)
end

local var64 = false

local function setupListeners()
	-- upvalues: var64 (write), name (ref), default_1 (ref), fFlagFixPartyVoiceGetPermissions (ref), promiseModule (ref), default (ref), cryoModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), fFlagPartyVoiceBlockSync (ref), var13 (ref), crossExperienceModule (ref), var58 (ref), var59 (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), var41 (ref), enableCrossExpVoiceDebug (ref), httpService (ref), var46 (ref), constants (ref), logPartyVoiceReconnect (ref), getPlayerUsersIds (ref), var11 (write), rbxAnalyticsService (ref), playersService (ref), getMemStorageKey (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref), t (write)
	if var64 then
		name:debug("listeners already registered, skipping duplicate setup")
		
		return
	end
	var64 = true
	name:debug("setting up listeners for the first time")
	default_1:subscribe("GetPermissions", function(p41, p42)
		-- upvalues: fFlagFixPartyVoiceGetPermissions (copy), promiseModule (copy), default (copy), cryoModule (copy)
		if fFlagFixPartyVoiceGetPermissions then
			local t = { hasMicPermissions = false }
			promiseModule.new(function(p43, _)
				-- upvalues: default (copy), p42 (ref), t (ref), cryoModule (copy), promiseModule (copy)
				default:hasPermissions(p42):andThen(function(p44)
					-- upvalues: t (copy), default (copy), cryoModule (copy), p42 (copy), promiseModule (copy), p43 (ref)
					t.hasMicPermissions = if p44.missingPermissions then not cryoModule.List.find(p44.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
					
					if t.hasMicPermissions then
						p43(t)
						
						return
					end
					local var87 = p42
					local t_1 = { hasMicPermissions = false }
					promiseModule.new(function(p45, _)
						-- upvalues: default (copy), var87 (ref), t_1 (ref), cryoModule (copy)
						default:requestPermissions(var87):andThen(function(p46)
							-- upvalues: t_1 (copy), default (copy), cryoModule (copy), p45 (ref)
							t_1.hasMicPermissions = if p46.missingPermissions then not cryoModule.List.find(p46.missingPermissions, default.Permissions.MICROPHONE_ACCESS) else false
							p45(t_1)
						end):catch(function()
							-- upvalues: p45 (ref), t_1 (copy)
							p45(t_1)
						end)
					end):andThen(p43)
				end):catch(function()
					-- upvalues: p43 (ref), t (copy)
					p43(t)
				end)
			end):andThen(p41)
			
			return
		end
		p41({ hasMicPermissions = true })
	end)
	handleParticipants()
	handleMicrophone()
	
	if fFlagEnablePartyVoiceChangersInLua then
		handleVoiceChanger()
	end
	if fFlagPartyVoiceBlockSync then
		var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, var58)
		var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, var59)
	end
	if getFFlagEnableCrossExperienceVoiceCaptureMute() then
		var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, function(p47)
			-- upvalues: var41 (copy), default_1 (copy)
			var41(function()
				-- upvalues: default_1 (copy), p47 (ref)
				default_1:MuteAll(true, p47.context)
			end)
		end)
		var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, function(p48)
			-- upvalues: var41 (copy), default_1 (copy)
			var41(function()
				-- upvalues: default_1 (copy), p48 (ref)
				default_1:MuteAll(false, p48.context)
			end)
		end)
	end
	if enableCrossExpVoiceDebug then
		var13:addObserver(crossExperienceModule.Constants.EVENTS.DEBUG_COMMAND, function(p49)
			-- upvalues: httpService (copy), var46 (copy), default_1 (copy)
			if p49.name == "dump_session" then
				print("----------- CEV BACKGROUND -----------")
				print("Store State", httpService:JSONEncode(var46:getState()))
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
		-- upvalues: constants (copy), var13 (copy), crossExperienceModule (copy)
		var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = nil,
			status = constants.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED
		})
	end)
	default_1:subscribe("OnPlayerModerated", function()
		-- upvalues: constants (copy), var13 (copy), crossExperienceModule (copy)
		var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "On Player Moderated",
			status = constants.VOICE_STATUS.ERROR_VOICE_MODERATED
		})
	end)
	default_1:subscribe("OnInitialJoinFailed", function()
		-- upvalues: constants (copy), var13 (copy), crossExperienceModule (copy)
		var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "Initial Join failed",
			status = constants.VOICE_STATUS.ERROR_VOICE_JOIN
		})
	end)
	default_1:subscribe("OnRetryRequested", function()
		-- upvalues: logPartyVoiceReconnect (copy), constants (copy), var13 (copy), crossExperienceModule (copy)
		if logPartyVoiceReconnect then
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Retry requested",
				status = constants.VOICE_STATUS.VOICE_RECONNECTING
			})
			
			return
		end
		var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "Retry requested",
			status = constants.VOICE_STATUS.VOICE_CONNECTING
		})
	end)
	default_1:subscribe("OnStateChanged", function(_, p50)
		-- upvalues: default_1 (copy), getPlayerUsersIds (copy), var13 (copy), crossExperienceModule (copy), var11 (copy), constants (copy), rbxAnalyticsService (copy), playersService (copy), getMemStorageKey (copy), CEV_JOIN_ATTEMPT_ID_KEY (copy), t (copy)
		if p50 == Enum.VoiceChatState.Joined then
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				userId = var11,
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
		elseif p50 == Enum.VoiceChatState.Failed then
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = nil,
				status = constants.VOICE_STATUS.ERROR_VOICE_FAILED
			})
			
			return
		elseif p50 == Enum.VoiceChatState.Ended then
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = nil,
				status = constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED
			})
		end
	end)
	default_1:subscribe("OnReportJoinFailed", function(p51)
		-- upvalues: name (copy), constants (copy), var13 (copy), crossExperienceModule (copy)
		name:error("CEV OnReportJoinFailed " .. p51)
		var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			status = constants.VOICE_STATUS.ERROR_VOICE_JOIN,
			detail = p51
		})
	end)
end

function initializeAFM()
	-- upvalues: audioFocusManagementEngineFeature (ref), crossExperienceModule (ref), fIntPartyVoiceUndeafenDelayMS (ref), var38 (write), partyVoiceFixCaptureVideoCheck (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), var21 (ref), var60 (ref), default_1 (ref), enableCEVPersistMuteStateForAFM (ref), t (write), name (ref), partyVoiceExecuteVoiceActionsPostAsyncInit (ref), var41 (ref), promiseModule (ref)
	if audioFocusManagementEngineFeature then
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			local CONTEXT_ID = crossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
			local FOCUS_PRIORITY = crossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY
			status:RegisterContextIdFromLua(CONTEXT_ID)
			
			local var90 = function()
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var38 (copy), partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var21 (copy), var60 (copy), default_1 (copy), enableCEVPersistMuteStateForAFM (copy), t (copy)
				if fIntPartyVoiceUndeafenDelayMS > 0 and var38 then
					task.cancel(var38)
					var38 = nil
				end
				if partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var21 or not var21:IsCapturingVideo())) or not var60 then
					default_1:MuteAll(true, "AudioFocusManagement - CEV deafenAll")
				end
				if not default_1.localMuted and (not enableCEVPersistMuteStateForAFM or t.previousMutedState == default_1.localMuted) then
					default_1:ToggleMic("AudioFocusManagement - CEV deafenAll")
				end
			end
			
			local var91 = function()
				-- upvalues: fIntPartyVoiceUndeafenDelayMS (copy), var38 (copy), partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var21 (copy), var60 (copy), default_1 (copy), name (copy), partyVoiceExecuteVoiceActionsPostAsyncInit (copy), var41 (copy), enableCEVPersistMuteStateForAFM (copy), t (copy)
				if fIntPartyVoiceUndeafenDelayMS > 0 and var38 then
					task.cancel(var38)
					var38 = nil
				end
				if partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var21 or not var21:IsCapturingVideo())) or not var60 then
					default_1:MuteAll(false, "AudioFocusManagement - CEV Mute All")
				end
				if default_1.localMuted == nil then
					name:info("CEV undeafenAll - Voice not connected yet - calling unmuteMicrophoneOnce")
					default_1.muteChanged.Event:Once(function(p52)
						-- upvalues: partyVoiceExecuteVoiceActionsPostAsyncInit (copy), var41 (copy), default_1 (copy)
						if p52 ~= nil then
							if partyVoiceExecuteVoiceActionsPostAsyncInit then
								var41(function()
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
			
			status.OnDeafenVoiceAudio:Connect(function(p53)
				-- upvalues: CONTEXT_ID (ref), fIntPartyVoiceUndeafenDelayMS (copy), var38 (copy), name (copy), var90 (ref)
				if p53 == CONTEXT_ID then
					if fIntPartyVoiceUndeafenDelayMS > 0 and var38 then
						task.cancel(var38)
						var38 = nil
					end
					name:info("CEV OnDeafenVoiceAudio fired" .. p53)
					var90()
				end
			end)
			status.OnUndeafenVoiceAudio:Connect(function(p54)
				-- upvalues: CONTEXT_ID (ref), name (copy), fIntPartyVoiceUndeafenDelayMS (copy), var38 (copy), var91 (ref)
				if p54 == CONTEXT_ID then
					name:info("CEV OnUndeafenVoiceAudio fired for context: {} - expected: {}", p54, CONTEXT_ID)
					
					if fIntPartyVoiceUndeafenDelayMS > 0 then
						if var38 then
							task.cancel(var38)
						end
						var38 = task.delay(fIntPartyVoiceUndeafenDelayMS / 1000, function()
							-- upvalues: var38 (copy), name (copy), p54 (ref), var91 (copy)
							var38 = nil
							name:info("CEV OnUndeafenVoiceAudio fired delayed" .. p54)
							var91()
						end)
						
						return
					else
						name:info("CEV OnUndeafenVoiceAudio fired" .. p54)
						var91()
					end
				end
			end)
			
			local _ = function(p55, p56)
				-- upvalues: name (copy), promiseModule (copy), status (ref)
				name:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", p55, p56)
				
				return promiseModule.new(function(p57, p58)
					-- upvalues: status (copy), p55 (ref), p56 (ref), name (copy)
					local ok, status_1 = pcall(status.RequestFocus, status, p55, p56)
					
					if ok then
						name:info("CEV requestAudioFocusWithPromise - focusGranted: {}", status_1)
						p57(status_1)
						
						return
					end
					name:info("CEV requestAudioFocusWithPromise - rejected")
					p58("Failed to call RequestFocus due to an error")
				end)
			end
			
			name:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", CONTEXT_ID, FOCUS_PRIORITY)
			promiseModule.new(function(p62, p63)
				-- upvalues: status (ref), CONTEXT_ID (ref), FOCUS_PRIORITY (ref), name (copy)
				local ok, status_1 = pcall(status.RequestFocus, status, CONTEXT_ID, FOCUS_PRIORITY)
				
				if ok then
					name:info("CEV requestAudioFocusWithPromise - focusGranted: {}", status_1)
					p62(status_1)
					
					return
				end
				name:info("CEV requestAudioFocusWithPromise - rejected")
				p63("Failed to call RequestFocus due to an error")
			end):andThen(function(p59)
				-- upvalues: name (copy), default_1 (copy), partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var21 (copy), var60 (copy)
				if p59 then
					name:info("CEV audio focus request granted, preparing to undeafen.")
					default_1.muteChanged.Event:Once(function(p60)
						-- upvalues: partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var21 (copy), var60 (copy), default_1 (copy)
						if p60 ~= nil and partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var21 or not var21:IsCapturingVideo())) or not var60 then
							default_1:MuteAll(false, "AudioFocusManagement CEV")
						end
					end)
					
					return
				end
				name:info("CEV audio focus request denied, preparing to deafen.")
				default_1.muteChanged.Event:Once(function(p61)
					-- upvalues: partyVoiceFixCaptureVideoCheck (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), var21 (copy), var60 (copy), default_1 (copy)
					if p61 ~= nil and partyVoiceFixCaptureVideoCheck and (not getFFlagEnableCrossExperienceVoiceCaptureMute() or (not var21 or not var21:IsCapturingVideo())) or not var60 then
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
	-- upvalues: constants (ref), var13 (ref), crossExperienceModule (ref), default_1 (ref), initializeDefaultChannel (ref), name (ref)
	var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
		detail = nil,
		status = constants.VOICE_STATUS.VOICE_CONNECTING
	})
	default_1:asyncInit():andThen(function()
		-- upvalues: initializeDefaultChannel (copy), constants (copy), var13 (copy), crossExperienceModule (copy)
		if initializeDefaultChannel(false) == false then
			var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Initial Join failed",
				status = constants.VOICE_STATUS.ERROR_VOICE_JOIN
			})
		else
			onCoreVoiceManagerInitialized()
		end
		initializeAFM()
	end):catch(function(_)
		-- upvalues: name (copy), constants (copy), var13 (copy), crossExperienceModule (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 749
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end)
end

function rejoinVoice()
	-- upvalues: constants (ref), var13 (ref), crossExperienceModule (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), default_1 (ref), t (write)
	var13:notify(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
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
	-- upvalues: validateSetup (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (ref), var11 (write), ensureLocalPlayerWithTimeout (ref), name (ref), setupListeners (ref)
	if validateSetup() then
		if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable then
			var11 = ensureLocalPlayerWithTimeout()
			name:info("Delayed loading of LocalPlayer loaded with UserId: {}", var11)
		end
		setupListeners()
		initializeVoice()
	end
end

var13:addObserver(crossExperienceModule.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function()
	-- upvalues: var46 (ref), VOICE_STATUS (ref), fFlagFixPartyVoiceGetPermissions (ref)
	local voiceStatus = var46:getState().Squad.CrossExperienceVoice.Experience.voiceStatus
	
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
local var66 = false

local _ = function()
	-- upvalues: var66 (write), foreground_ui_ready (write), var13 (ref), crossExperienceModule (ref), name (ref)
	if var66 then return end
	var66 = true
	
	if foreground_ui_ready then
		var13:removeObserver(foreground_ui_ready, crossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
		foreground_ui_ready = nil
	end
	name:info("Proceeding to start voice connection.")
	startVoice()
end

sendAnalyticsEvent("startingVoiceFromCEVDefaultChannel")

if cevReadinessSyncEngineFeature then
	name:info("Waiting for foreground UI readiness signal (with promise race)...")
	promiseModule.race({
		promiseModule.new(function(p65)
			-- upvalues: bindableEvent (ref)
			bindableEvent.Event:Once(function()
				-- upvalues: p65 (ref)
				p65("signal")
			end)
		end),
		promiseModule.delay(voiceJoinTimeoutInSeconds):andThen(function()
			return "timeout"
		end)
	}):andThen(function(p64)
		-- upvalues: name (ref), sendAnalyticsEvent (ref), voiceJoinTimeoutInSeconds (ref), var66 (write), foreground_ui_ready (write), var13 (ref), crossExperienceModule (ref)
		if p64 == "signal" then
			name:info("Readiness signal received within timeout.")
		else
			name:info("Timed out waiting for readiness signal. Starting voice anyway.")
			sendAnalyticsEvent("partyVoiceInitTimedOut", { timeout = voiceJoinTimeoutInSeconds })
		end
		if var66 then return end
		var66 = true
		
		if foreground_ui_ready then
			var13:removeObserver(foreground_ui_ready, crossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
			foreground_ui_ready = nil
		end
		name:info("Proceeding to start voice connection.")
		startVoice()
	end)
else
	name:info("Foreground UI not using readiness sync. Starting voice connection immediately.")
	startVoice()
end