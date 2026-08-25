local _ = require(script.Parent.MessageFtuxTooltipVariant)
local t = {
	dismissed = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()
}

function t.dismiss(p0)
	-- upvalues: t (ref)
	t.dismissed:fire(p0)
end

return t