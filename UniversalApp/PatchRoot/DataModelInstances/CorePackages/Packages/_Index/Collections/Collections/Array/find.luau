local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2)
	for i = 1, #p1 do
		local var1 = p1[i]
		
		if not p2(var1, i, p1) then
			continue
		end
		return var1
	end
	return nil
end