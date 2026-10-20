local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local DependenciesModule = require(CrossExperienceVoice.dependencies)
local Players = game:GetService("Players")
local AnalyticsModule = require(CrossExperienceVoice.Analytics)
local FlagsModule = require(CrossExperienceVoice.Flags)
local LoggingProtocol = DependenciesModule.LoggingProtocol
local CrossExperience = DependenciesModule.CrossExperience
local GetMemStorageKeyFunction = CrossExperience.Utils.getMemStorageKey
local CrossExperienceVoiceAnalyticsModule = {}
CrossExperienceVoiceAnalyticsModule.__index = CrossExperienceVoiceAnalyticsModule
local CEVJOINATTEMPTIDKEY = CrossExperience.Constants.CEV_JOIN_ATTEMPT_ID_KEY

function CrossExperienceVoiceAnalyticsModule.new()
	-- upvalues: AnalyticsModule (copy), CrossExperienceVoiceAnalyticsModule (copy)
	local config = {
		previousStatus = nil,
		isInitialized = false,
		eventManager = nil,
		connections = {},
		analytics = AnalyticsModule.Analytics()
	}
	setmetatable(config, CrossExperienceVoiceAnalyticsModule)
	
	return config
end

function CrossExperienceVoiceAnalyticsModule:initialize(EventManager)
	self.eventManager = EventManager
	self.isInitialized = true
end

function CrossExperienceVoiceAnalyticsModule:fireCEVAnalyticsEvent(PartyVoiceStateChanged, p1)
	-- upvalues: GetMemStorageKeyFunction (copy), CEVJOINATTEMPTIDKEY (copy)
	local P4 = p1 or {}
	P4.cevJoinAttemptId = GetMemStorageKeyFunction(CEVJOINATTEMPTIDKEY)
	P4.clientTimeStamp = os.time()
	self.analytics.fireAnalyticsEvent(PartyVoiceStateChanged, P4)
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceTimeout(p1)
	-- upvalues: AnalyticsModule (copy), CrossExperience (copy), Players (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceStateChanged, {
			partyId = p1 or "",
			status = CrossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT,
			previousStatus = self.previousStatus or "",
			userId = if Players.LocalPlayer then Players.LocalPlayer.UserId else 0
		})
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceStatusChanged(p1, p2, p3)
	-- upvalues: FlagsModule (copy), AnalyticsModule (copy)
	if not self.isInitialized then return end
	if self.previousStatus ~= p1.status then
		if FlagsModule.FFlagEnablePartyVoiceStatusChangedDetailAnalytics then
			if FlagsModule.FFlagPartyVoiceLogActiveDM then
				self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceStateChanged, {
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
				self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceStateChanged, {
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
		else
			self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceStateChanged, {
				partyId = p2 or "",
				status = p1.status,
				previousStatus = self.previousStatus or "",
				voiceChannelId = p1.voiceChannelId,
				voiceSessionId = p1.voiceSessionId,
				userId = p1.userId
			})
		end
	end
	self.previousStatus = p1.status
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceConnectedState(p1, p2, p3)
	-- upvalues: FlagsModule (copy), AnalyticsModule (copy)
	if not self.isInitialized then return end
	if FlagsModule.FFlagPartyVoiceLogActiveDM then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
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
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
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

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceJoinAttempt(p1)
	-- upvalues: FlagsModule (copy), AnalyticsModule (copy)
	if not self.isInitialized then return end
	if FlagsModule.FFlagPartyVoiceLogActiveDM then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceJoinAttempt, {
			userId = if p1.userId then p1.userId else 0,
			partyId = if p1.partyId then p1.partyId else "",
			targetPlaceId = if p1.targetPlaceId then p1.targetPlaceId else 0,
			isConnected = if p1.isConnected then p1.isConnected else false,
			activeDm = if p1.activeDm then p1.activeDm else ""
		})
	else
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceJoinAttempt, {
			activeDm = "",
			userId = if p1.userId then p1.userId else 0,
			partyId = if p1.partyId then p1.partyId else "",
			targetPlaceId = if p1.targetPlaceId then p1.targetPlaceId else 0,
			isConnected = if p1.isConnected then p1.isConnected else false
		})
	end
	self:logLaunchFlowBeginEvent()
end

function CrossExperienceVoiceAnalyticsModule:logLaunchFlowBeginEvent()
	-- upvalues: LoggingProtocol (copy)
	LoggingProtocol.default:logEvent("party_voice_launch_flow_begin")
end

function CrossExperienceVoiceAnalyticsModule:logLaunchFlowEndEvent()
	-- upvalues: LoggingProtocol (copy)
	LoggingProtocol.default:logEvent("party_voice_launch_flow_end")
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceJoinFailure(PartyId, p1, p2)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceJoinFailure, {
			partyId = PartyId,
			errorMessage = p1 or "",
			userId = p2 or 0
		})
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceUnmuteParticipant(PartyId, p1)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceUnmuteParticipant, { partyId = PartyId, userId = p1 or 0 })
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceMuteParticipant(PartyId, p1)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceMuteParticipant, { partyId = PartyId, userId = p1 or 0 })
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceBlockParticipant(PartyId, p1)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceBlockParticipant, { partyId = PartyId, userId = p1 or 0 })
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceUnblockParticipant(PartyId, p1)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceUnblockParticipant, { partyId = PartyId, userId = p1 or 0 })
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceOnCrossExperienceStartedSignalReceived(HasExperienceStarted, IsActiveDM)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceOnCrossExperienceStartedSignalReceived, {
			hasExperienceStarted = HasExperienceStarted,
			isActiveDM = IsActiveDM
		})
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:logPartyVoiceStateChangeHandlerRun(IsActiveDM, p1)
	-- upvalues: AnalyticsModule (copy)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(AnalyticsModule.EventNames.PartyVoiceStateChangeHandlerRun, {
			isActiveDM = IsActiveDM,
			status = p1.status,
			detail = p1.detail or ""
		})
		
		return
	end
end

function CrossExperienceVoiceAnalyticsModule:reset()
	self.previousStatus = nil
end

CrossExperienceVoiceAnalyticsModule.default = CrossExperienceVoiceAnalyticsModule.new()

return CrossExperienceVoiceAnalyticsModule