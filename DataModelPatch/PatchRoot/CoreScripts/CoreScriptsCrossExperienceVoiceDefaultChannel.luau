local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(CorePackages.Packages.Promise)
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CrossExperienceModule = require(CorePackages.Workspace.Packages.CrossExperience)
local FStringTimeoutLoadingLocalPlayerInBackgroundDM = require(CorePackages.Workspace.Packages.SharedFlags).FStringTimeoutLoadingLocalPlayerInBackgroundDM
local GetMemStorageKeyFunction = CrossExperienceModule.Utils.getMemStorageKey
local CEVJOINATTEMPTIDKEY = CrossExperienceModule.Constants.CEV_JOIN_ATTEMPT_ID_KEY
local LOCALPLAYERLOADINGTIMEOUTENUM = CrossExperienceModule.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM
local BackgroundDMLocalPlayerLoadingTimeoutSeconds = game:DefineFastInt("BackgroundDMLocalPlayerLoadingTimeoutSeconds", 12)
local DelayAudioFocusReplication = game:DefineFastFlag("DelayAudioFocusReplication", false)
local PlayerAudioFocusReplicationTimeoutSeconds = game:DefineFastInt("PlayerAudioFocusReplicationTimeoutSeconds", 10)
local UserId = if FStringTimeoutLoadingLocalPlayerInBackgroundDM == LOCALPLAYERLOADINGTIMEOUTENUM.Disable then Players.LocalPlayer and Players.LocalPlayer.UserId or -1 else nil

local function sendAnalyticsEvent(EventName, p1)
	-- upvalues: GetMemStorageKeyFunction (copy), CEVJOINATTEMPTIDKEY (copy), FStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCALPLAYERLOADINGTIMEOUTENUM (copy), UserId (ref), RbxAnalyticsService (copy)
	local P1 = p1 or {}
	P1.cevJoinAttemptId = GetMemStorageKeyFunction(CEVJOINATTEMPTIDKEY)
	P1.clientTimeStamp = os.time()
	P1.userId = if FStringTimeoutLoadingLocalPlayerInBackgroundDM == LOCALPLAYERLOADINGTIMEOUTENUM.Disable then UserId else nil
	RbxAnalyticsService:SendEventDeferred("client", "partyVoice", EventName, P1)
end

if FStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCALPLAYERLOADINGTIMEOUTENUM.Disable then
	sendAnalyticsEvent("partyVoiceCEVChannelFileLoaded")
end
local NewResult = CrossExperienceModule.EventManager.new(CrossExperienceModule.Constants.EXPERIENCE_TYPE_VOICE, true)

local function _(Status, Detail)
	-- upvalues: NewResult (copy), CrossExperienceModule (copy)
	NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, { status = Status, detail = Detail })
end

local function ensureLocalPlayerWithTimeout()
	-- upvalues: Players (copy), PromiseModule (copy), BackgroundDMLocalPlayerLoadingTimeoutSeconds (copy), sendAnalyticsEvent (copy), CrossExperienceModule (copy), NewResult (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if not LocalPlayer then
		PromiseModule.race({
			PromiseModule.new(function(Callback: (any) -> ())
				-- upvalues: Players (upval)
				if Players.LocalPlayer then
					Callback("loaded")
					
					return
				else
					local Connection = nil
					Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
						-- upvalues: Players (upval), Connection (ref), Callback (copy)
						if Players.LocalPlayer then
							Connection:Disconnect()
							Callback("loaded")
						end
					end)
				end
			end),
			(PromiseModule.delay(BackgroundDMLocalPlayerLoadingTimeoutSeconds):andThen(function(): string
				return "timeout"
			end))
		}):andThen(function(Result)
			-- upvalues: LocalPlayer (ref), Players (upval), sendAnalyticsEvent (upval), BackgroundDMLocalPlayerLoadingTimeoutSeconds (upval), CrossExperienceModule (upval), NewResult (upval)
			if Result == "loaded" then
				LocalPlayer = Players.LocalPlayer
				sendAnalyticsEvent("cevDefaultChannelBackgroundDMLocalPlayerLoaded", {
					timeoutSeconds = BackgroundDMLocalPlayerLoadingTimeoutSeconds
				})
				
				return
			else
				sendAnalyticsEvent("backgroundDMLocalPlayerLoadingTimeout", {
					timeoutSeconds = BackgroundDMLocalPlayerLoadingTimeoutSeconds
				})
				NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
					status = CrossExperienceModule.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT,
					detail = "LocalPlayer loading timed out after " .. BackgroundDMLocalPlayerLoadingTimeoutSeconds .. " seconds"
				})
				LocalPlayer = nil
			end
		end):await()
	end
	if not LocalPlayer then
		PromiseModule.new(function() end):await()
	end
	return LocalPlayer.UserId
end

if FStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCALPLAYERLOADINGTIMEOUTENUM.Disable then
	UserId = -1
end
if FStringTimeoutLoadingLocalPlayerInBackgroundDM == LOCALPLAYERLOADINGTIMEOUTENUM.Disable then
	sendAnalyticsEvent("partyVoiceCEVChannelFileLoaded")
end
local RemoteEvent = nil

if not DelayAudioFocusReplication then
	RemoteEvent = ReplicatedStorage:WaitForChild("PlayerAudioFocusChanged")
	sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedLoaded")
