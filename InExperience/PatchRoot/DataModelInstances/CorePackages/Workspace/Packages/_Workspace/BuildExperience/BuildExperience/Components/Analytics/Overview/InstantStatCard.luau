local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy), Icon (copy), IconSize (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "InstantStatCard"
	
	return ReactModule.createElement(View, {
		tag = "col gap-none size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			Text = p1.label,
			testId = `{TestId}-label`
		}),
		Value = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy padding-y-xxsmall"
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				tag = "content-emphasis",
				name = p1.icon,
				size = IconSize.Large,
				testId = `{TestId}-icon`
			}),
			Number = if p1.isLoading then ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_500),
				radius = Radius.Small,
				testId = `{TestId}-loading`
			}) else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p1.valueText,
				testId = `{TestId}-value`
			})
		})
	})
end