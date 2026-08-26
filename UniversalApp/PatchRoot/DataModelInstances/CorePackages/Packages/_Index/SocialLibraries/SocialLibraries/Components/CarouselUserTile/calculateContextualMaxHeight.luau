local constantsModule = require(script.Parent.Constants)
local getTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)

return function(p1)
	-- upvalues: constantsModule (ref), getTextHeightModule (ref)
	local font = p1.font
	
	return (if p1 then p1.nameTopPadding else constantsModule.NAME_TOP_PADDING) + getTextHeightModule("", font.CaptionHeader.Font, font.BaseSize * font.CaptionHeader.RelativeSize) + (if p1 then p1.contextualTopPadding else constantsModule.CONTEXTUAL_TOP_PADDING) + getTextHeightModule("", font.CaptionBody.Font, font.BaseSize * font.CaptionBody.RelativeSize) * (if p1 then p1.maxLinesNumber else constantsModule.LINES_MAX)
end