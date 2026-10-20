local Parent = script:FindFirstAncestor("ShareSheet").Parent
local ReactModule = require(Parent.React)
local ConversationRecipientModule = require(script.Parent.Kinds.ConversationRecipient)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local _ = require(Parent.LuauPolyfill)
local _ = require(script.Parent.Kinds.RecipientKind)
local _ = require(Parent.Signals)
local UserRecipientModule = require(script.Parent.Kinds.UserRecipient)
local Frozen = table.freeze({
	conversation = ConversationRecipientModule.kind,
	user = UserRecipientModule.kind
})
local Frozen1 = table.freeze({})

local function _(p1)
	-- upvalues: Frozen (copy)
	return Frozen[p1.kind]
end

return {
	canSend = function(p1, p2)
		-- upvalues: Frozen (copy)
		return Frozen[p2.kind].canSend(p1, p2)
	end,
	fromConversation = ConversationRecipientModule.create,
	fromUserId = UserRecipientModule.create,
	getName = function(p1, p2)
		-- upvalues: Frozen (copy)
		return Frozen[p1.kind].getName(p1, p2)
	end,
	getParticipantIds = function(p1, p2)
		-- upvalues: Frozen (copy)
		return Frozen[p1.kind].getParticipantIds(p1, p2)
	end,
	send = function(p1, p2, p3)
		-- upvalues: Frozen (copy)
		return Frozen[p2.kind].send(p1, p2, p3)
	end,
	useEligibleRecipients = function(KindProps)
		-- upvalues: ReactModule (copy), Frozen1 (copy), Frozen (copy)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: KindProps (copy)
			local t = {}
			
			for _, recipient in KindProps.recipients do
				local List = t[recipient.kind] or {}
				table.insert(List, recipient)
				t[recipient.kind] = List
			end
			return t
		end, { KindProps.recipients })
		
		local function _(p1)
			-- upvalues: UseMemoResult (copy), Frozen1 (upval), KindProps (copy)
			return {
				recipients = UseMemoResult[p1] or Frozen1,
				isActive = KindProps.isActive,
				isGroupChatEnabled = KindProps.isGroupChatEnabled,
				maxCount = KindProps.maxCount
			}
		end
		
		local UseEligibilityResult = Frozen.conversation.useEligibility({
			recipients = UseMemoResult.conversation or Frozen1,
			isActive = KindProps.isActive,
			isGroupChatEnabled = KindProps.isGroupChatEnabled,
			maxCount = KindProps.maxCount
		})
		local UseEligibilityResult1 = Frozen.user.useEligibility({
			recipients = UseMemoResult.user or Frozen1,
			isActive = KindProps.isActive,
			isGroupChatEnabled = KindProps.isGroupChatEnabled,
			maxCount = KindProps.maxCount
		})
		
		return ReactModule.useMemo(function()
			-- upvalues: UseEligibilityResult (copy), UseEligibilityResult1 (copy), KindProps (copy), UseMemoResult (copy)
			local config = {
				conversation = UseEligibilityResult,
				user = UseEligibilityResult1
			}
			local NoIsActive = not KindProps.isActive
			
			for i, value in config do
				if UseMemoResult[i] and value.isLoading then
					NoIsActive = true
				end
			end
			if NoIsActive then
				return { isLoading = true, recipients = {} }
			end
			local Recipients = {}
			
			for _, recipient in KindProps.recipients do
				if config[recipient.kind].isEligible(recipient) then
					table.insert(Recipients, recipient)
					
					if KindProps.maxCount <= #Recipients then break end
				end
			end
			return { isLoading = false, recipients = Recipients }
		end, {
			UseEligibilityResult, KindProps.isActive, KindProps.maxCount,
			KindProps.recipients, UseMemoResult, UseEligibilityResult1
		})
	end
}