local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useTopBarHeight = require(parent.RobloxAppHooks).useTopBarHeight
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local profileScrollContextModule = require(script.Parent.ProfileScrollContext)

return function(p1)
	-- upvalues: useProfileFormFactorModule (ref), reactModule (ref), enumsModule (ref), useTopBarHeight (ref), profileScrollContextModule (ref)
	local var1 = useProfileFormFactorModule()
	local var2, var3 = reactModule.useState(if var1.formFactor == enumsModule.ProfileFormFactor.PeekView then 0 else 1)
	local var4, var5 = reactModule.useState(0)
	local var6 = useTopBarHeight()
	local var7 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var6 (ref), enumsModule (copy), var4 (ref)
		local var8 = if var1.isFullView then 0 else var6
		
		if var1.formFactor == enumsModule.ProfileFormFactor.PeekView and not var1.isFullView then
			var8 += 25
		end
		return math.max(var8 - var4, 0)
	end, { var6, var4, var1 })
	
	return reactModule.createElement(profileScrollContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var7 (ref), var5 (ref), var2 (ref), var3 (ref)
			return {
				scrollY = var7,
				setAbsoluteYPosition = var5,
				peekViewOpenPercent = var2,
				setPeekViewOpenPercent = var3
			}
		end, { var7, var5, var2, var3 })
	}, p1.children)
end