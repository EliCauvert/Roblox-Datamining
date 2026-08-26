local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	if typeof(p1) ~= "table" then
		error(string.format("Array.some called on %s", typeof(p1)))
	end
	if typeof(p2) ~= "function" then
		error("callback is not a function")
	end
	for i, v in p1 do
		if p3 == nil then
			if v ~= nil and p2(v, i, p1) then
				return true
			end
		elseif v ~= nil and p2(p3, v, i, p1) then
			return true
		end
	end
	return false
end