local SceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local FindSourceAssetsFromDescendantModule = require(SceneUnderstanding.findSourceAssetsFromDescendant)
local GetSourceAssetsFromDescendantsModule = require(SceneUnderstanding.getSourceAssetsFromDescendants)
local IsSourceAssetModule = require(SceneUnderstanding.isSourceAsset)
local RangeQueryOptionsModule = require(SceneUnderstanding.options.RangeQueryOptions)

return function(Position, p1)
	-- upvalues: RangeQueryOptionsModule (copy), IsSourceAssetModule (copy), FindSourceAssetsFromDescendantModule (copy), GetSourceAssetsFromDescendantsModule (copy)
	local List = {}
	
	for _, value in workspace:GetPartBoundsInRadius(Position, RangeQueryOptionsModule.new(p1).maxDistance) do
		if IsSourceAssetModule(value) or #FindSourceAssetsFromDescendantModule(value) > 0 then
			table.insert(List, value)
		end
	end
	return GetSourceAssetsFromDescendantsModule(List)
end