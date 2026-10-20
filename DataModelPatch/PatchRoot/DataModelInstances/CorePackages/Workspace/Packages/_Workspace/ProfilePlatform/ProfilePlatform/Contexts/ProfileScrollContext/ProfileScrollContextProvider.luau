local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseTopBarHeightFunction = require(Parent.RobloxAppHooks).useTopBarHeight
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local ProfileScrollContextModule = require(script.Parent.ProfileScrollContext)

return function(p1)
	-- upvalues: UseProfileFormFactorModule (copy), ReactModule (copy), EnumsModule (copy), UseTopBarHeightFunction (copy), ProfileScrollContextModule (copy)
	local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(if UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.PeekView then 0 else 1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: UseProfileFormFactorModuleResult (copy), UseTopBarHeightResult (copy), EnumsModule (upval), UseStateResult1 (copy)
		local UseTopBarHeightResult1 = if UseProfileFormFactorModuleResult.isFullView then 0 else UseTopBarHeightResult
		
		if UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.PeekView and not UseProfileFormFactorModuleResult.isFullView then
			UseTopBarHeightResult1 += 25
		end
		return (math.max(UseTopBarHeightResult1 - UseStateResult1, 0))
	end, {
		UseTopBarHeightResult,
		UseStateResult1,
		UseProfileFormFactorModuleResult
	})
	
	return ReactModule.createElement(ProfileScrollContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), UseStateResult2_1 (copy), UseStateResult (copy), UseStateResult2 (copy)
			return {
				scrollY = UseMemoResult,
				setAbsoluteYPosition = UseStateResult2_1,
				peekViewOpenPercent = UseStateResult,
				setPeekViewOpenPercent = UseStateResult2
			}
		end, {
			UseMemoResult,
			UseStateResult2_1,
			UseStateResult,
			UseStateResult2
		})
	}, p1.children)
end