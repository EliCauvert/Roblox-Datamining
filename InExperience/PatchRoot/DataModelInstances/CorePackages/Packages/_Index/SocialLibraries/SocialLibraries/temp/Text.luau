local TextService = game:GetService("TextService")
local TextModule = { _TEMP_PATCHED_PADDING = Vector2.new(0, 0) }

if not game:GetEngineFeature("TextBoundsRoundUp") then
	TextModule._TEMP_PATCHED_PADDING = Vector2.new(2, 2)
end
function TextModule.GetTextBounds(String, p1, FontSize, Vector) --[[ Line: 18 ]]
	-- upvalues: TextService (copy), TextModule (copy)
	return TextService:GetTextSize(String, FontSize, p1, Vector) + TextModule._TEMP_PATCHED_PADDING
end

function TextModule.GetTextWidth(p1, p2, p3) --[[ Line: 22 ]]
	-- upvalues: TextModule (copy)
	return TextModule.GetTextBounds(p1, p2, p3, Vector2.new(10000, 10000)).X
end

function TextModule.GetTextHeight(p1, p2, p3, X) --[[ Line: 26 ]]
	-- upvalues: TextModule (copy)
	return TextModule.GetTextBounds(p1, p2, p3, Vector2.new(X, 10000)).Y
end

return TextModule