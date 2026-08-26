local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local experienceService = game:GetService("ExperienceService")
local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local promise = dependenciesModule.Promise
local crossExperience = dependenciesModule.CrossExperience
local communication = crossExperience.Communication
local sharedFlags = dependenciesModule.SharedFlags
local luauPolyfill = dependenciesModule.LuauPolyfill
local constantsModule = require(crossExperienceVoice.Common.Constants)
local crossExperienceVoiceAnalyticsModule = require(crossExperienceVoice.CrossExperienceVoiceAnalytics)
local loggerModule = require(crossExperienceVoice.Logger)
local flagsModule = require(crossExperienceVoice.Flags)
local createPersistenceMiddleware = crossExperience.Middlewares.createPersistenceMiddleware
local t = {}
t.__index = t
local getFFlagJoinCrossExpVoiceWithPartyId = sharedFlags.getFFlagJoinCrossExpVoiceWithPartyId
local getFFlagEnableCrossExpVoiceMemoryCheck = sharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local getFFlagEnableCrossExperienceVoiceCaptureMute = sharedFlags.GetFFlagEnableCrossExperienceVoiceCaptureMute
local fStringTimeoutLoadingLocalPlayerInBackgroundDM = sharedFlags.FStringTimeoutLoadingLocalPlayerInBackgroundDM
local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local recordJoinAttemptIdForCEVEngineFeature = game:GetEngineFeature("RecordJoinAttemptIdForCEV")
local fIntPartyVoiceJoinRequestPulseCheckTimeout = sharedFlags.FIntPartyVoiceJoinRequestPulseCheckTimeout
local BACKGROUND_DM_STATUS = crossExperience.Constants.BACKGROUND_DM_STATUS
local AUDIO_FOCUS_MANAGEMENT = crossExperience.Constants.AUDIO_FOCUS_MANAGEMENT
local LOCAL_PLAYER_LOADING_TIMEOUT_ENUM = crossExperience.Constants.LOCAL_PLAYER_LOADING_TIMEOUT_ENUM
local CEV_JOIN_ATTEMPT_ID_KEY = crossExperience.Constants.CEV_JOIN_ATTEMPT_ID_KEY
local var1 = createPersistenceMiddleware({
	storeKey = crossExperience.Constants.STORAGE_CEV_STORE_KEY
})
local setTimeout = luauPolyfill.setTimeout
local clearTimeout = luauPolyfill.clearTimeout
local fFlagFixCrossExperienceVoiceExecutePrint = sharedFlags.FFlagFixCrossExperienceVoiceExecutePrint
local crossExpVoicePlaceId = game:DefineFastString("CrossExpVoicePlaceId", tostring(constantsModule.DEFAULT_EXPERIENCE_PLACE_ID))

local var2 = function() end

local _ = function()
	-- upvalues: crossExperience (ref)
	return if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
end

