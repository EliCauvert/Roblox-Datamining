local _ = require(script.Parent.MessageFtuxTooltipVariant)
local t = {
	dismissed = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()
}

function t.dismiss(p1)
	-- upvalues: t (ref)
	t.dismissed:fire(p1)
end

return t