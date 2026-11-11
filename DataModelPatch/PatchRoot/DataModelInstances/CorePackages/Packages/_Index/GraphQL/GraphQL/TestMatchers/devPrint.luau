local InspectFunction = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect

return function(...)
	-- upvalues: InspectFunction (copy)
	local t = {}
	
	for i = 1, select("#", ...) do
		t[i] = InspectFunction((select(i, ...)))
	end
	print(table.unpack(t))
end