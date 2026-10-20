local _ = require(script.Parent.MessageFtuxTooltipVariant)
local MessageFtuxTooltipDismissSignalModule = {
	dismissed = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()
}

function MessageFtuxTooltipDismissSignalModule.dismiss(p1)
	-- upvalues: MessageFtuxTooltipDismissSignalModule (copy)
	MessageFtuxTooltipDismissSignalModule.dismissed:fire(p1)
end

return MessageFtuxTooltipDismissSignalModule