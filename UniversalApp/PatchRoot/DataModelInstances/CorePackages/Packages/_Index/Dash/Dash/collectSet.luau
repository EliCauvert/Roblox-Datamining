local _ = require(script.Parent.Types)

return function(value, p0) --[[ line: 16 | named "collectSet" ]]
	local t = {}
	
	for i, v in value do
		local var1 = if p0 == nil then v else p0(i, v)
		
		if var1 ~= nil then
			t[var1] = true
		end
	end
	return t
end