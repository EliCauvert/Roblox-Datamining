local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Types)

local function transformJsonLeafFirst(p0, p1) --[[ line: 12 ]]
	-- upvalues: transformJsonLeafFirst (ref)
	if type(p0) ~= "table" then
		return p1(p0)
	end
	local var1 = false
	local var2 = 0
	
	for i, v in pairs(p0) do
		if type(i) ~= "number" then
			var1 = false
			break
		end
		var1 = true
		var2 = math.max(var2, i)
	end
	if var1 then
		local t = {}
		
		for i_1, v_1 in ipairs(p0) do
			t[i_1] = transformJsonLeafFirst(v_1, p1)
		end
		return p1(t)
	else
		local t = {}
		
		for i_1, v_1 in pairs(p0) do
			t[i_1] = transformJsonLeafFirst(v_1, p1)
		end
		return p1(t)
	end
end

return transformJsonLeafFirst