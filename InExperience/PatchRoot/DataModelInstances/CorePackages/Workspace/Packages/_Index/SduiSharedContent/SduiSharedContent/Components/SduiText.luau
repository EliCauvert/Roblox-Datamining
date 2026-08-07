local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)

return function(p0) --[[ line: 52 | named "SduiText" ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		AnchorPoint = p0.anchorPoint,
		AutomaticSize = p0.automaticSize,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		RichText = p0.richText,
		Rotation = p0.rotation,
		Size = p0.size,
		SizeConstraint = p0.sizeConstraint,
		Text = p0.text,
		TextTruncate = p0.textTruncate,
		TextWrapped = p0.textWrapped,
		TextXAlignment = p0.textXAlignment,
		TextYAlignment = p0.textYAlignment,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		aspectRatio = p0.aspectRatio,
		backgroundStyle = p0.backgroundStyle,
		cornerRadius = p0.cornerRadius,
		cursor = p0.cursorType,
		fontStyle = p0.fontStyle,
		isDisabled = p0.isDisabled,
		onActivated = p0.onActivated,
		onSecondaryActivated = p0.onSecondaryActivated,
		padding = p0.padding,
		scale = p0.scale,
		selection = if p0.selectable ~= nil then nil else { Selectable = p0.selectable },
		tag = p0.tag,
		testId = p0.testId,
		textStyle = p0.textStyle
	}, p0.children)
end