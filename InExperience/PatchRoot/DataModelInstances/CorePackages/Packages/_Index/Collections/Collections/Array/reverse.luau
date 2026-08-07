local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0) --[[ line: 22 ]]
	local p0Count = #p0
	local var1 = 1
	while var1 < p0Count do
		local var2 = p0[var1]
		p0[var1] = p0[p0Count]
		p0[p0Count] = var2
		var1 += 1
		p0Count -= 1
	end
	return p0
end