return {
	findFirstDescendant = function(Object, ClassName, Callback)
		for _, descendant in Object:GetDescendants() do
			if descendant:IsA(ClassName) and (Callback == nil or Callback(descendant)) then
				return descendant
			end
		end
		return nil
	end,
	findAllDescendants = function(Object, ClassName)
		local List = {}
		
		for _, descendant in Object:GetDescendants() do
			if descendant:IsA(ClassName) then
				table.insert(List, descendant)
			end
		end
		return List
	end
}