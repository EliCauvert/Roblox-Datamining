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

function t.new() --[[ line: 82 ]]
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

function t:initialize(p0) --[[ line: 94 ]]
	self.eventManager = p0
	self.isInitialized = true
end

function t:fireCEVAnalyticsEvent(p1, p2) --[[ line: 99 ]]
	-- upvalues: getMemStorageKey (ref), CEV_JOIN_ATTEMPT_ID_KEY (ref)
	p2 = p2 or {}
	p2.cevJoinAttemptId = getMemStorageKey(CEV_JOIN_ATTEMPT_ID_KEY)
	p2.clientTimeStamp = os.time()
	self.analytics.fireAnalyticsEvent(p1, p2)
end

function t:logPartyVoiceTimeout(p3) --[[ line: 106 ]]
	-- upvalues: analyticsModule (ref), crossExperience (ref), playersService (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
			partyId = p3 or "",
			status = crossExperience.Constants.VOICE_STATUS.ERROR_RCC_TIMEOUT,
			previousStatus = self.previousStatus or "",
			userId = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0
		})
		
		return
	end
end

function t:logPartyVoiceStatusChanged(p4, p5, p6) --[[ line: 119 ]]
	-- upvalues: flagsModule (ref), analyticsModule (ref)
	if not self.isInitialized then return end
	if self.previousStatus ~= p4.status then
		if not flagsModule.FFlagEnablePartyVoiceStatusChangedDetailAnalytics then
			self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
				partyId = p5 or "",
				status = p4.status,
				previousStatus = self.previousStatus or "",
				voiceChannelId = p4.voiceChannelId,
				voiceSessionId = p4.voiceSessionId,
				userId = p4.userId
			})
		elseif flagsModule.FFlagPartyVoiceLogActiveDM then
			self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
				partyId = p5 or "",
				status = p4.status,
				detail = p4.detail or "",
				previousStatus = self.previousStatus or "",
				voiceChannelId = p4.voiceChannelId,
				voiceSessionId = p4.voiceSessionId,
				userId = p4.userId,
				activeDm = p6 or ""
			})
		else
			self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChanged, {
				activeDm = "",
				partyId = p5 or "",
				status = p4.status,
				detail = p4.detail or "",
				previousStatus = self.previousStatus or "",
				voiceChannelId = p4.voiceChannelId,
				voiceSessionId = p4.voiceSessionId,
				userId = p4.userId
			})
		end
	end
	self.previousStatus = p4.status
end

function t:logPartyVoiceConnectedState(p7, p8, p9) --[[ line: 171 ]]
	-- upvalues: flagsModule (ref), analyticsModule (ref)
	if not self.isInitialized then return end
	if flagsModule.FFlagPartyVoiceLogActiveDM then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
			userId = if p7.userId then p7.userId else 0,
			partyId = p8 or "",
			status = if p7.status then p7.status else "",
			voiceChannelId = if p7.voiceChannelId then p7.voiceChannelId else "",
			voiceSessionId = if p7.voiceSessionId then p7.voiceSessionId else "",
			voicePlaySessionId = if p7.voicePlaySessionId then p7.voicePlaySessionId else "",
			participants = if p7.participants then p7.participants else "",
			numberActive = p7.numberActive or 0,
			activeDm = p9 or ""
		})
	else
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceConnectedParticipantsOnJoin, {
			activeDm = "",
			userId = if p7.userId then p7.userId else 0,
			partyId = p8 or "",
			status = if p7.status then p7.status else "",
			voiceChannelId = if p7.voiceChannelId then p7.voiceChannelId else "",
			voiceSessionId = if p7.voiceSessionId then p7.voiceSessionId else "",
			voicePlaySessionId = if p7.voicePlaySessionId then p7.voicePlaySessionId else "",
			participants = if p7.participants then p7.participants else "",
			numberActive = p7.numberActive or 0
		})
	end
	self:logLaunchFlowEndEvent()
end

function t:logPartyVoiceJoinAttempt(p10) --[[ line: 209 ]]
	-- upvalues: flagsModule (ref), analyticsModule (ref)
	if not self.isInitialized then return end
	if flagsModule.FFlagPartyVoiceLogActiveDM then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceJoinAttempt, {
			userId = if p10.userId then p10.userId else 0,
			partyId = if p10.partyId then p10.partyId else "",
			targetPlaceId = if p10.targetPlaceId then p10.targetPlaceId else 0,
			isConnected = if p10.isConnected then p10.isConnected else false,
			activeDm = if p10.activeDm then p10.activeDm else ""
		})
	else
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceJoinAttempt, {
			activeDm = "",
			userId = if p10.userId then p10.userId else 0,
			partyId = if p10.partyId then p10.partyId else "",
			targetPlaceId = if p10.targetPlaceId then p10.targetPlaceId else 0,
			isConnected = if p10.isConnected then p10.isConnected else false
		})
	end
	self:logLaunchFlowBeginEvent()
end

function t.logLaunchFlowBeginEvent(_) --[[ line: 234 ]]
	-- upvalues: loggingProtocol (ref)
	loggingProtocol.default:logEvent("party_voice_launch_flow_begin")
end

function t.logLaunchFlowEndEvent(_) --[[ line: 238 ]]
	-- upvalues: loggingProtocol (ref)
	loggingProtocol.default:logEvent("party_voice_launch_flow_end")
end

function t:logPartyVoiceJoinFailure(p11, p12, p13) --[[ line: 242 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceJoinFailure, {
			partyId = p11,
			errorMessage = p12 or "",
			userId = p13 or 0
		})
		
		return
	end
end

function t:logPartyVoiceUnmuteParticipant(p14, p15) --[[ line: 254 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceUnmuteParticipant, { partyId = p14, userId = p15 or 0 })
		
		return
	end
end

function t:logPartyVoiceMuteParticipant(p16, p17) --[[ line: 265 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceMuteParticipant, { partyId = p16, userId = p17 or 0 })
		
		return
	end
end

function t:logPartyVoiceBlockParticipant(p18, p19) --[[ line: 276 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceBlockParticipant, { partyId = p18, userId = p19 or 0 })
		
		return
	end
end

function t:logPartyVoiceUnblockParticipant(p20, p21) --[[ line: 287 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceUnblockParticipant, { partyId = p20, userId = p21 or 0 })
		
		return
	end
end

function t:logPartyVoiceOnCrossExperienceStartedSignalReceived(p22, p23) --[[ line: 298 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceOnCrossExperienceStartedSignalReceived, { hasExperienceStarted = p22, isActiveDM = p23 })
		
		return
	end
end

function t:logPartyVoiceStateChangeHandlerRun(p24, p25) --[[ line: 311 ]]
	-- upvalues: analyticsModule (ref)
	if self.isInitialized then
		self:fireCEVAnalyticsEvent(analyticsModule.EventNames.PartyVoiceStateChangeHandlerRun, {
			isActiveDM = p24,
			status = p25.status,
			detail = p25.detail or ""
		})
		
		return
	end
end

function t:reset() --[[ line: 325 ]]
	self.previousStatus = nil
end

t.default = t.new()

return t