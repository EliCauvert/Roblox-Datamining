local tModule = require(game:GetService("CorePackages").Packages.t)
local t = {
	IMessage = tModule.strictInterface({
		id = tModule.string,
		name = tModule.string,
		text = tModule.string,
		userId = tModule.string,
		timestamp = tModule.number,
		adornee = tModule.union(tModule.instanceIsA("BasePart"), tModule.instanceOf("Model"))
	}),
	IMessageData = tModule.interface({
		ID = tModule.number,
		SpeakerUserId = tModule.number,
		FromSpeaker = tModule.string,
		Time = tModule.number,
		Message = tModule.optional(tModule.string)
	})
}
local t_1 = {
	BubbleDuration = tModule.optional(tModule.number),
	MaxBubbles = tModule.optional(tModule.number),
	BackgroundColor3 = tModule.optional(tModule.Color3),
	TextColor3 = tModule.optional(tModule.Color3),
	TextSize = tModule.optional(tModule.number),
	Font = tModule.optional(tModule.enum(Enum.Font)),
	Transparency = tModule.optional(tModule.number),
	CornerEnabled = tModule.optional(tModule.boolean),
	CornerRadius = tModule.optional(tModule.UDim),
	TailVisible = tModule.optional(tModule.boolean),
	Padding = tModule.optional(tModule.number),
	MaxWidth = tModule.optional(tModule.number),
	BackgroundImage = tModule.optional(tModule.strictInterface({
		Image = tModule.optional(tModule.string),
		ImageColor3 = tModule.optional(tModule.Color3),
		ImageRectOffset = tModule.optional(tModule.Vector2),
		ImageRectSize = tModule.optional(tModule.Vector2),
		ScaleType = tModule.optional(tModule.enum(Enum.ScaleType)),
		SliceCenter = tModule.optional(tModule.Rect),
		SliceScale = tModule.optional(tModule.number),
		TileSize = tModule.optional(tModule.UDim2)
	})),
	BackgroundGradient = tModule.optional(tModule.strictInterface({
		Enabled = tModule.optional(tModule.boolean),
		Color = tModule.optional(tModule.ColorSequence),
		Offset = tModule.optional(tModule.Vector2),
		Rotation = tModule.optional(tModule.number),
		Transparency = tModule.optional(tModule.NumberSequence)
	})),
	SizeAnimation = tModule.optional(tModule.strictInterface({
		Enabled = tModule.optional(tModule.boolean),
		SpringDampingRatio = tModule.optional(tModule.number),
		SpringFrequency = tModule.optional(tModule.number)
	})),
	TransparencyAnimation = tModule.optional(tModule.strictInterface({
		Enabled = tModule.optional(tModule.boolean),
		SpringDampingRatio = tModule.optional(tModule.number),
		SpringFrequency = tModule.optional(tModule.number)
	})),
	VerticalStudsOffset = tModule.optional(tModule.number),
	LocalPlayerStudsOffset = tModule.optional(tModule.Vector3),
	BubblesSpacing = tModule.optional(tModule.number),
	MinimizeDistance = tModule.optional(tModule.number),
	MaxDistance = tModule.optional(tModule.number),
	AdorneeName = tModule.optional(tModule.string),
	Voice = tModule.optional(tModule.strictInterface({ ShowIndicator = tModule.optional(tModule.boolean) }))
}
local t_2 = {}

for i, v in pairs(t_1) do
	t_2[i] = v
end
t_1.UserSpecificSettings = tModule.optional(tModule.map(tModule.string, tModule.strictInterface(t_2)))
t.IChatSettings = tModule.strictInterface(t_1)

return t