local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local ExperienceService = game:GetService("ExperienceService")
local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local NotificationService = game:GetService("NotificationService")
local Players = game:GetService("Players")
local DependenciesModule = require(CrossExperienceVoice.dependencies)
local Promise = DependenciesModule.Promise
local CrossExperience = DependenciesModule.CrossExperience
local Communication = CrossExperience.Communication
local SharedFlags = DependenciesModule.SharedFlags
local LuauPolyfill = DependenciesModule.LuauPolyfill
local CrossExperienceVoiceAnalyticsModule = require(CrossExperienceVoice.CrossExperienceVoiceAnalytics)
local LoggerModule = require(CrossExperienceVoice.Logger)
local FlagsModule = require(CrossExperienceVoice.Flags)
local CrossExperienceVoiceManager = {}
CrossExperienceVoiceManager.__index = CrossExperienceVoiceManager
local GetFFlagJoinCrossExpVoiceWithPartyIdFunction = SharedFlags.getFFlagJoinCrossExpVoiceWithPartyId
local GetFFlagEnableCrossExpVoiceMemoryCheckFunction = SharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction = SharedFlags.GetFFlagEnableCrossExperienceVoiceCaptureMute
local FStringTimeoutLoadingLocalPlayerInBackgroundDM = SharedFlags.FStringTimeoutLoadingLocalPlayerInBackgroundDM
local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local RecordJoinAttemptIdForCEVEngineFeature = game:GetEngineFeature("RecordJoinAttemptIdForCEV")
local FIntPartyVoiceJoinRequestPulseCheckTimeout = SharedFlags.FIntPartyVoiceJoinRequestPulseCheckTimeout
local BACKGROUNDDMSTATUS = CrossExperience.Constants.BACKGROUND_DM_STATUS
local AUDIOFOCUSMANAGEMENT = CrossExperience.Constants.AUDIO_FOCUS_MANAGEMENT
local LOCALPLAYERLOADINGTIMEOUTENUM = CrossExperience.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM
local CEVJOINATTEMPTIDKEY = CrossExperience.Constants.CEV_JOIN_ATTEMPT_ID_KEY
local PersistenceMiddleware = CrossExperience.Middlewares.createPersistenceMiddleware({
	storeKey = CrossExperience.Constants.STORAGE_CEV_STORE_KEY
})
local SetTimeoutFunction = LuauPolyfill.setTimeout
local ClearTimeoutFunction = LuauPolyfill.clearTimeout
local FFlagFixCrossExperienceVoiceExecutePrint = SharedFlags.FFlagFixCrossExperienceVoiceExecutePrint
local CrossExpVoicePlaceId = game:DefineFastString("CrossExpVoicePlaceId", (tostring(require(CrossExperienceVoice.Common.Constants).DEFAULT_EXPERIENCE_PLACE_ID)))

local function v26() end

local function _()
	-- upvalues: CrossExperience (copy)
	return if game.PlaceId == 0 then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC
end

function CrossExperienceVoiceManager.new()
	-- upvalues: CrossExperience (copy), CrossExperienceVoiceAnalyticsModule (copy), CrossExperienceVoiceManager (copy)
	local config = {
		joinRequestPulseCheckId = nil,
		isInitialized = false,
		isConnected = false,
		shouldIgnoreMemoryWarning = false,
		hasExperienceStarted = false,
		observersInitialized = false,
		currentCevJoinAttemptId = nil,
		isActiveDM = true,
		connections = {},
		ExperienceJoined = Instance.new("BindableEvent"),
		ExperienceJoinFailed = Instance.new("BindableEvent"),
		ExperienceLeft = Instance.new("BindableEvent"),
		JoinFeasibilityCheckPerformed = Instance.new("BindableEvent"),
		JoinRequestPulseCheck = Instance.new("BindableEvent"),
		JoinRequested = Instance.new("BindableEvent"),
		JoinRequestSubmitted = Instance.new("BindableEvent"),
		MemoryLow = Instance.new("BindableEvent"),
		VoiceEuModalConsented = Instance.new("BindableEvent"),
		VoiceEuModalRefused = Instance.new("BindableEvent"),
		cevEventManager = CrossExperience.EventManager.new(if game.PlaceId == 0 then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC, false),
		voiceAnalytics = CrossExperienceVoiceAnalyticsModule.default
	}
	setmetatable(config, CrossExperienceVoiceManager)
	
	return config
