local parent = script:FindFirstAncestor("VerifiedBadges").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant

return function(p1)
	-- upvalues: useTokens (ref), iconSize (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref)
	local var1 = useTokens()
	local size = p1.size or iconSize.Small
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Backplate = reactModule.createElement(icon, {
			ZIndex = 1,
			name = iconName.VerifiedBackplate,
			variant = iconVariant.Filled,
			size = size,
			style = p1.backplateStyle or var1.Color.System.Emphasis
		}),
		Check = reactModule.createElement(icon, {
			ZIndex = 2,
			name = iconName.VerifiedCheck,
			variant = iconVariant.Filled,
			size = size,
			style = p1.checkStyle or var1.Color.Extended.White.White_100
		})
	})
end