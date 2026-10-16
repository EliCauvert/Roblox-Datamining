local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local FFlagAXCategoryPillPositionAnimation = require(Parent.AvatarExperienceFlags).FFlagAXCategoryPillPositionAnimation

return function(p1) --[[ Line: 28 | Named "CategoryPillCloseButton" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAXCategoryPillPositionAnimation (copy), Icon (copy), Enums (copy)
	local ActionStandard = UseTokensFunction().Color.ActionStandard
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 35 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		if UseRefResult.current then
			p1.categoryButtonRefs["X-Button"] = UseRefResult
			p1.navButtonRefs[p1.pillIndex] = UseRefResult
		end
	end, {})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		backgroundStyle = ActionStandard.Background,
		onActivated = p1.onActivated,
		LayoutOrder = if FFlagAXCategoryPillPositionAnimation then nil else p1.layoutOrder,
		ref = UseRefResult
	}, {
		CloseIcon = ReactModule.createElement(Icon, {
			name = "x-small",
			size = Enums.IconSize.Medium,
			style = ActionStandard.Foreground
		})
	})
end