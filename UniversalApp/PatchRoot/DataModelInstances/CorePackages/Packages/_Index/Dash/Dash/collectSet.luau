local _ = require(script.Parent.Types)

return function(value, p1)
	local t = {}
	
	for i, v in value do
		local var1 = if p1 == nil then v else p1(i, v)
		
		if var1 ~= nil then
			t[var1] = true
		end
	end
	return t
end