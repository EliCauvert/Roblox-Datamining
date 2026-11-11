local TransitionAnimationModule = require(script.Parent.Enum.TransitionAnimation)
local config = {
	[TransitionAnimationModule.SlideInFromRight] = "slideInFromRight",
	[TransitionAnimationModule.SlideInFromBottom] = "slideInFromBottom"
}

return function(p1)
	-- upvalues: config (copy)
	return if p1 then config[p1] else nil
end