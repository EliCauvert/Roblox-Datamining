local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	local _ = {}
	
	if p2 then
		local t = {}
		
		for i, v in p1 do
			if p3 == nil then
				t[i] = p2(v, i)
			else
				t[i] = p2(p3, v, i)
			end
		end
		return t
	else
		local t = {}
		
		for i, v in p1 do
			t[i] = v
		end
		return t
	end
end