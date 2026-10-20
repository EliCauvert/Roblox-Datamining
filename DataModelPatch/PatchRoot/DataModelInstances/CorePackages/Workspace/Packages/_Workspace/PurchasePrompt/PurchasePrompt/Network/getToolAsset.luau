return function(p1, p2)
	return p1.loadAssetForEquip(p2):andThen(function(Result: Tool)
		if Result:IsA("Tool") then
			return Result
		end
		for _, Tool in ipairs((Result:GetChildren())) do
			if Tool:IsA("Tool") then
				return Tool
			end
		end
	end):catch(function(_)
		return nil
	end)
end