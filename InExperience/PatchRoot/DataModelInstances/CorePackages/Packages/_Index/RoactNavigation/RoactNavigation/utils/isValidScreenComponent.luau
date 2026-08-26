return function(p1)
	local var1 = type(p1)
	
	return if var1 ~= "function" then var1 == "table" and type(p1.render) == "function" else true
end