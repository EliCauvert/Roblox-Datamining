local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), skeleton (ref), radius (ref), icon (ref), iconName (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "row size-full-1100 padding-medium align-y-center flex-x-between gap-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		ref = p1.forwardRef
	}, {
		TitleText = reactModule.createElement(text, {
			tag = "text-title-medium content-emphasis auto-xy",
			LayoutOrder = 1,
			Text = p1.label
		}),
		EditButton = if p1.shouldShimmer then reactModule.createElement(skeleton, {
			LayoutOrder = 3,
			Size = UDim2.new(0.3, 0, 0, useTokens().Size.Size_400),
			radius = radius.Medium
		}) else reactModule.createElement(view, {
			tag = "row size-0-full fill align-y-center align-x-right gap-xsmall",
			LayoutOrder = 2
		}, {
			CurrentText = reactModule.createElement(view, {
				tag = "row size-0-full fill align-y-center align-x-right",
				LayoutOrder = 1
			}, {
				reactModule.createElement(text, {
					tag = "text-body-small text-truncate-end size-0-full auto-x",
					Text = string.gsub(p1.currentValue, "\n", " ")
				})
			}),
			EditIcon = reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = iconName.ChevronLargeRight,
				size = iconSize.Medium
			})
		})
	})
end