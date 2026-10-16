local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal

return function(p1) --[[ Line: 18 | Named "useCollectionImpressionsSignal" ]]
	-- upvalues: ReactModule (copy), Signal (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Signal.new()
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function() --[[ Line: 25 ]]
		-- upvalues: Current (copy), p1 (copy)
		Current:fire()
		local Connection = if p1 then p1:connect(function() --[[ Line: 34 ]]
			-- upvalues: Current (upval)
			Current:fire()
		end) else nil
		
		return function() --[[ Line: 39 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end, { p1, Current })
	
	return Current, (ReactModule.useCallback(function() --[[ Line: 46 ]]
		-- upvalues: Current (copy)
		Current:fire()
	end, { Current }))
end