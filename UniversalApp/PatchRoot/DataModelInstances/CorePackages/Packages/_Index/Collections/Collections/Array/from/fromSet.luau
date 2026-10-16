local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(List, Callback, p1) --[[ Line: 25 ]]
	if not Callback then
		return (table.clone(List._array))
	end
	local t = {}
	
	for i, value in List do
		if p1 == nil then
			t[i] = Callback(value, i)
		else
			t[i] = Callback(p1, value, i)
		end
	end
	return t
end