local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	local CountP0 = #p1
	local Count = 1
	while Count < CountP0 do
		local v1 = p1[Count]
		p1[Count] = p1[CountP0]
		p1[CountP0] = v1
		Count += 1
		CountP0 -= 1
	end
	return p1
end