end

function CrossExperienceVoiceManager:logPartyVoiceTimeout()
	self.voiceAnalytics:logPartyVoiceTimeout(self.currentPartyId)
end

function CrossExperienceVoiceManager:initialize()
	-- upvalues: ExperienceService (copy), CrossExperience (copy), LoggerModule (copy), FlagsModule (copy), FStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCALPLAYERLOADINGTIMEOUTENUM (copy), Players (copy), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (copy), NotificationService (copy)
	self.voiceAnalytics:initialize(self.cevEventManager)
	
	if self.isInitialized ~= true then
		table.insert(self.connections, ExperienceService:RegisterForExperienceJoin(function()
			-- upvalues: CrossExperience (upval), self (copy)
			if (if game.PlaceId == 0 then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC) == CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP then
				self.isActiveDM = false
			end
		end))
		table.insert(self.connections, ExperienceService:RegisterForExperienceLeave(function()
			-- upvalues: CrossExperience (upval), self (copy)
			if (if game.PlaceId == 0 then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC) == CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP then
				self.isActiveDM = true
			end
		end))
		table.insert(self.connections, ExperienceService.OnCrossExperienceStarted:Connect(function(_, _)
			-- upvalues: self (copy), LoggerModule (upval), CrossExperience (upval), FlagsModule (upval), FStringTimeoutLoadingLocalPlayerInBackgroundDM (upval), LOCALPLAYERLOADINGTIMEOUTENUM (upval), Players (upval), GetFFlagEnableCrossExpVoiceMemoryCheckFunction (upval)
			self.voiceAnalytics:logPartyVoiceOnCrossExperienceStartedSignalReceived(self.hasExperienceStarted, self.isActiveDM)
			
			if self.hasExperienceStarted then return end
			if self.observersInitialized then
				LoggerModule:info("Observers already initialized, skipping duplicate setup")
				
				return
			end
			self.observersInitialized = true
			LoggerModule:info("Initializing observers for the first time")
			self.cevEventManager:addObserver(CrossExperience.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(p1)
				-- upvalues: self (upval), FlagsModule (upval), CrossExperience (upval), FStringTimeoutLoadingLocalPlayerInBackgroundDM (upval), LOCALPLAYERLOADINGTIMEOUTENUM (upval)
				self.voiceAnalytics:logPartyVoiceStateChangeHandlerRun(self.isActiveDM, p1)
				
				if not self.isActiveDM then return end
				if FlagsModule.FFlagFireErrorRCCTimeoutSignal and p1.status == CrossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
					self.voiceAnalytics:logPartyVoiceTimeout(self.currentPartyId)
				elseif FlagsModule.FFlagPartyVoiceLogActiveDM then
					local EXPERIENCETYPELUAAPP = if self.isActiveDM then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC
					
					if p1.status == CrossExperience.Constants.VOICE_STATUS.VOICE_CONNECTED then
						self.voiceAnalytics:logPartyVoiceConnectedState(p1, self.currentPartyId, EXPERIENCETYPELUAAPP)
					end
					self.voiceAnalytics:logPartyVoiceStatusChanged(p1, self.currentPartyId, EXPERIENCETYPELUAAPP)
				else
					if p1.status == CrossExperience.Constants.VOICE_STATUS.VOICE_CONNECTED then
						self.voiceAnalytics:logPartyVoiceConnectedState(p1, self.currentPartyId, "")
					end
					self.voiceAnalytics:logPartyVoiceStatusChanged(p1, self.currentPartyId, "")
				end
				if FStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCALPLAYERLOADINGTIMEOUTENUM.Disable and p1.status == CrossExperience.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT or (p1.status == CrossExperience.Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or FlagsModule.FFlagFireErrorRCCTimeoutSignal and p1.status == CrossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT) then
					self:leave()
				end
			end)
			self.cevEventManager:addObserver(CrossExperience.Constants.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(p1)
				-- upvalues: self (upval), Players (upval)
				self.ExperienceJoinFailed:Fire()
				self.voiceAnalytics:logPartyVoiceJoinFailure(self.currentPartyId, if p1 and p1.state then "PARTY_VOICE_GAME_JOIN_FAILED:" .. tostring(p1.state) else "PARTY_VOICE_GAME_JOIN_FAILED:-1", if Players.LocalPlayer then Players.LocalPlayer.UserId else 0)
			end)
			
			if GetFFlagEnableCrossExpVoiceMemoryCheckFunction() then
				self.cevEventManager:addObserver(CrossExperience.Constants.EVENTS.PARTY_VOICE_MEMORY_LOW, function()
					-- upvalues: self (upval)
					self:ignoreMemoryWarning()
					
					if not self.shouldIgnoreMemoryWarning then
						self.MemoryLow:Fire()
						self.shouldIgnoreMemoryWarning = true
					end
				end)
			end
			self.ExperienceJoined:Fire()
			self.hasExperienceStarted = true
		end))
		table.insert(self.connections, ExperienceService.OnCrossExperienceStopped:Connect(function(_, _)
			-- upvalues: self (copy)
			self:disconnect()
			self.ExperienceLeft:Fire()
			self:resetCEVMemStorage()
		end))
		table.insert(self.connections, NotificationService.RobloxEventReceived:Connect(function(EventData)
			-- upvalues: self (copy)
			if EventData.detailType == "SignOut" then
				self:onUserLogout()
			end
		end))
		self.isInitialized = true
		
		return
	end
