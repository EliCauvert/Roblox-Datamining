return function(p1)
	if typeof(p1) == "number" then
		return p1
	else
		local Number: number? = tonumber(p1:match("(%d+)$"))
		
		return if Number then Number else -1
	end
end