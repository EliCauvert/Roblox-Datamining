local _ = require(script.Parent.CommentRowTypes)

return function(p1, p2, p3, p4)
	local list = table.create(#p1)
	local maxValue = math.max(1, p4)
	local maxValue_1 = math.max(0, p3)
	local var1 = 0
	
	for i, v in p1 do
		local key = p2[v.key]
		local var2 = if key == nil or key <= 0 then maxValue else key
		list[i] = { row = v, height = var2, yOffset = var1 }
		var1 += var2
		
		if i < #p1 then
			var1 += maxValue_1
		end
	end
	return list
end