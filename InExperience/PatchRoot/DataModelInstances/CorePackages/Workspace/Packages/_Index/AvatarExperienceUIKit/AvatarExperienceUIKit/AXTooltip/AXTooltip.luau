local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Radius = FoundationModule.Enums.Radius
local config = {
	Top = UDim2.fromScale(0.5, 0),
	Bottom = UDim2.fromScale(0.5, 1),
	Left = UDim2.fromScale(0, 0.5),
	Right = UDim2.fromScale(1, 0.5)
}

return function(p1) --[[ Line: 31 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Popover (copy), config (copy), PopoverAlign (copy), Radius (copy), FoundationModule (copy)
	return ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
		AXTooltipAnchor = ReactModule.createElement(Popover.Anchor, { Position = config[p1.popoverSide] }),
		AXTooltipContent = ReactModule.createElement(Popover.Content, {
			align = PopoverAlign.Center,
			side = p1.popoverSide,
			backgroundStyle = UseTokensFunction().Color.System.Contrast,
			radius = Radius.Medium
		}, {
			AXTooltipTextFrame = ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
			}, {
				AXTooltipTitle = ReactModule.createElement(FoundationModule.Text, {
					Text = p1.tooltipText,
					Size = if p1.maxWidth then UDim2.new(0, p1.maxWidth, 0, 0) else nil,
					tag = if p1.maxWidth then "auto-y text-title-medium content-inverse-emphasis" else "auto-xy text-title-medium content-inverse-emphasis",
					TextWrapped = if p1.maxWidth then true else nil
				})
			}),
			AXTooltipOverlayButton = ReactModule.createElement("TextButton", {
				Transparency = 1,
				[ReactModule.Event.Activated] = p1.onTooltipActivated,
				Size = UDim2.fromScale(1, 1)
			})
		})
	})
end