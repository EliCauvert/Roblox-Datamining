local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local animatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function() --[[ line: 11 | named "useAnimatedVisibility" ]]
	-- upvalues: reactModule (ref), animatedVisibilityContextModule (ref)
	local var2 = reactModule.useContext(animatedVisibilityContextModule)
	
	if var2 then
		return var2
	end
	warn("useAnimatedVisibility must be used within a AnimatedVisibilityProvider")
	
	return nil
end