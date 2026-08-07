local tModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	RelativeSize = tModule.numberMinExclusive(0),
	RelativeMinSize = tModule.numberMinExclusive(0),
	Font = tModule.EnumItem
})