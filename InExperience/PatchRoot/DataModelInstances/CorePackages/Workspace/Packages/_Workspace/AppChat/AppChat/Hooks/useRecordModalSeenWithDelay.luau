local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local statusCodes = require(parent.Http).StatusCodes
local loggerModule = require(appChat.Logger)
local useRecordModalSequenceResponseForConversationModule = require(appChat.Hooks.useRecordModalSequenceResponseForConversation)
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn

return function(p0) --[[ line: 26 | named "useRecordModalSeenWithDelay" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), useRecordModalSequenceResponseForConversationModule (ref), fFlagAppChatEnableDoubleOptIn (ref), appChatNetworkingModule (ref), statusCodes (ref), loggerModule (ref), setTimeout (ref), clearTimeout (ref)
	local var6 = useDispatch()
	local var7, var8 = reactModule.useState(false)
	local var9 = useRecordModalSequenceResponseForConversationModule(p0.conversationId)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: var8 (ref)
		var8(false)
	end, {
		p0.modalSequence,
		p0.modalId,
		p0.conversationId,
		if fFlagAppChatEnableDoubleOptIn then p0.modalVariant else nil
	})
	local modalId = p0.canRecordAction and (not var7 and (p0.actionToRecord and (p0.modalSequence and p0.modalId)))
	
	if fFlagAppChatEnableDoubleOptIn then
		modalId = p0.canRecordAction and (not var7 and (p0.actionToRecord and (p0.modalSequence and (p0.modalId or p0.modalVariant))))
	end
	local var11 = reactModule.useCallback(function() --[[ line: 56 ]]
		-- upvalues: p0 (ref), var9 (ref), var6 (ref), appChatNetworkingModule (copy), statusCodes (copy), var8 (ref), loggerModule (copy)
		local actionToRecord = p0.actionToRecord;
		(if p0.conversationId then var9(actionToRecord, p0.modalSequence, p0.modalId, p0.modalVariant) else var6(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(actionToRecord, p0.modalSequence, p0.modalId))):andThen(function(p2) --[[ line: 74 ]]
			-- upvalues: statusCodes (copy), var8 (copy)
			if p2 and p2.responseCode == statusCodes.OK then
				var8(true)
			end
		end):catch(function(p1) --[[ line: 79 ]]
			-- upvalues: loggerModule (copy), p0 (copy)
			loggerModule:warning(`Error in {p0.modalSequence} {p0.modalId} -> RecordModalSequenceResponse seen: {tostring(p1)}`)
		end)
	end, {
		var6, p0.actionToRecord, p0.modalId, p0.modalSequence, p0.conversationId, var9
	})
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: modalId (write), p0 (ref), setTimeout (copy), var11 (ref), clearTimeout (copy)
		local var12 = nil
		
		if modalId then
			if p0.delayMs and p0.delayMs > 0 then
				var12 = setTimeout(var11, p0.delayMs)
			else
				var11()
			end
		end
		return function() --[[ line: 106 ]]
			-- upvalues: var12 (write), clearTimeout (copy)
			if var12 then
				clearTimeout(var12)
			end
		end
	end, { p0.delayMs, var11, modalId })
end