local parent = script.Parent.Parent.Parent.Parent.Parent
local foundationModule = require(parent.Foundation)
local tModule = require(parent.t)
local validateFontFaceModule = require(script.Parent.validateFontFace)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

return tModule.strictInterface({
	RelativeSize = tModule.numberMinExclusive(0),
	RelativeMinSize = tModule.numberMinExclusive(0),
	Font = if foundationFontFaceMigration then tModule.union(tModule.EnumItem, validateFontFaceModule) else tModule.EnumItem,
	FontFace = if foundationFontFaceMigration then tModule.optional(validateFontFaceModule) else nil
})