local sduiConditionKey = require(script:FindFirstAncestor("SduiCoreSystem").ConditionalProps.SduiConditionalPropTypes).SduiConditionKey

return function(p0, p1)
	-- upvalues: sduiConditionKey (ref)
	local t = {}
	
	if not p0 then
		return t
	end
	assert(p0, "allConditionalProps must exist")
	
	for i, v in p0 do
		local var1 = nil
		
		if v.conditions then
			for i_1, v_1 in v.conditions do
				if i_1 == sduiConditionKey.friendInGame then
					var1 = true
					local var2 = p1[tostring(v_1)]
					
					if var2 then
						for i_2 in var2 do
							var1 = false
							break
						end
					end
					if var1 then break end
				end
			end
		end
		t[i] = var1
		continue
	end
	return t
end