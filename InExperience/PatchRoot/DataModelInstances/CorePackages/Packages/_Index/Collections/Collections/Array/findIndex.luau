local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1) --[[ line: 22 ]]
	for i = 1, #p0 do
		if not p1(p0[i], i, p0) then
			continue
		end
		return i
	end
	return -1
end