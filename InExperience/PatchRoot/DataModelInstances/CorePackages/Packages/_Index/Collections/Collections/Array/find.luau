local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1)
	for i = 1, #p0 do
		local var0 = p0[i]
		
		if not p1(var0, i, p0) then
			continue
		end
		return var0
	end
	return nil
end