local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseInspectAvatarTooltipModule = require(script.Parent.useInspectAvatarTooltip)
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return (ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseTokensFunction (copy), UseInspectAvatarTooltipModule (copy), UseLocalizationFunction (copy), ReactModule (copy), Popover (copy), PopoverSide (copy), PopoverAlign (copy), Radius (copy), View (copy), Text (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseInspectAvatarTooltipModuleResult = UseInspectAvatarTooltipModule()
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Profile.Header.InspectAndBuy.Tooltip",
		body = "Feature.Profile.Description.InspectAndBuy"
	})
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseInspectAvatarTooltipModuleResult (copy)
		return {
			onDismiss = UseInspectAvatarTooltipModuleResult.onDismiss
		}
	end, { UseInspectAvatarTooltipModuleResult.onDismiss })
	
	return ReactModule.createElement(Popover.Root, { isOpen = UseInspectAvatarTooltipModuleResult.showTooltip }, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = true,
			side = PopoverSide.Right,
			align = PopoverAlign.Center,
			radius = Radius.Medium,
			backgroundStyle = UseTokensResult.Color.System.Contrast
		}, {
			Layout = ReactModule.createElement(View, {
				tag = "col gap-xsmall auto-y padding-medium",
				Size = UDim2.fromOffset(160, 0)
			}, {
				Header = ReactModule.createElement(View, {
					tag = "row flex-between align-y-center size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Title = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-large content-inverse-emphasis",
						Text = UseLocalizationResult.title
					}),
					CloseButton = ReactModule.createElement(IconButton, {
						icon = IconName.X,
						size = IconSize.Small,
						onActivated = UseInspectAvatarTooltipModuleResult.onDismiss,
						variant = ButtonVariant.OverMedia
					})
				}),
				Body = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium content-inverse-default",
					TextWrapped = true,
					LayoutOrder = 2,
					Text = UseLocalizationResult.body,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			})
		})
	})
end))