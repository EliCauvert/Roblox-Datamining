local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Types)

local function transformJsonLeafFirst(List, Callback) --[[ Line: 12 ]]
	-- upvalues: transformJsonLeafFirst (copy)
	if type(List) ~= "table" then
		return Callback(List)
	end
	local Flag = false
	
	for i, _ in pairs(List) do
		if type(i) ~= "number" then
			Flag = false
			break
		else
			Flag = true
			continue
		end
	end
	if Flag then
		local List1 = {}
		
		for _, value in ipairs(List) do
			local TransformJsonLeafFirstResult = transformJsonLeafFirst(value, Callback)
			
			if TransformJsonLeafFirstResult ~= nil then
				table.insert(List1, TransformJsonLeafFirstResult)
			end
		end
		return Callback(List1)
	else
		local t = {}
		
		for i1, value1 in pairs(List) do
			t[i1] = transformJsonLeafFirst(value1, Callback)
		end
		return Callback(t)
	end
end

return transformJsonLeafFirst