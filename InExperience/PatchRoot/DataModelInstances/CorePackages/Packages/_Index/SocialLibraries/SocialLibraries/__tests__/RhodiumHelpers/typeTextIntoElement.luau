return function(p0, p1) --[[ line: 2 ]]
	for i = 1, #p1 do
		p0:sendText(p1:sub(i, i))
	end
	wait(0)
end