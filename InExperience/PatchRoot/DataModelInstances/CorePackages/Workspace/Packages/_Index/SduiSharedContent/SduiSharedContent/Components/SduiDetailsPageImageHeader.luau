local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)
local View = FoundationModule.View
local Image = FoundationModule.Image

return ReactModule.memo(function(p1) --[[ Line: 42 | Named "SduiDetailsPageImageHeader" ]]
	-- upvalues: ReactModule (copy), View (copy), Image (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center",
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		backgroundStyle = p1.backgroundStyle,
		AutomaticSize = p1.automaticSize,
		testId = p1.testId
	}, {
		Image = ReactModule.createElement(Image, {
			Image = p1.image,
			Size = p1.imageSize,
			TileSize = p1.tileSize,
			ScaleType = p1.scaleType,
			ResampleMode = p1.resampleMode,
			imageStyle = p1.imageStyle,
			tag = p1.imageTag,
			SizeConstraint = p1.imageSizeConstraint
		})
	})
end)