function t.new()
	-- upvalues: crossExperience (ref), crossExperienceVoiceAnalyticsModule (ref), t (ref)
	local t_1 = {
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
		cevEventManager = crossExperience.EventManager.new(if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC, false),
		voiceAnalytics = crossExperienceVoiceAnalyticsModule.default
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:logPartyVoiceTimeout()
	self.voiceAnalytics:logPartyVoiceTimeout(self.currentPartyId)
end

function t:initialize()
	-- upvalues: experienceService (ref), crossExperience (ref), loggerModule (ref), flagsModule (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (ref), playersService (ref), getFFlagEnableCrossExpVoiceMemoryCheck (ref), notificationService (ref)
	self.voiceAnalytics:initialize(self.cevEventManager)
	
	if self.isInitialized == true then
		return
	end
	table.insert(self.connections, experienceService:RegisterForExperienceJoin(function()
		-- upvalues: crossExperience (copy), self (ref)
		if (if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC) == crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP then
			self.isActiveDM = false
		end
	end))
	table.insert(self.connections, experienceService:RegisterForExperienceLeave(function()
		-- upvalues: crossExperience (copy), self (ref)
		if (if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC) == crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP then
			self.isActiveDM = true
		end
	end))
	table.insert(self.connections, experienceService.OnCrossExperienceStarted:Connect(function(_, _)
		-- upvalues: self (ref), loggerModule (copy), crossExperience (copy), flagsModule (copy), fStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (copy), playersService (copy), getFFlagEnableCrossExpVoiceMemoryCheck (copy)
		self.voiceAnalytics:logPartyVoiceOnCrossExperienceStartedSignalReceived(self.hasExperienceStarted, self.isActiveDM)
		
		if self.hasExperienceStarted then return end
		if self.observersInitialized then
			loggerModule:info("Observers already initialized, skipping duplicate setup")
			
			return
		end
		self.observersInitialized = true
		loggerModule:info("Initializing observers for the first time")
		self.cevEventManager:addObserver(crossExperience.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(p1)
			-- upvalues: self (copy), flagsModule (copy), crossExperience (copy), fStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (copy)
			self.voiceAnalytics:logPartyVoiceStateChangeHandlerRun(self.isActiveDM, p1)
			
			if not self.isActiveDM then return end
			if flagsModule.FFlagFireErrorRCCTimeoutSignal and p1.status == crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
				self.voiceAnalytics:logPartyVoiceTimeout(self.currentPartyId)
			elseif flagsModule.FFlagPartyVoiceLogActiveDM then
				local var3 = if self.isActiveDM then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
				
				if p1.status == crossExperience.Constants.VOICE_STATUS.VOICE_CONNECTED then
					self.voiceAnalytics:logPartyVoiceConnectedState(p1, self.currentPartyId, var3)
				end
				self.voiceAnalytics:logPartyVoiceStatusChanged(p1, self.currentPartyId, var3)
			elseif p1.status == crossExperience.Constants.VOICE_STATUS.VOICE_CONNECTED then
				self.voiceAnalytics:logPartyVoiceConnectedState(p1, self.currentPartyId, "")
			end
			self.voiceAnalytics:logPartyVoiceStatusChanged(p1, self.currentPartyId, "")
			if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable and p1.status == crossExperience.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT or p1.status == crossExperience.Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or flagsModule.FFlagFireErrorRCCTimeoutSignal and p1.status == crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
				self:leave()
			end
		end)
		self.cevEventManager:addObserver(crossExperience.Constants.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(p1)
			-- upvalues: self (copy), playersService (copy)
			self.ExperienceJoinFailed:Fire()
			self.voiceAnalytics:logPartyVoiceJoinFailure(self.currentPartyId, if p1 and p1.state then "PARTY_VOICE_GAME_JOIN_FAILED:" .. tostring(p1.state) else "PARTY_VOICE_GAME_JOIN_FAILED:-1", if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
		end)
		
		if getFFlagEnableCrossExpVoiceMemoryCheck() then
			self.cevEventManager:addObserver(crossExperience.Constants.EVENTS.PARTY_VOICE_MEMORY_LOW, function()
				-- upvalues: self (copy)
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
	table.insert(self.connections, experienceService.OnCrossExperienceStopped:Connect(function(_, _)
		-- upvalues: self (ref)
		self:disconnect()
		self.ExperienceLeft:Fire()
		self:resetCEVMemStorage()
	end))
	table.insert(self.connections, notificationService.RobloxEventReceived:Connect(function(p1)
		-- upvalues: self (ref)
		if p1.detailType == "SignOut" then
			self:onUserLogout()
		end
	end))
	self.isInitialized = true
end

function t:onUserLogout()
	if self.hasExperienceStarted then
		self:leave()
	end
	if self.isConnected then
		self:disconnect()
		self.ExperienceLeft:Fire()
		self:resetCEVMemStorage()
	end
end

function t:getIsConnected()
	return self.isConnected
end

function t:setAsDisconnected()
	self.isConnected = false
	self.hasExperienceStarted = false
	
	if self.ExperienceLeft then
		self.ExperienceLeft:Fire()
	end
end

function t:setAsConnected()
	if not self.isInitialized then
		self:initialize()
	end
	self.isConnected = true
	self.hasExperienceStarted = true
	self.ExperienceJoined:Fire()
end

function t.getIsBackgroundDMActive(_)
	-- upvalues: promise (ref), communication (ref), crossExperience (ref), BACKGROUND_DM_STATUS (ref)
	return promise.new(function(p1, p2)
		-- upvalues: communication (copy), crossExperience (copy), BACKGROUND_DM_STATUS (copy)
		communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_GET_BACKGROUND_DM_STATE, {}, function(p3)
			-- upvalues: p1 (ref), BACKGROUND_DM_STATUS (copy)
			p1(if p3.status ~= BACKGROUND_DM_STATUS.ACTIVE then p3.status == BACKGROUND_DM_STATUS.BACKGROUND else true)
		end, function()
			-- upvalues: p2 (ref)
			p2()
		end)
	end)
end

function t:performJoinFeasibilityCheck()
	-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (ref), crossExperience (ref), fFlagFixCrossExperienceVoiceExecutePrint (ref), loggerModule (ref)
	if not getFFlagEnableCrossExpVoiceMemoryCheck() then
		return true
	end
	local ok, status = pcall(function()
		return game:GetService("PerformanceControlService")
	end)
	
	if not ok or not status then
		self.JoinFeasibilityCheckPerformed:Fire(false)
		
		return false
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: status (ref), crossExperience (copy)
		return status:IsCrossExperienceLaunchFeasible(crossExperience.Constants.EXPERIENCE_TYPE_VOICE)
	end)
	
	if ok_1 then
		self.JoinFeasibilityCheckPerformed:Fire(status_1)
		
		return status_1
	elseif fFlagFixCrossExperienceVoiceExecutePrint then
		loggerModule:warning("performJoinFeasibilityCheck() - failed to check feasibility", status_1)
	else
		loggerModule:warn("performJoinFeasibilityCheck() - failed to check feasibility", status_1)
	end
	self.JoinFeasibilityCheckPerformed:Fire(false)
	
	return false
end

function t.ignoreMemoryWarning(_)
	-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (ref), communication (ref), crossExperience (ref), var2 (ref)
	if getFFlagEnableCrossExpVoiceMemoryCheck() then
		communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY, {}, var2, var2)
		
		return
	end
end

function t:join(p1)
	-- upvalues: crossExpVoicePlaceId (ref), fFlagFixCrossExperienceVoiceExecutePrint (ref), loggerModule (ref), httpService (ref), memStorageService (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref), playersService (ref), crossExperience (ref), fIntPartyVoiceJoinRequestPulseCheckTimeout (ref), clearTimeout (ref), setTimeout (ref), getFFlagJoinCrossExpVoiceWithPartyId (ref), experienceService (ref), recordJoinAttemptIdForCEVEngineFeature (ref)
	if p1.shouldIgnoreMemoryWarning then
		self.shouldIgnoreMemoryWarning = true
	end
	if not self.isInitialized then
		self:initialize()
	end
	local var3 = tonumber(crossExpVoicePlaceId)
	
	if self.isConnected and not p1.force then
		if fFlagFixCrossExperienceVoiceExecutePrint then
			loggerModule:info("CrossExperienceVoiceManager:join() - already connected, returning early.")
		else
			print("CrossExperienceVoiceManager:join() - already connected, returning early.")
		end
		self.JoinRequestSubmitted:Fire(true)
		
		return
	elseif game:GetEngineFeature("CEVGetBackgroundState") then
		local var4, var5 = self:getIsBackgroundDMActive():await()
		
		if var4 and var5 and not p1.force then
			self:setAsConnected()
			self.JoinRequestSubmitted:Fire(true)
			
			return
		end
	end
	self.currentCevJoinAttemptId = httpService:GenerateGUID(false)
	pcall(function()
		-- upvalues: memStorageService (copy), CEV_JOIN_ATTEMPT_ID_KEY (copy), self (ref)
		memStorageService:SetItem(CEV_JOIN_ATTEMPT_ID_KEY, self.currentCevJoinAttemptId)
	end)
	self.voiceAnalytics:logPartyVoiceJoinAttempt({
		isConnected = self.isConnected,
		targetPlaceId = var3,
		partyId = p1.partyId,
		userId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0,
		activeDm = if self.isActiveDM then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
	})
	self.JoinRequested:Fire()
	
	if fIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
		if self.joinRequestPulseCheckId then
			clearTimeout(self.joinRequestPulseCheckId)
			self.joinRequestPulseCheckId = nil
		end
		self.joinRequestPulseCheckId = setTimeout(function()
			-- upvalues: self (ref)
			self.JoinRequestPulseCheck:Fire()
		end, fIntPartyVoiceJoinRequestPulseCheckTimeout)
	end
	self.isConnected = true
	
	if getFFlagJoinCrossExpVoiceWithPartyId() then
		if p1 and p1.partyId then
			self.currentPartyId = p1.partyId
			local ok, status = pcall(function()
				-- upvalues: loggerModule (copy), p1 (ref), experienceService (copy), crossExperience (copy), var3 (ref), recordJoinAttemptIdForCEVEngineFeature (copy), self (ref)
				loggerModule:info("CrossExperienceVoiceManager:join() - starting cross experience voice with partyId " .. p6.partyId)
				experienceService:StartCrossExperience(crossExperience.Constants.EXPERIENCE_TYPE_VOICE, {
					partyId = p1.partyId,
					placeId = var3,
					joinAttemptId = if recordJoinAttemptIdForCEVEngineFeature then self.currentCevJoinAttemptId else nil
				})
			end)
			
			if not ok then
				if fFlagFixCrossExperienceVoiceExecutePrint then
					loggerModule:warning("Failed to join cross experience voice with partyId " .. p6.partyId, status)
				else
					loggerModule:warn("Failed to join cross experience voice with partyId " .. p6.partyId, status)
				end
				self.voiceAnalytics:logPartyVoiceJoinFailure(p1.partyId, status, if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
				self.currentPartyId = nil
			end
		elseif fFlagFixCrossExperienceVoiceExecutePrint then
			loggerModule:warning("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice")
		else
			loggerModule:warn("CrossExperienceVoiceManager:join() - params.partyId is required to join cross experience voice")
		end
		self.isConnected = false
		self.currentPartyId = nil
		self.JoinRequestSubmitted:Fire(self.isConnected)
		
		return
	else
		local ok, status = pcall(function()
			-- upvalues: loggerModule (copy), experienceService (copy), crossExperience (copy), var3 (ref), recordJoinAttemptIdForCEVEngineFeature (copy), self (ref)
			loggerModule:info("CrossExperienceVoiceManager:join() - starting cross experience voice")
			experienceService:StartCrossExperience(crossExperience.Constants.EXPERIENCE_TYPE_VOICE, {
				placeId = var3,
				joinAttemptId = if recordJoinAttemptIdForCEVEngineFeature then self.currentCevJoinAttemptId else nil
			})
		end)
		
		if not ok then
			if fFlagFixCrossExperienceVoiceExecutePrint then
				loggerModule:warning("Failed to join cross experience voice: ", status)
			else
				loggerModule:warn("Failed to join cross experience voice: ", status)
			end
			self.isConnected = false
			self.currentPartyId = nil
		end
	end
	self.JoinRequestSubmitted:Fire(self.isConnected)
end

function t.changeInputDevice(_, p1, p2)
	-- upvalues: communication (ref), crossExperience (ref), var2 (ref)
	communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE, { deviceName = p1, deviceGuid = p2 }, var2, var2)
end

function t.changeOutputDevice(_, p1, p2)
	-- upvalues: communication (ref), crossExperience (ref), var2 (ref)
	communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE, { deviceName = p1, deviceGuid = p2 }, var2, var2)
end

function t:muteVoiceParticipant(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, { userId = p1 })
	self.voiceAnalytics:logPartyVoiceMuteParticipant(self.currentPartyId, p1)
end

function t:unmuteVoiceParticipant(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, { userId = p1 })
	self.voiceAnalytics:logPartyVoiceUnmuteParticipant(self.currentPartyId, p1)
end

function t:enableVoiceChanger(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, { userId = p1 })
end

function t:disableVoiceChanger(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, { userId = p1 })
end

function t:setVoicePack(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.SET_PARTY_VOICE_PACK, { voicePackName = p1 })
end

function t:enableHearMyself(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, { userId = p1 })
end

function t:disableHearMyself(p1)
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, { userId = p1 })
end

function t:blockVoiceParticipant(p1)
	-- upvalues: crossExperience (ref)
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, { userId = p1 })
		self.voiceAnalytics:logPartyVoiceBlockParticipant(self.currentPartyId, p1)
	end
