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
local var15 = 0
local name = require(appChat.Logger):new(script.Name)

local function _() --[[ line: 31 | named "getAscendingNumber" ]]
	-- upvalues: var15 (write)
	var15 += 1
	
	return var15
end

local tbl = setmetatable({}, sendMessagePolicyModule)
tbl.__index = tbl

function tbl.new(p0, p1, p2) --[[ line: 39 ]]
	-- upvalues: messageModelModule (ref)
	return setmetatable({
		messageSendingId = messageModelModule.newSendingId(),
		conversationId = p1,
		replyingToMessage = p2
	}, p0)
end

function tbl:onBeforeSendingMessage(p3) --[[ line: 47 ]]
	-- upvalues: name (ref), getDeepValue2Module (ref), messageModelModule (ref), immutable (ref), var15 (write), dateTime (ref), sendingMessageModule (ref)
	name:trace("onBeforeSendingMessage conversationId: {} messageSendingId: {}, replyingToId: {}", self.conversationId, self.messageSendingId, if self.replyingToMessage then self.replyingToMessage.id else nil)
	local _ = nil
	local var18 = getDeepValue2Module(p3:getState(), `ChatAppReducer.Conversations.{self.conversationId}`)
	local moderationType = var18 and var18.moderationType
	local newSending = messageModelModule.newSending
	local joinDictionaries = immutable.JoinDictionaries
	local t = { id = self.messageSendingId }
	var15 += 1
	t.order = var15
	t.conversationId = self.conversationId
	t.repliesTo = self.replyingToMessage
	t.sent = dateTime.now()
	t.moderationType = moderationType
	newSending = newSending(joinDictionaries(t, self:sendingMessagePayload()))
	self.sendingMessageStableKey = newSending.stableKey
	assert(newSending, "Failed to create sending message placeholder")
	p3:dispatch(sendingMessageModule(self.conversationId, newSending))
end

function tbl.sendingMessagePayload(_) --[[ line: 74 ]]
	error("Override me")
end

function tbl:onSuccess(p4, p5) --[[ line: 78 ]]
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
	p4:dispatch(sentMessageModule(self.conversationId, self.messageSendingId))
	p4:dispatch(receivedChatResponseModule(self.conversationId, p5.responseBody, self.sendingMessageStableKey))
	
	return p5
end

function tbl:onFailure(p6, p7) --[[ line: 112 ]]
	-- upvalues: name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), statusCodes (ref), receivedChannelsMigrationConflictModule (ref), navigateIntoChatModule (ref), enumScreensModule (ref), messageFailedToSendModule (ref), responseStatus (ref), messageModeratedModule (ref)
	name:error("Failed to send message. conversationId: {}, messageSendingId: {}, responseCode: {}", self.conversationId, self.messageSendingId, p7.responseCode)
	
	if fFlagAppChatPerfTrackingModule then
		if fFlagAppChatMessageTTIMilestonesModule then
			local t = { conversationId = self.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Name, appChatPerfTrackerModule.Milestone.PrimaryDataReady.Subphase.ResponseReceived, t)
		else
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, { conversationId = self.conversationId })
		end
	end
	local var23 = not p7
	
	if not var23 then
		if p7.responseCode ~= nil then
			var23 = true
			
			if p7.responseCode == statusCodes.OK then
				if p7.StatusCode ~= nil then
					var23 = if p7.StatusCode == statusCodes.OK then not p7.responseBody or (not p7.responseBody.messages or #p7.responseBody.messages == 0) else true
				end
			end
		end
	end
	if var23 then
		if p7.StatusCode == statusCodes.CONFLICT then
			name:error("Message sent conflicting system (409). Reloading messages...")
			p6:dispatch(receivedChannelsMigrationConflictModule())
			p6:dispatch(navigateIntoChatModule({
				screen = enumScreensModule.ChatLanding,
				params = { key = tostring(os.clock()) }
			}))
			
			return p7
		end
		p6:dispatch(messageFailedToSendModule(self.conversationId, self.messageSendingId))
		name:error("Message could not be sent, no response body or no messages in response body")
		
		return p7
	elseif p7.responseBody.messages[1].status and p7.responseBody.messages[1].status == responseStatus.MODERATED then
		p6:dispatch(messageModeratedModule(self.conversationId, self.messageSendingId))
		name:error("Message was moderated.")
		
		return p7
	end
	p6:dispatch(messageFailedToSendModule(self.conversationId, self.messageSendingId))
	name:error("Message could not be sent, no response body or no messages in response body")
	
	return p7
end

return tbl