end

function CrossExperienceVoiceManager:onUserLogout()
	if self.hasExperienceStarted then
		self:leave()
	end
	if self.isConnected then
		self:disconnect()
		self.ExperienceLeft:Fire()
		self:resetCEVMemStorage()
	end
end

function CrossExperienceVoiceManager:getIsConnected()
	return self.isConnected
end

function CrossExperienceVoiceManager:setAsDisconnected()
	self.isConnected = false
	self.hasExperienceStarted = false
	
	if self.ExperienceLeft then
		self.ExperienceLeft:Fire()
	end
end

function CrossExperienceVoiceManager:setAsConnected()
	if not self.isInitialized then
		self:initialize()
	end
	self.isConnected = true
	self.hasExperienceStarted = true
	self.ExperienceJoined:Fire()
end

function CrossExperienceVoiceManager:getIsBackgroundDMActive()
	-- upvalues: Promise (copy), Communication (copy), CrossExperience (copy), BACKGROUNDDMSTATUS (copy)
	return Promise.new(function(Callback, Callback1)
		-- upvalues: Communication (upval), CrossExperience (upval), BACKGROUNDDMSTATUS (upval)
		Communication.execute(CrossExperience.Constants.COMMUNICATIONS.EXECUTE_GET_BACKGROUND_DM_STATE, {}, function(p1)
			-- upvalues: Callback (copy), BACKGROUNDDMSTATUS (upval)
			Callback(p1.status == BACKGROUNDDMSTATUS.ACTIVE or p1.status == BACKGROUNDDMSTATUS.BACKGROUND)
		end, function()
			-- upvalues: Callback1 (copy)
			Callback1()
		end)
	end)
end

function CrossExperienceVoiceManager:getPartyVoiceDebugStats()
	-- upvalues: FlagsModule (copy), Promise (copy), Communication (copy), CrossExperience (copy)
	return if FlagsModule.FFlagVoiceDebugPartyVoiceToggleEnabled then Promise.new(function(Callback, Callback1)
		-- upvalues: Communication (upval), CrossExperience (upval)
		Communication.execute(CrossExperience.Constants.COMMUNICATIONS.EXECUTE_GET_PARTY_VOICE_DEBUG_STATS, {}, function(p1)
			-- upvalues: Callback (copy)
			Callback(p1)
		end, function()
			-- upvalues: Callback1 (copy)
			Callback1()
		end)
	end) else Promise.resolve({})
end

function CrossExperienceVoiceManager:performJoinFeasibilityCheck()
	-- upvalues: GetFFlagEnableCrossExpVoiceMemoryCheckFunction (copy), CrossExperience (copy), FFlagFixCrossExperienceVoiceExecutePrint (copy), LoggerModule (copy)
	if not GetFFlagEnableCrossExpVoiceMemoryCheckFunction() then
		return true
	end
	local Success, Result = pcall(function()
		return game:GetService("PerformanceControlService")
	end)
	
	if not Success or not Result then
		self.JoinFeasibilityCheckPerformed:Fire(false)
		
		return false
	end
	local Success1, Result1 = pcall(function()
		-- upvalues: Result (copy), CrossExperience (upval)
		return Result:IsCrossExperienceLaunchFeasible(CrossExperience.Constants.EXPERIENCE_TYPE_VOICE)
	end)
	
	if Success1 then
		self.JoinFeasibilityCheckPerformed:Fire(Result1)
		
		return Result1
	end
	if FFlagFixCrossExperienceVoiceExecutePrint then
		LoggerModule:warning("performJoinFeasibilityCheck() - failed to check feasibility", Result1)
	else
		LoggerModule:warn("performJoinFeasibilityCheck() - failed to check feasibility", Result1)
	end
	self.JoinFeasibilityCheckPerformed:Fire(false)
	
	return false
