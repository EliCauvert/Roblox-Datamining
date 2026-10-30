local SduiConditionKey = require(script:FindFirstAncestor("SduiCoreSystem").ConditionalProps.SduiConditionalPropTypes).SduiConditionKey

return function(List, p1)
	-- upvalues: SduiConditionKey (copy)
	local t = {}
	
	if not List then
		return t
	end
	assert(List, "allConditionalProps must exist")
	local Flag = nil
	
	for i, value in List do
		Flag = nil
		
		if value.conditions then
			for i1, condition in value.conditions do
				if i1 == SduiConditionKey.friendInGame then
					Flag = true
					local v1 = p1[tostring(condition)]
					
					if v1 then
						for _ in v1 do
							Flag = false
							break
						end
					end
					if Flag then break end
				else
					continue
				end
			end
		end
		t[i] = Flag
	end
	return t
end