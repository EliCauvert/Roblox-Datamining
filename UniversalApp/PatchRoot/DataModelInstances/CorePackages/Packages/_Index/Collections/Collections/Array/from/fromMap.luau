local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(List, Callback, p1)
	if Callback then
		local t = {}
		
		for i, value in List do
			if p1 == nil then
				t[i] = Callback(value, i)
			else
				t[i] = Callback(p1, value, i)
			end
		end
		return t
	else
		local t1 = {}
		
		for i1, value1 in List do
			t1[i1] = value1
		end
		return t1
	end
end