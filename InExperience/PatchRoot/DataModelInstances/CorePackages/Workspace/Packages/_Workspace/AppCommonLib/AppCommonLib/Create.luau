return function(p0)
	return function(p1)
		-- upvalues: p0 (ref)
		local var0 = Instance.new(p0)
		local var1 = nil
		
		for i, v in pairs(p1) do
			if type(i) == "number" and typeof(v) == "Instance" then
				v.Parent = var0
			elseif type(i) == "string" then
				if i == "Parent" then
					var1 = v
				else
					var0[i] = v
				end
			end
		end
		var0.Parent = var1
		
		return var0
	end
end