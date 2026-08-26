local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local animatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function()
	-- upvalues: reactModule (ref), animatedVisibilityContextModule (ref)
	local var1 = reactModule.useContext(animatedVisibilityContextModule)
	
	if var1 then
		return var1
	end
	warn("useAnimatedVisibility must be used within a AnimatedVisibilityProvider")
	
	return nil
end