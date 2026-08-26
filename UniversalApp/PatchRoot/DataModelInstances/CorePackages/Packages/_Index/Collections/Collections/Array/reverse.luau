local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	local p0Count = #p1
	local var1 = 1
	while var1 < p0Count do
		local var2 = p1[var1]
		p1[var1] = p1[p0Count]
		p1[p0Count] = var2
		var1 += 1
		p0Count -= 1
	end
	return p1
end