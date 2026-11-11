local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.installReducer.ChatTimeouts)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local CurrentConversationTimeoutEndedModule = require(AppChat.Conversations.Actions.CurrentConversationTimeoutEnded)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), ConversationChannelsModule (copy), ReactModule (copy), SetTimeoutFunction (copy), CurrentConversationTimeoutEndedModule (copy), ClearTimeoutFunction (copy)
	local ConversationId = p1.conversationId
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValue2Module (upval), ConversationId (copy)
		return {
			userTimeout = GetDeepValue2Module(p2, "ChatAppReducer.ChatTimeouts.userTimeout"),
			conversationTimeout = GetDeepValue2Module(p2, `ChatAppReducer.ChatTimeouts.byConversationId.{ConversationId}`)
		}
	end)
	local UnixTimestamp = DateTime.now().UnixTimestamp
	local EndTimestamp = UseSelectorResult.userTimeout and UseSelectorResult.userTimeout.endTimestamp or 0
	local EndTimestamp1 = UseSelectorResult.conversationTimeout and UseSelectorResult.conversationTimeout.endTimestamp or 0
	local Largest = math.max(EndTimestamp, EndTimestamp1)
	local IsNotConversationModerationTypeMatch: boolean = UnixTimestamp < Largest and p1.conversationModerationType ~= ConversationChannelsModule.ModerationType.TrustedComms
	local DecisionEventId = if EndTimestamp < EndTimestamp1 then UseSelectorResult.conversationTimeout and UseSelectorResult.conversationTimeout.decisionEventId else UseSelectorResult.userTimeout and UseSelectorResult.userTimeout.decisionEventId
	local Duration = if EndTimestamp < EndTimestamp1 then UseSelectorResult.conversationTimeout and UseSelectorResult.conversationTimeout.duration else UseSelectorResult.userTimeout and UseSelectorResult.userTimeout.duration
	ReactModule.useEffect(function()
		-- upvalues: IsNotConversationModerationTypeMatch (copy), SetTimeoutFunction (upval), UseDispatchResult (copy), CurrentConversationTimeoutEndedModule (upval), ConversationId (copy), Largest (copy), UnixTimestamp (copy), ClearTimeoutFunction (upval)
		local SetTimeoutResult = if IsNotConversationModerationTypeMatch then SetTimeoutFunction(function()
			-- upvalues: UseDispatchResult (upval), CurrentConversationTimeoutEndedModule (upval), ConversationId (upval)
			UseDispatchResult(CurrentConversationTimeoutEndedModule(ConversationId))
		end, (Largest - UnixTimestamp + 1) * 1000) else nil
		
		return function()
			-- upvalues: SetTimeoutResult (ref), ClearTimeoutFunction (upval)
			if SetTimeoutResult then
				ClearTimeoutFunction(SetTimeoutResult)
			end
		end
	end, {
		IsNotConversationModerationTypeMatch,
		Largest,
		p1.conversationId
	})
	
	return {
		isTimedOut = IsNotConversationModerationTypeMatch,
		timeoutEndTimestamp = Largest,
		decisionEventId = DecisionEventId,
		duration = Duration
	}
end