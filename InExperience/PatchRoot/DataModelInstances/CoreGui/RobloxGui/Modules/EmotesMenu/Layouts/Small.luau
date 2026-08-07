local appFonts = require(game:GetService("CorePackages").Workspace.Packages.Style).AppFonts

return {
	ErrorFrameAspectRatio = 6,
	ErrorTextSize = 24,
	ErrorIcon = "rbxasset://textures/ui/Emotes/ErrorIcon.png",
	ErrorIconOffset = 10,
	MiddleTextSize = 18,
	SlotNumberTextSize = 16,
	CircleBackground = "rbxasset://textures/ui/Emotes/Small/CircleBackground.png",
	SegmentedCircle = "rbxasset://textures/ui/Emotes/Small/SegmentedCircle.png",
	SelectedLine = "rbxasset://textures/ui/Emotes/Small/SelectedLine.png",
	SelectedLinePadding = 2,
	SelectedGradient = "rbxasset://textures/ui/Emotes/Small/SelectedGradient.png",
	EmotesWheelMinSize = Vector2.new(150, 150),
	EmotesWheelMaxSize = Vector2.new(300, 300),
	ErrorFrameSize = UDim2.new(0.6, 0, 0.2, 0),
	ErrorFramePosition = UDim2.new(0, 0, 0.1, 0),
	ErrorFrameMinSize = Vector2.new(336, 56),
	ErrorFrameMaxSize = Vector2.new(432, 72),
	ErrorTextFont = appFonts.default:getDefault(),
	MiddleTextFont = appFonts.default:getDefault(),
	SlotNumberFont = appFonts.default:getDefault(),
	SelectedLineImageSize = Vector2.new(8, 50),
	SelectedGradientImageSize = Vector2.new(138, 106),
	EmotesListPosition = UDim2.new(1, -119, 1, -114)
}