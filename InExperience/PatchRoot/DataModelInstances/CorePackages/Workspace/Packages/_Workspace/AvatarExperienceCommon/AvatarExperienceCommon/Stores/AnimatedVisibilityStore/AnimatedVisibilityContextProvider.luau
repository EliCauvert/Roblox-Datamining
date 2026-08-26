local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local createAnimatedVisibilityStoreModule = require(script.Parent.createAnimatedVisibilityStore)
local animatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function(p1)
	-- upvalues: reactModule (ref), createAnimatedVisibilityStoreModule (ref), animatedVisibilityContextModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: createAnimatedVisibilityStoreModule (copy), p1 (ref)
		return createAnimatedVisibilityStoreModule(p1.initialRatio)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.destroy()
		end
	end, { var1 })
	
	return reactModule.createElement(animatedVisibilityContextModule.Provider, { value = { animatedMenusStore = var1 } }, p1.children)
end