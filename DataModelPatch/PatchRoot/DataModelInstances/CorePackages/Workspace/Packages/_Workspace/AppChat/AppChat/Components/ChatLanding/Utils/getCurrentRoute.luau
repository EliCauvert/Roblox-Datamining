return function(p1)
	while p1 and p1.index and p1.routes do
		p1 = p1.routes[p1.index]
	end
	return p1
end