end
local VoiceChatCoreModule = require(CorePackages.Workspace.Packages.VoiceChatCore)
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local RoduxModule = require(CorePackages.Packages.Rodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local Default1 = VoiceChatCoreModule.CoreVoiceManager.default
local CreatePersistenceMiddlewareFunction = CrossExperienceModule.Middlewares.createPersistenceMiddleware
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local CaptureService = if SharedFlagsModule.GetFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil
local _ = require(CorePackages.Packages.LuauPolyfill)
local FFlagPartyVoiceBlockSync = SharedFlagsModule.FFlagPartyVoiceBlockSync
local GetFFlagVoiceChatClientRewriteMasterLuaFunction = SharedFlagsModule.GetFFlagVoiceChatClientRewriteMasterLua
local UseNotificationServiceIsConnected = game:DefineFastFlag("UseNotificationServiceIsConnected", false)
local DefaultChannelEnableDefaultVoice = game:DefineFastFlag("DefaultChannelEnableDefaultVoice", true)
local EnableCrossExpVoiceDebug = game:DefineFastFlag("EnableCrossExpVoiceDebug", false)
local GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute
local LogPartyVoiceReconnect = game:DefineFastFlag("LogPartyVoiceReconnect", false)
local PartyVoiceFixCaptureVideoCheck = game:DefineFastFlag("PartyVoiceFixCaptureVideoCheck", false)
local FIntPartyVoiceUndeafenDelayMS = SharedFlagsModule.FIntPartyVoiceUndeafenDelayMS
local PartyVoiceExecuteVoiceActionsPostAsyncInit = game:DefineFastFlag("PartyVoiceExecuteVoiceActionsPostAsyncInit", false)
local VoiceJoinTimeoutInSeconds = game:DefineFastInt("VoiceJoinTimeoutInSeconds", 15)
local VoiceServiceEnableDefaultVoiceAvailableEngineFeature = game:GetEngineFeature("VoiceServiceEnableDefaultVoiceAvailable")
local NotificationServiceIsConnectedAvailableEngineFeature = game:GetEngineFeature("NotificationServiceIsConnectedAvailable")
local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local CevReadinessSyncEngineFeature = game:GetEngineFeature("CevReadinessSync")
local NewResult1 = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local NewResult2 = VoiceChatCoreModule.Analytics.new()
local ObserveCurrentContextIdFunction: (any) -> () = CrossExperienceModule.Utils.observeCurrentContextId
local VoiceChatService = game:GetService("VoiceChatService")
local Constants = CrossExperienceModule.Constants
local VOICESTATUS = Constants.VOICE_STATUS
local FFlagFixPartyVoiceGetPermissions = SharedFlagsModule.GetFFlagFixPartyVoiceGetPermissions()
local FFlagEnablePartyVoiceChangersInLua = SharedFlagsModule.FFlagEnablePartyVoiceChangersInLua
local EnableCEVPersistMuteStateForAFM = game:DefineFastFlag("EnableCEVPersistMuteStateForAFM", false)
local DelayedThread = nil

if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
	Default1:setOptions({
		allowSeamlessVoice = false,
		passInitErrorInPromiseReject = true,
		forceVoiceEnabled = true
	})
end
local PersistenceMiddleware = CreatePersistenceMiddlewareFunction({
	storeKey = CrossExperienceModule.Constants.STORAGE_CEV_STORE_KEY
})
sendAnalyticsEvent("partyVoicePersistenceMiddlewareCreated")
local Default2 = CrossExperienceModule.PartyAudioPlayer.default

local function v54()
	-- upvalues: RoduxModule (copy), CrossExperienceModule (copy)
	return RoduxModule.combineReducers({
		Squad = RoduxModule.combineReducers({
			CrossExperienceVoice = CrossExperienceModule.installReducer()
		})
	})
end

sendAnalyticsEvent("partyVoiceCrossExperienceReducerLoaded")

local function v55(Callback)
	-- upvalues: Default1 (copy), NewResult1 (copy)
	Default1:asyncInit():andThen(function()
		-- upvalues: Callback (copy)
		Callback()
	end):catch(function(Err)
		-- upvalues: NewResult1 (upval)
		NewResult1:info("CoreVoiceManager did not initialize {}", Err)
	end)
end

local config = { previousGroupId = nil, previousMutedState = false }
local BindableEvent = Instance.new("BindableEvent")
local Flag = false
local AddObserverResult = nil

if CevReadinessSyncEngineFeature then
	NewResult1:info("Registering early observer for foreground readiness signal.")
	AddObserverResult = NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY, function()
		-- upvalues: Flag (ref), NewResult1 (copy), BindableEvent (copy)
		if not Flag then
			NewResult1:info("Received foreground UI readiness signal.")
			Flag = true
			BindableEvent:Fire()
		end
	end)
end
local NewResult3 = RoduxModule.Store.new(v54(), nil, {
	RoduxModule.thunkMiddleware,
	PersistenceMiddleware.getMiddleware()
})
sendAnalyticsEvent("partyVoicePersistenceMiddlewareReducerLoaded")
NewResult:subscribe(NewResult3)

if not game:IsLoaded() then
	game.Loaded:Wait()
end
sendAnalyticsEvent("partyVoiceGameLoaded")
NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
	detail = nil,
	status = Constants.VOICE_STATUS.RCC_CONNECTED
})
sendAnalyticsEvent("partyVoiceRCCConnectedSignalFired")
NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, {
	jobId = if game.JobId == "" or game.JobId == nil then HttpService:GenerateGUID(true) else game.JobId,
	placeId = game.PlaceId,
	gameId = game.GameId
})

if DelayAudioFocusReplication then
	local v1 = nil
	local Flag1 = false
	ObserveCurrentContextIdFunction(function(p1)
		-- upvalues: v1 (ref), Flag1 (ref), RemoteEvent (ref)
		v1 = p1
		print("CurrentContextId changed to", p1, "isReplicationReady:", Flag1)
		
		if Flag1 and RemoteEvent then
			RemoteEvent:FireServer(p1)
			print("Fired PlayerAudioFocusChanged with contextId:", p1)
		end
	end)
	print("Waiting for PlayerAudioFocusChanged to replicate...")
	RemoteEvent = ReplicatedStorage:WaitForChild("PlayerAudioFocusChanged", PlayerAudioFocusReplicationTimeoutSeconds)
	
	if RemoteEvent then
		print("PlayerAudioFocusChanged replicated successfully.")
		sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedLoaded")
		RemoteEvent.OnClientEvent:Connect(function(UserId, ContextId, ContextIds)
			-- upvalues: NewResult (copy), CrossExperienceModule (copy)
			print("Received PlayerAudioFocusChanged OnClientEvent:", UserId, ContextId)
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
				userId = UserId,
				contextId = ContextId,
				contextIds = ContextIds
			})
		end)
		Flag1 = true
		
		if v1 then
			RemoteEvent:FireServer(v1)
			print("Fired PlayerAudioFocusChanged with latestContextId:", v1)
		end
	else
		print("PlayerAudioFocusChanged did not replicate within timeout of ", PlayerAudioFocusReplicationTimeoutSeconds, " seconds.")
		sendAnalyticsEvent("partyVoicePlayerAudioFocusChangedReplicationTimeout", {
			timeoutSeconds = PlayerAudioFocusReplicationTimeoutSeconds
		})
	end
