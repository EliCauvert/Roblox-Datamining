local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Popover = FoundationModule.Popover
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local LocalizationModule = require(ExpChat.Localization)
local UseIsChatBackgroundVisibleModule = require(ExpChat.Stores.GetTransparencyStore.useIsChatBackgroundVisible)

return ReactModule.memo(function(p1)
	-- upvalues: UseIsChatBackgroundVisibleModule (copy), FoundationModule (copy), LocalizationModule (copy), ReactModule (copy), Popover (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = LocalizationModule.useLocalization({
		longPressHint = "CoreScripts.TextChat.ChatWindow.HandFreeTranscriptionFTUX"
	})
	
	return ReactModule.createElement(Popover.Root, { isOpen = UseIsChatBackgroundVisibleModule() }, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			side = {
				position = PopoverSide.Top,
				offset = UseTokensResult.Size.Size_200
			},
			align = PopoverAlign.Center
		}, ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-xsmall auto-xy padding-x-small padding-y-xsmall radius-small",
			backgroundStyle = UseTokensResult.Inverse.Surface.Surface_0,
			sizeConstraint = { MaxSize = Vector2.new(320, 1e999) },
			onActivated = p1.onDismiss
		}, {
			Title = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-body-medium text-wrap content-inverse-default",
				Text = if UseLocalizationResult.longPressHint and UseLocalizationResult.longPressHint ~= "" then UseLocalizationResult.longPressHint else "Hold to go hands free"
			})
		}))
	})
end)