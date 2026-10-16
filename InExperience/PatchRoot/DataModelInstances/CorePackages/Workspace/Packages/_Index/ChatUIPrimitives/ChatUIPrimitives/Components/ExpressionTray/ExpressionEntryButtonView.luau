local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local config = { name = "lightning-bolt", variant = "Regular" }

return ReactModule.memo(function(p1) --[[ Line: 31 | Named "ExpressionEntryButtonView" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), config (copy)
	if p1.isFullWidth then
		return ReactModule.createElement(FoundationModule.Button, {
			fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
			onActivated = p1.onActivated,
			text = p1.text or "",
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			width = UDim.new(1, 0),
			ref = p1.buttonRef
		})
	else
		local Icon = p1.icon or config
		
		return ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			isDisabled = false,
			icon = if p1.isActive then { variant = "Filled", name = Icon.name } else Icon,
			variant = FoundationModule.Enums.ButtonVariant.Standard,
			size = if p1.size == nil then FoundationModule.Enums.InputSize.Small else p1.size,
			onActivated = p1.onActivated,
			ref = p1.buttonRef
		})
	end
end)