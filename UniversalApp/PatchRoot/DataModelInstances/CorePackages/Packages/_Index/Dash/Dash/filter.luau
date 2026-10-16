local _ = require(script.Parent.Types)

return function(List, Callback) --[[ Line: 16 | Named "filter" ]]
	local List1 = {}
	
	for i, value in List do
		if Callback(value, i) then
			table.insert(List1, value)
		end
	end
	return List1
end