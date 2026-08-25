local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(value, p0)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: value (ref), p0 (ref), var2 (ref)
		if p0.Y < value.Y then
			var2(true)
			
			return
		end
		var2(false)
	end, { value, p0 })
	
	return if var1 then 16 else 0
end