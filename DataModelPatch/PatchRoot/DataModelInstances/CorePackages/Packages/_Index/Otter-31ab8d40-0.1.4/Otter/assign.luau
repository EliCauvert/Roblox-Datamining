return function(p1, ...)
	for i = 1, select("#", ...) do
		for i1, value in pairs((select(i, ...))) do
			p1[i1] = value
		end
	end
	return p1
end