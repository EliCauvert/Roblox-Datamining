local parent = script.Parent

return function(p1, p2)
	-- upvalues: parent (ref)
	p2 = p2 or ""
	local var1, var2 = p2:find("[A-Za-z#?]+")
	
	if var1 then
		local var3 = p2:sub(var1, var2)
		local text = "%" .. p1:sub(1, var1 - 1) .. p1:sub(var2 + 1) .. "s"
		local prettyModule = require(parent.pretty)
		
		return if var3 == "#?" then text:format(prettyModule(p1, { multiline = true })) elseif var3 == "?" then text:format(prettyModule(p1)) else ("%" .. p1):format(p1)
	end
	local var4 = "s"
	
	if type(p1) == "number" then
		local _, var5 = math.modf(p1)
		var4 = if var5 == 0 then "d" else "f"
	end
	return ("%" .. p1 .. var6):format(tostring(p1))
end