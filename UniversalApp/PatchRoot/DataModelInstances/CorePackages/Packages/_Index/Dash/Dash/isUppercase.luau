local assertEqualModule = require(script.Parent.assertEqual)

return function(p1)
	-- upvalues: assertEqualModule (ref)
	assertEqualModule(#p1 > 0, true, "Attempted to call Dash.isUppercase with an empty string")
	local var1 = p1:sub(1, 1)
	
	return var1 == var1:upper()
end