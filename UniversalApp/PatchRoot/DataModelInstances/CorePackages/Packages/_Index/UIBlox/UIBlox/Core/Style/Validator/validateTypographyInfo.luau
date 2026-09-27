local parent = script.Parent.Parent.Parent.Parent.Parent
local tModule = require(parent.t)

return tModule.strictInterface({
	Font = if require(parent.Foundation).Utility.Flags.FoundationFontFaceMigration then tModule.union(tModule.EnumItem, require(script.Parent.validateFontFace)) else tModule.EnumItem,
	FontSize = tModule.numberMinExclusive(0),
	LineHeight = tModule.numberMinExclusive(0),
	LetterSpacing = tModule.number
})