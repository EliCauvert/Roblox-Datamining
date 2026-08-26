local textBoundsRoundUpEngineFeature = game:GetEngineFeature("TextBoundsRoundUp")
local textService = game:GetService("TextService")
local t = { _TEMP_PATCHED_PADDING = Vector2.new(0, 0) }

if not textBoundsRoundUpEngineFeature then
	t._TEMP_PATCHED_PADDING = Vector2.new(2, 2)
end
function t.GetTextBounds(p1, p2, p3, p4)
	-- upvalues: textService (ref), t (ref)
	return textService:GetTextSize(p1, p3, p2, p4) + t._TEMP_PATCHED_PADDING
end

function t.GetTextWidth(p1, p2, p3)
	-- upvalues: t (ref)
	return t.GetTextBounds(p1, p2, p3, Vector2.new(10000, 10000)).X
end

function t.GetTextHeight(p1, p2, p3, p4)
	-- upvalues: t (ref)
	return t.GetTextBounds(p1, p2, p3, Vector2.new(p4, 10000)).Y
end

return t