else
	ObserveCurrentContextIdFunction(function(p1)
		-- upvalues: RemoteEvent (ref)
		RemoteEvent:FireServer(p1)
	end)
	RemoteEvent.OnClientEvent:Connect(function(UserId, ContextId, ContextIds)
		-- upvalues: NewResult (copy), CrossExperienceModule (copy)
		NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, {
			userId = UserId,
			contextId = ContextId,
			contextIds = ContextIds
		})
	end)
end
local function v64(Player: Player)
	-- upvalues: NewResult (copy), CrossExperienceModule (copy), UserId (ref), FFlagEnablePartyVoiceChangersInLua (copy)
	NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, {
		userId = Player.UserId,
		isLocalUser = Player.UserId == UserId,
		username = Player.Name,
		displayname = Player.DisplayName,
		isVoiceChangerActive = not FFlagEnablePartyVoiceChangersInLua and nil,
		isVoiceChangerHearMyselfActive = not FFlagEnablePartyVoiceChangersInLua and nil,
		selectedVoicePack = if FFlagEnablePartyVoiceChangersInLua then "None" else nil
	})
end

local function Callback(Player: Player)
	-- upvalues: NewResult (copy), CrossExperienceModule (copy), UserId (ref), Default2 (copy)
	NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, {
		userId = Player.UserId,
		isLocalUser = Player.UserId == UserId
	})
	Default2:playSound("leave")
end

local function Callback1(ActivityInfo)
	-- upvalues: CrossExperienceModule (copy), NewResult (copy), UserId (ref)
	NewResult:notify(if ActivityInfo.isActive then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, { isLocalUser = true, userId = UserId })
end

local function Callback2(PreviousMutedState)
	-- upvalues: EnableCEVPersistMuteStateForAFM (copy), config (ref), CrossExperienceModule (copy), PartyVoiceExecuteVoiceActionsPostAsyncInit (copy), v55 (copy), NewResult (copy), UserId (ref)
	if not EnableCEVPersistMuteStateForAFM then
		config.previousMutedState = PreviousMutedState
	end
	local PARTYVOICEPARTICIPANTWASMUTED = if PreviousMutedState then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED
	
	if PartyVoiceExecuteVoiceActionsPostAsyncInit then
		v55(function()
			-- upvalues: NewResult (upval), PARTYVOICEPARTICIPANTWASMUTED (copy), UserId (upval)
			NewResult:notify(PARTYVOICEPARTICIPANTWASMUTED, { isLocalUser = true, userId = UserId })
		end)
		
		return
	else
		NewResult:notify(PARTYVOICEPARTICIPANTWASMUTED, { isLocalUser = true, userId = UserId })
	end
end

local function onLocalVoiceChangerChanged(p1)
	-- upvalues: CrossExperienceModule (copy), NewResult (copy), UserId (ref)
	NewResult:notify(if p1 then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, { isLocalUser = true, userId = UserId })
end

local function onLocalVoiceChangerHearMyselfChanged(p1)
	-- upvalues: CrossExperienceModule (copy), NewResult (copy), UserId (ref)
	NewResult:notify(if p1 then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, { isLocalUser = true, userId = UserId })
end

local function Callback3(List)
	-- upvalues: FFlagEnablePartyVoiceChangersInLua (copy), CrossExperienceModule (copy), UserId (ref), NewResult (copy)
	for UserId1, value in pairs(List) do
		local IsSignalActive = value.isSignalActive
		local IsMuted = value.isMuted
		local IsVoiceChangerActive = if FFlagEnablePartyVoiceChangersInLua then value.isVoiceChangerActive else nil
		local PARTYVOICEPARTICIPANTISACTIVE = if IsSignalActive then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE
		local PARTYVOICECHANGERWASENABLED = if FFlagEnablePartyVoiceChangersInLua then if IsVoiceChangerActive then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED else nil
		local config = { userId = UserId1, isLocalUser = UserId1 == UserId }
		NewResult:notify(if IsMuted then CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED else CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED, config)
		NewResult:notify(PARTYVOICEPARTICIPANTISACTIVE, config)
		
		if FFlagEnablePartyVoiceChangersInLua then
			NewResult:notify(PARTYVOICECHANGERWASENABLED, config)
		end
	end
end

local function v71(p1)
	-- upvalues: UserId (ref), PartyVoiceExecuteVoiceActionsPostAsyncInit (copy), v55 (copy), EnableCEVPersistMuteStateForAFM (copy), config (ref), Default1 (copy)
	local Number: number? = tonumber(p1.userId)
	local IsUserIdMatch = UserId == Number
	
	if PartyVoiceExecuteVoiceActionsPostAsyncInit then
		v55(function()
			-- upvalues: IsUserIdMatch (copy), EnableCEVPersistMuteStateForAFM (upval), config (upval), Default1 (upval), Number (copy)
			if not IsUserIdMatch then
				Default1:ToggleMutePlayer(Number)
				
				return
			end
			if EnableCEVPersistMuteStateForAFM then
				config.previousMutedState = not Default1.localMuted
			end
			Default1:ToggleMic("Squads")
		end)
		
		return
	end
	if IsUserIdMatch then
		Default1:ToggleMic("Squads")
		
		return
	else
		Default1:ToggleMutePlayer(Number)
	end
end

local function setVoicePack(p1)
	-- upvalues: Default1 (copy), NewResult (copy), CrossExperienceModule (copy), UserId (ref)
	local VoicePackName = p1.voicePackName
	Default1:SetVoicePack(VoicePackName)
	NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_PACK_WAS_SET, {
		isLocalUser = true,
		userId = UserId,
		voicePackName = VoicePackName
	})
end

local function toggleVoiceChanger(p1)
	-- upvalues: UserId (ref), Default1 (copy)
	local Number: number? = tonumber(p1.userId)
	
	if UserId == Number then
		Default1:ToggleVoiceChanger("Squads")
		
		return
	else
		Default1:ToggleVoiceChanger(Number)
	end
end

