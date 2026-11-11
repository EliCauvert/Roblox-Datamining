local UseSequentialAnimationModule = require(script:FindFirstAncestor("CrossExperienceVoice").Hooks.useSequentialAnimation)

return function(p1, DurationInMs, EasingStyle)
	-- upvalues: UseSequentialAnimationModule (copy)
	local UseSequentialAnimationModuleResult, UseSequentialAnimationModuleResult2 = UseSequentialAnimationModule(p1)
	
	return UseSequentialAnimationModuleResult, function(Value)
		-- upvalues: UseSequentialAnimationModuleResult2 (copy), DurationInMs (copy), EasingStyle (copy)
		UseSequentialAnimationModuleResult2({
			{
				value = Value,
				durationInMs = DurationInMs,
				easingStyle = EasingStyle
			}
		}, nil)
	end
end