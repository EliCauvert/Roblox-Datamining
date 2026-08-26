local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local createCurrentTimeSignal = require(parent.SignalsUtils).createCurrentTimeSignal
local getChatModerationStatusDataHydrationModule = require(appChat.Stores.GetChatModerationStatusDataHydration)
local _ = require(appChat.Stores.GetConversationStore)
local getConversationSendEligibilityStatusModule = require(appChat.Utils.getConversationSendEligibilityStatus)

local function areResultsEqual(p1, p2)
	if p1.isLoading ~= p2.isLoading or #p1.eligibleConversations ~= #p2.eligibleConversations then
		return false
	end
	for i, v in p1.eligibleConversations do
		if v ~= p2.eligibleConversations[i] then
			return false
		end
	end
	return true
end

return function(p3)
	-- upvalues: getChatModerationStatusDataHydrationModule (ref), reactModule (ref), createCurrentTimeSignal (ref), signalsModule (ref), getConversationSendEligibilityStatusModule (ref), areResultsEqual (ref), signalsReactModule (ref)
	local var1 = getChatModerationStatusDataHydrationModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: createCurrentTimeSignal (copy)
		return createCurrentTimeSignal(1)
	end, {})
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p3 (ref), var2 (ref), getConversationSendEligibilityStatusModule (copy), var1 (ref), areResultsEqual (copy)
		return signalsModule.createComputed(function(p4)
			-- upvalues: p3 (copy), var2 (copy), getConversationSendEligibilityStatusModule (copy), var1 (copy)
			local t = {}
			
			if not p3.isActive then
				return { isLoading = true, eligibleConversations = t }
			end
			local var3 = var2(p4)
			
			for i, v in p3.conversations do
				local var4 = getConversationSendEligibilityStatusModule({
					allowConversationStatusLoading = false,
					isAvailable = true,
					conversation = v,
					currentTimestamp = var3,
					isGroupChatEnabled = p3.isGroupChatEnabled,
					scope = p4,
					timeoutStore = var1
				})
				
				if var4 ~= "loading" then
					if var4 == "eligible" then
						table.insert(t, v)
						
						if p3.maxConversationCount <= #t then break end
					end
				end
				return { isLoading = true, eligibleConversations = {} }
			end
			return { isLoading = false, eligibleConversations = t }
		end, areResultsEqual)
	end, {
		var2, p3.conversations, p3.isActive, p3.isGroupChatEnabled,
		p3.maxConversationCount, var1
	}))
end