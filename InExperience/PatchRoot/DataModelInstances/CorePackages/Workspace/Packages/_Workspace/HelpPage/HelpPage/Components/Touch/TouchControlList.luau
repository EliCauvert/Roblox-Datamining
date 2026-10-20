local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local _ = require(Parent.Components.Common.ActionText)
local ControlActionRowModule = require(Parent.Components.Common.ControlActionRow)
local TouchControlIconModule = require(script.Parent.TouchControlIcon)

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), ControlActionRowModule (copy), TouchControlIconModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local IsShowIconBackground = p1.showIconBackground ~= false
	local Elements = {}
	
	for LayoutOrder, control in ipairs(p1.controls) do
		Elements[control.id] = ReactModule.createElement(ControlActionRowModule, {
			textVariant = p1.textVariant or "label-small",
			actionLabels = { { label = control.label, disabled = control.disabled } },
			layoutOrderReversed = p1.layoutOrderReversed,
			layoutOrder = LayoutOrder,
			iconWidth = UseTokensResult.Size.Size_500,
			testId = "TouchActionText-" .. control.id,
			icon = ReactModule.createElement(TouchControlIconModule, {
				name = control.icon,
				diameter = UseTokensResult.Size.Size_500,
				iconDiameter = if IsShowIconBackground then UseTokensResult.Size.Size_300 else UseTokensResult.Size.Size_500,
				disabled = control.disabled,
				showBackground = IsShowIconBackground,
				LayoutOrder = if p1.layoutOrderReversed then 1 else 2,
				testId = "TouchActionIcon-" .. control.id
			})
		})
	end
	return ReactModule.createElement(FoundationModule.View, { tag = "col gap-small size-full-0 auto-y" }, Elements)
end)