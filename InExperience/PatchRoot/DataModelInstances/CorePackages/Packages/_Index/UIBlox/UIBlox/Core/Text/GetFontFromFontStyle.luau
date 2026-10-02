local parent = script.Parent.Parent.Parent
local _ = require(parent.Core.Style.Validator.validateFontInfo)
local _ = require(parent.App.Style.StyleTypes)

return function(p1)
	return p1.FontFace or p1.Font
end