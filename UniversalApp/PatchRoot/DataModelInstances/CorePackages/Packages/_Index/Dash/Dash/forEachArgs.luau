return function(p0, ...) --[[ line: 9 | named "forEachArgs" ]]
	for i = 1, select("#", ...) do
		p0(select(i, ...), i)
	end
end