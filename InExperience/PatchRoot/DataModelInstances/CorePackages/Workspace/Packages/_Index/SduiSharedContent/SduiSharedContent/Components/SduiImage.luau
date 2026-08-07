local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return function(p0) --[[ line: 39 | named "SduiImage" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Image, {
		AnchorPoint = p0.anchorPoint,
		AutomaticSize = p0.automaticSize,
		ClipsDescendants = p0.clipsDescendants,
		Image = p0.image,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		ResampleMode = p0.resampleMode,
		ScaleType = p0.scaleType,
		Size = p0.size,
		SizeConstraint = p0.sizeConstraint,
		TileSize = p0.tileSize,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		aspectRatio = p0.aspectRatio,
		backgroundStyle = p0.backgroundStyle,
		cornerRadius = p0.cornerRadius,
		cursor = p0.cursorType,
		imageStyle = p0.imageStyle,
		onActivated = p0.onActivated,
		tag = p0.tag,
		testId = p0.testId
	})
end