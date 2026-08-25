local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local createAnimatedVisibilityStoreModule = require(script.Parent.createAnimatedVisibilityStore)
local animatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function(p0)
	-- upvalues: reactModule (ref), createAnimatedVisibilityStoreModule (ref), animatedVisibilityContextModule (ref)
	local var3 = reactModule.useMemo(function()
		-- upvalues: createAnimatedVisibilityStoreModule (copy), p0 (ref)
		return createAnimatedVisibilityStoreModule(p0.initialRatio)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			var3.destroy()
		end
	end, { var3 })
	
	return reactModule.createElement(animatedVisibilityContextModule.Provider, { value = { animatedMenusStore = var3 } }, p0.children)
end