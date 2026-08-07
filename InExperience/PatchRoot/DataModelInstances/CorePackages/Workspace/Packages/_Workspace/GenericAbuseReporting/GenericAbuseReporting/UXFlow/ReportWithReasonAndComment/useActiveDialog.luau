local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function() --[[ line: 8 | named "useActiveDialog" ]]
	-- upvalues: reactModule (ref)
	local form, form_1 = reactModule.useState("Form")
	
	return form, form_1
end