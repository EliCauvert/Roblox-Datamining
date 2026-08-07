local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 25 ]]
	local _ = {}
	
	if p1 then
		local t = {}
		
		for i, v in p0 do
			if p2 == nil then
				t[i] = p1(v, i)
			else
				t[i] = p1(p2, v, i)
			end
		end
		return t
	else
		local t = {}
		
		for i, v in p0 do
			t[i] = v
		end
		return t
	end
end