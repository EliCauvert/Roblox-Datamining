local Parent = script.Parent.Parent.Parent
local _ = require(Parent.Core.Style.Validator.validateFontInfo)
local _ = require(Parent.App.Style.StyleTypes)

return function(Label) --[[ Line: 9 | Named "getFontFromFontStyle" ]]
	return Label.FontFace or Label.Font
end