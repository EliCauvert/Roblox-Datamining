local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local enums = foundationModule.Enums
local fFlagAXCategoryPillPositionAnimation = require(parent.AvatarExperienceFlags).FFlagAXCategoryPillPositionAnimation

return function(p0) --[[ line: 28 | named "CategoryPillCloseButton" ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), fFlagAXCategoryPillPositionAnimation (ref), icon (ref), enums (ref)
	local actionStandard = useTokens().Color.ActionStandard
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var2 (ref), p0 (ref)
		if var2.current then
			p0.categoryButtonRefs["X-Button"] = var2
			p0.navButtonRefs[p0.pillIndex] = var2
		end
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		backgroundStyle = actionStandard.Background,
		onActivated = p0.onActivated,
		LayoutOrder = if fFlagAXCategoryPillPositionAnimation then nil else p0.layoutOrder,
		ref = var2
	}, {
		CloseIcon = reactModule.createElement(icon, {
			name = "x-small",
			size = enums.IconSize.Medium,
			style = actionStandard.Foreground
		})
	})
end