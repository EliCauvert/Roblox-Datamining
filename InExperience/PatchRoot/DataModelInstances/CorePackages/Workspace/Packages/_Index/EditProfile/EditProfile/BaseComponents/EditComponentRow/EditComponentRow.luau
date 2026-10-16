local Parent = script:FindFirstAncestor("EditProfile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 26 | Named "EditComponentRow" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy), Skeleton (copy), Radius (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local Replaced = string.gsub(p1.currentValue, "\n", " ")
	
	return ReactModule.createElement(View, {
		tag = "row size-full-1100 padding-medium align-y-center flex-x-between gap-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		ref = p1.forwardRef
	}, {
		TitleText = ReactModule.createElement(Text, {
			tag = "text-title-medium content-emphasis auto-xy",
			LayoutOrder = 1,
			Text = p1.label
		}),
		EditButton = if p1.shouldShimmer then ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			Size = UDim2.new(0.3, 0, 0, UseTokensResult.Size.Size_400),
			radius = Radius.Medium
		}) else ReactModule.createElement(View, {
			tag = "row size-0-full fill align-y-center align-x-right gap-xsmall",
			LayoutOrder = 2
		}, {
			CurrentText = ReactModule.createElement(View, {
				tag = "row size-0-full fill align-y-center align-x-right",
				LayoutOrder = 1
			}, {
				ReactModule.createElement(Text, {
					tag = "text-body-small text-truncate-end size-0-full auto-x",
					Text = Replaced
				})
			}),
			EditIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.ChevronLargeRight,
				size = IconSize.Medium
			})
		})
	})
end