local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Popover = FoundationModule.Popover
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(AvatarExperienceControlBar.ControlBarTypes)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Popover (copy), PopoverAlign (copy), PopoverSide (copy), Radius (copy), FoundationModule (copy)
	return ReactModule.createElement(Popover.Root, { isOpen = p1.open or false }, {
		Anchor = ReactModule.createElement(Popover.Anchor, nil, p1.children),
		Content = ReactModule.createElement(Popover.Content, {
			align = p1.align or PopoverAlign.Center,
			side = p1.side or PopoverSide.Right,
			backgroundStyle = UseTokensFunction().Color.OverMedia.OverMedia_0,
			radius = p1.radius or Radius.Small
		}, ReactModule.createElement(FoundationModule.View, { tag = "col gap-small padding-medium auto-xy" }, {
			Title = if p1.titleText then ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis",
				Text = p1.titleText
			}) else nil,
			Subtitle = if p1.bodyText then ReactModule.createElement(FoundationModule.Text, { tag = "auto-xy text-body-small", Text = p1.bodyText }) else nil
		}))
	})
end