end

function t:unblockVoiceParticipant(p1)
	-- upvalues: crossExperience (ref)
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, { userId = p1 })
		self.voiceAnalytics:logPartyVoiceUnblockParticipant(self.currentPartyId, p1)
	end
end

function t:dumpDebugData()
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.DEBUG_COMMAND, { name = "dump_session" })
end

function t:leave()
	-- upvalues: experienceService (ref), crossExperience (ref), clearTimeout (ref)
	experienceService:StopCrossExperience(crossExperience.Constants.EXPERIENCE_TYPE_VOICE, {})
	
	if self.joinRequestPulseCheckId then
		clearTimeout(self.joinRequestPulseCheckId)
		self.joinRequestPulseCheckId = nil
	end
	self.voiceAnalytics:reset()
end

function t:rejoinVoice()
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, {})
end

function t:resetCEVMemStorage()
	-- upvalues: memStorageService (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref)
	self.currentCevJoinAttemptId = nil
	pcall(function()
		-- upvalues: memStorageService (copy), CEV_JOIN_ATTEMPT_ID_KEY (copy)
		memStorageService:RemoveItem(CEV_JOIN_ATTEMPT_ID_KEY)
	end)
end

function t:disconnect()
	-- upvalues: loggerModule (ref), clearTimeout (ref), var1 (ref)
	self.isConnected = false
	self.currentPartyId = nil
	self.hasExperienceStarted = false
	self.shouldIgnoreMemoryWarning = false
	loggerModule:info("Disconnecting, resetting observers")
	self.observersInitialized = false
	
	if self.joinRequestPulseCheckId then
		clearTimeout(self.joinRequestPulseCheckId)
		self.joinRequestPulseCheckId = nil
	end
	var1.clean()
