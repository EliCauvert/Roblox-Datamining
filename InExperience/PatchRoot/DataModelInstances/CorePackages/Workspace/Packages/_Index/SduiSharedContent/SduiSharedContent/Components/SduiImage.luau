local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Image, {
		AnchorPoint = p1.anchorPoint,
		AutomaticSize = p1.automaticSize,
		ClipsDescendants = p1.clipsDescendants,
		Image = p1.image,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ResampleMode = p1.resampleMode,
		ScaleType = p1.scaleType,
		Size = p1.size,
		SizeConstraint = p1.sizeConstraint,
		TileSize = p1.tileSize,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		aspectRatio = p1.aspectRatio,
		backgroundStyle = p1.backgroundStyle,
		cornerRadius = p1.cornerRadius,
		cursor = p1.cursorType,
		imageStyle = p1.imageStyle,
		onActivated = p1.onActivated,
		tag = p1.tag,
		testId = p1.testId
	})
end