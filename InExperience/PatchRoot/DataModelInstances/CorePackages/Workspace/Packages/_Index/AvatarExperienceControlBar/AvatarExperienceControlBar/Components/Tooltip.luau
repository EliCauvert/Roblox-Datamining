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
local CompactTooltipContentModule = require(script.Parent.CompactTooltipContent)
local FFlagMeProfileEntryTooltipEnabled = require(Parent.AvatarExperienceFlags).FFlagMeProfileEntryTooltipEnabled

return function(Frame) --[[ Line: 17 | Named "Tooltip" ]]
	-- upvalues: UseTokensFunction (copy), FFlagMeProfileEntryTooltipEnabled (copy), PopoverSide (copy), ReactModule (copy), Popover (copy), PopoverAlign (copy), Radius (copy), CompactTooltipContentModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsCompact: boolean = FFlagMeProfileEntryTooltipEnabled and Frame.compact == true
	local Side = Frame.side or PopoverSide.Right
	local UseMemoResult = nil
	
	if FFlagMeProfileEntryTooltipEnabled then
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 23 ]]
			-- upvalues: Side (copy), UseTokensResult (copy)
			return { position = Side, offset = UseTokensResult.Size.Size_150 }
		end, { Side, UseTokensResult.Size.Size_150 })
		ReactModule.useEffect(function() --[[ Line: 26 ]]
			-- upvalues: Frame (copy)
			if Frame.open and Frame.onShown then
				Frame.onShown()
			end
		end, { Frame.open, Frame.onShown })
	end
	return ReactModule.createElement(Popover.Root, { isOpen = Frame.open or false }, {
		Anchor = ReactModule.createElement(Popover.Anchor, {
			LayoutOrder = if FFlagMeProfileEntryTooltipEnabled then Frame.LayoutOrder else nil,
			Visible = if FFlagMeProfileEntryTooltipEnabled then Frame.Visible else nil
		}, Frame.children),
		Content = ReactModule.createElement(Popover.Content, {
			align = Frame.align or (if IsCompact then PopoverAlign.Start else PopoverAlign.Center),
			side = if IsCompact then UseMemoResult else Side,
			backgroundStyle = if IsCompact then UseTokensResult.Inverse.Surface.Surface_0 else UseTokensResult.Color.OverMedia.OverMedia_0,
			radius = Frame.radius or (if IsCompact then Radius.Medium else Radius.Small),
			selectionGroup = not IsCompact and nil
		}, if IsCompact then ReactModule.createElement(CompactTooltipContentModule, { bodyText = Frame.bodyText, onDismiss = Frame.onDismiss }) else ReactModule.createElement(FoundationModule.View, { tag = "col gap-small auto-xy padding-medium" }, {
			Title = if Frame.titleText then ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis",
				Text = Frame.titleText
			}) else nil,
			Subtitle = if Frame.bodyText then ReactModule.createElement(FoundationModule.Text, { tag = "auto-xy text-body-small", Text = Frame.bodyText }) else nil
		}))
	})
end