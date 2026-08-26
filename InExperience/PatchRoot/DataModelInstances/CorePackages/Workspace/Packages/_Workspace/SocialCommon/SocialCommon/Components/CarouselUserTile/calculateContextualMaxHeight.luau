local parent = script:FindFirstAncestor("SocialCommon").Parent
local text = require(parent.AppCommonLib).Text
local constantsModule = require(script.Parent.Constants)
local _ = require(parent.UIBlox)

return function(p1)
	-- upvalues: constantsModule (ref), text (ref)
	local font = p1.font
	
	return (if p1 then p1.nameTopPadding else constantsModule.NAME_TOP_PADDING) + text.GetTextHeight("", font.CaptionHeader.Font, font.BaseSize * font.CaptionHeader.RelativeSize, 10000) + (if p1 then p1.contextualTopPadding else constantsModule.CONTEXTUAL_TOP_PADDING) + text.GetTextHeight("", font.CaptionBody.Font, font.BaseSize * font.CaptionBody.RelativeSize, 10000) * (if p1 then p1.maxLinesNumber else constantsModule.LINES_MAX)
end