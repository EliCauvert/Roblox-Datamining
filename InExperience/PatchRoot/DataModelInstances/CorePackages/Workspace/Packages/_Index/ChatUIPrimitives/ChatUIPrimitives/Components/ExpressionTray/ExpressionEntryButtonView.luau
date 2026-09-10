local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local t = { name = "lightning-bolt", variant = "Regular" }

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), t (ref)
	if p1.isFullWidth then
		return reactModule.createElement(foundationModule.Button, {
			fillBehavior = foundationModule.Enums.FillBehavior.Fit,
			onActivated = p1.onActivated,
			text = p1.text or "",
			variant = foundationModule.Enums.ButtonVariant.Standard,
			width = UDim.new(1, 0)
		})
	end
	local icon = p1.icon or t
	
	return reactModule.createElement(foundationModule.IconButton, {
		isCircular = true,
		isDisabled = false,
		icon = if p1.isActive then { variant = "Filled", name = icon.name } else icon,
		variant = foundationModule.Enums.ButtonVariant.Standard,
		size = if p1.size ~= nil then foundationModule.Enums.InputSize.Small else p1.size,
		onActivated = p1.onActivated
	})
end)