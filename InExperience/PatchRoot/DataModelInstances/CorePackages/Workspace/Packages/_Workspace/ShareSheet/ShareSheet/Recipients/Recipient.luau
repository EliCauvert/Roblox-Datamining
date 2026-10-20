local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local ConversationUtilsModule = require(ShareSheet.Utils.ConversationUtils)
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local _ = require(Parent.LuauPolyfill)
local UseExternalChatConversationEligibilityModule = require(Parent.AppChat.useExternalChatConversationEligibility)

return {
	canSend = function(p1, p2)
		return p1.canSendToConversation(p2.conversation)
	end,
	fromConversation = function(Conversation)
		return { id = Conversation.id, conversation = Conversation }
	end,
	getName = function(p1)
		-- upvalues: ConversationUtilsModule (copy)
		return ConversationUtilsModule.getDisplayName(p1.conversation)
	end,
	getParticipantIds = function(p1, p2)
		local List = {}
		
		for _, value in p1.conversation.participants or {} do
			if value ~= p2 then
				table.insert(List, value)
			end
		end
		return List
	end,
	send = function(p3, p4, p5)
		return p3.sendToConversation(p4.conversation, p5)
	end,
	useEligibleRecipients = function(p3)
		-- upvalues: ReactModule (copy), UseExternalChatConversationEligibilityModule (copy)
		local UseExternalChatConversationEligibilityModuleResult = UseExternalChatConversationEligibilityModule({
			conversations = ReactModule.useMemo(function()
				-- upvalues: p3 (copy)
				local Buffer = table.create(#p3.recipients)
				
				for i, recipient in p3.recipients do
					Buffer[i] = recipient.conversation
				end
				return Buffer
			end, { p3.recipients }),
			isActive = p3.isActive,
			isGroupChatEnabled = p3.isGroupChatEnabled,
			maxConversationCount = p3.maxCount
		})
		
		return ReactModule.useMemo(function()
			-- upvalues: UseExternalChatConversationEligibilityModuleResult (copy), p3 (copy)
			local t = {}
			
			for _, eligibleConversation in UseExternalChatConversationEligibilityModuleResult.eligibleConversations do
				t[eligibleConversation] = true
			end
			local Recipients = {}
			
			for _, recipient in p3.recipients do
				if t[recipient.conversation] then
					table.insert(Recipients, recipient)
				end
			end
			return {
				recipients = Recipients,
				isLoading = UseExternalChatConversationEligibilityModuleResult.isLoading
			}
		end, {
			UseExternalChatConversationEligibilityModuleResult,
			p3.recipients
		})
	end
}