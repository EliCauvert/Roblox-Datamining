local tModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Color = tModule.ColorSequence,
	Transparency = tModule.NumberSequence,
	Rotation = tModule.number,
	Offset = tModule.optional(tModule.Vector2)
})