local _ = require(script.Parent.Parent.Parent.React)

return function(p1) --[[ Line: 57 | Named "setAndForwardRef" ]]
	local GetForwardedRefFunction = p1.getForwardedRef
	local SetLocalRefFunction = p1.setLocalRef
	
	return function(Current) --[[ Line: 59 ]]
		-- upvalues: GetForwardedRefFunction (copy), SetLocalRefFunction (copy)
		local ForwardedRef: (any) -> () = GetForwardedRefFunction()
		SetLocalRefFunction(Current)
		
		if typeof(ForwardedRef) == "function" then
			ForwardedRef(Current)
			
			return
		end
		if typeof(ForwardedRef) == "table" then
			ForwardedRef.current = Current
		end
	end
end