end

function CrossExperienceVoiceManager:ignoreMemoryWarning()
	-- upvalues: GetFFlagEnableCrossExpVoiceMemoryCheckFunction (copy), Communication (copy), CrossExperience (copy), v26 (copy)
	if GetFFlagEnableCrossExpVoiceMemoryCheckFunction() then
		Communication.execute(CrossExperience.Constants.COMMUNICATIONS.EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY, {}, v26, v26)
		
		return
	end
end

function CrossExperienceVoiceManager:join(p1)
	-- upvalues: CrossExpVoicePlaceId (copy), FFlagFixCrossExperienceVoiceExecutePrint (copy), LoggerModule (copy), HttpService (copy), MemStorageService (copy), CEVJOINATTEMPTIDKEY (copy), Players (copy), CrossExperience (copy), FIntPartyVoiceJoinRequestPulseCheckTimeout (copy), ClearTimeoutFunction (copy), SetTimeoutFunction (copy), GetFFlagJoinCrossExpVoiceWithPartyIdFunction (copy), ExperienceService (copy), RecordJoinAttemptIdForCEVEngineFeature (copy)
	if p1.shouldIgnoreMemoryWarning then
		self.shouldIgnoreMemoryWarning = true
	end
	if not self.isInitialized then
		self:initialize()
	end
	local Number: number? = tonumber(CrossExpVoicePlaceId)
	
	if self.isConnected and not p1.force then
		if FFlagFixCrossExperienceVoiceExecutePrint then
			LoggerModule:info("CrossExperienceVoiceManager:join() - already connected, returning early.")
		else
			print("CrossExperienceVoiceManager:join() - already connected, returning early.")
		end
		self.JoinRequestSubmitted:Fire(true)
		
		return
	else
		if game:GetEngineFeature("CEVGetBackgroundState") then
			local v1, v2 = self:getIsBackgroundDMActive():await()
			
			if v1 and v2 and not p1.force then
				self:setAsConnected()
				self.JoinRequestSubmitted:Fire(true)
				
				return
			end
		end
		self.currentCevJoinAttemptId = HttpService:GenerateGUID(false)
		pcall(function()
			-- upvalues: MemStorageService (upval), CEVJOINATTEMPTIDKEY (upval), self (copy)
			MemStorageService:SetItem(CEVJOINATTEMPTIDKEY, self.currentCevJoinAttemptId)
		end)
		self.voiceAnalytics:logPartyVoiceJoinAttempt({
			isConnected = self.isConnected,
			targetPlaceId = Number,
			partyId = p1.partyId,
			userId = if Players.LocalPlayer then Players.LocalPlayer.UserId else 0,
			activeDm = if self.isActiveDM then CrossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else CrossExperience.Constants.EXPERIENCE_TYPE_UGC
		})
		self.JoinRequested:Fire()
		
		if FIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
			if self.joinRequestPulseCheckId then
				ClearTimeoutFunction(self.joinRequestPulseCheckId)
				self.joinRequestPulseCheckId = nil
			end
			self.joinRequestPulseCheckId = SetTimeoutFunction(function()
				-- upvalues: self (copy)
				self.JoinRequestPulseCheck:Fire()
			end, FIntPartyVoiceJoinRequestPulseCheckTimeout)
		end
		self.isConnected = true
		
		if GetFFlagJoinCrossExpVoiceWithPartyIdFunction() then
			if p1 and p1.partyId then
				self.currentPartyId = p1.partyId
				local Success1, Result1 = pcall(function()
					-- upvalues: LoggerModule (upval), p1 (copy), ExperienceService (upval), CrossExperience (upval), Number (copy), RecordJoinAttemptIdForCEVEngineFeature (upval), self (copy)
					LoggerModule:info("CrossExperienceVoiceManager:join() - starting cross experience voice with partyId " .. p1.partyId)
					ExperienceService:StartCrossExperience(CrossExperience.Constants.EXPERIENCE_TYPE_VOICE, {
						partyId = p1.partyId,
						placeId = Number,
						joinAttemptId = if RecordJoinAttemptIdForCEVEngineFeature then self.currentCevJoinAttemptId else nil
					})
				end)
				
				if not Success1 then
					if FFlagFixCrossExperienceVoiceExecutePrint then
						LoggerModule:warning("Failed to join cross experience voice with partyId " .. p1.partyId, Result1)
					else
						LoggerModule:warn("Failed to join cross experience voice with partyId " .. p1.partyId, Result1)
					end
					self.voiceAnalytics:logPartyVoiceJoinFailure(p1.partyId, Result1, if Players.LocalPlayer then Players.LocalPlayer.UserId else 0)
					self.currentPartyId = nil
				end
			else
				if FFlagFixCrossExperienceVoiceExecutePrint then
					LoggerModule:warning("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice")
				else
					LoggerModule:warn("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice")
				end
				self.isConnected = false
				self.currentPartyId = nil
				self.JoinRequestSubmitted:Fire(self.isConnected)
				
				return
			end
		else
			local Success, Result = pcall(function()
				-- upvalues: LoggerModule (upval), ExperienceService (upval), CrossExperience (upval), Number (copy), RecordJoinAttemptIdForCEVEngineFeature (upval), self (copy)
				LoggerModule:info("CrossExperienceVoiceManager:join() - starting cross experience voice")
				ExperienceService:StartCrossExperience(CrossExperience.Constants.EXPERIENCE_TYPE_VOICE, {
					placeId = Number,
					joinAttemptId = if RecordJoinAttemptIdForCEVEngineFeature then self.currentCevJoinAttemptId else nil
				})
			end)
			
			if not Success then
				if FFlagFixCrossExperienceVoiceExecutePrint then
					LoggerModule:warning("Failed to join cross experience voice: ", Result)
				else
					LoggerModule:warn("Failed to join cross experience voice: ", Result)
				end
				self.isConnected = false
				self.currentPartyId = nil
			end
		end
		self.JoinRequestSubmitted:Fire(self.isConnected)
	end
