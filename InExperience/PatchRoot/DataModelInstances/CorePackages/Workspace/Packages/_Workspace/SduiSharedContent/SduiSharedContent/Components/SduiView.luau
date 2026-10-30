local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiViewContainerRefEnabled = SharedFlagsModule.FFlagSduiViewContainerRefEnabled
local FFlagSduiViewStateLayerAffordance = SharedFlagsModule.FFlagSduiViewStateLayerAffordance

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FFlagSduiViewContainerRefEnabled (copy), FFlagSduiViewStateLayerAffordance (copy)
	return ReactModule.createElement(FoundationModule.View, {
		ref = if FFlagSduiViewContainerRefEnabled then p1.containerRef else nil,
		AnchorPoint = p1.anchorPoint,
		AutomaticSize = p1.automaticSize,
		ClipsDescendants = p1.clipsDescendants,
		GroupTransparency = p1.groupTransparency,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Rotation = p1.rotation,
		Size = p1.size,
		SizeConstraint = p1.sizeConstraint,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		aspectRatio = p1.aspectRatio,
		backgroundStyle = p1.backgroundStyle,
		cornerRadius = p1.cornerRadius,
		cursor = p1.cursorType,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		onSecondaryActivated = p1.onSecondaryActivated,
		padding = p1.padding,
		scale = p1.scale,
		selection = if p1.selectable == nil then nil else { Selectable = p1.selectable },
		selectionGroup = p1.selectionGroup,
		stateLayer = if FFlagSduiViewStateLayerAffordance and p1.stateLayerAffordance ~= nil then { affordance = p1.stateLayerAffordance } else nil,
		tag = p1.tag,
		testId = p1.testId
	}, p1.children)
end)