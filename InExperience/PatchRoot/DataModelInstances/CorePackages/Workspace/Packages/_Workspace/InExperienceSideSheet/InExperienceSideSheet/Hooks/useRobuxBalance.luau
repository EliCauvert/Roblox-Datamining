local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FetchRobuxBalanceModule = require(InExperienceSideSheet.Utils.fetchRobuxBalance)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)

return function() --[[ Line: 10 | Named "useRobuxBalance" ]]
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), GetSideSheetVisibilityModule (copy), FetchRobuxBalanceModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(true)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSideSheetVisibilityModule)
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function() --[[ Line: 17 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 22 ]]
		-- upvalues: FetchRobuxBalanceModule (upval), UseRefResult (copy), UseStateResult2 (copy)
		FetchRobuxBalanceModule(function(p1) --[[ Line: 23 ]]
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
			if UseRefResult.current then
				UseStateResult2(p1)
			end
		end)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 30 ]]
		-- upvalues: UseSignalStateResult (copy), UseResult (copy)
		if UseSignalStateResult then
			UseResult()
		end
	end, { UseSignalStateResult, UseResult })
	
	return UseStateResult
end