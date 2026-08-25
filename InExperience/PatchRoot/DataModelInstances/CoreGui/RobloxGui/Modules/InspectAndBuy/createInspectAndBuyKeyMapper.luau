return function(p0)
	return function(p1, ...)
		-- upvalues: p0 (ref)
		local text = "inspectAndBuy." .. p1 .. "." .. p0
		
		for i = 1, select("#", ...) do
			text ..= "." .. tostring(select(i, ...))
		end
		return text
	end
end