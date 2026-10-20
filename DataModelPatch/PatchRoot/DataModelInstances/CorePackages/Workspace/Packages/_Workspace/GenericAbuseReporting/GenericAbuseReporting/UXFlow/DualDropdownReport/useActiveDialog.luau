local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local Form, Form2 = ReactModule.useState("Form")
	
	return Form, Form2
end