end

function CrossExperienceVoiceManager:changeInputDevice(DeviceName, DeviceGuid)
	-- upvalues: Communication (copy), CrossExperience (copy), v26 (copy)
	Communication.execute(CrossExperience.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE, { deviceName = DeviceName, deviceGuid = DeviceGuid }, v26, v26)
end

function CrossExperienceVoiceManager:changeOutputDevice(DeviceName, DeviceGuid)
	-- upvalues: Communication (copy), CrossExperience (copy), v26 (copy)
	Communication.execute(CrossExperience.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE, { deviceName = DeviceName, deviceGuid = DeviceGuid }, v26, v26)
end

function CrossExperienceVoiceManager:muteVoiceParticipant(UserId)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, { userId = UserId })
	self.voiceAnalytics:logPartyVoiceMuteParticipant(self.currentPartyId, UserId)
end

function CrossExperienceVoiceManager:unmuteVoiceParticipant(UserId)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, { userId = UserId })
	self.voiceAnalytics:logPartyVoiceUnmuteParticipant(self.currentPartyId, UserId)
end

function CrossExperienceVoiceManager:enableVoiceChanger(UserId)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, { userId = UserId })
end

function CrossExperienceVoiceManager:disableVoiceChanger(UserId)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, { userId = UserId })
end

function CrossExperienceVoiceManager:setVoicePack(VoicePackName)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.SET_PARTY_VOICE_PACK, { voicePackName = VoicePackName })
end

function CrossExperienceVoiceManager:enableHearMyself(UserId)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, { userId = UserId })
end

function CrossExperienceVoiceManager:disableHearMyself(UserId)
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, { userId = UserId })
end

function CrossExperienceVoiceManager:blockVoiceParticipant(UserId)
	-- upvalues: CrossExperience (copy)
	if self.isConnected then
		self.cevEventManager:notify(CrossExperience.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, { userId = UserId })
		self.voiceAnalytics:logPartyVoiceBlockParticipant(self.currentPartyId, UserId)
	end
end

function CrossExperienceVoiceManager:unblockVoiceParticipant(UserId)
	-- upvalues: CrossExperience (copy)
	if self.isConnected then
		self.cevEventManager:notify(CrossExperience.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, { userId = UserId })
		self.voiceAnalytics:logPartyVoiceUnblockParticipant(self.currentPartyId, UserId)
	end
end

