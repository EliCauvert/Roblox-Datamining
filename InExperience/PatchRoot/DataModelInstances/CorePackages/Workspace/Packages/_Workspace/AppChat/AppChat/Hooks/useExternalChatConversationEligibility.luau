local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateCurrentTimeSignalFunction = require(Parent.SignalsUtils).createCurrentTimeSignal
local GetChatModerationStatusDataHydrationModule = require(AppChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(AppChat.Stores.GetConversationStore)
local GetConversationSendEligibilityStatusModule = require(AppChat.Utils.getConversationSendEligibilityStatus)

local function areResultsEqual(p1, p2): boolean --[[ Line: 29 ]]
	if p1.isLoading ~= p2.isLoading or #p1.eligibleConversations ~= #p2.eligibleConversations then
		return false
	end
	for i, eligibleConversation in p1.eligibleConversations do
		if eligibleConversation ~= p2.eligibleConversations[i] then
			return false
		end
	end
	return true
end

return function(p3) --[[ Line: 43 | Named "useExternalChatConversationEligibility" ]]
	-- upvalues: GetChatModerationStatusDataHydrationModule (copy), ReactModule (copy), CreateCurrentTimeSignalFunction (copy), SignalsModule (copy), GetConversationSendEligibilityStatusModule (copy), areResultsEqual (copy), SignalsReactModule (copy)
	local ChatModerationStatusDataHydrationModule = GetChatModerationStatusDataHydrationModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 45 ]]
		-- upvalues: CreateCurrentTimeSignalFunction (upval)
		return CreateCurrentTimeSignalFunction(1)
	end, {})
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 50 ]]
		-- upvalues: SignalsModule (upval), p3 (copy), UseMemoResult (copy), GetConversationSendEligibilityStatusModule (upval), ChatModerationStatusDataHydrationModule (copy), areResultsEqual (upval)
		return SignalsModule.createComputed(function(Scope) --[[ Line: 51 ]]
			-- upvalues: p3 (upval), UseMemoResult (upval), GetConversationSendEligibilityStatusModule (upval), ChatModerationStatusDataHydrationModule (upval)
			local EligibleConversations = {}
			
			if not p3.isActive then
				return {
					isLoading = true,
					eligibleConversations = EligibleConversations
				}
			end
			local UseMemoResultResult = UseMemoResult(Scope)
			
			for _, conversation in p3.conversations do
				local ConversationSendEligibilityStatusModule = GetConversationSendEligibilityStatusModule({
					allowConversationStatusLoading = false,
					isAvailable = true,
					conversation = conversation,
					currentTimestamp = UseMemoResultResult,
					isGroupChatEnabled = p3.isGroupChatEnabled,
					scope = Scope,
					timeoutStore = ChatModerationStatusDataHydrationModule
				})
				
				if ConversationSendEligibilityStatusModule == "loading" then
					return { isLoading = true, eligibleConversations = {} }
				elseif ConversationSendEligibilityStatusModule == "eligible" then
					table.insert(EligibleConversations, conversation)
					
					if p3.maxConversationCount <= #EligibleConversations then break end
				else
					continue
				end
			end
			return {
				isLoading = false,
				eligibleConversations = EligibleConversations
			}
		end, areResultsEqual)
	end, {
		UseMemoResult, p3.conversations, p3.isActive, p3.isGroupChatEnabled,
		p3.maxConversationCount, ChatModerationStatusDataHydrationModule
	})))
end