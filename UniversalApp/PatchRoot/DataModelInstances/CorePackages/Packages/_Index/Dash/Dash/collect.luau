local _ = require(script.Parent.Types)

return function(p1, p2)
	local t = {}
	
	for i, v in p1 do
		local var1, var2 = p2(i, v)
		
		if var1 ~= nil then
			t[var1] = var2
		end
	end
	return t
end