local TModule = require(script.Parent.Parent.Parent.Parent.Parent.t)
local ValidateFontFaceModule = require(script.Parent.validateFontFace)

return TModule.strictInterface({
	RelativeSize = TModule.numberMinExclusive(0),
	RelativeMinSize = TModule.numberMinExclusive(0),
	Font = TModule.union(TModule.EnumItem, ValidateFontFaceModule),
	FontFace = TModule.optional(ValidateFontFaceModule)
})