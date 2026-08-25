local isSourceAssetModule = require(script:FindFirstAncestor("SceneUnderstanding").isSourceAsset)

return function(value)
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