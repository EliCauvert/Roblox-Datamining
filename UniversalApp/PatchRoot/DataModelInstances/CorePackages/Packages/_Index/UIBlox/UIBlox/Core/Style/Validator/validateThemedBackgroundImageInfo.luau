local tModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Color = tModule.Color3,
	Transparency = tModule.numberConstrained(0, 1),
	Image = tModule.string
})