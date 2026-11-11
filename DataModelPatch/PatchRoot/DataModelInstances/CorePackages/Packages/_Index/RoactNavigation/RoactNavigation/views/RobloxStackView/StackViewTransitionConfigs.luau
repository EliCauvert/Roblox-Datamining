local Parent = script.Parent
local Object = require(Parent.Parent.Parent.Parent.LuauPolyfill).Object
local StackViewInterpolatorModule = require(Parent.StackViewInterpolator)
local StackPresentationStyleModule = require(Parent.StackPresentationStyle)
local TransitionSpec = { frequency = 3, dampingRatio = 1 }
local SlideFromRight = {
	transitionSpec = TransitionSpec,
	screenInterpolator = StackViewInterpolatorModule.forHorizontal
}
local ModalSlideFromBottom = {
	transitionSpec = TransitionSpec,
	screenInterpolator = StackViewInterpolatorModule.forVertical
}
local FadeInPlace = {
	transitionSpec = TransitionSpec,
	screenInterpolator = StackViewInterpolatorModule.forFade
}

return {
	getDefaultTransitionConfig = function(_, _, Modal)
		-- upvalues: StackPresentationStyleModule (copy), ModalSlideFromBottom (copy), FadeInPlace (copy), SlideFromRight (copy)
		return if Modal == StackPresentationStyleModule.Modal then ModalSlideFromBottom elseif Modal == StackPresentationStyleModule.Overlay then FadeInPlace else SlideFromRight
	end,
	getTransitionConfig = function(Callback, p1, p2, Modal)
		-- upvalues: StackPresentationStyleModule (copy), ModalSlideFromBottom (copy), FadeInPlace (copy), SlideFromRight (copy), Object (copy)
		local ModalSlideFromBottom1 = if Modal == StackPresentationStyleModule.Modal then ModalSlideFromBottom elseif Modal == StackPresentationStyleModule.Overlay then FadeInPlace else SlideFromRight
		
		return if Callback then Object.assign(table.clone(ModalSlideFromBottom1), Callback(p1, p2, Modal)) else ModalSlideFromBottom1
	end,
	SlideFromRight = SlideFromRight,
	ModalSlideFromBottom = ModalSlideFromBottom,
	FadeInPlace = FadeInPlace
}