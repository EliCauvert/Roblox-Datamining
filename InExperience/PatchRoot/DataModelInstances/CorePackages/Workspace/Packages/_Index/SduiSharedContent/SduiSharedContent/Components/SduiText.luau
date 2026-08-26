local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		AnchorPoint = p1.anchorPoint,
		AutomaticSize = p1.automaticSize,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		RichText = p1.richText,
		Rotation = p1.rotation,
		Size = p1.size,
		SizeConstraint = p1.sizeConstraint,
		Text = p1.text,
		TextTruncate = p1.textTruncate,
		TextWrapped = p1.textWrapped,
		TextXAlignment = p1.textXAlignment,
		TextYAlignment = p1.textYAlignment,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		aspectRatio = p1.aspectRatio,
		backgroundStyle = p1.backgroundStyle,
		cornerRadius = p1.cornerRadius,
		cursor = p1.cursorType,
		fontStyle = p1.fontStyle,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		onSecondaryActivated = p1.onSecondaryActivated,
		padding = p1.padding,
		scale = p1.scale,
		selection = if p1.selectable ~= nil then nil else { Selectable = p1.selectable },
		tag = p1.tag,
		testId = p1.testId,
		textStyle = p1.textStyle
	}, p1.children)
end