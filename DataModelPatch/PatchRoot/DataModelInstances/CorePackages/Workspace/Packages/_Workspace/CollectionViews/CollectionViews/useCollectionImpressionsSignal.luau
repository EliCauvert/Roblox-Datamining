local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Signal.new()
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), p1 (copy)
		Current:fire()
		local Connection = if p1 then p1:connect(function()
			-- upvalues: Current (upval)
			Current:fire()
		end) else nil
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end, { p1, Current })
	
	return Current, (ReactModule.useCallback(function()
		-- upvalues: Current (copy)
		Current:fire()
	end, { Current }))
end