local function toggleVoiceChangerHearMyself(p1)
	-- upvalues: UserId (ref), Default1 (copy)
	local Number: number? = tonumber(p1.userId)
	
	if UserId == Number then
		Default1:ToggleVoiceChangerHearMyself("Squads")
		
		return
	else
		Default1:ToggleVoiceChangerHearMyself(Number)
	end
end

function handleParticipants()
	-- upvalues: Players (copy), v64 (copy), Default2 (copy), Callback (copy), UserId (ref)
	Players.PlayerAdded:Connect(function(Player)
		-- upvalues: v64 (upval), Default2 (upval)
		v64(Player)
		Default2:playSound("join")
	end)
	Players.PlayerRemoving:Connect(Callback)
	
	for _, player in pairs(Players:GetPlayers()) do
		if player:IsA("Player") then
			v64(player)
			
			if player.UserId == UserId then
				Default2:playSound("join")
			end
		end
	end
end

function handleMicrophone()
	-- upvalues: Default1 (copy), Callback2 (copy), NewResult (copy), CrossExperienceModule (copy), v71 (copy)
	Default1.muteChanged.Event:Connect(Callback2)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, v71)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, v71)
end

function handleVoiceChanger()
	-- upvalues: Default1 (copy), onLocalVoiceChangerChanged (copy), NewResult (copy), CrossExperienceModule (copy), toggleVoiceChanger (copy), setVoicePack (copy), onLocalVoiceChangerHearMyselfChanged (copy), toggleVoiceChangerHearMyself (copy)
	Default1.voiceChangerChanged.Event:Connect(onLocalVoiceChangerChanged)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, toggleVoiceChanger)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, toggleVoiceChanger)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.SET_PARTY_VOICE_PACK, setVoicePack)
	Default1.voiceChangerHearMyselfChanged.Event:Connect(onLocalVoiceChangerHearMyselfChanged)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, toggleVoiceChangerHearMyself)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, toggleVoiceChangerHearMyself)
end

local function v75(p1)
	-- upvalues: Players (copy), BlockingUtilityModule (copy), NewResult1 (copy)
	local Player = Players:GetPlayerByUserId(tonumber(p1.userId) or 0)
	
	if Player then
		coroutine.wrap(function()
			-- upvalues: BlockingUtilityModule (upval), Player (copy), NewResult1 (upval)
			if BlockingUtilityModule:AddPlayerToBlockList(Player) then
				NewResult1:info("Participant {} was blocked from party voice", Player.DisplayName)
			end
		end)()
	end
end

local function v76(p1)
	-- upvalues: Players (copy), BlockingUtilityModule (copy), NewResult1 (copy)
	local Player = Players:GetPlayerByUserId(tonumber(p1.userId) or 0)
	
	if Player then
		coroutine.wrap(function()
			-- upvalues: BlockingUtilityModule (upval), Player (copy), NewResult1 (upval)
			if BlockingUtilityModule:RemovePlayerFromBlockList(Player) then
				NewResult1:info("Participant {} was unblocked from party voice", Player.DisplayName)
			end
		end)()
	end
end

local function v77()
	-- upvalues: GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), CaptureService (copy)
	return GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() and (CaptureService and CaptureService:IsCapturingVideo())
end

local _ = function(p1, p2): boolean
	-- upvalues: CryoModule (copy)
	return if p1.missingPermissions then not CryoModule.List.find(p1.missingPermissions, p2) else false
end

local _ = function(p1)
	-- upvalues: PromiseModule (copy), Default (copy), CryoModule (copy)
	local config = { hasMicPermissions = false }
	
	return PromiseModule.new(function(Callback, _)
		-- upvalues: Default (upval), p1 (copy), config (copy), CryoModule (upval)
		Default:requestPermissions(p1):andThen(function(Result)
			-- upvalues: config (upval), Default (upval), CryoModule (upval), Callback (copy)
			local MICROPHONEACCESS = Default.Permissions.MICROPHONE_ACCESS
			config.hasMicPermissions = if Result.missingPermissions then not CryoModule.List.find(Result.missingPermissions, MICROPHONEACCESS) else false
			Callback(config)
		end):catch(function()
			-- upvalues: Callback (copy), config (upval)
			Callback(config)
		end)
	end)
end

local _ = function()
	-- upvalues: NewResult (copy), CrossExperienceModule (copy), v75 (copy), v76 (copy)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v75)
	NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v76)
end

function onCoreVoiceManagerInitialized()
	-- upvalues: Default1 (copy), Callback1 (copy), Callback3 (copy)
	Default1:getService().PlayerMicActivitySignalChange:Connect(Callback1)
	Default1.participantsUpdate.Event:Connect(Callback3)
end

local _ = function()
	-- upvalues: Default1 (copy), PartyVoiceExecuteVoiceActionsPostAsyncInit (copy), v55 (copy)
	Default1.muteChanged.Event:Once(function(p1)
		-- upvalues: PartyVoiceExecuteVoiceActionsPostAsyncInit (upval), v55 (upval), Default1 (upval)
		if p1 ~= nil then
			if PartyVoiceExecuteVoiceActionsPostAsyncInit then
				v55(function()
					-- upvalues: Default1 (upval)
					Default1:ToggleMic("BackgroundDM")
				end)
				
				return
			end
			Default1:ToggleMic("BackgroundDM")
		end
	end)
end

local function initializeDefaultChannel(IsMicMuted)
	-- upvalues: Default1 (copy), NewResult1 (copy), NewResult2 (copy)
	local Service = Default1:getService()
	
	if not Service then
		return nil
	end
	NewResult1:info("Joining default channel")
	local Default = Service:JoinByGroupIdToken("default", IsMicMuted)
	
	if Default then
		NewResult2:reportVoiceChatJoinResult(true, "defaultJoinSuccess")
		
		return Default
	else
		NewResult2:reportVoiceChatJoinResult(false, "defaultJoinFailed", "error")
		
		return Default
	end
end

