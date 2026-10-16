local TModule = require(game:GetService("CorePackages").Packages.t)
local TypesModule = {
	IMessage = TModule.strictInterface({
		id = TModule.string,
		name = TModule.string,
		text = TModule.string,
		userId = TModule.string,
		timestamp = TModule.number,
		adornee = TModule.union(TModule.instanceIsA("BasePart"), TModule.instanceOf("Model"))
	}),
	IMessageData = TModule.interface({
		ID = TModule.number,
		SpeakerUserId = TModule.number,
		FromSpeaker = TModule.string,
		Time = TModule.number,
		Message = TModule.optional(TModule.string)
	})
}
local config = {
	BubbleDuration = TModule.optional(TModule.number),
	MaxBubbles = TModule.optional(TModule.number),
	BackgroundColor3 = TModule.optional(TModule.Color3),
	TextColor3 = TModule.optional(TModule.Color3),
	TextSize = TModule.optional(TModule.number),
	Font = TModule.optional(TModule.enum(Enum.Font)),
	Transparency = TModule.optional(TModule.number),
	CornerEnabled = TModule.optional(TModule.boolean),
	CornerRadius = TModule.optional(TModule.UDim),
	TailVisible = TModule.optional(TModule.boolean),
	Padding = TModule.optional(TModule.number),
	MaxWidth = TModule.optional(TModule.number),
	BackgroundImage = TModule.optional(TModule.strictInterface({
		Image = TModule.optional(TModule.string),
		ImageColor3 = TModule.optional(TModule.Color3),
		ImageRectOffset = TModule.optional(TModule.Vector2),
		ImageRectSize = TModule.optional(TModule.Vector2),
		ScaleType = TModule.optional(TModule.enum(Enum.ScaleType)),
		SliceCenter = TModule.optional(TModule.Rect),
		SliceScale = TModule.optional(TModule.number),
		TileSize = TModule.optional(TModule.UDim2)
	})),
	BackgroundGradient = TModule.optional(TModule.strictInterface({
		Enabled = TModule.optional(TModule.boolean),
		Color = TModule.optional(TModule.ColorSequence),
		Offset = TModule.optional(TModule.Vector2),
		Rotation = TModule.optional(TModule.number),
		Transparency = TModule.optional(TModule.NumberSequence)
	})),
	SizeAnimation = TModule.optional(TModule.strictInterface({
		Enabled = TModule.optional(TModule.boolean),
		SpringDampingRatio = TModule.optional(TModule.number),
		SpringFrequency = TModule.optional(TModule.number)
	})),
	TransparencyAnimation = TModule.optional(TModule.strictInterface({
		Enabled = TModule.optional(TModule.boolean),
		SpringDampingRatio = TModule.optional(TModule.number),
		SpringFrequency = TModule.optional(TModule.number)
	})),
	VerticalStudsOffset = TModule.optional(TModule.number),
	LocalPlayerStudsOffset = TModule.optional(TModule.Vector3),
	BubblesSpacing = TModule.optional(TModule.number),
	MinimizeDistance = TModule.optional(TModule.number),
	MaxDistance = TModule.optional(TModule.number),
	AdorneeName = TModule.optional(TModule.string),
	Voice = TModule.optional(TModule.strictInterface({ ShowIndicator = TModule.optional(TModule.boolean) }))
}
local t = {}

for i, value in pairs(config) do
	t[i] = value
end
config.UserSpecificSettings = TModule.optional(TModule.map(TModule.string, TModule.strictInterface(t)))
TypesModule.IChatSettings = TModule.strictInterface(config)

return TypesModule