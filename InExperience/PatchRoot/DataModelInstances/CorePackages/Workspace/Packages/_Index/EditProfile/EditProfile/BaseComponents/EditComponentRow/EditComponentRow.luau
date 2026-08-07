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

return function(p0) --[[ line: 26 | named "EditComponentRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), skeleton (ref), radius (ref), icon (ref), iconName (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "row size-full-1100 padding-medium align-y-center flex-x-between gap-medium",
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onActivated,
		ref = p0.forwardRef
	}, {
		TitleText = reactModule.createElement(text, {
			tag = "text-title-medium content-emphasis auto-xy",
			LayoutOrder = 1,
			Text = p0.label
		}),
		EditButton = if p0.shouldShimmer then reactModule.createElement(skeleton, {
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
					Text = string.gsub(p0.currentValue, "\n", " ")
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