local GetTextSizeModule = require(script.Parent.GetTextSize)

return function(Text, p1, p2, p3, p4): string --[[ Line: 16 | Named "getWrappedTextWithIcon" ]]
	-- upvalues: GetTextSizeModule (copy)
	return string.rep(" ", (math.ceil((p3 + p4) / (GetTextSizeModule("  ", p1, p2, Vector2.new(0, 0)) - GetTextSizeModule(" ", p1, p2, Vector2.new(0, 0))).X))) .. Text
end