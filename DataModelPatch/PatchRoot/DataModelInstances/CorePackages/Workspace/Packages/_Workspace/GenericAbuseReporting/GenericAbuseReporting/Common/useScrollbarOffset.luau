local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(p1, p2): number
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), UseStateResult2 (copy)
		if p2.Y < p1.Y then
			UseStateResult2(true)
			
			return
		else
			UseStateResult2(false)
		end
	end, { p1, p2 })
	
	return if UseStateResult then 16 else 0
end