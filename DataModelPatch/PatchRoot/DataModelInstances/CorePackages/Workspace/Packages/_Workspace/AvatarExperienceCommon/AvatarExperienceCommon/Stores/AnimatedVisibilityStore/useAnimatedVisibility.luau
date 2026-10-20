local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local AnimatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function()
	-- upvalues: ReactModule (copy), AnimatedVisibilityContextModule (copy)
	local UseContextResult = ReactModule.useContext(AnimatedVisibilityContextModule)
	
	if UseContextResult then
		return UseContextResult
	else
		warn("useAnimatedVisibility must be used within a AnimatedVisibilityProvider")
		
		return nil
	end
end