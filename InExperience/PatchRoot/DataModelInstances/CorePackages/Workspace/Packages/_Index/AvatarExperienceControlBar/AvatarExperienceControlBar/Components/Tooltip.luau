local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local popover = foundationModule.Popover
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local _ = require(avatarExperienceControlBar.ControlBarTypes)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), popover (ref), popoverAlign (ref), popoverSide (ref), radius (ref), foundationModule (ref)
	return reactModule.createElement(popover.Root, { isOpen = p0.open or false }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, p0.children),
		Content = reactModule.createElement(popover.Content, {
			align = p0.align or popoverAlign.Center,
			side = p0.side or popoverSide.Right,
			backgroundStyle = useTokens().Color.OverMedia.OverMedia_0,
			radius = p0.radius or radius.Small
		}, reactModule.createElement(foundationModule.View, { tag = "col gap-small padding-medium auto-xy" }, {
			Title = if p0.titleText then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis",
				Text = p0.titleText
			}) else nil,
			Subtitle = if p0.bodyText then reactModule.createElement(foundationModule.Text, { tag = "auto-xy text-body-small", Text = p0.bodyText }) else nil
		}))
	})
end