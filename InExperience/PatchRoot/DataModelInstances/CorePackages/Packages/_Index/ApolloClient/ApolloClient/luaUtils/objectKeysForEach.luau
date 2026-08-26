return function(p1, p2)
	for i, v in p1 do
		p2(i)
	end
end