function CrossExperienceVoiceManager:dumpDebugData()
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.DEBUG_COMMAND, { name = "dump_session" })
end

function CrossExperienceVoiceManager:leave()
	-- upvalues: ExperienceService (copy), CrossExperience (copy), ClearTimeoutFunction (copy)
	ExperienceService:StopCrossExperience(CrossExperience.Constants.EXPERIENCE_TYPE_VOICE, {})
	
	if self.joinRequestPulseCheckId then
		ClearTimeoutFunction(self.joinRequestPulseCheckId)
		self.joinRequestPulseCheckId = nil
	end
	self.voiceAnalytics:reset()
end

function CrossExperienceVoiceManager:rejoinVoice()
	-- upvalues: CrossExperience (copy)
	self.cevEventManager:notify(CrossExperience.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, {})
end

function CrossExperienceVoiceManager:resetCEVMemStorage()
	-- upvalues: MemStorageService (copy), CEVJOINATTEMPTIDKEY (copy)
	self.currentCevJoinAttemptId = nil
	pcall(function()
		-- upvalues: MemStorageService (upval), CEVJOINATTEMPTIDKEY (upval)
		MemStorageService:RemoveItem(CEVJOINATTEMPTIDKEY)
	end)
end

function CrossExperienceVoiceManager:disconnect()
	-- upvalues: LoggerModule (copy), ClearTimeoutFunction (copy), PersistenceMiddleware (copy)
	self.isConnected = false
	self.currentPartyId = nil
	self.hasExperienceStarted = false
	self.shouldIgnoreMemoryWarning = false
	LoggerModule:info("Disconnecting, resetting observers")
	self.observersInitialized = false
	
	if self.joinRequestPulseCheckId then
		ClearTimeoutFunction(self.joinRequestPulseCheckId)
		self.joinRequestPulseCheckId = nil
	end
	PersistenceMiddleware.clean()
end

function CrossExperienceVoiceManager:getAudioFocusService()
	-- upvalues: AudioFocusManagementEngineFeature (copy)
	if AudioFocusManagementEngineFeature then
		local Success, Result = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		return if Success and Result then Result else nil
	else
		return nil
	end
end

function CrossExperienceVoiceManager:getCurrentAudioContext()
	local AudioFocusService = self:getAudioFocusService()
	
	return if AudioFocusService == nil then -1 else AudioFocusService:GetFocusedContextId()
end

function CrossExperienceVoiceManager:toggleAudioFocus()
	-- upvalues: AUDIOFOCUSMANAGEMENT (copy)
	local AudioFocusService = self:getAudioFocusService()
	
	if AudioFocusService == nil then return end
	local Flag = false
	local Flag1 = false
	
	for CONTEXTID, _ in pairs((AudioFocusService:GetRegisteredContexts())) do
		if CONTEXTID == AUDIOFOCUSMANAGEMENT.CEV.CONTEXT_ID then
			Flag = true
		end
		if CONTEXTID == AUDIOFOCUSMANAGEMENT.UGC.CONTEXT_ID then
			Flag1 = true
		end
	end
	if Flag and Flag1 then
		AudioFocusService:AcquireFocus(AudioFocusService:GetFocusedContextId() == AUDIOFOCUSMANAGEMENT.CEV.CONTEXT_ID and AUDIOFOCUSMANAGEMENT.UGC.CONTEXT_ID or AUDIOFOCUSMANAGEMENT.CEV.CONTEXT_ID)
		
		return
	end
end

function CrossExperienceVoiceManager:muteAll(Context)
	-- upvalues: GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), CrossExperience (copy)
	if not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() then return end
	if self.isConnected then
		self.cevEventManager:notify(CrossExperience.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, { context = Context })
	end
end

function CrossExperienceVoiceManager:unmuteAll(Context)
	-- upvalues: GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), CrossExperience (copy)
	if not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() then return end
	if self.isConnected then
		self.cevEventManager:notify(CrossExperience.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, { context = Context })
	end
end

function CrossExperienceVoiceManager:signalCevReadinessSync()
	-- upvalues: CrossExperience (copy)
	if game:GetEngineFeature("CevReadinessSync") then
		self.cevEventManager:notify(CrossExperience.Constants.EVENTS.FOREGROUND_UI_READY, {})
		
		return
	end
end

CrossExperienceVoiceManager.default = CrossExperienceVoiceManager.new()

return CrossExperienceVoiceManager