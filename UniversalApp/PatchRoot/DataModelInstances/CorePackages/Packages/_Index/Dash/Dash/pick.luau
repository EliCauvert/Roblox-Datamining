local _ = require(script.Parent.Types)

return function(p0, p1) --[[ line: 12 | named "pick" ]]
	local t = {}
	
	for i, v in p0 do
		if p1(v, i) then
			t[i] = v
		end
	end
	return t
end