return function(p0, p1)
	for i, v in p0 do
		p1(v, i)
	end
end