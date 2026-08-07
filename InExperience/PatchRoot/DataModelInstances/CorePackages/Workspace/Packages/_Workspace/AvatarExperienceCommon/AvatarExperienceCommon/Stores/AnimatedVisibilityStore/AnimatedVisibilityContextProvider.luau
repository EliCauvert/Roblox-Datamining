local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local createAnimatedVisibilityStoreModule = require(script.Parent.createAnimatedVisibilityStore)
local animatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function(p0) --[[ line: 14 | named "AnimatedVisibilityProvider" ]]
	-- upvalues: reactModule (ref), createAnimatedVisibilityStoreModule (ref), animatedVisibilityContextModule (ref)
	local var3 = reactModule.useMemo(function() --[[ line: 15 ]]
		-- upvalues: createAnimatedVisibilityStoreModule (copy), p0 (ref)
		return createAnimatedVisibilityStoreModule(p0.initialRatio)
	end, {})
	reactModule.useEffect(function() --[[ line: 19 ]]
		-- upvalues: var3 (ref)
		return function() --[[ line: 20 ]]
			-- upvalues: var3 (copy)
			var3.destroy()
		end
	end, { var3 })
	
	return reactModule.createElement(animatedVisibilityContextModule.Provider, { value = { animatedMenusStore = var3 } }, p0.children)
end