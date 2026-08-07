local tModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Font = tModule.EnumItem,
	FontSize = tModule.numberMinExclusive(0),
	LineHeight = tModule.numberMinExclusive(0),
	LetterSpacing = tModule.number
})