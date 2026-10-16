local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigation)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function() --[[ Line: 13 | Named "useActiveEventMap" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	local Value = if UseContextResult then UseContextResult.activeEventMap:getValue() else {}
	local UseStateResult, UseStateResult2 = ReactModule.useState(Value)
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UseStateResult (copy), Value (copy), UseStateResult2 (copy), UseContextResult (copy)
		if UseStateResult ~= Value then
			UseStateResult2(Value)
		end
		if UseContextResult then
			local SubscribeResult = UseContextResult.activeEventMap:subscribe(UseStateResult2)
			
			return function() --[[ Line: 27 ]]
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		else
			return nil
		end
	end, { UseContextResult })
	
	return UseStateResult
end