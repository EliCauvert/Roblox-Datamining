local _ = require(script.Parent.Types)

return function(p0, p1)
	local t = {}
	
	for i, v in p0 do
		if p1(v, i) then
			table.insert(t, v)
		end
	end
	return t
end