local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Types)

local function transformJsonLeafFirst(List, Callback)
	-- upvalues: transformJsonLeafFirst (copy)
	if type(List) ~= "table" then
		return Callback(List)
	end
	local Flag = false
	local Largest = 0
	
	for i, _ in pairs(List) do
		if type(i) ~= "number" then
			Flag = false
			break
		else
			Flag = true
			Largest = math.max(Largest, i)
			continue
		end
	end
	if Flag then
		local t = {}
		
		for i1, value in ipairs(List) do
			t[i1] = transformJsonLeafFirst(value, Callback)
		end
		return Callback(t)
	else
		local t1 = {}
		
		for i2, value1 in pairs(List) do
			t1[i2] = transformJsonLeafFirst(value1, Callback)
		end
		return Callback(t1)
	end
end

return transformJsonLeafFirst