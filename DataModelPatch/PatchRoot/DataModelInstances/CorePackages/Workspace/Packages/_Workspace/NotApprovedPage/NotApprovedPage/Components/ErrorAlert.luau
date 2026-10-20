local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuilderIconsModule = require(Parent.BuilderIcons)
local CircleX = BuilderIconsModule.Icon.CircleX
local IconVariant = BuilderIconsModule.IconVariant
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseNotApprovedPageContextFunction (copy), ReactModule (copy), View (copy), Icon (copy), CircleX (copy), InputSize (copy), IconVariant (copy), Text (copy), IconButton (copy), ButtonVariant (copy), ButtonSize (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y row flex-between gap-medium padding-medium radius-medium align-y-center stroke-standard stroke-system-alert",
		testId = "error-alert",
		backgroundStyle = {
			Transparency = 0.9,
			Color3 = UseTokensResult.Color.System.Alert.Color3
		},
		LayoutOrder = p1.layoutOrder or 1
	}, {
		Container = ReactModule.createElement(View, {
			tag = "auto-xy row gap-small align-y-center",
			LayoutOrder = 1
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = CircleX,
				size = InputSize.Medium,
				variant = IconVariant.Filled,
				style = UseTokensResult.Color.System.Alert
			}),
			Text = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-left text-wrap content-emphasis",
				LayoutOrder = 2,
				Text = UseNotApprovedPageContextFunction().translations.errorMessage
			})
		}),
		Button = ReactModule.createElement(IconButton, {
			icon = "x-small",
			isCircular = true,
			LayoutOrder = 2,
			variant = ButtonVariant.Utility,
			onActivated = p1.onClose,
			size = ButtonSize.Small
		})
	})
end)