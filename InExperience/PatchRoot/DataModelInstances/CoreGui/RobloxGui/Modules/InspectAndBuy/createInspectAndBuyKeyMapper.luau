return function(p0) --[[ line: 7 | named "createInspectAndBuyKeyMapper" ]]
	return function(p1, ...) --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		local text = "inspectAndBuy." .. p1 .. "." .. p0
		
		for i = 1, select("#", ...) do
			text ..= "." .. tostring(select(i, ...))
		end
		return text
	end
end