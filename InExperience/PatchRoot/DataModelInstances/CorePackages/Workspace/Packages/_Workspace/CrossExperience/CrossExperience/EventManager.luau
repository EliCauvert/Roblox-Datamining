local httpService = game:GetService("HttpService")
local crossExperience = script:FindFirstAncestor("CrossExperience")
local dependenciesModule = require(crossExperience.dependencies)
local _ = require(crossExperience.Types)
local communicationModule = require(crossExperience.Communication)
local constantsModule = require(crossExperience.Constants)
local actionsModule = require(crossExperience.Actions)
local modelsModule = require(crossExperience.Models)
local utilsModule = require(crossExperience.Utils)
local eventQueueModule = require(crossExperience.Utils.EventQueue)
local createPersistenceMiddlewareModule = require(crossExperience.Middlewares.createPersistenceMiddleware)
local enableCrossExpEventLogging = game:DefineFastFlag("EnableCrossExpEventLogging", false)
local sharedFlags = dependenciesModule.SharedFlags
local fFlagPartyVoiceBlockSync = sharedFlags.FFlagPartyVoiceBlockSync
local fFlagEnablePartyVoiceChangersInLua = sharedFlags.FFlagEnablePartyVoiceChangersInLua
local cryo = dependenciesModule.Cryo
local var11 = 0
local var12 = httpService:GenerateGUID(false)
local t = {}
t.__index = t

function t.new(p0, p1)
	-- upvalues: eventQueueModule (ref), t (ref)
	local t_1 = {
		isSubscribed = false,
		observers = {},
		experienceType = p0,
		eventQueue = eventQueueModule.new(p1)
	}
	setmetatable(t_1, t)
	
	return t_1
end

local _ = function(p2)
	return {
		userId = tonumber(p2.userId) or -1,
		isLocalUser = p2.isLocalUser
	}
end

function t.notify(_, p3, p4)
	-- upvalues: var11 (write), var12 (ref), communicationModule (ref)
	if not p4 then
		p4 = {}
	end
	var11 += 1
	p4._seq = var11
	p4._origin = var12
	communicationModule.notify(p3, p4)
end

function t:removeObserver(p5, p6)
	-- upvalues: communicationModule (ref)
	communicationModule.removeObserver(self.experienceType, p6, p5)
end

function t:addObserver(p7, p8)
	-- upvalues: communicationModule (ref)
	table.insert(self.observers, {
		id = communicationModule.addObserver(self.experienceType, p7, function(p9)
			-- upvalues: self (ref), p7 (ref), p8 (ref)
			self.eventQueue:process(p7, p9, p8)
		end),
		event = p7
	})
end

local var14 = createPersistenceMiddlewareModule({ storeKey = constantsModule.STORAGE_CEV_STORE_KEY })

