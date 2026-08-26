return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		local var1 = Instance.new(p1)
		local var2 = nil
		
		for i, v in pairs(p2) do
			if type(i) == "number" and typeof(v) == "Instance" then
				v.Parent = var1
			elseif type(i) == "string" then
				if i == "Parent" then
					var2 = v
				else
					var1[i] = v
				end
			end
		end
		var1.Parent = var2
		
		return var1
	end
end