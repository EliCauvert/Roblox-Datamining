local _ = require(script.Parent.Types)

return function(...) --[[ Line: 10 | Named "joinArrays" ]]
	local t = {}
	
	for _, value in { ... } do
		if value then
			table.move(value, 1, #value, #t + 1, t)
		end
	end
	return t
end