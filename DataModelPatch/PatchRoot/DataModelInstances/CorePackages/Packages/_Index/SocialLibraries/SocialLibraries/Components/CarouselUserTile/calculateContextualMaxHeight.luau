local ConstantsModule = require(script.Parent.Constants)
local GetTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)

return function(p1)
	-- upvalues: ConstantsModule (copy), GetTextHeightModule (copy)
	local _Font = p1.font
	
	return (p1 and p1.nameTopPadding or ConstantsModule.NAME_TOP_PADDING) + GetTextHeightModule("", _Font.CaptionHeader.Font, _Font.BaseSize * _Font.CaptionHeader.RelativeSize) + (p1 and p1.contextualTopPadding or ConstantsModule.CONTEXTUAL_TOP_PADDING) + GetTextHeightModule("", _Font.CaptionBody.Font, _Font.BaseSize * _Font.CaptionBody.RelativeSize) * (p1 and p1.maxLinesNumber or ConstantsModule.LINES_MAX)
end