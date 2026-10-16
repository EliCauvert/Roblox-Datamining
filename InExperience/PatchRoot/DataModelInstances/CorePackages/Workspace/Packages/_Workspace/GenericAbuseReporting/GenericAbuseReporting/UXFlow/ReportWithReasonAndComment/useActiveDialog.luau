local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function() --[[ Line: 8 | Named "useActiveDialog" ]]
	-- upvalues: ReactModule (copy)
	local Form, Form2 = ReactModule.useState("Form")
	
	return Form, Form2
end