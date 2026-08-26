return function(p1, p2)
	for i = 1, #p2 do
		p1:sendText(p2:sub(i, i))
	end
	wait(0)
end