local function _(p0) --[[ line: 14 | named "TypeError" ]]
	return p0
end

return function(p1, p2) --[[ line: 18 | named "splitOnFirst" ]]
	if type(p1) ~= "string" or type(p2) ~= "string" then
		error("Expected the arguments to be of type `string`")
	end
	if p2 == "" then
		return { p1 }
	end
	local var0 = p1:find(p2, 1, true)
	
	return if var0 == nil then { p1 } else { p1:sub(1, var0 - 1), p1:sub(var0 + p2:len()) }
end