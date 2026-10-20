return function(p1)
	return function(Text, ...): string
		-- upvalues: p1 (copy)
		local Text1 = "inspectAndBuy." .. Text .. "." .. p1
		
		for i = 1, select("#", ...) do
			Text1 ..= "." .. tostring(select(i, ...))
		end
		return Text1
	end
end