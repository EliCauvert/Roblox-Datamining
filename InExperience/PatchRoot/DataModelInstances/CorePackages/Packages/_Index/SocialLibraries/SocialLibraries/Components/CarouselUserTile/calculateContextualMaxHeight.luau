local ConstantsModule = require(script.Parent.Constants)
local GetTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)

return if require(script:FindFirstAncestor("SocialLibraries").dependencies).Foundation.Utility.Flags.FoundationFontFaceMigration then function(p1) --[[ Line: 18 ]]
	-- upvalues: ConstantsModule (copy)
	local _Font = p1.font
	
	return (p1 and p1.nameTopPadding or ConstantsModule.NAME_TOP_PADDING) + _Font.BaseSize * _Font.CaptionHeader.RelativeSize + (p1 and p1.contextualTopPadding or ConstantsModule.CONTEXTUAL_TOP_PADDING) + _Font.BaseSize * _Font.CaptionBody.RelativeSize * (p1 and p1.maxLinesNumber or ConstantsModule.LINES_MAX)
end else function(p1) --[[ Line: 29 ]]
	-- upvalues: ConstantsModule (copy), GetTextHeightModule (copy)
	local _Font = p1.font
	
	return (p1 and p1.nameTopPadding or ConstantsModule.NAME_TOP_PADDING) + GetTextHeightModule("", _Font.CaptionHeader.Font, _Font.BaseSize * _Font.CaptionHeader.RelativeSize) + (p1 and p1.contextualTopPadding or ConstantsModule.CONTEXTUAL_TOP_PADDING) + GetTextHeightModule("", _Font.CaptionBody.Font, _Font.BaseSize * _Font.CaptionBody.RelativeSize) * (p1 and p1.maxLinesNumber or ConstantsModule.LINES_MAX)
end