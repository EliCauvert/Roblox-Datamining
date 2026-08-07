local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 28 ]]
	if typeof(p0) ~= "table" then
		error(string.format("Array.some called on %s", typeof(p0)))
	end
	if typeof(p1) ~= "function" then
		error("callback is not a function")
	end
	for i, v in p0 do
		if p2 == nil then
			if v ~= nil and p1(v, i, p0) then
				return true
			end
		elseif v ~= nil and p1(p2, v, i, p0) then
			return true
		end
	end
	return false
end