local function validateSetup(): boolean
	-- upvalues: NotificationServiceIsConnectedAvailableEngineFeature (copy), UseNotificationServiceIsConnected (copy), NotificationService (copy), NewResult1 (copy), VoiceChatService (copy), Players (copy), VoiceServiceEnableDefaultVoiceAvailableEngineFeature (copy), DefaultChannelEnableDefaultVoice (copy), NewResult2 (copy), Constants (copy), NewResult (copy), CrossExperienceModule (copy)
	if NotificationServiceIsConnectedAvailableEngineFeature and UseNotificationServiceIsConnected then
		if not NotificationService.IsConnected then
			NewResult1:debug("NotificationService is not yet connected")
			NotificationService:GetPropertyChangedSignal("IsConnected"):Wait()
		end
		NewResult1:debug("NotificationService connected")
	end
	if not VoiceChatService.UseNewAudioApi then
		if Players.LocalPlayer.Character then
			NewResult1:debug("Player character already loaded")
		else
			Players.LocalPlayer.CharacterAdded:Wait()
			NewResult1:debug("Player character loaded")
		end
	end
	if VoiceServiceEnableDefaultVoiceAvailableEngineFeature and DefaultChannelEnableDefaultVoice then
		local VoiceChatService1 = game:FindService("VoiceChatService")
		
		if not VoiceChatService1 then
			NewResult1:info("VoiceChatService not found. Assuming default values.")
		elseif not VoiceChatService1.EnableDefaultVoice and not VoiceChatService1.UseNewAudioApi then
			NewResult1:debug("Default channel is disabled.")
			NewResult2:reportVoiceChatJoinResult(false, "defaultDisabled")
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Default channel disabled",
				status = Constants.VOICE_STATUS.ERROR_VOICE_SETUP
			})
			
			return false
		end
	end
	return true
end

local function getPlayerUsersIds(): string
	-- upvalues: Players (copy)
	local List = {}
	
	for _, player in ipairs(Players:GetPlayers()) do
		table.insert(List, player.UserId)
	end
	return table.concat(List, ", ")
end

local _ = function(p1)
	-- upvalues: PromiseModule (copy), Default (copy), CryoModule (copy)
	local config = { hasMicPermissions = false }
	
	return PromiseModule.new(function(Callback, _)
		-- upvalues: Default (upval), p1 (copy), config (copy), CryoModule (upval), PromiseModule (upval)
		Default:hasPermissions(p1):andThen(function(Result)
			-- upvalues: config (upval), Default (upval), CryoModule (upval), p1 (upval), PromiseModule (upval), Callback (copy)
			local MICROPHONEACCESS = Default.Permissions.MICROPHONE_ACCESS
			config.hasMicPermissions = if Result.missingPermissions then not CryoModule.List.find(Result.missingPermissions, MICROPHONEACCESS) else false
			
			if config.hasMicPermissions then
				Callback(config)
				
				return
			else
				local config = { hasMicPermissions = false }
				PromiseModule.new(function(Callback, _)
					-- upvalues: Default (upval), p1 (copy), config (copy), CryoModule (upval)
					Default:requestPermissions(p1):andThen(function(Result)
						-- upvalues: config (upval), Default (upval), CryoModule (upval), Callback (copy)
						local MICROPHONEACCESS = Default.Permissions.MICROPHONE_ACCESS
						config.hasMicPermissions = if Result.missingPermissions then not CryoModule.List.find(Result.missingPermissions, MICROPHONEACCESS) else false
						Callback(config)
					end):catch(function()
						-- upvalues: Callback (copy), config (upval)
						Callback(config)
					end)
				end):andThen(Callback)
			end
		end):catch(function()
			-- upvalues: Callback (copy), config (upval)
			Callback(config)
		end)
	end)
end

local Flag2 = false

