return function(p1, p2) --[[ Line: 2 | Named "getToolAsset" ]]
	return p1.loadAssetForEquip(p2):andThen(function(Result: Tool) --[[ Line: 5 ]]
		if Result:IsA("Tool") then
			return Result
		end
		for _, Tool in ipairs((Result:GetChildren())) do
			if Tool:IsA("Tool") then
				return Tool
			end
		end
	end):catch(function(_) --[[ Line: 17 ]]
		return nil
	end)
end