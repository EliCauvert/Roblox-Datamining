local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), icon (ref), iconSize (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	local testId = p1.testId or "InstantStatCard"
	
	return reactModule.createElement(view, {
		tag = "col gap-none size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			Text = p1.label,
			testId = `{testId}-label`
		}),
		Value = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy padding-y-xxsmall"
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				tag = "content-emphasis",
				name = p1.icon,
				size = iconSize.Large,
				testId = `{testId}-icon`
			}),
			Number = if p1.isLoading then reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_500),
				radius = radius.Small,
				testId = `{testId}-loading`
			}) else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p1.valueText,
				testId = `{testId}-value`
			})
		})
	})
end