local DEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(Entry, Callback, p1)
	-- upvalues: DEV (copy)
	if DEV then
		if typeof(Entry) ~= "table" then
			error(string.format("Array.reduce called on %s", (typeof(Entry))))
		end
		if typeof(Callback) ~= "function" then
			error("callback is not a function")
		end
	end
	local CountEntry = #Entry
	local v1 = 1
	local v2 = nil
	
	if p1 == nil then
		v1 = 2
		
		if CountEntry == 0 then
			error("reduce of empty array with no initial value")
		end
		v2 = Entry[1]
	else
		v2 = p1
	end
	for i = v1, CountEntry do
		v2 = Callback(v2, Entry[i], i, Entry)
	end
	return v2
end