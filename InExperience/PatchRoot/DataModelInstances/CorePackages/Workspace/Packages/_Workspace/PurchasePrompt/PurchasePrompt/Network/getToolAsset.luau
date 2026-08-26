return function(value, p1)
	return value.loadAssetForEquip(p1):andThen(function(p2)
		if p2:IsA("Tool") then
			return p2
		end
		for i, v in ipairs(p2:GetChildren()) do
			if v:IsA("Tool") then
				return v
			end
		end
	end):catch(function(_)
		return nil
	end)
end