local useSequentialAnimationModule = require(script:FindFirstAncestor("CrossExperienceVoice").Hooks.useSequentialAnimation)

return function(p1, p2, p3)
	-- upvalues: useSequentialAnimationModule (ref)
	local var1, var2 = useSequentialAnimationModule(p1)
	
	return var1, function(p4)
		-- upvalues: var2 (ref), p2 (ref), p3 (ref)
		var2({ { value = p4, durationInMs = p2, easingStyle = p3 } }, nil)
	end
end