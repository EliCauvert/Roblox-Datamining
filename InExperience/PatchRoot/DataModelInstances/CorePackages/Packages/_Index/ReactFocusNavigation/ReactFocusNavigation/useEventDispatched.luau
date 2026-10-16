local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigation)
local FocusNavigationContextModule = require(script.Parent.FocusNavigationContext)

return function(Current) --[[ Line: 12 | Named "useEventDispatched" ]]
	-- upvalues: ReactModule (copy), FocusNavigationContextModule (copy)
	local UseContextResult = ReactModule.useContext(FocusNavigationContextModule)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	ReactModule.useEffect(function() --[[ Line: 17 ]]
		-- upvalues: UseContextResult (copy), UseRefResult (copy)
		if UseContextResult then
			local SubscribeResult = UseContextResult.eventDispatched:subscribe(function(p1) --[[ Line: 19 ]]
				-- upvalues: UseRefResult (upval)
				if p1 then
					UseRefResult.current(p1)
				end
			end)
			
			return function() --[[ Line: 25 ]]
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		else
			return nil
		end
	end, { UseContextResult })
end