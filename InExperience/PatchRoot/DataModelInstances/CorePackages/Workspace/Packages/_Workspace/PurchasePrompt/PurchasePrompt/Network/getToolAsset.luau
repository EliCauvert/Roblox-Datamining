return function(value, p0) --[[ line: 2 | named "getToolAsset" ]]
	return value.loadAssetForEquip(p0):andThen(function(p1) --[[ line: 5 ]]
		if p1:IsA("Tool") then
			return p1
		end
		for i, v in ipairs(p1:GetChildren()) do
			if v:IsA("Tool") then
				return v
			end
		end
	end):catch(function(_) --[[ line: 17 ]]
		return nil
	end)
end