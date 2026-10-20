local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Immutable = require(Parent.AppCommonLib).Immutable
local MessageModelModule = require(AppChat.Models.MessageModel)
local _DateTime = require(Parent.Time).DateTime
local ReceivedChatResponseModule = require(AppChat.Conversations.Thunks.ReceivedChatResponse)
local SendingMessageModule = require(AppChat.Conversations.Actions.SendingMessage)
local SentMessageModule = require(AppChat.Conversations.Actions.SentMessage)
local StatusCodes = require(Parent.Http).StatusCodes
local MessageFailedToSendModule = require(AppChat.Conversations.Actions.MessageFailedToSend)
local MessageModeratedModule = require(AppChat.Conversations.Actions.MessageModerated)
local ResponseStatus = require(Parent.AppChatNetworking).Constants.ResponseStatus
local NavigateIntoChatModule = require(AppChat.Actions.NavigateIntoChat)
local ReceivedChannelsMigrationConflictModule = require(AppChat.Conversations.Actions.ReceivedChannelsMigrationConflict)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local _ = require(AppChat.Models.ConversationChannels)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local Count = 0
local NewResult = require(AppChat.Logger):new(script.Name)

local function _(): number
	-- upvalues: Count (ref)
	Count += 1
	
	return Count
end

local self = setmetatable({}, (require(script.Parent.SendMessagePolicy)))
self.__index = self

function self.new(p1, ConversationId, ReplyingToMessage)
	-- upvalues: MessageModelModule (copy)
	return (setmetatable({
		messageSendingId = MessageModelModule.newSendingId(),
		conversationId = ConversationId,
		replyingToMessage = ReplyingToMessage
	}, p1))
end

function self:onBeforeSendingMessage(p1)
	-- upvalues: NewResult (copy), GetDeepValue2Module (copy), MessageModelModule (copy), Immutable (copy), Count (ref), _DateTime (copy), SendingMessageModule (copy)
	NewResult:trace("onBeforeSendingMessage conversationId: {} messageSendingId: {}, replyingToId: {}", self.conversationId, self.messageSendingId, if self.replyingToMessage then self.replyingToMessage.id else nil)
	local DeepValue2Module = GetDeepValue2Module(p1:getState(), `ChatAppReducer.Conversations.{self.conversationId}`)
	Count += 1
	local Sending = MessageModelModule.newSending(Immutable.JoinDictionaries({
		id = self.messageSendingId,
		order = Count,
		conversationId = self.conversationId,
		repliesTo = self.replyingToMessage,
		sent = _DateTime.now(),
		moderationType = DeepValue2Module and DeepValue2Module.moderationType
	}, self:sendingMessagePayload()))
	self.sendingMessageStableKey = Sending.stableKey
	assert(Sending, "Failed to create sending message placeholder")
	p1:dispatch(SendingMessageModule(self.conversationId, Sending))
end

function self:sendingMessagePayload()
	error("Override me")
end

function self:onSuccess(p1, p2)
	-- upvalues: NewResult (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), SentMessageModule (copy), ReceivedChatResponseModule (copy)
	NewResult:debug("Message sent successfully. conversationId: {} messageSendingId: {} replyingToId: {}", self.conversationId, self.messageSendingId, if self.replyingToMessage then self.replyingToMessage.id else nil)
	
	if FFlagAppChatPerfTrackingModule then
		if FFlagAppChatMessageTTIMilestonesModule then
			local config = { conversationId = self.conversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
		else
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, { conversationId = self.conversationId })
		end
	end
	p1:dispatch(SentMessageModule(self.conversationId, self.messageSendingId))
	p1:dispatch(ReceivedChatResponseModule(self.conversationId, p2.responseBody, self.sendingMessageStableKey))
	
	return p2
end

function self:onFailure(p1, p2)
	-- upvalues: NewResult (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), StatusCodes (copy), ReceivedChannelsMigrationConflictModule (copy), NavigateIntoChatModule (copy), EnumScreensModule (copy), MessageFailedToSendModule (copy), ResponseStatus (copy), MessageModeratedModule (copy)
	NewResult:error("Failed to send message. conversationId: {}, messageSendingId: {}, responseCode: {}", self.conversationId, self.messageSendingId, p2.responseCode)
	
	if FFlagAppChatPerfTrackingModule then
		if FFlagAppChatMessageTTIMilestonesModule then
			local config = { conversationId = self.conversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, AppChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, config)
		else
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, { conversationId = self.conversationId })
		end
	end
	if not p2 or ((if p2.responseCode == nil then if p2.StatusCode == nil then not p2.responseBody else p2.StatusCode ~= StatusCodes.OK or not p2.responseBody else p2.responseCode ~= StatusCodes.OK or (if p2.StatusCode == nil then not p2.responseBody else p2.StatusCode ~= StatusCodes.OK or not p2.responseBody)) or (not p2.responseBody.messages or #p2.responseBody.messages == 0)) then
		if p2.StatusCode == StatusCodes.CONFLICT then
			NewResult:error("Message sent conflicting system (409). Reloading messages...")
			p1:dispatch(ReceivedChannelsMigrationConflictModule())
			p1:dispatch(NavigateIntoChatModule({
				screen = EnumScreensModule.ChatLanding,
				params = { key = tostring(os.clock()) }
			}))
			
			return p2
		else
			p1:dispatch(MessageFailedToSendModule(self.conversationId, self.messageSendingId))
			NewResult:error("Message could not be sent, no response body or no messages in response body")
			
			return p2
		end
	elseif p2.responseBody.messages[1].status and p2.responseBody.messages[1].status == ResponseStatus.MODERATED then
		p1:dispatch(MessageModeratedModule(self.conversationId, self.messageSendingId))
		NewResult:error("Message was moderated.")
		
		return p2
	else
		p1:dispatch(MessageFailedToSendModule(self.conversationId, self.messageSendingId))
		NewResult:error("Message could not be sent, no response body or no messages in response body")
		
		return p2
	end
end

return self