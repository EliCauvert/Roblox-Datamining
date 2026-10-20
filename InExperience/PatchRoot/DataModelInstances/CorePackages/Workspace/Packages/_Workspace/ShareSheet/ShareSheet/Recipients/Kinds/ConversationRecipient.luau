local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local ConversationUtilsModule = require(ShareSheet.Utils.ConversationUtils)
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(script.Parent.RecipientKind)
local UseExternalChatConversationEligibilityModule = require(Parent.AppChat.useExternalChatConversationEligibility)

return {
	create = function(Conversation)
		return {
			kind = "conversation",
			id = Conversation.id,
			conversation = Conversation
		}
	end,
	kind = {
		useEligibility = function(p1)
			-- upvalues: ReactModule (copy), UseExternalChatConversationEligibilityModule (copy)
			local UseExternalChatConversationEligibilityModuleResult = UseExternalChatConversationEligibilityModule({
				conversations = ReactModule.useMemo(function()
					-- upvalues: p1 (copy)
					local Buffer = table.create(#p1.recipients)
					
					for i, recipient in p1.recipients do
						Buffer[i] = recipient.conversation
					end
					return Buffer
				end, { p1.recipients }),
				isActive = p1.isActive,
				isGroupChatEnabled = p1.isGroupChatEnabled,
				maxConversationCount = p1.maxCount
			})
			
			return ReactModule.useMemo(function()
				-- upvalues: UseExternalChatConversationEligibilityModuleResult (copy)
				local t = {}
				
				for _, eligibleConversation in UseExternalChatConversationEligibilityModuleResult.eligibleConversations do
					t[eligibleConversation] = true
				end
				return {
					isLoading = UseExternalChatConversationEligibilityModuleResult.isLoading,
					isEligible = function(p2): boolean
						-- upvalues: t (copy)
						return t[p2.conversation] == true
					end
				}
			end, { UseExternalChatConversationEligibilityModuleResult })
		end,
		canSend = function(p2, p3)
			return p2.canSendToConversation(p3.conversation)
		end,
		send = function(p2, p3, p4)
			return p2.sendToConversation(p3.conversation, p4)
		end,
		getName = function(p2)
			-- upvalues: ConversationUtilsModule (copy)
			return ConversationUtilsModule.getDisplayName(p2.conversation)
		end,
		getParticipantIds = function(p2, p3)
			local List = {}
			
			for _, value in p2.conversation.participants or {} do
				if value ~= p3 then
					table.insert(List, value)
				end
			end
			return List
		end
	}
}