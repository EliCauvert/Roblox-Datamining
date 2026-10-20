local _ = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Foundation)

return function(p1, p2)
	return if p1 then {
		backgroundStyle = p2.Color.System.Emphasis,
		textStyle = p2.Color.ActionEmphasis.Foreground
	} else {
		backgroundStyle = p2.Color.Shift.Shift_400,
		textStyle = p2.Color.Content.Emphasis
	}
end