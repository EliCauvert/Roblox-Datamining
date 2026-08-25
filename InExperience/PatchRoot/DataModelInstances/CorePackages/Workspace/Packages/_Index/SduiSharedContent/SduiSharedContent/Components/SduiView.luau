local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local fFlagSduiViewContainerRefEnabled = require(parent.SharedFlags).FFlagSduiViewContainerRefEnabled

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), foundationModule (ref), fFlagSduiViewContainerRefEnabled (ref)
	return reactModule.createElement(foundationModule.View, {
		ref = if fFlagSduiViewContainerRefEnabled then p0.containerRef else nil,
		AnchorPoint = p0.anchorPoint,
		AutomaticSize = p0.automaticSize,
		ClipsDescendants = p0.clipsDescendants,
		GroupTransparency = p0.groupTransparency,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Rotation = p0.rotation,
		Size = p0.size,
		SizeConstraint = p0.sizeConstraint,
		Visible = p0.visible,
		ZIndex = p0.zIndex,
		aspectRatio = p0.aspectRatio,
		backgroundStyle = p0.backgroundStyle,
		cornerRadius = p0.cornerRadius,
		cursor = p0.cursorType,
		isDisabled = p0.isDisabled,
		onActivated = p0.onActivated,
		onSecondaryActivated = p0.onSecondaryActivated,
		padding = p0.padding,
		scale = p0.scale,
		selection = if p0.selectable ~= nil then nil else { Selectable = p0.selectable },
		selectionGroup = p0.selectionGroup,
		tag = p0.tag,
		testId = p0.testId
	}, p0.children)
end)