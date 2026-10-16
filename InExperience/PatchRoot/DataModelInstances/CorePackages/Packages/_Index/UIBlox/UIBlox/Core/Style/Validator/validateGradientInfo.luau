local TModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return TModule.strictInterface({
	Color = TModule.ColorSequence,
	Transparency = TModule.NumberSequence,
	Rotation = TModule.number,
	Offset = TModule.optional(TModule.Vector2)
})