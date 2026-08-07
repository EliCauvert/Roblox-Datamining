return function(p0) --[[ line: 1 ]]
	while p0 and p0.index and p0.routes do
		p0 = p0.routes[p0.index]
	end
	return p0
end