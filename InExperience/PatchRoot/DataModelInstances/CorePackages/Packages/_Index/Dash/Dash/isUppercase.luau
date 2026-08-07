local assertEqualModule = require(script.Parent.assertEqual)

return function(p0) --[[ line: 15 | named "isUppercase" ]]
	-- upvalues: assertEqualModule (ref)
	assertEqualModule(#p0 > 0, true, "Attempted to call Dash.isUppercase with an empty string")
	local var1 = p0:sub(1, 1)
	
	return var1 == var1:upper()
end