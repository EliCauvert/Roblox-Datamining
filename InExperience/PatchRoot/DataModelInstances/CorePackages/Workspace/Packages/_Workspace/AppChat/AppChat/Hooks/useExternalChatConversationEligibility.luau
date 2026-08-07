local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local createCurrentTimeSignal = require(parent.SignalsUtils).createCurrentTimeSignal
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local getConversationSendEligibilityStatusModule = require(appChat.Utils.getConversationSendEligibilityStatus)

local function areResultsEqual(p0, p1) --[[ line: 29 ]]
	if p0.isLoading ~= p1.isLoading or #p0.eligibleConversations ~= #p1.eligibleConversations then
		return false
	end
	for i, v in p0.eligibleConversations do
		if v ~= p1.eligibleConversations[i] then
			return false
		end
	end
	return true
end

return function(p2) --[[ line: 43 | named "useExternalChatConversationEligibility" ]]
	-- upvalues: getChatModerationStatusDataHydrationModule (ref), reactModule (ref), createCurrentTimeSignal (ref), signalsModule (ref), getConversationSendEligibilityStatusModule (ref), areResultsEqual (ref), signalsReactModule (ref)
	local var7 = getChatModerationStatusDataHydrationModule()
	local var8 = reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: createCurrentTimeSignal (copy)
		return createCurrentTimeSignal(1)
	end, {})
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: signalsModule (copy), p2 (ref), var8 (ref), getConversationSendEligibilityStatusModule (copy), var7 (ref), areResultsEqual (copy)
		return signalsModule.createComputed(function(p3) --[[ line: 51 ]]
			-- upvalues: p2 (copy), var8 (copy), getConversationSendEligibilityStatusModule (copy), var7 (copy)
			local t = {}
			
			if not p2.isActive then
				return { isLoading = true, eligibleConversations = t }
			end
			local var10 = var8(p3)
			
			for i, v in p2.conversations do
				local var11 = getConversationSendEligibilityStatusModule({
					allowConversationStatusLoading = false,
					isAvailable = true,
					conversation = v,
					currentTimestamp = var10,
					isGroupChatEnabled = p2.isGroupChatEnabled,
					scope = p3,
					timeoutStore = var7
				})
				
				if var11 ~= "loading" then
					if var11 == "eligible" then
						table.insert(t, v)
						
						if p2.maxConversationCount <= #t then break end
					end
				end
				return { isLoading = true, eligibleConversations = {} }
			end
			return { isLoading = false, eligibleConversations = t }
		end, areResultsEqual)
	end, {
		var8, p2.conversations, p2.isActive, p2.isGroupChatEnabled,
		p2.maxConversationCount, var7
	}))
end