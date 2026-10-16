return function(p1) --[[ Line: 7 | Named "createInspectAndBuyKeyMapper" ]]
	return function(Text, ...): string --[[ Line: 9 ]]
		-- upvalues: p1 (copy)
		local Text1 = "inspectAndBuy." .. Text .. "." .. p1
		
		for i = 1, select("#", ...) do
			Text1 ..= "." .. tostring(select(i, ...))
		end
		return Text1
	end
end