local function setupListeners()
	-- upvalues: Flag2 (ref), NewResult1 (copy), Default1 (copy), FFlagFixPartyVoiceGetPermissions (copy), PromiseModule (copy), Default (copy), CryoModule (copy), FFlagEnablePartyVoiceChangersInLua (copy), FFlagPartyVoiceBlockSync (copy), NewResult (copy), CrossExperienceModule (copy), v75 (copy), v76 (copy), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), v55 (copy), EnableCrossExpVoiceDebug (copy), HttpService (copy), NewResult3 (copy), Constants (copy), LogPartyVoiceReconnect (copy), getPlayerUsersIds (copy), UserId (ref), RbxAnalyticsService (copy), Players (copy), GetMemStorageKeyFunction (copy), CEVJOINATTEMPTIDKEY (copy), config (ref)
	if Flag2 then
		NewResult1:debug("listeners already registered, skipping duplicate setup")
		
		return
	end
	Flag2 = true
	NewResult1:debug("setting up listeners for the first time")
	Default1:subscribe("GetPermissions", function(Callback: (any) -> (), p1)
		-- upvalues: FFlagFixPartyVoiceGetPermissions (upval), PromiseModule (upval), Default (upval), CryoModule (upval)
		if FFlagFixPartyVoiceGetPermissions then
			local config = { hasMicPermissions = false }
			PromiseModule.new(function(Callback, _)
				-- upvalues: Default (upval), p1 (copy), config (copy), CryoModule (upval), PromiseModule (upval)
				Default:hasPermissions(p1):andThen(function(Result)
					-- upvalues: config (upval), Default (upval), CryoModule (upval), p1 (upval), PromiseModule (upval), Callback (copy)
					local MICROPHONEACCESS = Default.Permissions.MICROPHONE_ACCESS
					config.hasMicPermissions = if Result.missingPermissions then not CryoModule.List.find(Result.missingPermissions, MICROPHONEACCESS) else false
					
					if config.hasMicPermissions then
						Callback(config)
						
						return
					else
						local config = { hasMicPermissions = false }
						PromiseModule.new(function(Callback, _)
							-- upvalues: Default (upval), p1 (copy), config (copy), CryoModule (upval)
							Default:requestPermissions(p1):andThen(function(Result)
								-- upvalues: config (upval), Default (upval), CryoModule (upval), Callback (copy)
								local MICROPHONEACCESS = Default.Permissions.MICROPHONE_ACCESS
								config.hasMicPermissions = if Result.missingPermissions then not CryoModule.List.find(Result.missingPermissions, MICROPHONEACCESS) else false
								Callback(config)
							end):catch(function()
								-- upvalues: Callback (copy), config (upval)
								Callback(config)
							end)
						end):andThen(Callback)
					end
				end):catch(function()
					-- upvalues: Callback (copy), config (upval)
					Callback(config)
				end)
			end):andThen(Callback)
			
			return
		else
			Callback({ hasMicPermissions = true })
		end
	end)
	handleParticipants()
	handleMicrophone()
	
	if FFlagEnablePartyVoiceChangersInLua then
		handleVoiceChanger()
	end
	if FFlagPartyVoiceBlockSync then
		NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, v75)
		NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, v76)
	end
	if GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() then
		NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, function(p1)
			-- upvalues: v55 (upval), Default1 (upval)
			v55(function()
				-- upvalues: Default1 (upval), p1 (copy)
				Default1:MuteAll(true, p1.context)
			end)
		end)
		NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, function(p1)
			-- upvalues: v55 (upval), Default1 (upval)
			v55(function()
				-- upvalues: Default1 (upval), p1 (copy)
				Default1:MuteAll(false, p1.context)
			end)
		end)
	end
	if EnableCrossExpVoiceDebug then
		NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.DEBUG_COMMAND, function(p1)
			-- upvalues: HttpService (upval), NewResult3 (upval), Default1 (upval)
			if p1.name == "dump_session" then
				print("----------- CEV BACKGROUND -----------")
				print("Store State", HttpService:JSONEncode(NewResult3:getState()))
				print("--------------------------------------")
				print("CoreVoiceManager State:")
				print("Participants", HttpService:JSONEncode(Default1.participants))
				print("Local Muted", HttpService:JSONEncode({ value = Default1.localMuted }))
				print("Mute All", HttpService:JSONEncode({ value = Default1.muteAll }))
				print("Muted Anyone", HttpService:JSONEncode({ value = Default1._mutedAnyone }))
				print("Is Talking", HttpService:JSONEncode({ value = Default1.isTalking }))
				print("Muted Players", HttpService:JSONEncode(Default1.mutedPlayers))
				
				for audioDevice in Default1.audioDevices do
					if audioDevice.Player then
						print("Audio Device ", audioDevice.Player.UserId, " Active:", audioDevice.Active, " MutedByLocalPlayer:", audioDevice.MutedByLocalUser)
					end
				end
				print("Voice Enabled", HttpService:JSONEncode({ value = Default1.voiceEnabled }))
				print("Permissions Result", HttpService:JSONEncode(Default1.communicationPermissionsResult))
				print("Voice Join Progress", HttpService:JSONEncode({ value = Default1.VoiceJoinProgress }))
				print("-----------------------------")
			end
		end)
	end
	Default1:subscribe("OnRequestMicPermissionRejected", function()
		-- upvalues: Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = nil,
			status = Constants.VOICE_STATUS.ERROR_VOICE_MIC_REJECTED
		})
	end)
	Default1:subscribe("OnPlayerModerated", function()
		-- upvalues: Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "On Player Moderated",
			status = Constants.VOICE_STATUS.ERROR_VOICE_MODERATED
		})
	end)
	Default1:subscribe("OnInitialJoinFailed", function()
		-- upvalues: Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			detail = "Initial Join failed",
			status = Constants.VOICE_STATUS.ERROR_VOICE_JOIN
		})
	end)
	Default1:subscribe("OnRetryRequested", function()
		-- upvalues: LogPartyVoiceReconnect (upval), Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		if LogPartyVoiceReconnect then
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Retry requested",
				status = Constants.VOICE_STATUS.VOICE_RECONNECTING
			})
			
			return
		else
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Retry requested",
				status = Constants.VOICE_STATUS.VOICE_CONNECTING
			})
		end
	end)
	Default1:subscribe("OnStateChanged", function(_, VoiceChatState)
		-- upvalues: Default1 (upval), getPlayerUsersIds (upval), NewResult (upval), CrossExperienceModule (upval), UserId (upval), Constants (upval), RbxAnalyticsService (upval), Players (upval), GetMemStorageKeyFunction (upval), CEVJOINATTEMPTIDKEY (upval), config (upval)
		if VoiceChatState == Enum.VoiceChatState.Joined then
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				userId = UserId,
				status = Constants.VOICE_STATUS.VOICE_CONNECTED,
				voiceChannelId = Default1:GetChannelId(),
				voiceSessionId = Default1:GetSessionId(),
				voicePlaySessionId = RbxAnalyticsService:GetPlaySessionId(),
				participants = getPlayerUsersIds(),
				numberActive = #Players:GetPlayers(),
				cevJoinAttemptId = GetMemStorageKeyFunction(CEVJOINATTEMPTIDKEY)
			})
			config.previousGroupId = Default1.service:GetGroupId()
			
			return
		end
		if VoiceChatState == Enum.VoiceChatState.Failed then
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = nil,
				status = Constants.VOICE_STATUS.ERROR_VOICE_FAILED
			})
			
			return
		end
		if VoiceChatState == Enum.VoiceChatState.Ended then
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = nil,
				status = Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED
			})
		end
	end)
	Default1:subscribe("OnReportJoinFailed", function(Detail)
		-- upvalues: NewResult1 (upval), Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		NewResult1:error("CEV OnReportJoinFailed " .. Detail)
		NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			status = Constants.VOICE_STATUS.ERROR_VOICE_JOIN,
			detail = Detail
		})
	end)
end

