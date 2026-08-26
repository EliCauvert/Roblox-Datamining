return function(p1)
	return function(p2, ...)
		-- upvalues: p1 (ref)
		local text = "inspectAndBuy." .. p1 .. "." .. p0
		
		for i = 1, select("#", ...) do
			text ..= "." .. tostring(select(i, ...))
		end
		return text
	end
end