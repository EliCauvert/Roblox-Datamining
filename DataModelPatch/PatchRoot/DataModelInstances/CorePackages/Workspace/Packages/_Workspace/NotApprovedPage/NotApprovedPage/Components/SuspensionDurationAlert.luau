local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuilderIconsModule = require(Parent.BuilderIcons)
local TriangleExclamation = BuilderIconsModule.Icon.TriangleExclamation
local IconVariant = BuilderIconsModule.IconVariant

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseNotApprovedPageContextFunction (copy), ReactModule (copy), View (copy), Icon (copy), TriangleExclamation (copy), IconSize (copy), IconVariant (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y row gap-medium padding-medium align-y-center stroke-thick stroke-default radius-medium bg-shift-100",
		testId = "suspension-duration-alert",
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = TriangleExclamation,
			size = IconSize.Medium,
			variant = IconVariant.Filled,
			style = UseTokensFunction().Color.System.Warning
		}),
		Text = ReactModule.createElement(View, { tag = "auto-xy row gap-xsmall", LayoutOrder = 2 }, {
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-medium content-emphasis text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = UseNotApprovedPageContextFunction().translations.suspensionLabel
			}),
			Value = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-left text-wrap",
				LayoutOrder = 2,
				Text = p1.timeRemaining
			})
		})
	})
end)