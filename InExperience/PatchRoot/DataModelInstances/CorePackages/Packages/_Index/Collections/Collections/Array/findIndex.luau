local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2)
	for i = 1, #p1 do
		if not p2(p1[i], i, p1) then
			continue
		end
		return i
	end
	return -1
end