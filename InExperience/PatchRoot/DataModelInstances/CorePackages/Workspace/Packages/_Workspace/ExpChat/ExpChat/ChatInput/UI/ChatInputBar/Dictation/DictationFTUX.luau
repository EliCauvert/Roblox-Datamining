local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local popover = foundationModule.Popover
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local localizationModule = require(expChat.Localization)
local useIsChatBackgroundVisibleModule = require(expChat.Stores.GetTransparencyStore.useIsChatBackgroundVisible)

return reactModule.memo(function(p0)
	-- upvalues: useIsChatBackgroundVisibleModule (ref), foundationModule (ref), localizationModule (ref), reactModule (ref), popover (ref), popoverSide (ref), popoverAlign (ref)
	local var5 = useIsChatBackgroundVisibleModule()
	local var6 = foundationModule.Hooks.useTokens()
	local var7 = localizationModule.useLocalization({
		longPressHint = "CoreScripts.TextChat.ChatWindow.HandFreeTranscriptionFTUX"
	})
	
	return reactModule.createElement(popover.Root, { isOpen = var5 }, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p0.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			selectionGroup = false,
			side = { position = popoverSide.Top, offset = var6.Size.Size_200 },
			align = popoverAlign.Center
		}, reactModule.createElement(foundationModule.View, {
			tag = "col gap-xsmall auto-xy padding-x-small padding-y-xsmall radius-small",
			backgroundStyle = var6.Inverse.Surface.Surface_0,
			sizeConstraint = { MaxSize = Vector2.new(320, 1e999) },
			onActivated = p0.onDismiss
		}, {
			Title = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-body-medium text-wrap content-inverse-default",
				Text = if var7.longPressHint and var7.longPressHint ~= "" then var7.longPressHint else "Hold to go hands free"
			})
		}))
	})
end)