function initializeAFM()
	-- upvalues: AudioFocusManagementEngineFeature (copy), CrossExperienceModule (copy), FIntPartyVoiceUndeafenDelayMS (copy), DelayedThread (ref), PartyVoiceFixCaptureVideoCheck (copy), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), CaptureService (copy), v77 (copy), Default1 (copy), EnableCEVPersistMuteStateForAFM (copy), config (ref), NewResult1 (copy), PartyVoiceExecuteVoiceActionsPostAsyncInit (copy), v55 (copy), PromiseModule (copy)
	if AudioFocusManagementEngineFeature then
		local Success, Result = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			local CONTEXTID = CrossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
			local FOCUSPRIORITY = CrossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT.CEV.FOCUS_PRIORITY
			Result:RegisterContextIdFromLua(CONTEXTID)
			
			local function v121()
				-- upvalues: FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), PartyVoiceFixCaptureVideoCheck (upval), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (upval), CaptureService (upval), v77 (upval), Default1 (upval), EnableCEVPersistMuteStateForAFM (upval), config (upval)
				if FIntPartyVoiceUndeafenDelayMS > 0 and DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				if PartyVoiceFixCaptureVideoCheck and (not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() or (not CaptureService or not CaptureService:IsCapturingVideo())) or not v77 then
					Default1:MuteAll(true, "AudioFocusManagement - CEV deafenAll")
				end
				if not Default1.localMuted and (not EnableCEVPersistMuteStateForAFM or config.previousMutedState == Default1.localMuted) then
					Default1:ToggleMic("AudioFocusManagement - CEV deafenAll")
				end
			end
			
			local function v122()
				-- upvalues: FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), PartyVoiceFixCaptureVideoCheck (upval), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (upval), CaptureService (upval), v77 (upval), Default1 (upval), NewResult1 (upval), PartyVoiceExecuteVoiceActionsPostAsyncInit (upval), v55 (upval), EnableCEVPersistMuteStateForAFM (upval), config (upval)
				if FIntPartyVoiceUndeafenDelayMS > 0 and DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				if PartyVoiceFixCaptureVideoCheck and (not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() or (not CaptureService or not CaptureService:IsCapturingVideo())) or not v77 then
					Default1:MuteAll(false, "AudioFocusManagement - CEV Mute All")
				end
				if Default1.localMuted == nil then
					NewResult1:info("CEV undeafenAll - Voice not connected yet - calling unmuteMicrophoneOnce")
					Default1.muteChanged.Event:Once(function(p1)
						-- upvalues: PartyVoiceExecuteVoiceActionsPostAsyncInit (upval), v55 (upval), Default1 (upval)
						if p1 ~= nil then
							if PartyVoiceExecuteVoiceActionsPostAsyncInit then
								v55(function()
									-- upvalues: Default1 (upval)
									Default1:ToggleMic("BackgroundDM")
								end)
								
								return
							end
							Default1:ToggleMic("BackgroundDM")
						end
					end)
					
					return
				end
				if Default1.localMuted and (not EnableCEVPersistMuteStateForAFM or config.previousMutedState ~= Default1.localMuted) then
					NewResult1:info("CEV undeafenAll - Voice connected and muted - unmuting immediately")
					Default1:ToggleMic("AudioFocusManagement - CEV undeafenAll")
				end
			end
			
			Result.OnDeafenVoiceAudio:Connect(function(ContextId)
				-- upvalues: CONTEXTID (copy), FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), NewResult1 (upval), v121 (copy)
				if ContextId == CONTEXTID then
					if FIntPartyVoiceUndeafenDelayMS > 0 and DelayedThread then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
					NewResult1:info("CEV OnDeafenVoiceAudio fired" .. ContextId)
					v121()
				end
			end)
			Result.OnUndeafenVoiceAudio:Connect(function(ContextId)
				-- upvalues: CONTEXTID (copy), NewResult1 (upval), FIntPartyVoiceUndeafenDelayMS (upval), DelayedThread (upval), v122 (copy)
				if ContextId == CONTEXTID then
					NewResult1:info("CEV OnUndeafenVoiceAudio fired for context: {} - expected: {}", ContextId, CONTEXTID)
					
					if FIntPartyVoiceUndeafenDelayMS > 0 then
						if DelayedThread then
							task.cancel(DelayedThread)
						end
						DelayedThread = task.delay(FIntPartyVoiceUndeafenDelayMS / 1000, function()
							-- upvalues: DelayedThread (upval), NewResult1 (upval), ContextId (copy), v122 (upval)
							DelayedThread = nil
							NewResult1:info("CEV OnUndeafenVoiceAudio fired delayed" .. ContextId)
							v122()
						end)
						
						return
					else
						NewResult1:info("CEV OnUndeafenVoiceAudio fired" .. ContextId)
						v122()
					end
				end
			end)
			
			local function _(p1, p2)
				-- upvalues: NewResult1 (upval), PromiseModule (upval), Result (copy)
				NewResult1:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", p1, p2)
				
				return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
					-- upvalues: Result (upval), p1 (copy), p2 (copy), NewResult1 (upval)
					local Success, Result1 = pcall(Result.RequestFocus, Result, p1, p2)
					
					if Success then
						NewResult1:info("CEV requestAudioFocusWithPromise - focusGranted: {}", Result1)
						Callback(Result1)
						
						return
					else
						NewResult1:info("CEV requestAudioFocusWithPromise - rejected")
						Callback1("Failed to call RequestFocus due to an error")
					end
				end)
			end
			
			NewResult1:info("CEV requestAudioFocusWithPromise - id: {} - priority: {}", CONTEXTID, FOCUSPRIORITY)
			PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: Result (copy), CONTEXTID (copy), FOCUSPRIORITY (copy), NewResult1 (upval)
				local Success, Result1 = pcall(Result.RequestFocus, Result, CONTEXTID, FOCUSPRIORITY)
				
				if Success then
					NewResult1:info("CEV requestAudioFocusWithPromise - focusGranted: {}", Result1)
					Callback(Result1)
					
					return
				else
					NewResult1:info("CEV requestAudioFocusWithPromise - rejected")
					Callback1("Failed to call RequestFocus due to an error")
				end
			end):andThen(function(Result)
				-- upvalues: NewResult1 (upval), Default1 (upval), PartyVoiceFixCaptureVideoCheck (upval), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (upval), CaptureService (upval), v77 (upval)
				if Result then
					NewResult1:info("CEV audio focus request granted, preparing to undeafen.")
					Default1.muteChanged.Event:Once(function(p1)
						-- upvalues: PartyVoiceFixCaptureVideoCheck (upval), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (upval), CaptureService (upval), v77 (upval), Default1 (upval)
						if p1 ~= nil and PartyVoiceFixCaptureVideoCheck and (not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() or (not CaptureService or not CaptureService:IsCapturingVideo())) or not v77 then
							Default1:MuteAll(false, "AudioFocusManagement CEV")
						end
					end)
					
					return
				else
					NewResult1:info("CEV audio focus request denied, preparing to deafen.")
					Default1.muteChanged.Event:Once(function(p1)
						-- upvalues: PartyVoiceFixCaptureVideoCheck (upval), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (upval), CaptureService (upval), v77 (upval), Default1 (upval)
						if p1 ~= nil and PartyVoiceFixCaptureVideoCheck and (not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() or (not CaptureService or not CaptureService:IsCapturingVideo())) or not v77 then
							Default1:MuteAll(true, "AudioFocusManagement CEV")
						end
					end)
				end
			end):catch(function()
				-- upvalues: NewResult1 (upval)
				NewResult1:info("[CEV] Error requesting focus inside CEV")
			end)
			
			return
		else
			NewResult1:info("AudioFocusService did not initialize")
		end
	end
