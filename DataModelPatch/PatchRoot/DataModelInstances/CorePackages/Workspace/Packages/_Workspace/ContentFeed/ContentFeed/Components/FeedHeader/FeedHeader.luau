local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.fromOffset(1, 1)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), _UDim2 (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 bg-action-subtle auto-y padding-x-large padding-y-small row flex-between",
		ZIndex = p1.ZIndex
	}, {
		BackButton = ReactModule.createElement(View, {
			tag = "radius-medium auto-xy padding-medium bg-action-subtle",
			onActivated = p1.onBackActivated
		}, {
			BackIcon = ReactModule.createElement(Icon, {
				name = "icons/navigation/pushBack",
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				style = UseTokensResult.Color.ActionEmphasis.Foreground
			}),
			BackIconShadow = ReactModule.createElement(Icon, {
				name = "icons/navigation/pushBack",
				ZIndex = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5) + _UDim2,
				style = UseTokensResult.Color.Common.Shadow
			})
		}),
		MoreButton = if p1.isPlaceholderPost then nil else ReactModule.createElement(View, {
			tag = "radius-medium auto-xy padding-medium bg-action-subtle",
			onActivated = p1.onMoreActivated
		}, {
			MoreIcon = ReactModule.createElement(Icon, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				name = if p1.isContextualMenuOpen then "icons/menu/more_on" else "icons/menu/more_off",
				Position = UDim2.fromScale(0.5, 0.5),
				style = UseTokensResult.Color.ActionEmphasis.Foreground
			}),
			MoreIconShadow = ReactModule.createElement(Icon, {
				ZIndex = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				name = if p1.isContextualMenuOpen then "icons/menu/more_on" else "icons/menu/more_off",
				Position = UDim2.fromScale(0.5, 0.5) + _UDim2,
				style = UseTokensResult.Color.Common.Shadow
			})
		})
	})
end