local _ = require(script.Parent.Parent.Parent.React)

return function(value)
	local getForwardedRef = value.getForwardedRef
	local setLocalRef = value.setLocalRef
	
	return function(p1)
		-- upvalues: getForwardedRef (ref), setLocalRef (ref)
		local var1 = getForwardedRef()
		setLocalRef(p1)
		
		if typeof(var1) == "function" then
			var1(p1)
			
			return
		elseif typeof(var1) == "table" then
			var1.current = p1
		end
	end
end