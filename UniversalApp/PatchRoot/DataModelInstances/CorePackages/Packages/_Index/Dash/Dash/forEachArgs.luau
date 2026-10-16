return function(Callback: (any, any) -> (), ...) --[[ Line: 9 | Named "forEachArgs" ]]
	for i = 1, select("#", ...) do
		Callback(select(i, ...), i)
	end
end