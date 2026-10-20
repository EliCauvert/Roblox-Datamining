local TModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return TModule.strictInterface({
	RelativeSize = TModule.numberMinExclusive(0),
	RelativeMinSize = TModule.numberMinExclusive(0),
	Font = TModule.EnumItem
})