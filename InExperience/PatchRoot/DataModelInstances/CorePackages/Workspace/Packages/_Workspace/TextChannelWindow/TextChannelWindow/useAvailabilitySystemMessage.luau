local reactModule = require(script.Parent.Parent.React)
local useRobloxSystemMessageModule = require(script.Parent.useRobloxSystemMessage)
local _ = require(script.Parent.ChatAvailabilityContext)
local fFlagExpChatMemoizeSystemMessageModule = require(script.Parent.Flags.FFlagExpChatMemoizeSystemMessage)

return function(p1, p2)
	-- upvalues: useRobloxSystemMessageModule (ref), reactModule (ref), fFlagExpChatMemoizeSystemMessageModule (ref)
	local var1 = useRobloxSystemMessageModule()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.messageKey then
			var1.displayRobloxSystemMessage(p1.messageKey, p1.messageFallback or "")
		end
		return var1.clearAvailabilityMessage
	end, if fFlagExpChatMemoizeSystemMessageModule then { var1, p1.messageKey, p1.messageFallback, p2 } else { var1, p1.messageKey, p1.messageFallback })
end