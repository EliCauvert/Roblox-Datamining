local IsSourceAssetModule = require(script:FindFirstAncestor("SceneUnderstanding").isSourceAsset)

return function(p1) --[[ Line: 5 | Named "findSourceAssetsFromDescendant" ]]
	-- upvalues: IsSourceAssetModule (copy)
	local List = {}
	local Parent = p1.Parent
	while Parent do
		if IsSourceAssetModule(Parent) then
			table.insert(List, Parent)
		end
		Parent = Parent.Parent
	end
	return List
end