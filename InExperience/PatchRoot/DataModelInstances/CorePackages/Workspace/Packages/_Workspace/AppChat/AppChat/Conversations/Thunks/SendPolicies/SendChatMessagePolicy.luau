local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local immutable = require(parent.AppCommonLib).Immutable
local sendMessagePolicyModule = require(script.Parent.SendMessagePolicy)
local messageModelModule = require(appChat.Models.MessageModel)
local dateTime = require(parent.Time).DateTime
local receivedChatResponseModule = require(appChat.Conversations.Thunks.ReceivedChatResponse)
local sendingMessageModule = require(appChat.Conversations.Actions.SendingMessage)
local sentMessageModule = require(appChat.Conversations.Actions.SentMessage)
local statusCodes = require(parent.Http).StatusCodes
local messageFailedToSendModule = require(appChat.Conversations.Actions.MessageFailedToSend)
local messageModeratedModule = require(appChat.Conversations.Actions.MessageModerated)
local responseStatus = require(parent.AppChatNetworking).Constants.ResponseStatus
local navigateIntoChatModule = require(appChat.Actions.NavigateIntoChat)
local receivedChannelsMigrationConflictModule = require(appChat.Conversations.Actions.ReceivedChannelsMigrationConflict)
local enumScreensModule = require(appChat.EnumScreens)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local _ = require(appChat.Models.ConversationChannels)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local var1 = 0
local name = require(appChat.Logger):new(script.Name)

local function _()
	-- upvalues: var1 (write)
	var1 += 1
	
	return var1
end

local tbl = setmetatable({}, sendMessagePolicyModule)
tbl.__index = tbl

function tbl.new(p1, p2, p3)
	-- upvalues: messageModelModule (ref)
	return setmetatable({
		messageSendingId = messageModelModule.newSendingId(),
		conversationId = p2,
		replyingToMessage = p3
	}, p1)
end

function tbl:onBeforeSendingMessage(p1)
	-- upvalues: name (ref), getDeepValue2Module (ref), messageModelModule (ref), immutable (ref), var1 (write), dateTime (ref), sendingMessageModule (ref)
	name:trace("onBeforeSendingMessage conversationId: {} messageSendingId: {}, replyingToId: {}", self.conversationId, self.messageSendingId, if self.replyingToMessage then self.replyingToMessage.id else nil)
	local _ = nil
	local var2 = getDeepValue2Module(p1:getState(), `ChatAppReducer.Conversations.{self.conversationId}`)
	local moderationType = var2 and var2.moderationType
	local newSending = messageModelModule.newSending
	local joinDictionaries = immutable.JoinDictionaries
	local t = {
		id = self.messageSendingId,
		order = var1,
		conversationId = self.conversationId,
		repliesTo = self.replyingToMessage,
		sent = dateTime.now(),
		moderationType = moderationType
	}
	var1 += 1
	newSending = newSending(joinDictionaries(t, self:sendingMessagePayload()))
	self.sendingMessageStableKey = newSending.stableKey
	assert(newSending, "Failed to create sending message placeholder")
	p1:dispatch(sendingMessageModule(self.conversationId, newSending))
end

function tbl.sendingMessagePayload(_)
	error("Override me")
end

function tbl:onSuccess(p1, p2)
	-- upvalues: name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), sentMessageModule (ref), receivedChatResponseModule (ref)
	name:debug("Message sent successfully. conversationId: {} messageSendingId: {} replyingToId: {}", self.conversationId, self.messageSendingId, if self.replyingToMessage then self.replyingToMessage.id else nil)
	
	if fFlagAppChatPerfTrackingModule then
		if fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = self.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
		else
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, { conversationId = self.conversationId })
		end
	end
	p1:dispatch(sentMessageModule(self.conversationId, self.messageSendingId))
	p1:dispatch(receivedChatResponseModule(self.conversationId, p2.responseBody, self.sendingMessageStableKey))
	
	return p2
end

function tbl:onFailure(p1, p2)
	-- upvalues: name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), statusCodes (ref), receivedChannelsMigrationConflictModule (ref), navigateIntoChatModule (ref), enumScreensModule (ref), messageFailedToSendModule (ref), responseStatus (ref), messageModeratedModule (ref)
	name:error("Failed to send message. conversationId: {}, messageSendingId: {}, responseCode: {}", self.conversationId, self.messageSendingId, p2.responseCode)
	
	if fFlagAppChatPerfTrackingModule then
		if fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = self.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
		else
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, { conversationId = self.conversationId })
		end
	end
	local var2 = not p2
	
	if not var2 then
		if p2.responseCode ~= nil then
			var2 = true
			
			if p2.responseCode == statusCodes.OK then
				if p2.StatusCode ~= nil then
					var2 = if p2.StatusCode == statusCodes.OK then not p2.responseBody or (not p2.responseBody.messages or #p2.responseBody.messages == 0) else true
				end
			end
		end
	end
	if var2 then
		if p2.StatusCode == statusCodes.CONFLICT then
			name:error("Message sent conflicting system (409). Reloading messages...")
			p1:dispatch(receivedChannelsMigrationConflictModule())
			p1:dispatch(navigateIntoChatModule({
				screen = enumScreensModule.ChatLanding,
				params = { key = tostring(os.clock()) }
			}))
			
			return p2
		end
		p1:dispatch(messageFailedToSendModule(self.conversationId, self.messageSendingId))
		name:error("Message could not be sent, no response body or no messages in response body")
		
		return p2
	elseif p2.responseBody.messages[1].status and p2.responseBody.messages[1].status == responseStatus.MODERATED then
		p1:dispatch(messageModeratedModule(self.conversationId, self.messageSendingId))
		name:error("Message was moderated.")
		
		return p2
	end
	p1:dispatch(messageFailedToSendModule(self.conversationId, self.messageSendingId))
	name:error("Message could not be sent, no response body or no messages in response body")
	
	return p2
end

return tbl