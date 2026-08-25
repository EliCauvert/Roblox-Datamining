local parent = script.Parent
local object = require(parent.Parent.Parent.Parent.LuauPolyfill).Object
local stackViewInterpolatorModule = require(parent.StackViewInterpolator)
local stackPresentationStyleModule = require(parent.StackPresentationStyle)
local t = { frequency = 3, dampingRatio = 1 }
local t_1 = {
	transitionSpec = t,
	screenInterpolator = stackViewInterpolatorModule.forHorizontal
}
local t_2 = {
	transitionSpec = t,
	screenInterpolator = stackViewInterpolatorModule.forVertical
}
local t_3 = {
	transitionSpec = t,
	screenInterpolator = stackViewInterpolatorModule.forFade
}

return {
	getDefaultTransitionConfig = function(_, _, p0)
		-- upvalues: stackPresentationStyleModule (ref), t_2 (ref), t_3 (ref), t_1 (ref)
		return if p0 == stackPresentationStyleModule.Modal then t_2 elseif p0 == stackPresentationStyleModule.Overlay then t_3 else t_1
	end,
	getTransitionConfig = function(p1, p2, p3, p4)
		-- upvalues: stackPresentationStyleModule (ref), t_2 (ref), t_3 (ref), t_1 (ref), object (ref)
		local var6 = if p4 == stackPresentationStyleModule.Modal then t_2 elseif p4 == stackPresentationStyleModule.Overlay then t_3 else t_1
		
		return if p1 then object.assign(table.clone(var6), p1(p2, p3, p4)) else var6
	end,
	SlideFromRight = t_1,
	ModalSlideFromBottom = t_2,
	FadeInPlace = t_3
}