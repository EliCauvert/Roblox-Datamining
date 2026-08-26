return function(p1, ...)
	for i = 1, select("#", ...) do
		p1(select(i, ...), i)
	end
end