local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fetchRobuxBalanceModule = require(inExperienceSideSheet.Utils.fetchRobuxBalance)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)

return function()
	-- upvalues: reactModule (ref), signalsReactModule (ref), getSideSheetVisibilityModule (ref), fetchRobuxBalanceModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(true)
	local var4 = signalsReactModule.useSignalState(getSideSheetVisibilityModule)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3.current = true
		
		return function()
			-- upvalues: var3 (copy)
			var3.current = false
		end
	end, {})
	local var5 = reactModule.useCallback(function()
		-- upvalues: fetchRobuxBalanceModule (copy), var3 (ref), var2 (ref)
		fetchRobuxBalanceModule(function(p1)
			-- upvalues: var3 (copy), var2 (copy)
			if var3.current then
				var2(p1)
			end
		end)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref)
		if var4 then
			var5()
		end
	end, { var4, var5 })
	
	return var1
end