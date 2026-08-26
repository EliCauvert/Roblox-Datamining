local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local playersService = game:GetService("Players")
local analyticsModule = require(crossExperienceVoice.Analytics)
local flagsModule = require(crossExperienceVoice.Flags)
local loggingProtocol = dependenciesModule.LoggingProtocol
local crossExperience = dependenciesModule.CrossExperience
local getMemStorageKey = crossExperience.Utils.getMemStorageKey
local t = {}
t.__index = t
local CEV_JOIN_ATTEMPT_ID_KEY = crossExperience.Constants.CEV_JOIN_ATTEMPT_ID_KEY

function t.new()
	-- upvalues: analyticsModule (ref), t (ref)
	local t_1 = {
		previousStatus = nil,
		isInitialized = false,
		eventManager = nil,
		connections = {},
		analytics = analyticsModule.Analytics()
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:initialize(p1)
	self.eventManager = p1
	self.isInitialized = true
end

function t:fireCEVAnalyticsEvent(p1, p2)
	-- upvalues: getMemStorageKey (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref)
	p2 = p2 or {}
	p2.cevJoinAttemptId = getMemStorageKey(CEV_JOIN_ATTEMPT_ID_KEY)
	p2.clientTimeStamp = os.time()
	self.analytics.fireAnalyticsEvent(p1, p2)
end

function t:logPartyVoiceTimeout(p1)
	-- upvalues: analyticsModule (ref), crossExperience (ref), playersService (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
			partyId = p1 or "",
			status = crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT,
			previousStatus = self.previousStatus or "",
			userId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0
		})
		
		return
	end
end

function t:logPartyVoiceStatusChanged(p1, p2, p3)
	-- upvalues: flagsModule (ref), analyticsModule (ref)
	if not self.isInitialized then return end
	if self.previousStatus ~= p1.status then
		if not flagsModule.FFlagEnablePartyVoiceStatusChangedDetailAnalytics then
			self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
				partyId = p2 or "",
				status = p1.status,
				previousStatus = self.previousStatus or "",
				voiceChannelId = p1.voiceChannelId,
				voiceSessionId = p1.voiceSessionId,
				userId = p1.userId
			})
		elseif flagsModule.FFlagPartyVoiceLogActiveDM then
			self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
				partyId = p2 or "",
				status = p1.status,
				detail = p1.detail or "",
				previousStatus = self.previousStatus or "",
				voiceChannelId = p1.voiceChannelId,
				voiceSessionId = p1.voiceSessionId,
				userId = p1.userId,
				activeDm = p3 or ""
			})
		else
			self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
				activeDm = "",
				partyId = p2 or "",
				status = p1.status,
				detail = p1.detail or "",
				previousStatus = self.previousStatus or "",
				voiceChannelId = p1.voiceChannelId,
				voiceSessionId = p1.voiceSessionId,
				userId = p1.userId
			})
		end
	end
	self.previousStatus = p1.status
end

function t:logPartyVoiceConnectedState(p1, p2, p3)
	-- upvalues: flagsModule (ref), analyticsModule (ref)
	if not self.isInitialized then return end
	if flagsModule.FFlagPartyVoiceLogActiveDM then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
			userId = if p1.userId then p1.userId else 0,
			partyId = p2 or "",
			status = if p1.status then p1.status else "",
			voiceChannelId = if p1.voiceChannelId then p1.voiceChannelId else "",
			voiceSessionId = if p1.voiceSessionId then p1.voiceSessionId else "",
			voicePlaySessionId = if p1.voicePlaySessionId then p1.voicePlaySessionId else "",
			participants = if p1.participants then p1.participants else "",
			numberActive = p1.numberActive or 0,
			activeDm = p3 or ""
		})
	else
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
			activeDm = "",
			userId = if p1.userId then p1.userId else 0,
			partyId = p2 or "",
			status = if p1.status then p1.status else "",
			voiceChannelId = if p1.voiceChannelId then p1.voiceChannelId else "",
			voiceSessionId = if p1.voiceSessionId then p1.voiceSessionId else "",
			voicePlaySessionId = if p1.voicePlaySessionId then p1.voicePlaySessionId else "",
			participants = if p1.participants then p1.participants else "",
			numberActive = p1.numberActive or 0
		})
	end
	self:logLaunchFlowEndEvent()
end

function t:logPartyVoiceJoinAttempt(p1)
	-- upvalues: flagsModule (ref), analyticsModule (ref)
	if not self.isInitialized then return end
	if flagsModule.FFlagPartyVoiceLogActiveDM then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceJoinAttempt, {
			userId = if p1.userId then p1.userId else 0,
			partyId = if p1.partyId then p1.partyId else "",
			targetPlaceId = if p1.targetPlaceId then p1.targetPlaceId else 0,
			isConnected = if p1.isConnected then p1.isConnected else false,
			activeDm = if p1.activeDm then p1.activeDm else ""
		})
	else
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceJoinAttempt, {
			activeDm = "",
			userId = if p1.userId then p1.userId else 0,
			partyId = if p1.partyId then p1.partyId else "",
			targetPlaceId = if p1.targetPlaceId then p1.targetPlaceId else 0,
			isConnected = if p1.isConnected then p1.isConnected else false
		})
	end
	self:logLaunchFlowBeginEvent()
end

function t.logLaunchFlowBeginEvent(_)
	-- upvalues: loggingProtocol (ref)
	loggingProtocol.default:logEvent("party_voice_launch_flow_begin")
end

function t.logLaunchFlowEndEvent(_)
	-- upvalues: loggingProtocol (ref)
	loggingProtocol.default:logEvent("party_voice_launch_flow_end")
end

function t:logPartyVoiceJoinFailure(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceJoinFailure, {
			partyId = p1,
			errorMessage = p2 or "",
			userId = p3 or 0
		})
		
		return
	end
end

function t:logPartyVoiceUnmuteParticipant(p1, p2)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceUnmuteParticipant, { partyId = p1, userId = p2 or 0 })
		
		return
	end
end

function t:logPartyVoiceMuteParticipant(p1, p2)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceMuteParticipant, { partyId = p1, userId = p2 or 0 })
		
		return
	end
end

function t:logPartyVoiceBlockParticipant(p1, p2)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceBlockParticipant, { partyId = p1, userId = p2 or 0 })
		
		return
	end
end

function t:logPartyVoiceUnblockParticipant(p1, p2)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceUnblockParticipant, { partyId = p1, userId = p2 or 0 })
		
		return
	end
end

function t:logPartyVoiceOnCrossExperienceStartedSignalReceived(p1, p2)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceOnCrossExperienceStartedSignalReceived, { hasExperienceStarted = p1, isActiveDM = p2 })
		
		return
	end
end

function t:logPartyVoiceStateChangeHandlerRun(p1, p2)
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChangeHandlerRun, {
			isActiveDM = p1,
			status = p2.status,
			detail = p2.detail or ""
		})
		
		return
	end
end

function t:reset()
	self.previousStatus = nil
end

t.default = t.new()

return t