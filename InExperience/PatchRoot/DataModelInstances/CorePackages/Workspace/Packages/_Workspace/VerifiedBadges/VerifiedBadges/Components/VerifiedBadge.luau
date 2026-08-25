local parent = script:FindFirstAncestor("VerifiedBadges").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant

return function(p0)
	-- upvalues: useTokens (ref), iconSize (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref)
	local var2 = useTokens()
	local size = p0.size or iconSize.Small
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId
	}, {
		Backplate = reactModule.createElement(icon, {
			ZIndex = 1,
			name = iconName.VerifiedBackplate,
			variant = iconVariant.Filled,
			size = size,
			style = p0.backplateStyle or var2.Color.System.Emphasis
		}),
		Check = reactModule.createElement(icon, {
			ZIndex = 2,
			name = iconName.VerifiedCheck,
			variant = iconVariant.Filled,
			size = size,
			style = p0.checkStyle or var2.Color.Extended.White.White_100
		})
	})
end