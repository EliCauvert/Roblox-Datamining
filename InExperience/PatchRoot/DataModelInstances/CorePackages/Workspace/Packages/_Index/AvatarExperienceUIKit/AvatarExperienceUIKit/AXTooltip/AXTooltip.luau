local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local radius = foundationModule.Enums.Radius
local t = {
	Top = UDim2.fromScale(0.5, 0),
	Bottom = UDim2.fromScale(0.5, 1),
	Left = UDim2.fromScale(0, 0.5),
	Right = UDim2.fromScale(1, 0.5)
}

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), popover (ref), t (ref), popoverAlign (ref), radius (ref), foundationModule (ref)
	return reactModule.createElement(popover.Root, { isOpen = p0.isOpen }, {
		AXTooltipAnchor = reactModule.createElement(popover.Anchor, { Position = t[p0.popoverSide] }),
		AXTooltipContent = reactModule.createElement(popover.Content, {
			align = popoverAlign.Center,
			side = p0.popoverSide,
			backgroundStyle = useTokens().Color.System.Contrast,
			radius = radius.Medium
		}, {
			AXTooltipTextFrame = reactModule.createElement(foundationModule.View, {
				tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
			}, {
				AXTooltipTitle = reactModule.createElement(foundationModule.Text, {
					Text = p0.tooltipText,
					Size = if p0.maxWidth then UDim2.new(0, p0.maxWidth, 0, 0) else nil,
					tag = if p0.maxWidth then "auto-y text-title-medium content-inverse-emphasis" else "auto-xy text-title-medium content-inverse-emphasis",
					TextWrapped = if p0.maxWidth then true else nil
				})
			}),
			AXTooltipOverlayButton = reactModule.createElement("TextButton", {
				Transparency = 1,
				[reactModule.Event.Activated] = p0.onTooltipActivated,
				Size = UDim2.fromScale(1, 1)
			})
		})
	})
end