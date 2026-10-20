local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FetchRobuxBalanceModule = require(InExperienceSideSheet.Utils.fetchRobuxBalance)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)

return function()
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), GetSideSheetVisibilityModule (copy), FetchRobuxBalanceModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(true)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSideSheetVisibilityModule)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FetchRobuxBalanceModule (upval), UseRefResult (copy), UseStateResult2 (copy)
		FetchRobuxBalanceModule(function(p1)
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
			if UseRefResult.current then
				UseStateResult2(p1)
			end
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseResult (copy)
		if UseSignalStateResult then
			UseResult()
		end
	end, { UseSignalStateResult, UseResult })
	
	return UseStateResult
end