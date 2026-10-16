local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagProfilePlatformEnableTransferTooltipContrastModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltipContrast)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local radius = foundationModule.Enums.Radius
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), popover (ref), popoverSide (ref), popoverAlign (ref), radius (ref), fFlagProfilePlatformEnableTransferTooltipContrastModule (ref), view (ref), text (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref)
	local var1 = useTokens()
	
	if not p1.isOpen or not p1.text or p1.text == "" then
		return nil
	end
	local var2 = if p1.title and p1.title ~= "" then p1.title else nil
	
	return reactModule.createElement(popover.Root, { isOpen = p1.isOpen }, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = true,
			side = { position = popoverSide.Top, offset = var1.Padding.Medium },
			align = popoverAlign.End,
			radius = radius.Medium,
			backgroundStyle = if fFlagProfilePlatformEnableTransferTooltipContrastModule then var1.Color.System.Contrast else nil,
			onPressedOutside = p1.onPressedOutside
		}, {
			Layout = if var2 == nil or var2 == "" then reactModule.createElement(view, {
				tag = "row align-y-center flex-between gap-x-small padding-x-small padding-y-small auto-xy"
			}, {
				TooltipText = reactModule.createElement(text, {
					Text = p1.text,
					tag = {
						["auto-xy text-body-small content-inverse-default"] = fFlagProfilePlatformEnableTransferTooltipContrastModule,
						["auto-xy text-body-small content-default"] = not fFlagProfilePlatformEnableTransferTooltipContrastModule
					}
				}),
				CloseButton = reactModule.createElement(iconButton, {
					icon = iconName.X,
					size = iconSize.XSmall,
					onActivated = p1.onClose,
					variant = if fFlagProfilePlatformEnableTransferTooltipContrastModule then buttonVariant.OverMedia else nil
				})
			}) else reactModule.createElement(view, {
				tag = "col gap-xxsmall padding-x-small padding-y-small auto-xy"
			}, {
				Header = reactModule.createElement(view, {
					tag = "row align-y-center flex-between size-full-0 auto-y"
				}, {
					Title = reactModule.createElement(text, {
						Text = var2,
						tag = {
							["auto-xy text-title-small content-inverse-emphasis"] = fFlagProfilePlatformEnableTransferTooltipContrastModule,
							["auto-xy text-title-small content-emphasis"] = not fFlagProfilePlatformEnableTransferTooltipContrastModule
						}
					}),
					CloseButton = reactModule.createElement(iconButton, {
						icon = iconName.X,
						size = iconSize.XSmall,
						onActivated = p1.onClose,
						variant = if fFlagProfilePlatformEnableTransferTooltipContrastModule then buttonVariant.OverMedia else nil
					})
				}),
				Body = reactModule.createElement(text, {
					Text = p1.text,
					tag = {
						["auto-xy text-body-small content-inverse-default"] = fFlagProfilePlatformEnableTransferTooltipContrastModule,
						["auto-xy text-body-small content-default"] = not fFlagProfilePlatformEnableTransferTooltipContrastModule
					}
				})
			})
		})
	})
end