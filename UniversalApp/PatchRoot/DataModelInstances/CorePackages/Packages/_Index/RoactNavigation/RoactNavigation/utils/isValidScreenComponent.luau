return function(p0) --[[ line: 2 ]]
	local var0 = type(p0)
	
	return if var0 ~= "function" then var0 == "table" and type(p0.render) == "function" else true
end