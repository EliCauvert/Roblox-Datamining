local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, Callback): number
	for i = 1, #p1 do
		if Callback(p1[i], i, p1) then
			return i
		end
	end
	return -1
end