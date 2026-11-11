local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local IsScrollingFrameOverflowingYModule = require(Foundation.Utility.isScrollingFrameOverflowingY)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function()
	-- upvalues: ReactModule (copy), UseTokensModule (copy), IsScrollingFrameOverflowingYModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTokensModuleResult = UseTokensModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return UseStateResult, UseBindingResult, (ReactModule.useCallback(function(p1)
		-- upvalues: IsScrollingFrameOverflowingYModule (upval), UseStateResult2 (copy), UseBindingResult2 (copy), UseTokensModuleResult (copy)
		local IsScrollingFrameOverflowingYModule1 = IsScrollingFrameOverflowingYModule(p1, 1)
		UseStateResult2(IsScrollingFrameOverflowingYModule1)
		UseBindingResult2(if IsScrollingFrameOverflowingYModule1 then UseTokensModuleResult.Size.Size_150 else 0)
	end, { UseTokensModuleResult.Size.Size_150 }))
end