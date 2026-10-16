local ReactModule = require(script.Parent.Parent.React)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function() --[[ Line: 11 | Named "useCurrentFocus" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	local Value = if UseContextResult then UseContextResult.focusedGuiObject:getValue() else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(Value)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: UseStateResult (copy), Value (copy), UseStateResult2 (copy), UseContextResult (copy)
		if UseStateResult ~= Value then
			UseStateResult2(Value)
		end
		if UseContextResult then
			local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(UseStateResult2)
			
			return function() --[[ Line: 25 ]]
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		else
			return nil
		end
	end, { UseContextResult })
	
	return UseStateResult
end