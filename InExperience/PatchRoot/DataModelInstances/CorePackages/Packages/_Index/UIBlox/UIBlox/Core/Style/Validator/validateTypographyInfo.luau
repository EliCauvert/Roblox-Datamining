local TModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return TModule.strictInterface({
	Font = TModule.union(TModule.EnumItem, (require(script.Parent.validateFontFace))),
	FontSize = TModule.numberMinExclusive(0),
	LineHeight = TModule.numberMinExclusive(0),
	LetterSpacing = TModule.number
})