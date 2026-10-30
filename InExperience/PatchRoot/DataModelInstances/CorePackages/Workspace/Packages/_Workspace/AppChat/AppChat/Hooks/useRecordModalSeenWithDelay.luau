local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local StatusCodes = require(Parent.Http).StatusCodes
local LoggerModule = require(AppChat.Logger)
local UseRecordModalSequenceResponseForConversationModule = require(AppChat.Hooks.useRecordModalSequenceResponseForConversation)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseRecordModalSequenceResponseForConversationModule (copy), AppChatNetworkingModule (copy), StatusCodes (copy), LoggerModule (copy), SetTimeoutFunction (copy), ClearTimeoutFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRecordModalSequenceResponseForConversationModuleResult = UseRecordModalSequenceResponseForConversationModule(p1.conversationId)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {
		p1.modalSequence,
		p1.modalId,
		p1.conversationId,
		p1.modalVariant
	})
	local ModalId = p1.canRecordAction and (not UseStateResult and (p1.actionToRecord and (p1.modalSequence and (p1.modalId or p1.modalVariant))))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseRecordModalSequenceResponseForConversationModuleResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), StatusCodes (upval), UseStateResult2 (copy), LoggerModule (upval)
		local ActionToRecord = p1.actionToRecord;
		(if p1.conversationId then UseRecordModalSequenceResponseForConversationModuleResult(ActionToRecord, p1.modalSequence, p1.modalId, p1.modalVariant) else UseDispatchResult(AppChatNetworkingModule.rodux.RecordModalSequenceResponse.API(ActionToRecord, p1.modalSequence, p1.modalId))):andThen(function(Result)
			-- upvalues: StatusCodes (upval), UseStateResult2 (upval)
			if Result and Result.responseCode == StatusCodes.OK then
				UseStateResult2(true)
			end
		end):catch(function(Err)
			-- upvalues: LoggerModule (upval), p1 (upval)
			LoggerModule:warning(`Error in {p1.modalSequence} {p1.modalId} -> RecordModalSequenceResponse seen: {tostring(Err)}`)
		end)
	end, {
		UseDispatchResult, p1.actionToRecord, p1.modalId, p1.modalSequence,
		p1.conversationId, UseRecordModalSequenceResponseForConversationModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: ModalId (copy), p1 (copy), SetTimeoutFunction (upval), UseResult (copy), ClearTimeoutFunction (upval)
		local v1 = nil
		
		if ModalId then
			if p1.delayMs and p1.delayMs > 0 then
				v1 = SetTimeoutFunction(UseResult, p1.delayMs)
			else
				UseResult()
			end
		end
		return function()
			-- upvalues: v1 (ref), ClearTimeoutFunction (upval)
			if v1 then
				ClearTimeoutFunction(v1)
			end
		end
	end, { p1.delayMs, UseResult, ModalId })
end