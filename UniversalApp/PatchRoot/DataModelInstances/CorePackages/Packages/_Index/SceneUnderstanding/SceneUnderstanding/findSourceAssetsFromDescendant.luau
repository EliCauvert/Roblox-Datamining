local isSourceAssetModule = require(script:FindFirstAncestor("SceneUnderstanding").isSourceAsset)

return function(value) --[[ line: 5 | named "findSourceAssetsFromDescendant" ]]
	-- upvalues: isSourceAssetModule (ref)
	local t = {}
	local parent = value.Parent
	while parent do
		if isSourceAssetModule(parent) then
			table.insert(t, parent)
		end
		parent = parent.Parent
	end
	return t
end