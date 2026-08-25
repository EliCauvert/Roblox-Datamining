local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local form, form_1 = reactModule.useState("Form")
	
	return form, form_1
end