end

function initializeVoice()
	-- upvalues: Constants (copy), NewResult (copy), CrossExperienceModule (copy), Default1 (copy), initializeDefaultChannel (copy), NewResult1 (copy)
	NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
		detail = nil,
		status = Constants.VOICE_STATUS.VOICE_CONNECTING
	})
	Default1:asyncInit():andThen(function()
		-- upvalues: initializeDefaultChannel (upval), Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		if initializeDefaultChannel(false) == false then
			NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
				detail = "Initial Join failed",
				status = Constants.VOICE_STATUS.ERROR_VOICE_JOIN
			})
		else
			onCoreVoiceManagerInitialized()
		end
		initializeAFM()
	end):catch(function(Err)
		-- upvalues: NewResult1 (upval), Constants (upval), NewResult (upval), CrossExperienceModule (upval)
		NewResult1:info("CoreVoiceManager did not initialize {}", Err)
		NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
			status = Constants.VOICE_STATUS.ERROR_VOICE_INIT,
			detail = if Err then Err.code or Err else "INIT_ERROR_UNKNOWN"
		})
	end)
end

function rejoinVoice()
	-- upvalues: Constants (copy), NewResult (copy), CrossExperienceModule (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), Default1 (copy), config (ref)
	NewResult:notify(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, {
		detail = nil,
		status = Constants.VOICE_STATUS.VOICE_CONNECTING
	})
	
	if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
		Default1:RejoinVoice()
	else
		Default1:RejoinChannel(config.previousGroupId, config.previousMutedState)
	end
	config = { previousGroupId = nil, previousMutedState = nil }
end

function startVoice()
	-- upvalues: validateSetup (copy), FStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCALPLAYERLOADINGTIMEOUTENUM (copy), UserId (ref), ensureLocalPlayerWithTimeout (copy), NewResult1 (copy), setupListeners (copy)
	if validateSetup() then
		if FStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCALPLAYERLOADINGTIMEOUTENUM.Disable then
			UserId = ensureLocalPlayerWithTimeout()
			NewResult1:info("Delayed loading of LocalPlayer loaded with UserId: {}", UserId)
		end
		setupListeners()
		initializeVoice()
	end
end

NewResult:addObserver(CrossExperienceModule.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, function()
	-- upvalues: NewResult3 (copy), VOICESTATUS (copy), FFlagFixPartyVoiceGetPermissions (copy)
	local VoiceStatus = NewResult3:getState().Squad.CrossExperienceVoice.Experience.voiceStatus
	
	if VoiceStatus == VOICESTATUS.ERROR_VOICE_SETUP then
		startVoice()
		
		return
	end
	if VoiceStatus == VOICESTATUS.ERROR_VOICE_INIT or FFlagFixPartyVoiceGetPermissions and VoiceStatus == VOICESTATUS.ERROR_VOICE_MIC_REJECTED then
		initializeVoice()
		
		return
	end
	if VoiceStatus == VOICESTATUS.ERROR_VOICE_JOIN or not FFlagFixPartyVoiceGetPermissions and VoiceStatus == VOICESTATUS.ERROR_VOICE_MIC_REJECTED or VoiceStatus == VOICESTATUS.ERROR_VOICE_MODERATED or VoiceStatus == VOICESTATUS.ERROR_VOICE_FAILED or VoiceStatus == VOICESTATUS.ERROR_VOICE_DISCONNECTED then
		rejoinVoice()
	end
end)
local Flag3 = false

local _ = function()
	-- upvalues: Flag3 (ref), AddObserverResult (ref), NewResult (copy), CrossExperienceModule (copy), NewResult1 (copy)
	if Flag3 then return end
	Flag3 = true
	
	if AddObserverResult then
		NewResult:removeObserver(AddObserverResult, CrossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
		AddObserverResult = nil
	end
	NewResult1:info("Proceeding to start voice connection.")
	startVoice()
end

sendAnalyticsEvent("startingVoiceFromCEVDefaultChannel")

if CevReadinessSyncEngineFeature then
	if Flag then
		NewResult1:info("Foreground was ready before setup finished. Starting voice now.")
		
		if not Flag3 then
			Flag3 = true
			
			if AddObserverResult then
				NewResult:removeObserver(AddObserverResult, CrossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
				AddObserverResult = nil
			end
			NewResult1:info("Proceeding to start voice connection.")
			startVoice()
		end
	else
		NewResult1:info("Waiting for foreground UI readiness signal (with promise race)...")
		PromiseModule.race({
			PromiseModule.new(function(Callback)
				-- upvalues: BindableEvent (copy)
				BindableEvent.Event:Once(function()
					-- upvalues: Callback (copy)
					Callback("signal")
				end)
			end),
			(PromiseModule.delay(VoiceJoinTimeoutInSeconds):andThen(function(): string
				return "timeout"
			end))
		}):andThen(function(Result)
			-- upvalues: NewResult1 (copy), sendAnalyticsEvent (copy), VoiceJoinTimeoutInSeconds (copy), Flag3 (ref), AddObserverResult (ref), NewResult (copy), CrossExperienceModule (copy)
			if Result == "signal" then
				NewResult1:info("Readiness signal received within timeout.")
			else
				NewResult1:info("Timed out waiting for readiness signal. Starting voice anyway.")
				sendAnalyticsEvent("partyVoiceInitTimedOut", { timeout = VoiceJoinTimeoutInSeconds })
			end
			if Flag3 then return end
			Flag3 = true
			
			if AddObserverResult then
				NewResult:removeObserver(AddObserverResult, CrossExperienceModule.Constants.EVENTS.FOREGROUND_UI_READY)
				AddObserverResult = nil
			end
			NewResult1:info("Proceeding to start voice connection.")
			startVoice()
		end)
	end
else
	NewResult1:info("Foreground UI not using readiness sync. Starting voice connection immediately.")
	startVoice()
end