local function _(p1)
	return p1
end

return function(p1, p2)
	if type(p1) ~= "string" or type(p2) ~= "string" then
		error("Expected the arguments to be of type `string`")
	end
	if p2 == "" then
		return { p1 }
	end
	local var1 = p1:find(p2, 1, true)
	
	return if var1 == nil then { p1 } else { p1:sub(1, var1 - 1), p1:sub(var1 + p2:len()) }
end