function t:subscribe(p10, p11)
	-- upvalues: enableCrossExpEventLogging (ref), constantsModule (ref), actionsModule (ref), cryo (ref), modelsModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), fFlagPartyVoiceBlockSync (ref)
	if self.isSubscribed then return end
	self.isSubscribed = true
	
	if p11 and enableCrossExpEventLogging then
		p11:info("{}: Subscribing to the CEV Store", self.experienceType)
	end
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_GAME_JOIN_FAILED, function(p12)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy), constantsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Experience Party Voice Game Join Failed: {}", self.experienceType, p12.state)
		end
		p10:dispatch(actionsModule.VoiceStatusChanged({
			status = constantsModule.VOICE_STATUS.ERROR_RCC_CONNECTING
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_STATUS_CHANGED, function(p13)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), constantsModule (copy), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Experience Voice Status Changed: {}, {}, {}, {}", self.experienceType, p13.status, p13.detail, p13.voiceChannelId, p13.voiceSessionId)
		end
		if p13.status == constantsModule.VOICE_STATUS.VOICE_CONNECTED then
			if not p13.voiceChannelId and p11 then
				p11:warning("Voice channel id is expected")
			end
			if not p13.voiceSessionId then
				p11:warning("Voice session id is expected")
			end
		end
		p10:dispatch(actionsModule.VoiceStatusChanged({
			status = p13.status,
			voiceChannelId = p13.voiceChannelId,
			voiceSessionId = p13.voiceSessionId
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_EXPERIENCE_JOINED, function(p14)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), cryo (copy), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Experience joined JobID: {}, GameID: {}, PlaceId: {}", self.experienceType, p14.jobId, p14.gameId, p14.placeId)
		end
		local backgroundStateSnapshot = self:getBackgroundStateSnapshot()
		local var17 = p14
		
		if backgroundStateSnapshot and backgroundStateSnapshot.Participants then
			var17 = cryo.Dictionary.join(var17, backgroundStateSnapshot.Participants)
		end
		p10:dispatch(actionsModule.ExperienceJoined(var17))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED, function(p15)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant Audio Focus Changed {} = {}", self.experienceType, p15.userId, p15.contextId)
		end
		p10:dispatch(actionsModule.ParticipantAudioFocusChanged({
			userId = p15.userId,
			contextId = p15.contextId,
			contextIds = p15.contextIds
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_ADDED, function(p16)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), modelsModule (copy), fFlagEnablePartyVoiceChangersInLua (copy), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant added {}", self.experienceType, p16.userId)
		end
		p10:dispatch(actionsModule.ParticipantAdded(modelsModule.ParticipantModel.format({
			isActive = false,
			isMuted = false,
			isMutedLocally = false,
			userId = p16.userId,
			isLocalUser = p16.isLocalUser,
			username = p16.username,
			displayname = p16.displayname,
			isVoiceChangerActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
			isVoiceChangerHearMyselfActive = if fFlagEnablePartyVoiceChangersInLua then false else nil,
			selectedVoicePack = if fFlagEnablePartyVoiceChangersInLua then p16.selectedVoicePack else nil
		})))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_REMOVED, function(p17)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant removed {}", self.experienceType, p17.userId)
		end
		p10:dispatch(actionsModule.ParticipantRemoved({
			userId = tonumber(p17.userId) or -1,
			isLocalUser = p17.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_IS_ACTIVE, function(p18)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant is active {}", self.experienceType, p18.userId)
		end
		p10:dispatch(actionsModule.ParticipantIsActive({
			userId = tonumber(p18.userId) or -1,
			isLocalUser = p18.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_IS_INACTIVE, function(p19)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant is inactive {}", self.experienceType, p19.userId)
		end
		p10:dispatch(actionsModule.ParticipantIsInactive({
			userId = tonumber(p19.userId) or -1,
			isLocalUser = p19.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_MUTED, function(p20)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant is was muted {}", self.experienceType, p20.userId)
		end
		p10:dispatch(actionsModule.ParticipantWasMuted({
			userId = tonumber(p20.userId) or -1,
			isLocalUser = p20.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PARTICIPANT_WAS_UNMUTED, function(p21)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant is was unmuted {}", self.experienceType, p21.userId)
		end
		p10:dispatch(actionsModule.ParticipantWasUnmuted({
			userId = tonumber(p21.userId) or -1,
			isLocalUser = p21.isLocalUser
		}))
	end)
	
	if fFlagEnablePartyVoiceChangersInLua then
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_WAS_ENABLED, function(p22)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant voice changer was enabled {}", self.experienceType, p22.userId)
			end
			p10:dispatch(actionsModule.VoiceChangerWasEnabled({
				userId = tonumber(p22.userId) or -1,
				isLocalUser = p22.isLocalUser
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_WAS_DISABLED, function(p23)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant voice changer was disabled {}", self.experienceType, p23.userId)
			end
			p10:dispatch(actionsModule.VoiceChangerWasDisabled({
				userId = tonumber(p23.userId) or -1,
				isLocalUser = p23.isLocalUser
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_PACK_WAS_SET, function(p24)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant {} voice pack was set to {}", self.experienceType, p24.userId, p24.voicePackName)
			end
			p10:dispatch(actionsModule.VoicePackWasSet({
				userId = tonumber(p24.userId) or -1,
				isLocalUser = p24.isLocalUser,
				voicePackName = p24.voicePackName
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED, function(p25)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant voice changer feedback was enabled {}", self.experienceType, p25.userId)
			end
			p10:dispatch(actionsModule.VoiceChangerFeedbackWasEnabled({
				userId = tonumber(p25.userId) or -1,
				isLocalUser = p25.isLocalUser
			}))
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED, function(p26)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant voice changer feedback was disabled {}", self.experienceType, p26.userId)
			end
			p10:dispatch(actionsModule.VoiceChangerFeedbackWasDisabled({
				userId = tonumber(p26.userId) or -1,
				isLocalUser = p26.isLocalUser
			}))
		end)
	end
	self:addObserver(constantsModule.EVENTS.MUTE_PARTY_VOICE_PARTICIPANT, function(p27)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant is muted locally {}", self.experienceType, p27.userId)
		end
		p10:dispatch(actionsModule.MuteParticipant({
			userId = tonumber(p27.userId) or -1,
			isLocalUser = p27.isLocalUser
		}))
	end)
	self:addObserver(constantsModule.EVENTS.UNMUTE_PARTY_VOICE_PARTICIPANT, function(p28)
		-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref), p10 (ref), actionsModule (copy)
		if p11 and enableCrossExpEventLogging then
			p11:info("{}: Participant is unmuted locally {}", self.experienceType, p28.userId)
		end
		p10:dispatch(actionsModule.UnmuteParticipant({
			userId = tonumber(p28.userId) or -1,
			isLocalUser = p28.isLocalUser
		}))
	end)
	
	if fFlagPartyVoiceBlockSync then
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_BLOCK_PARTICIPANT, function(p29)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant was blocked {} from party voice", self.experienceType, p29.userId)
			end
		end)
		self:addObserver(constantsModule.EVENTS.PARTY_VOICE_UNBLOCK_PARTICIPANT, function(p30)
			-- upvalues: p11 (ref), enableCrossExpEventLogging (copy), self (ref)
			if p11 and enableCrossExpEventLogging then
				p11:info("{}: Participant was unblocked {} from party voice", self.experienceType, p30.userId)
			end
		end)
	end
end

function t.getBackgroundStateSnapshot(_)
	-- upvalues: var14 (ref), utilsModule (ref)
	local var18 = var14.restore()
	
	return if var18 and var18.Squad and var18.Squad.CrossExperienceVoice then {
		Experience = var18.Squad.CrossExperienceVoice.Experience,
		Participants = {
			participants = utilsModule.stringMapToNumberMap(var18.Squad.CrossExperienceVoice.Participants.participants),
			activeUserIds = var18.Squad.CrossExperienceVoice.Participants.activeUserIds,
			publicVoiceFocusedUserIds = utilsModule.stringMapToNumberMap(var18.Squad.CrossExperienceVoice.Participants.publicVoiceFocusedUserIds)
		}
	} else nil
end

function t:restoreStateFromBackground(p31, p32)
	-- upvalues: enableCrossExpEventLogging (ref), httpService (ref), actionsModule (ref)
	local backgroundStateSnapshot = self:getBackgroundStateSnapshot()
	
	if backgroundStateSnapshot then
		if p32 and enableCrossExpEventLogging then
			p32:info("{}: Restoring state from background {}", self.experienceType, httpService:JSONEncode(backgroundStateSnapshot))
		end
		p31:dispatch(actionsModule.RestoreState(backgroundStateSnapshot))
	end
end

function t:unsubscribe(p33, p34)
	-- upvalues: enableCrossExpEventLogging (ref), actionsModule (ref)
	if p34 and enableCrossExpEventLogging then
		p34:info("{}: Unsubscribing from the CEV Store", self.experienceType)
	end
	p33:dispatch(actionsModule.ExperienceLeft())
	
	for i, v in ipairs(self.observers) do
		self:removeObserver(v.id, v.event)
	end
	self.isSubscribed = false
	self.observers = {}
	self.eventQueue:reset()
end

return t