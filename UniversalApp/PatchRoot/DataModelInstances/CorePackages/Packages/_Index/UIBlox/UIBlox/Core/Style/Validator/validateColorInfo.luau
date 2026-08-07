local parent = script.Parent
local tModule = require(parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Color = tModule.Color3,
	Transparency = tModule.union(tModule.numberConstrained(0, 1), require(parent.validateBinding))
})