local appFonts = require(game:GetService("CorePackages").Workspace.Packages.Style).AppFonts

return {
	ErrorFrameAspectRatio = 6,
	ErrorTextSize = 36,
	ErrorIcon = "rbxasset://textures/ui/Emotes/ErrorIcon.png",
	ErrorIconOffset = 10,
	MiddleTextSize = 28,
	SlotNumberTextSize = 24,
	CircleBackground = "rbxasset://textures/ui/Emotes/Large/CircleBackground.png",
	SegmentedCircle = "rbxasset://textures/ui/Emotes/Large/SegmentedCircle.png",
	SelectedLine = "rbxasset://textures/ui/Emotes/Large/SelectedLine.png",
	SelectedLinePadding = 4,
	SelectedGradient = "rbxasset://textures/ui/Emotes/Large/SelectedGradient.png",
	EmotesWheelMinSize = Vector2.new(200, 200),
	EmotesWheelMaxSize = Vector2.new(400, 400),
	ErrorFrameSize = UDim2.new(0.6, 0, 0.2, 0),
	ErrorFramePosition = UDim2.new(0, 0, 0.1, 0),
	ErrorFrameMinSize = Vector2.new(336, 56),
	ErrorFrameMaxSize = Vector2.new(432, 72),
	ErrorTextFont = appFonts.default:getDefault(),
	MiddleTextFont = appFonts.default:getDefault(),
	SlotNumberFont = appFonts.default:getDefault(),
	SelectedLineImageSize = Vector2.new(11, 67),
	SelectedGradientImageSize = Vector2.new(183, 141)
}