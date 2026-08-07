local inspect = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect

return function(...) --[[ line: 19 | named "devPrint" ]]
	-- upvalues: inspect (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		t[i] = inspect(select(i, ...))
	end
	print(table.unpack(t))
end