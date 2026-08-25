local _ = require(script.Parent.Types)

return function(...)
	local t = {}
	
	for i, v in { ... } do
		if v then
			table.move(v, 1, #v, #t + 1, t)
		end
	end
	return t
end