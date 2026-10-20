local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local CreateAnimatedVisibilityStoreModule = require(script.Parent.createAnimatedVisibilityStore)
local AnimatedVisibilityContextModule = require(script.Parent.AnimatedVisibilityContext)

return function(p1)
	-- upvalues: ReactModule (copy), CreateAnimatedVisibilityStoreModule (copy), AnimatedVisibilityContextModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateAnimatedVisibilityStoreModule (upval), p1 (copy)
		return CreateAnimatedVisibilityStoreModule(p1.initialRatio)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement(AnimatedVisibilityContextModule.Provider, { value = { animatedMenusStore = UseMemoResult } }, p1.children)
end