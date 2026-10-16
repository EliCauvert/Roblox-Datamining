local Parent = script:FindFirstAncestor("SocialCommon").Parent
local Text = require(Parent.AppCommonLib).Text
local ConstantsModule = require(script.Parent.Constants)
local _ = require(Parent.UIBlox)

return function(p1) --[[ Line: 16 ]]
	-- upvalues: ConstantsModule (copy), Text (copy)
	local _Font = p1.font
	
	return (p1 and p1.nameTopPadding or ConstantsModule.NAME_TOP_PADDING) + Text.GetTextHeight("", _Font.CaptionHeader.Font, _Font.BaseSize * _Font.CaptionHeader.RelativeSize, 10000) + (p1 and p1.contextualTopPadding or ConstantsModule.CONTEXTUAL_TOP_PADDING) + Text.GetTextHeight("", _Font.CaptionBody.Font, _Font.BaseSize * _Font.CaptionBody.RelativeSize, 10000) * (p1 and p1.maxLinesNumber or ConstantsModule.LINES_MAX)
end