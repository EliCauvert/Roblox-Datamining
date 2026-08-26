local _ = require(script.Parent.Types)

return function(p1, p2)
	local t = {}
	
	for i, v in p1 do
		if p2(v, i) then
			t[i] = v
		end
	end
	return t
end