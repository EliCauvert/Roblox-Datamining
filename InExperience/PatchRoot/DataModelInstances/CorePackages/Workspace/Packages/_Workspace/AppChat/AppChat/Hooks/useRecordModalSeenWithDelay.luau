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

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), useRecordModalSequenceResponseForConversationModule (ref), fFlagAppChatEnableDoubleOptIn (ref), appChatNetworkingModule (ref), statusCodes (ref), loggerModule (ref), setTimeout (ref), clearTimeout (ref)
	local var1 = useDispatch()
	local var2, var3 = reactModule.useState(false)
	local var4 = useRecordModalSequenceResponseForConversationModule(p1.conversationId)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {
		p1.modalSequence,
		p1.modalId,
		p1.conversationId,
		if fFlagAppChatEnableDoubleOptIn then p1.modalVariant else nil
	})
	local modalId = p1.canRecordAction and (not var2 and (p1.actionToRecord and (p1.modalSequence and p1.modalId)))
	
	if fFlagAppChatEnableDoubleOptIn then
		modalId = p1.canRecordAction and (not var2 and (p1.actionToRecord and (p1.modalSequence and (p1.modalId or p1.modalVariant))))
	end
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), var1 (ref), appChatNetworkingModule (copy), statusCodes (copy), var3 (ref), loggerModule (copy)
		local actionToRecord = p1.actionToRecord;
		(if p1.conversationId then var4(actionToRecord, p1.modalSequence, p1.modalId, p1.modalVariant) else var1(appChatNetworkingModule.rodux.RecordModalSequenceResponse.API(actionToRecord, p1.modalSequence, p1.modalId))):andThen(function(p2)
			-- upvalues: statusCodes (copy), var3 (copy)
			if p2 and p2.responseCode == statusCodes.OK then
				var3(true)
			end
		end):catch(function(p2)
			-- upvalues: loggerModule (copy), p1 (copy)
			loggerModule:warning(`Error in {p1.modalSequence} {p1.modalId} -> RecordModalSequenceResponse seen: {tostring(p2)}`)
		end)
	end, {
		var1, p1.actionToRecord, p1.modalId, p1.modalSequence, p1.conversationId, var4
	})
	reactModule.useEffect(function()
		-- upvalues: modalId (write), p1 (ref), setTimeout (copy), var5 (ref), clearTimeout (copy)
		local var6 = nil
		
		if modalId then
			if p1.delayMs and p1.delayMs > 0 then
				var6 = setTimeout(var5, p1.delayMs)
			else
				var5()
			end
		end
		return function()
			-- upvalues: var6 (write), clearTimeout (copy)
			if var6 then
				clearTimeout(var6)
			end
		end
	end, { p1.delayMs, var5, modalId })
end