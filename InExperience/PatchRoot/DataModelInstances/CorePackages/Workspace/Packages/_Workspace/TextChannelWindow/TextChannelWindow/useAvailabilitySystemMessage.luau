local ReactModule = require(script.Parent.Parent.React)
local UseRobloxSystemMessageModule = require(script.Parent.useRobloxSystemMessage)
local _ = require(script.Parent.ChatAvailabilityContext)
local FFlagExpChatMemoizeSystemMessageModule = require(script.Parent.Flags.FFlagExpChatMemoizeSystemMessage)

return function(p1, p2) --[[ Line: 8 | Named "useAvailabilitySystemMessage" ]]
	-- upvalues: UseRobloxSystemMessageModule (copy), ReactModule (copy), FFlagExpChatMemoizeSystemMessageModule (copy)
	local UseRobloxSystemMessageModuleResult = UseRobloxSystemMessageModule()
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: p1 (copy), UseRobloxSystemMessageModuleResult (copy)
		if p1.messageKey then
			UseRobloxSystemMessageModuleResult.displayRobloxSystemMessage(p1.messageKey, p1.messageFallback or "")
		end
		return UseRobloxSystemMessageModuleResult.clearAvailabilityMessage
	end, if FFlagExpChatMemoizeSystemMessageModule then {
		UseRobloxSystemMessageModuleResult,
		p1.messageKey,
		p1.messageFallback,
		p2
	} else {
		UseRobloxSystemMessageModuleResult,
		p1.messageKey,
		p1.messageFallback
	})
end