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
local compactTooltipContentModule = require(script.Parent.CompactTooltipContent)
local fFlagMeProfileEntryTooltipEnabled = require(parent.AvatarExperienceFlags).FFlagMeProfileEntryTooltipEnabled

return function(p1)
	-- upvalues: useTokens (ref), fFlagMeProfileEntryTooltipEnabled (ref), popoverSide (ref), reactModule (ref), popover (ref), popoverAlign (ref), radius (ref), compactTooltipContentModule (ref), foundationModule (ref)
	local var1 = useTokens()
	local var2 = fFlagMeProfileEntryTooltipEnabled and p1.compact == true
	local side = p1.side or popoverSide.Right
	local var3 = nil
	
	if fFlagMeProfileEntryTooltipEnabled then
		var3 = reactModule.useMemo(function()
			-- upvalues: side (ref), var1 (ref)
			return { position = side, offset = var1.Size.Size_150 }
		end, { side, var1.Size.Size_150 })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref)
			if p1.open and p1.onShown then
				p1.onShown()
			end
		end, { p1.open, p1.onShown })
	end
	return reactModule.createElement(popover.Root, { isOpen = p1.open or false }, {
		Anchor = reactModule.createElement(popover.Anchor, {
			LayoutOrder = if fFlagMeProfileEntryTooltipEnabled then p1.LayoutOrder else nil,
			Visible = if fFlagMeProfileEntryTooltipEnabled then p1.Visible else nil
		}, p1.children),
		Content = reactModule.createElement(popover.Content, {
			align = p1.align or (if var2 then popoverAlign.Start else popoverAlign.Center),
			side = if var2 then var3 else side,
			backgroundStyle = if var2 then var1.Inverse.Surface.Surface_0 else var1.Color.OverMedia.OverMedia_0,
			radius = p1.radius or (if var2 then radius.Medium else radius.Small),
			selectionGroup = if var2 then false else nil
		}, if var2 then reactModule.createElement(compactTooltipContentModule, { bodyText = p1.bodyText, onDismiss = p1.onDismiss }) else reactModule.createElement(foundationModule.View, { tag = "col gap-small auto-xy padding-medium" }, {
			Title = if p1.titleText then reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis",
				Text = p1.titleText
			}) else nil,
			Subtitle = if p1.bodyText then reactModule.createElement(foundationModule.Text, { tag = "auto-xy text-body-small", Text = p1.bodyText }) else nil
		}))
	})
end