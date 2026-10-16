return function(p1) --[[ Line: 21 | Named "create" ]]
	return function(List) --[[ Line: 22 ]]
		-- upvalues: p1 (copy)
		local NewInstance = Instance.new(p1)
		local Parent = nil
		
		for i, value in pairs(List) do
			if type(i) == "number" and typeof(value) == "Instance" then
				value.Parent = NewInstance
			elseif type(i) == "string" then
				if i == "Parent" then
					Parent = value
				else
					NewInstance[i] = value
				end
			end
		end
		NewInstance.Parent = Parent
		
		return NewInstance
	end
end