local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagProfilePlatformEnableTransferTooltipContrastModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltipContrast)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Popover (copy), PopoverSide (copy), PopoverAlign (copy), Radius (copy), FFlagProfilePlatformEnableTransferTooltipContrastModule (copy), View (copy), Text (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	
	if p1.isOpen and p1.text and p1.text ~= "" then
		local Title = if p1.title and p1.title ~= "" then p1.title else nil
		
		return ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
			Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = true,
				side = {
					position = PopoverSide.Top,
					offset = UseTokensResult.Padding.Medium
				},
				align = PopoverAlign.End,
				radius = Radius.Medium,
				backgroundStyle = if FFlagProfilePlatformEnableTransferTooltipContrastModule then UseTokensResult.Color.System.Contrast else nil,
				onPressedOutside = p1.onPressedOutside
			}, {
				Layout = if Title == nil or Title == "" then ReactModule.createElement(View, {
					tag = "row align-y-center flex-between gap-x-small padding-x-small padding-y-small auto-xy"
				}, {
					TooltipText = ReactModule.createElement(Text, {
						Text = p1.text,
						tag = {
							["auto-xy text-body-small content-inverse-default"] = FFlagProfilePlatformEnableTransferTooltipContrastModule,
							["auto-xy text-body-small content-default"] = not FFlagProfilePlatformEnableTransferTooltipContrastModule
						}
					}),
					CloseButton = ReactModule.createElement(IconButton, {
						icon = IconName.X,
						size = IconSize.XSmall,
						onActivated = p1.onClose,
						variant = if FFlagProfilePlatformEnableTransferTooltipContrastModule then ButtonVariant.OverMedia else nil
					})
				}) else ReactModule.createElement(View, {
					tag = "col gap-xxsmall padding-x-small padding-y-small auto-xy"
				}, {
					Header = ReactModule.createElement(View, {
						tag = "row align-y-center flex-between size-full-0 auto-y"
					}, {
						Title = ReactModule.createElement(Text, {
							Text = Title,
							tag = {
								["auto-xy text-title-small content-inverse-emphasis"] = FFlagProfilePlatformEnableTransferTooltipContrastModule,
								["auto-xy text-title-small content-emphasis"] = not FFlagProfilePlatformEnableTransferTooltipContrastModule
							}
						}),
						CloseButton = ReactModule.createElement(IconButton, {
							icon = IconName.X,
							size = IconSize.XSmall,
							onActivated = p1.onClose,
							variant = if FFlagProfilePlatformEnableTransferTooltipContrastModule then ButtonVariant.OverMedia else nil
						})
					}),
					Body = ReactModule.createElement(Text, {
						Text = p1.text,
						tag = {
							["auto-xy text-body-small content-inverse-default"] = FFlagProfilePlatformEnableTransferTooltipContrastModule,
							["auto-xy text-body-small content-default"] = not FFlagProfilePlatformEnableTransferTooltipContrastModule
						}
					})
				})
			})
		})
	else
		return nil
	end
end