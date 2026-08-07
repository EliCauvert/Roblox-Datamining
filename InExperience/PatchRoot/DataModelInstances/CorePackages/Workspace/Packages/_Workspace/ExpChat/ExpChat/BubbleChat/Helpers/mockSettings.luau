return {
	BubbleDuration = 15,
	MaxBubbles = 3,
	BackgroundTransparency = 0.1,
	TextSize = 16,
	Transparency = 0.1,
	TailVisible = true,
	Padding = 8,
	MaxWidth = 300,
	VerticalStudsOffset = 0,
	LocalPlayerStudsOffset = Vector3.new(0, 0, 2),
	BubblesSpacing = 6,
	MinimizeDistance = 40,
	MaxDistance = 100,
	AdorneeName = "HumanoidRootPart",
	BackgroundColor3 = Color3.fromRGB(250, 250, 250),
	TextColor3 = Color3.fromRGB(57, 59, 61),
	FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
	ImageLabel = {
		Image = "",
		SliceScale = 1,
		ImageColor3 = Color3.new(1, 1, 1),
		ImageRectOffset = Vector2.new(),
		ImageRectSize = Vector2.new(),
		ScaleType = Enum.ScaleType.Stretch,
		SliceCenter = Rect.new(Vector2.new(), Vector2.new()),
		TileSize = UDim2.fromScale(1, 1)
	},
	UIGradient = {
		Enabled = false,
		Rotation = 0,
		Color = ColorSequence.new(Color3.fromRGB(150, 150, 150), Color3.fromRGB(250, 250, 250)),
		Offset = Vector2.new(),
		Transparency = NumberSequence.new(0)
	},
	UICorner = { CornerRadius = UDim.new(0, 12) },
	SizeAnimation = {
		Enabled = true,
		SpringDampingRatio = 1,
		SpringFrequency = 2
	},
	TransparencyAnimation = {
		Enabled = true,
		SpringDampingRatio = 1,
		SpringFrequency = 2
	},
	Voice = { ShowIndicator = true },
	UserSpecificSettings = {}
}