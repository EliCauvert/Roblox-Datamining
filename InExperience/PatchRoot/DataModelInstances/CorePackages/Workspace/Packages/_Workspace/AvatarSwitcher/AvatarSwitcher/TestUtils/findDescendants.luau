return {
	findFirstDescendant = function(p1, p2, p3)
		for i, v in p1:GetDescendants() do
			if v:IsA(p2) and (p3 == nil or p3(v)) then
				return v
			end
		end
		return nil
	end,
	findAllDescendants = function(p4, p5)
		local t = {}
		
		for i, v in p4:GetDescendants() do
			if v:IsA(p5) then
				table.insert(t, v)
			end
		end
		return t
	end
}