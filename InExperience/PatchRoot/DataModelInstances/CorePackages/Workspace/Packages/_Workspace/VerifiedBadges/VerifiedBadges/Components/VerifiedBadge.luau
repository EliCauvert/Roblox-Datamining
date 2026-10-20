local Parent = script:FindFirstAncestor("VerifiedBadges").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant

return function(Frame)
	-- upvalues: UseTokensFunction (copy), IconSize (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local Size = Frame.size or IconSize.Small
	
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Backplate = ReactModule.createElement(Icon, {
			ZIndex = 1,
			name = IconName.VerifiedBackplate,
			variant = IconVariant.Filled,
			size = Size,
			style = Frame.backplateStyle or UseTokensResult.Color.System.Emphasis
		}),
		Check = ReactModule.createElement(Icon, {
			ZIndex = 2,
			name = IconName.VerifiedCheck,
			variant = IconVariant.Filled,
			size = Size,
			style = Frame.checkStyle or UseTokensResult.Color.Extended.White.White_100
		})
	})
end