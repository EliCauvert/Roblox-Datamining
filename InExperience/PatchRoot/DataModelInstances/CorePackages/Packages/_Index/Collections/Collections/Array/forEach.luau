local DEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, Callback: (any, any, any, any) -> (), p2) --[[ Line: 27 ]]
	-- upvalues: DEV (copy)
	if DEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.forEach called on %s", (typeof(p1))))
		end
		if typeof(Callback) ~= "function" then
			error("callback is not a function")
		end
	end
	local CountP0 = #p1
	local Count = 1
	while Count <= CountP0 do
		local v1 = p1[Count]
		
		if p2 == nil then
			Callback(v1, Count, p1)
		else
			Callback(p2, v1, Count, p1)
		end
		if #p1 < CountP0 then
			CountP0 = #p1
		end
		Count += 1
	end
end