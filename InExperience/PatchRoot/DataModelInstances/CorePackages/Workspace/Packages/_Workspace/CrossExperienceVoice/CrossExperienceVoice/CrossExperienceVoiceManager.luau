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
local var14 = createPersistenceMiddleware({
	storeKey = crossExperience.Constants.STORAGE_CEV_STORE_KEY
})
local setTimeout = luauPolyfill.setTimeout
local clearTimeout = luauPolyfill.clearTimeout
local fFlagFixCrossExperienceVoiceExecutePrint = sharedFlags.FFlagFixCrossExperienceVoiceExecutePrint
local crossExpVoicePlaceId = game:DefineFastString("CrossExpVoicePlaceId", tostring(constantsModule.DEFAULT_EXPERIENCE_PLACE_ID))

local var16 = function() --[[ line: 57 ]] end

local _ = function() --[[ line: 129 ]]
	-- upvalues: crossExperience (ref)
	return if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
end

function t.new() --[[ line: 135 ]]
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

function t:logPartyVoiceTimeout() --[[ line: 168 ]]
	self.voiceAnalytics:logPartyVoiceTimeout(self.currentPartyId)
end

function t:initialize() --[[ line: 172 ]]
	-- upvalues: experienceService (ref), crossExperience (ref), loggerModule (ref), flagsModule (ref), fStringTimeoutLoadingLocalPlayerInBackgroundDM (ref), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (ref), playersService (ref), getFFlagEnableCrossExpVoiceMemoryCheck (ref), notificationService (ref)
	self.voiceAnalytics:initialize(self.cevEventManager)
	
	if self.isInitialized == true then
		return
	end
	table.insert(self.connections, experienceService:RegisterForExperienceJoin(function() --[[ line: 181 ]]
		-- upvalues: crossExperience (copy), self (ref)
		if (if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC) == crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP then
			self.isActiveDM = false
		end
	end))
	table.insert(self.connections, experienceService:RegisterForExperienceLeave(function() --[[ line: 191 ]]
		-- upvalues: crossExperience (copy), self (ref)
		if (if game.PlaceId == 0 then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC) == crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP then
			self.isActiveDM = true
		end
	end))
	table.insert(self.connections, experienceService.OnCrossExperienceStarted:Connect(function(_, _) --[[ line: 201 ]]
		-- upvalues: self (ref), loggerModule (copy), crossExperience (copy), flagsModule (copy), fStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (copy), playersService (copy), getFFlagEnableCrossExpVoiceMemoryCheck (copy)
		self.voiceAnalytics:logPartyVoiceOnCrossExperienceStartedSignalReceived(self.hasExperienceStarted, self.isActiveDM)
		
		if self.hasExperienceStarted then return end
		if self.observersInitialized then
			loggerModule:info("Observers already initialized, skipping duplicate setup")
			
			return
		end
		self.observersInitialized = true
		loggerModule:info("Initializing observers for the first time")
		self.cevEventManager:addObserver(crossExperience.Constants.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(p0) --[[ line: 221 ]]
			-- upvalues: self (copy), flagsModule (copy), crossExperience (copy), fStringTimeoutLoadingLocalPlayerInBackgroundDM (copy), LOCAL_PLAYER_LOADING_TIMEOUT_ENUM (copy)
			self.voiceAnalytics:logPartyVoiceStateChangeHandlerRun(self.isActiveDM, p0)
			
			if not self.isActiveDM then return end
			if flagsModule.FFlagFireErrorRCCTimeoutSignal and p0.status == crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
				self.voiceAnalytics:logPartyVoiceTimeout(self.currentPartyId)
			elseif flagsModule.FFlagPartyVoiceLogActiveDM then
				local var18 = if self.isActiveDM then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
				
				if p0.status == crossExperience.Constants.VOICE_STATUS.VOICE_CONNECTED then
					self.voiceAnalytics:logPartyVoiceConnectedState(p0, self.currentPartyId, var18)
				end
				self.voiceAnalytics:logPartyVoiceStatusChanged(p0, self.currentPartyId, var18)
			elseif p0.status == crossExperience.Constants.VOICE_STATUS.VOICE_CONNECTED then
				self.voiceAnalytics:logPartyVoiceConnectedState(p0, self.currentPartyId, "")
			end
			self.voiceAnalytics:logPartyVoiceStatusChanged(p0, self.currentPartyId, "")
			if fStringTimeoutLoadingLocalPlayerInBackgroundDM ~= LOCAL_PLAYER_LOADING_TIMEOUT_ENUM.Disable and p0.status == crossExperience.Constants.VOICE_STATUS.ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT or p0.status == crossExperience.Constants.VOICE_STATUS.ERROR_VOICE_DISCONNECTED or flagsModule.FFlagFireErrorRCCTimeoutSignal and p0.status == crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT then
				self:leave()
			end
		end)
		self.cevEventManager:addObserver(crossExperience.Constants.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(p1) --[[ line: 272 ]]
			-- upvalues: self (copy), playersService (copy)
			self.ExperienceJoinFailed:Fire()
			self.voiceAnalytics:logPartyVoiceJoinFailure(self.currentPartyId, if p1 and p1.state then "PARTY_VOICE_GAME_JOIN_FAILED:" .. tostring(p1.state) else "PARTY_VOICE_GAME_JOIN_FAILED:-1", if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
		end)
		
		if getFFlagEnableCrossExpVoiceMemoryCheck() then
			self.cevEventManager:addObserver(crossExperience.Constants.EVENTS.PARTY_VOICE_MEMORY_LOW, function() --[[ line: 283 ]]
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
	table.insert(self.connections, experienceService.OnCrossExperienceStopped:Connect(function(_, _) --[[ line: 298 ]]
		-- upvalues: self (ref)
		self:disconnect()
		self.ExperienceLeft:Fire()
		self:resetCEVMemStorage()
	end))
	table.insert(self.connections, notificationService.RobloxEventReceived:Connect(function(p2) --[[ line: 310 ]]
		-- upvalues: self (ref)
		if p2.detailType == "SignOut" then
			self:onUserLogout()
		end
	end))
	self.isInitialized = true
end

function t:onUserLogout() --[[ line: 319 ]]
	if self.hasExperienceStarted then
		self:leave()
	end
	if self.isConnected then
		self:disconnect()
		self.ExperienceLeft:Fire()
		self:resetCEVMemStorage()
	end
end

function t:getIsConnected() --[[ line: 330 ]]
	return self.isConnected
end

function t:setAsDisconnected() --[[ line: 334 ]]
	self.isConnected = false
	self.hasExperienceStarted = false
	
	if self.ExperienceLeft then
		self.ExperienceLeft:Fire()
	end
end

function t:setAsConnected() --[[ line: 342 ]]
	if not self.isInitialized then
		self:initialize()
	end
	self.isConnected = true
	self.hasExperienceStarted = true
	self.ExperienceJoined:Fire()
end

function t.getIsBackgroundDMActive(_) --[[ line: 351 ]]
	-- upvalues: promise (ref), communication (ref), crossExperience (ref), BACKGROUND_DM_STATUS (ref)
	return promise.new(function(p3, p4) --[[ line: 352 ]]
		-- upvalues: communication (copy), crossExperience (copy), BACKGROUND_DM_STATUS (copy)
		communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_GET_BACKGROUND_DM_STATE, {}, function(p5) --[[ line: 356 ]]
			-- upvalues: p3 (ref), BACKGROUND_DM_STATUS (copy)
			p3(if p5.status ~= BACKGROUND_DM_STATUS.ACTIVE then p5.status == BACKGROUND_DM_STATUS.BACKGROUND else true)
		end, function() --[[ line: 359 ]]
			-- upvalues: p4 (ref)
			p4()
		end)
	end)
end

function t:performJoinFeasibilityCheck() --[[ line: 367 ]]
	-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (ref), crossExperience (ref), fFlagFixCrossExperienceVoiceExecutePrint (ref), loggerModule (ref)
	if not getFFlagEnableCrossExpVoiceMemoryCheck() then
		return true
	end
	local ok, status = pcall(function() --[[ line: 371 ]]
		return game:GetService("PerformanceControlService")
	end)
	
	if not ok or not status then
		self.JoinFeasibilityCheckPerformed:Fire(false)
		
		return false
	end
	local ok_1, status_1 = pcall(function() --[[ line: 380 ]]
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

function t.ignoreMemoryWarning(_) --[[ line: 400 ]]
	-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (ref), communication (ref), crossExperience (ref), var16 (ref)
	if getFFlagEnableCrossExpVoiceMemoryCheck() then
		communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY, {}, var16, var16)
		
		return
	end
end

function t:join(p6) --[[ line: 413 ]]
	-- upvalues: crossExpVoicePlaceId (ref), fFlagFixCrossExperienceVoiceExecutePrint (ref), loggerModule (ref), httpService (ref), memStorageService (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref), playersService (ref), crossExperience (ref), fIntPartyVoiceJoinRequestPulseCheckTimeout (ref), clearTimeout (ref), setTimeout (ref), getFFlagJoinCrossExpVoiceWithPartyId (ref), experienceService (ref), recordJoinAttemptIdForCEVEngineFeature (ref)
	if p6.shouldIgnoreMemoryWarning then
		self.shouldIgnoreMemoryWarning = true
	end
	if not self.isInitialized then
		self:initialize()
	end
	local var19 = tonumber(crossExpVoicePlaceId)
	
	if self.isConnected and not p6.force then
		if fFlagFixCrossExperienceVoiceExecutePrint then
			loggerModule:info("CrossExperienceVoiceManager:join() - already connected, returning early.")
		else
			print("CrossExperienceVoiceManager:join() - already connected, returning early.")
		end
		self.JoinRequestSubmitted:Fire(true)
		
		return
	elseif game:GetEngineFeature("CEVGetBackgroundState") then
		local var20, var21 = self:getIsBackgroundDMActive():await()
		
		if var20 and var21 and not p6.force then
			self:setAsConnected()
			self.JoinRequestSubmitted:Fire(true)
			
			return
		end
	end
	self.currentCevJoinAttemptId = httpService:GenerateGUID(false)
	pcall(function() --[[ line: 447 ]]
		-- upvalues: memStorageService (copy), CEV_JOIN_ATTEMPT_ID_KEY (copy), self (ref)
		memStorageService:SetItem(CEV_JOIN_ATTEMPT_ID_KEY, self.currentCevJoinAttemptId)
	end)
	self.voiceAnalytics:logPartyVoiceJoinAttempt({
		isConnected = self.isConnected,
		targetPlaceId = var19,
		partyId = p6.partyId,
		userId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0,
		activeDm = if self.isActiveDM then crossExperience.Constants.EXPERIENCE_TYPE_LUAAPP else crossExperience.Constants.EXPERIENCE_TYPE_UGC
	})
	self.JoinRequested:Fire()
	
	if fIntPartyVoiceJoinRequestPulseCheckTimeout > 0 then
		if self.joinRequestPulseCheckId then
			clearTimeout(self.joinRequestPulseCheckId)
			self.joinRequestPulseCheckId = nil
		end
		self.joinRequestPulseCheckId = setTimeout(function() --[[ line: 467 ]]
			-- upvalues: self (ref)
			self.JoinRequestPulseCheck:Fire()
		end, fIntPartyVoiceJoinRequestPulseCheckTimeout)
	end
	self.isConnected = true
	
	if getFFlagJoinCrossExpVoiceWithPartyId() then
		if p6 and p6.partyId then
			self.currentPartyId = p6.partyId
			local ok, status = pcall(function() --[[ line: 492 ]]
				-- upvalues: loggerModule (copy), p6 (ref), experienceService (copy), crossExperience (copy), var19 (ref), recordJoinAttemptIdForCEVEngineFeature (copy), self (ref)
				loggerModule:info("CrossExperienceVoiceManager:join() - starting cross experience voice with partyId " .. p6.partyId)
				experienceService:StartCrossExperience(crossExperience.Constants.EXPERIENCE_TYPE_VOICE, {
					partyId = p6.partyId,
					placeId = var19,
					joinAttemptId = if recordJoinAttemptIdForCEVEngineFeature then self.currentCevJoinAttemptId else nil
				})
			end)
			
			if not ok then
				if fFlagFixCrossExperienceVoiceExecutePrint then
					loggerModule:warning("Failed to join cross experience voice with partyId " .. p6.partyId, status)
				else
					loggerModule:warn("Failed to join cross experience voice with partyId " .. p6.partyId, status)
				end
				self.voiceAnalytics:logPartyVoiceJoinFailure(p6.partyId, status, if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
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
		local ok, status = pcall(function() --[[ line: 514 ]]
			-- upvalues: loggerModule (copy), experienceService (copy), crossExperience (copy), var19 (ref), recordJoinAttemptIdForCEVEngineFeature (copy), self (ref)
			loggerModule:info("CrossExperienceVoiceManager:join() - starting cross experience voice")
			experienceService:StartCrossExperience(crossExperience.Constants.EXPERIENCE_TYPE_VOICE, {
				placeId = var19,
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

function t.changeInputDevice(_, p7, p8) --[[ line: 536 ]]
	-- upvalues: communication (ref), crossExperience (ref), var16 (ref)
	communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE, { deviceName = p7, deviceGuid = p8 }, var16, var16)
end

function t.changeOutputDevice(_, p9, p10) --[[ line: 543 ]]
	-- upvalues: communication (ref), crossExperience (ref), var16 (ref)
	communication.execute(crossExperience.Constants.COMMUNICATIONS.EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE, { deviceName = p9, deviceGuid = p10 }, var16, var16)
end

function t:muteVoiceParticipant(p11) --[[ line: 550 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, { userId = p11 })
	self.voiceAnalytics:logPartyVoiceMuteParticipant(self.currentPartyId, p11)
end

function t:unmuteVoiceParticipant(p12) --[[ line: 558 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, { userId = p12 })
	self.voiceAnalytics:logPartyVoiceUnmuteParticipant(self.currentPartyId, p12)
end

function t:enableVoiceChanger(p13) --[[ line: 566 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER, { userId = p13 })
end

function t:disableVoiceChanger(p14) --[[ line: 574 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER, { userId = p14 })
end

function t:setVoicePack(p15) --[[ line: 582 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.SET_PARTY_VOICE_PACK, { voicePackName = p15 })
end

function t:enableHearMyself(p16) --[[ line: 590 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.ENABLE_PARTY_VOICE_CHANGER_FEEDBACK, { userId = p16 })
end

function t:disableHearMyself(p17) --[[ line: 596 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.DISABLE_PARTY_VOICE_CHANGER_FEEDBACK, { userId = p17 })
end

function t:blockVoiceParticipant(p18) --[[ line: 602 ]]
	-- upvalues: crossExperience (ref)
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, { userId = p18 })
		self.voiceAnalytics:logPartyVoiceBlockParticipant(self.currentPartyId, p18)
	end
end

function t:unblockVoiceParticipant(p19) --[[ line: 612 ]]
	-- upvalues: crossExperience (ref)
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, { userId = p19 })
		self.voiceAnalytics:logPartyVoiceUnblockParticipant(self.currentPartyId, p19)
	end
end

function t:dumpDebugData() --[[ line: 622 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.DEBUG_COMMAND, { name = "dump_session" })
end

function t:leave() --[[ line: 628 ]]
	-- upvalues: experienceService (ref), crossExperience (ref), clearTimeout (ref)
	experienceService:StopCrossExperience(crossExperience.Constants.EXPERIENCE_TYPE_VOICE, {})
	
	if self.joinRequestPulseCheckId then
		clearTimeout(self.joinRequestPulseCheckId)
		self.joinRequestPulseCheckId = nil
	end
	self.voiceAnalytics:reset()
end

function t:rejoinVoice() --[[ line: 639 ]]
	-- upvalues: crossExperience (ref)
	self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_RECONNECT_REQUESTED, {})
end

function t:resetCEVMemStorage() --[[ line: 643 ]]
	-- upvalues: memStorageService (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref)
	self.currentCevJoinAttemptId = nil
	pcall(function() --[[ line: 645 ]]
		-- upvalues: memStorageService (copy), CEV_JOIN_ATTEMPT_ID_KEY (copy)
		memStorageService:RemoveItem(CEV_JOIN_ATTEMPT_ID_KEY)
	end)
end

function t:disconnect() --[[ line: 650 ]]
	-- upvalues: loggerModule (ref), clearTimeout (ref), var14 (ref)
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
	var14.clean()
end

function t.getAudioFocusService(_) --[[ line: 668 ]]
	-- upvalues: audioFocusManagementEngineFeature (ref)
	if not audioFocusManagementEngineFeature then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 674 ]]
		return game:GetService("AudioFocusService")
	end)
	
	return if ok and status then status else nil
end

function t:getCurrentAudioContext() --[[ line: 684 ]]
	local audioFocusService = self:getAudioFocusService()
	
	return if audioFocusService == nil then -1 else audioFocusService:GetFocusedContextId()
end

function t:toggleAudioFocus() --[[ line: 693 ]]
	-- upvalues: AUDIO_FOCUS_MANAGEMENT (ref)
	local audioFocusService = self:getAudioFocusService()
	
	if audioFocusService == nil then return end
	local registeredContexts = audioFocusService:GetRegisteredContexts()
	local var25 = false
	local var26 = false
	
	for i, v in pairs(registeredContexts) do
		if i == AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID then
			var25 = true
		end
		if i == AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID then
			var26 = true
		end
	end
	if var25 and var26 then
		audioFocusService:AcquireFocus(if audioFocusService:GetFocusedContextId() == AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID then AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID else AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID)
		
		return
	end
end

function t:muteAll(p20) --[[ line: 722 ]]
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), crossExperience (ref)
	if not getFFlagEnableCrossExperienceVoiceCaptureMute() then return end
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_MUTE_ALL, { context = p20 })
	end
end

function t:unmuteAll(p21) --[[ line: 733 ]]
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), crossExperience (ref)
	if not getFFlagEnableCrossExperienceVoiceCaptureMute() then return end
	if self.isConnected then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.PARTY_VOICE_UNMUTE_ALL, { context = p21 })
	end
end

function t:signalCevReadinessSync() --[[ line: 744 ]]
	-- upvalues: crossExperience (ref)
	if game:GetEngineFeature("CevReadinessSync") then
		self.cevEventManager:notify(crossExperience.Constants.EVENTS.FOREGROUND_UI_READY, {})
		
		return
	end
end

t.default = t.new()

return t