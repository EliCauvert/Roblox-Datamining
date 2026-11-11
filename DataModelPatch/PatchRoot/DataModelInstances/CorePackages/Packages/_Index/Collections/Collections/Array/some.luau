local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(List, Callback, p1): boolean
	if typeof(List) ~= "table" then
		error(string.format("Array.some called on %s", (typeof(List))))
	end
	if typeof(Callback) ~= "function" then
		error("callback is not a function")
	end
	for i, value in List do
		if p1 == nil then
			if value ~= nil and Callback(value, i, List) then
				return true
			end
		elseif value ~= nil and Callback(p1, value, i, List) then
			return true
		end
	end
	return false
end