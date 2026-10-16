local Parent = script.Parent
local TModule = require(Parent.Parent.Parent.Parent.Parent.t)

return TModule.strictInterface({
	Color = TModule.Color3,
	Transparency = TModule.union(TModule.numberConstrained(0, 1), (require(Parent.validateBinding)))
})