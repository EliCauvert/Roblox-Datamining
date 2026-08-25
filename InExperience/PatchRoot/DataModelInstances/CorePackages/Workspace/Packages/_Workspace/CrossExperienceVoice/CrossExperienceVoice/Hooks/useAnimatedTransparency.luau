local useSequentialAnimationModule = require(script:FindFirstAncestor("CrossExperienceVoice").Hooks.useSequentialAnimation)

return function(p0, p1, p2)
	-- upvalues: useSequentialAnimationModule (ref)
	local var1, var2 = useSequentialAnimationModule(p0)
	
	return var1, function(p3)
		-- upvalues: var2 (ref), p1 (ref), p2 (ref)
		var2({ { value = p3, durationInMs = p1, easingStyle = p2 } }, nil)
	end
end