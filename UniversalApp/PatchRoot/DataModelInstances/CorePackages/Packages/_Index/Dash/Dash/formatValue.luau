local parent = script.Parent

return function(p0, p1)
	-- upvalues: parent (ref)
	p1 = p1 or ""
	local var1, var2 = p1:find("[A-Za-z#?]+")
	
	if var1 then
		local var3 = p1:sub(var1, var2)
		local text = "%" .. p1:sub(1, var1 - 1) .. p1:sub(var2 + 1) .. "s"
		local prettyModule = require(parent.pretty)
		
		return if var3 == "#?" then text:format(prettyModule(p0, { multiline = true })) elseif var3 == "?" then text:format(prettyModule(p0)) else ("%" .. p1):format(p0)
	end
	local var6 = "s"
	
	if type(p0) == "number" then
		local _, var7 = math.modf(p0)
		var6 = if var7 == 0 then "d" else "f"
	end
	return ("%" .. p1 .. var6):format(tostring(p0))
end