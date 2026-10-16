local DEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, Callback, p2): boolean --[[ Line: 27 ]]
	-- upvalues: DEV (copy)
	if DEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.every called on %s", (typeof(p1))))
		end
		if typeof(Callback) ~= "function" then
			error("callback is not a function")
		end
	end
	local CountP0 = #p1
	local Count = 1
	while Count <= CountP0 do
		local v1 = p1[Count]
		
		if v1 ~= nil and not (if p2 == nil then Callback(v1, Count, p1) else Callback(p2, v1, Count, p1)) then
			return false
		end
		Count += 1
	end
	return true
end