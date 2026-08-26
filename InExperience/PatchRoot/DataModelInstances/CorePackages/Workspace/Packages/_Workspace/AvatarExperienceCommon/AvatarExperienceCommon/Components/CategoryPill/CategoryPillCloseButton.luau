local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local fFlagAXCategoryPillPositionAnimation = require(parent.AvatarExperienceFlags).FFlagAXCategoryPillPositionAnimation

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), fFlagAXCategoryPillPositionAnimation (ref), icon (ref), enums (ref)
	local actionStandard = useTokens().Color.ActionStandard
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		if var1.current then
			p1.categoryButtonRefs["X-Button"] = var1
			p1.navButtonRefs[p1.pillIndex] = var1
		end
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		backgroundStyle = actionStandard.Background,
		onActivated = p1.onActivated,
		LayoutOrder = if fFlagAXCategoryPillPositionAnimation then nil else p1.layoutOrder,
		ref = var1
	}, {
		CloseIcon = reactModule.createElement(icon, {
			name = "x-small",
			size = enums.IconSize.Medium,
			style = actionStandard.Foreground
		})
	})
end