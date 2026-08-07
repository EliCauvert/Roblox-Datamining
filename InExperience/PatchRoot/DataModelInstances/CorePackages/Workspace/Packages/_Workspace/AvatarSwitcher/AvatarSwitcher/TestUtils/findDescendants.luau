return {
	findFirstDescendant = function(p0, p1, p2) --[[ line: 1 ]]
		for i, v in p0:GetDescendants() do
			if v:IsA(p1) and (p2 == nil or p2(v)) then
				return v
			end
		end
		return nil
	end,
	findAllDescendants = function(p3, p4) --[[ line: 14 ]]
		local t = {}
		
		for i, v in p3:GetDescendants() do
			if v:IsA(p4) then
				table.insert(t, v)
			end
		end
		return t
	end
}