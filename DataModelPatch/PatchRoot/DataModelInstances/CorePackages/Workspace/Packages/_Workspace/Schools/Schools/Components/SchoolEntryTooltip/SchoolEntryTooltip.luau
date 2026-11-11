local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Radius = FoundationModule.Enums.Radius
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(Schools.Common.Constants)
local _ = require(Schools.Common.Enums)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), Popover (copy), PopoverSide (copy), PopoverAlign (copy), Radius (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local ConstantsModuleEntry = ConstantsModule[p1.variant]
	local UseLocalizationResult = UseLocalizationFunction({
		title = ConstantsModuleEntry.TITLE,
		body = ConstantsModuleEntry.BODY
	})
	
	return ReactModule.createElement(Popover.Root, { isOpen = true }, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = true,
			side = PopoverSide.Bottom,
			align = PopoverAlign.Center,
			radius = Radius.Small,
			backgroundStyle = UseTokensResult.Color.System.Contrast
		}, {
			Layout = ReactModule.createElement(View, {
				tag = "col gap-xsmall auto-xy padding-x-small padding-y-small"
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-caption-medium text-align-x-left content-inverse-emphasis",
					Text = UseLocalizationResult.title
				}),
				Body = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
					Text = UseLocalizationResult.body,
					sizeConstraint = { MaxSize = Vector2.new(280, 1e999) }
				})
			})
		})
	})
end