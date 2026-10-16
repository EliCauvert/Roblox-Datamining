local DEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, Callback, p2) --[[ Line: 27 ]]
	-- upvalues: DEV (copy)
	if DEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.filter called on %s", (typeof(p1))))
		end
		if typeof(Callback) ~= "function" then
			error("callback is not a function")
		end
	end
	local CountP0 = #p1
	local t = {}
	local Count = 1
	
	if p2 == nil then
		for i = 1, CountP0 do
			local v1 = p1[i]
			
			if v1 ~= nil and Callback(v1, i, p1) then
				t[Count] = v1
				Count += 1
			end
		end
		return t
	else
		for i1 = 1, CountP0 do
			local v2 = p1[i1]
			
			if v2 ~= nil and Callback(p2, v2, i1, p1) then
				t[Count] = v2
				Count += 1
			end
		end
		return t
	end
end