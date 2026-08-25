local textBoundsRoundUpEngineFeature = game:GetEngineFeature("TextBoundsRoundUp")
local textService = game:GetService("TextService")
local t = { _TEMP_PATCHED_PADDING = Vector2.new(0, 0) }

if not textBoundsRoundUpEngineFeature then
	t._TEMP_PATCHED_PADDING = Vector2.new(2, 2)
end
function t.GetTextBounds(p0, p1, p2, p3)
	-- upvalues: textService (ref), t (ref)
	return textService:GetTextSize(p0, p2, p1, p3) + t._TEMP_PATCHED_PADDING
end

function t.GetTextWidth(p4, p5, p6)
	-- upvalues: t (ref)
	return t.GetTextBounds(p4, p5, p6, Vector2.new(10000, 10000)).X
end

function t.GetTextHeight(p7, p8, p9, p10)
	-- upvalues: t (ref)
	return t.GetTextBounds(p7, p8, p9, Vector2.new(p10, 10000)).Y
end

return t