end

function t.getAudioFocusService(_)
	-- upvalues: audioFocusManagementEngineFeature (ref)
	if not audioFocusManagementEngineFeature then
		return nil
	end
	local ok, status = pcall(function()
		return game:GetService("AudioFocusService")
	end)
	
	return if ok and status then status else nil
end

function t:getCurrentAudioContext()
	local audioFocusService = self:getAudioFocusService()
	
	return if audioFocusService == nil then -1 else audioFocusService:GetFocusedContextId()
end

function t:toggleAudioFocus()
	-- upvalues: AUDIO_FOCUS_MANAGEMENT (ref)
	local audioFocusService = self:getAudioFocusService()
	
	if audioFocusService == nil then return end
	local registeredContexts = audioFocusService:GetRegisteredContexts()
	local var3 = false
	local var4 = false
	
	for i, v in pairs(registeredContexts) do
		if i == AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID then
			var3 = true
		end
		if i == AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID then
			var4 = true
		end
	end
	if var3 and var4 then
		audioFocusService:AcquireFocus(if audioFocusService:GetFocusedContextId() == AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID then AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID else AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID)
		
		return
	end
end

function t:muteAll(p1)
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), crossExperience (ref)
	if not getFFlagEnableCrossExperienceVoiceCaptureMute() then return end
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, { context = p1 })
	end
end

function t:unmuteAll(p1)
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), crossExperience (ref)
	if not getFFlagEnableCrossExperienceVoiceCaptureMute() then return end
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, { context = p1 })
	end
end

function t:signalCevReadinessSync()
	-- upvalues: crossExperience (ref)
	if game:GetEngineFeature("CevReadinessSync") then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.FOREGROUND_UI_READY, {})
		
		return
	end
end

t.default = t.new()

return t