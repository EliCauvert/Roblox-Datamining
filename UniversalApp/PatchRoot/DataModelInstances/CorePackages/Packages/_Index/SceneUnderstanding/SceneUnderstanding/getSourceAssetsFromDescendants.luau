local SceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local IsSourceAssetModule = require(SceneUnderstanding.isSourceAsset)
local FindSourceAssetsFromDescendantModule = require(SceneUnderstanding.findSourceAssetsFromDescendant)

return function(List) --[[ Line: 17 | Named "getSourceAssetsFromDescendants" ]]
	-- upvalues: IsSourceAssetModule (copy), FindSourceAssetsFromDescendantModule (copy)
	local List1 = {}
	
	for _, value in List do
		if IsSourceAssetModule(value) then
			table.insert(List1, value)
		end
		for _, value1 in FindSourceAssetsFromDescendantModule(value) do
			if not table.find(List1, value1) then
				table.insert(List1, value1)
			end
		end
	end
	return List1
end