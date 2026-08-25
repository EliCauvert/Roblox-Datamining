return function(p0, ...)
	for i = 1, select("#", ...) do
		p0(select(i, ...), i)
	end
end