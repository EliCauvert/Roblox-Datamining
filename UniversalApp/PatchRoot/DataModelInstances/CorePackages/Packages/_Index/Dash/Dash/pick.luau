local _ = require(script.Parent.Types)

return function(List, Callback) --[[ Line: 12 | Named "pick" ]]
	local t = {}
	
	for i, value in List do
		if Callback(value, i) then
			t[i] = value
		end
	end
	return t
end