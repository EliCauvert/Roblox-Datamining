local sduiConditionKey = require(script:FindFirstAncestor("SduiCoreSystem").ConditionalProps.SduiConditionalPropTypes).SduiConditionKey

return function(p1, p2)
	-- upvalues: sduiConditionKey (ref)
	local t = {}
	
	if not p1 then
		return t
	end
	assert(p1, "allConditionalProps must exist")
	
	for i, v in p1 do
		local var1 = nil
		
		if v.conditions then
			for i_1, v_1 in v.conditions do
				if i_1 == sduiConditionKey.friendInGame then
					var1 = true
					local var2 = p2[tostring(v_1)]
					
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