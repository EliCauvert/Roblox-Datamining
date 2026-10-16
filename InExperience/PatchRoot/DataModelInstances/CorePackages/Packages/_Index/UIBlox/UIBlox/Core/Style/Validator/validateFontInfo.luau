local Parent = script.Parent.Parent.Parent.Parent.Parent
local TModule = require(Parent.t)
local ValidateFontFaceModule = require(script.Parent.validateFontFace)
local FoundationFontFaceMigration = require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration

return TModule.strictInterface({
	RelativeSize = TModule.numberMinExclusive(0),
	RelativeMinSize = TModule.numberMinExclusive(0),
	Font = if FoundationFontFaceMigration then TModule.union(TModule.EnumItem, ValidateFontFaceModule) else TModule.EnumItem,
	FontFace = if FoundationFontFaceMigration then TModule.optional(ValidateFontFaceModule) else nil
})