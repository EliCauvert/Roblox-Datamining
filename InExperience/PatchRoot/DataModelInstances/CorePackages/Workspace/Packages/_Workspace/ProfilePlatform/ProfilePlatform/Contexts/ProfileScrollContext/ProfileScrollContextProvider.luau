local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useTopBarHeight = require(parent.RobloxAppHooks).useTopBarHeight
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local profileScrollContextModule = require(script.Parent.ProfileScrollContext)

return function(p0) --[[ line: 14 ]]
	-- upvalues: useProfileFormFactorModule (ref), reactModule (ref), enumsModule (ref), useTopBarHeight (ref), profileScrollContextModule (ref)
	local var5 = useProfileFormFactorModule()
	local var6, var7 = reactModule.useState(if var5.formFactor == enumsModule.ProfileFormFactor.PeekView then 0 else 1)
	local var8, var9 = reactModule.useState(0)
	local var10 = useTopBarHeight()
	local var11 = reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: var5 (ref), var10 (ref), enumsModule (copy), var8 (ref)
		local var12 = if var5.isFullView then 0 else var10
		
		if var5.formFactor == enumsModule.ProfileFormFactor.PeekView and not var5.isFullView then
			var12 += 25
		end
		return math.max(var12 - var8, 0)
	end, { var10, var8, var5 })
	
	return reactModule.createElement(profileScrollContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 34 ]]
			-- upvalues: var11 (ref), var9 (ref), var6 (ref), var7 (ref)
			return {
				scrollY = var11,
				setAbsoluteYPosition = var9,
				peekViewOpenPercent = var6,
				setPeekViewOpenPercent = var7
			}
		end, { var11, var9, var6, var7 })
	}, p0.children)
end