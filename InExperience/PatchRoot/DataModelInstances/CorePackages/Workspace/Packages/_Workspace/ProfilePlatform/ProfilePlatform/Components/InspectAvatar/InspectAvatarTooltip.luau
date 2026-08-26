local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useInspectAvatarTooltipModule = require(script.Parent.useInspectAvatarTooltip)
local fFlagProfileInspectAndBuyTooltipGamepadFocusModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyTooltipGamepadFocus)
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local radius = foundationModule.Enums.Radius
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local buttonVariant = foundationModule.Enums.ButtonVariant

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useInspectAvatarTooltipModule (ref), useLocalization (ref), reactModule (ref), fFlagProfileInspectAndBuyTooltipGamepadFocusModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), popover (ref), popoverSide (ref), popoverAlign (ref), radius (ref), view (ref), text (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	local var2 = useInspectAvatarTooltipModule()
	local var3 = useLocalization({
		title = "Feature.Profile.Header.InspectAndBuy.Tooltip",
		body = "Feature.Profile.Description.InspectAndBuy"
	})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var2 (ref)
		return { onDismiss = var2.onDismiss }
	end, { var2.onDismiss })
	
	return reactModule.createElement(popover.Root, { isOpen = var2.showTooltip }, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			side = popoverSide.Right,
			align = popoverAlign.Center,
			radius = radius.Medium,
			backgroundStyle = var1.Color.System.Contrast
		}, {
			Layout = reactModule.createElement(view, {
				tag = "col gap-xsmall auto-y padding-medium",
				Size = UDim2.fromOffset(160, 0),
				ref = if fFlagProfileInspectAndBuyTooltipGamepadFocusModule then if fFlagProfileInspectAndBuyTooltipGamepadFocusModule then useAppFocusRoot({
					isAutoFocusRoot = true,
					surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
					isFocusable = var2.showTooltip
				}) else nil else nil
			}, {
				Header = reactModule.createElement(view, {
					tag = "row flex-between align-y-center size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Title = reactModule.createElement(text, {
						tag = "auto-xy text-title-large content-inverse-emphasis",
						Text = var3.title
					}),
					CloseButton = reactModule.createElement(iconButton, {
						icon = iconName.X,
						size = iconSize.Small,
						onActivated = var2.onDismiss,
						variant = buttonVariant.OverMedia
					})
				}),
				Body = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium content-inverse-default",
					TextWrapped = true,
					LayoutOrder = 2,
					Text = var3.body,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			})
		})
	})
end)