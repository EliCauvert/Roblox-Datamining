local Parent = script.Parent.Parent.Parent.Parent.Parent
local TModule = require(Parent.t)
local ValidateFontFaceModule = require(script.Parent.validateFontFace)

return TModule.strictInterface({
	Font = if require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration then TModule.union(TModule.EnumItem, ValidateFontFaceModule) else TModule.EnumItem,
	FontSize = TModule.numberMinExclusive(0),
	LineHeight = TModule.numberMinExclusive(0),
	LetterSpacing = TModule.number
})