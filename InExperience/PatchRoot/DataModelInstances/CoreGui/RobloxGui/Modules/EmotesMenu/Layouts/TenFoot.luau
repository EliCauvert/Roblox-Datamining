local appFonts = require(game:GetService("CorePackages").Workspace.Packages.Style).AppFonts

return {
	ErrorFrameAspectRatio = 6,
	ErrorTextSize = 48,
	ErrorIcon = "rbxasset://textures/ui/Emotes/ErrorIcon.png",
	ErrorIconOffset = 10,
	MiddleTextSize = 48,
	SlotNumberTextSize = 48,
	CircleBackground = "rbxasset://textures/ui/Emotes/TenFoot/CircleBackground.png",
	SegmentedCircle = "rbxasset://textures/ui/Emotes/TenFoot/SegmentedCircle.png",
	SelectedLine = "rbxasset://textures/ui/Emotes/TenFoot/SelectedLine.png",
	SelectedLinePadding = 5,
	SelectedGradient = "rbxasset://textures/ui/Emotes/TenFoot/SelectedGradient.png",
	EmotesWheelMinSize = Vector2.new(320, 320),
	EmotesWheelMaxSize = Vector2.new(640, 640),
	ErrorFrameSize = UDim2.new(0.6, 0, 0.2, 0),
	ErrorFramePosition = UDim2.new(0, 0, 0.1, 0),
	ErrorFrameMinSize = Vector2.new(336, 56),
	ErrorFrameMaxSize = Vector2.new(432, 72),
	ErrorTextFont = appFonts.default:getDefault(),
	MiddleTextFont = appFonts.default:getDefault(),
	SlotNumberFont = appFonts.default:getDefault(),
	SelectedLineImageSize = Vector2.new(18, 107),
	SelectedGradientImageSize = Vector2.new(292, 225),
	EmotesListPosition = UDim2.new(1, -194, 1, -234)
}