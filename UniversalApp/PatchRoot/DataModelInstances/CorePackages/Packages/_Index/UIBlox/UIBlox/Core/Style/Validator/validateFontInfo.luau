local parent = script.Parent.Parent.Parent.Parent.Parent
local tModule = require(parent.t)

return tModule.strictInterface({
	RelativeSize = tModule.numberMinExclusive(0),
	RelativeMinSize = tModule.numberMinExclusive(0),
	Font = if require(parent.Foundation).Utility.Flags.FoundationFontFaceMigration then tModule.union(tModule.EnumItem, require(script.Parent.validateFontFace)) else tModule.EnumItem
})