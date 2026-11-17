local Parent = script:FindFirstAncestor("SduiFoundation").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant

return ReactModule.memo(function(p1)
	-- upvalues: StatusIndicatorVariant (copy), ReactModule (copy), StatusIndicator (copy)
	local StatusIndicatorVariantEntry = if p1.variant then StatusIndicatorVariant[p1.variant] else nil
	local Value = p1.value
	
	return if Value == nil then ReactModule.createElement(StatusIndicator, {
		variant = StatusIndicatorVariantEntry,
		shape = p1.shape,
		size = p1.size,
		mask = p1.mask,
		testId = p1.testId,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex
	}) else ReactModule.createElement(StatusIndicator, {
		variant = StatusIndicatorVariantEntry,
		value = Value,
		max = p1.max,
		size = p1.size,
		mask = p1.mask,
		testId = p1.testId,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex
	})
end)