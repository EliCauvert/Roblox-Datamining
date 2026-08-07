local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local findSourceAssetsFromDescendantModule = require(sceneUnderstanding.findSourceAssetsFromDescendant)
local getSourceAssetsFromDescendantsModule = require(sceneUnderstanding.getSourceAssetsFromDescendants)
local isSourceAssetModule = require(sceneUnderstanding.isSourceAsset)
local rangeQueryOptionsModule = require(sceneUnderstanding.options.RangeQueryOptions)

return function(value, p0) --[[ line: 30 | named "getSourceAssetsInRange" ]]
	-- upvalues: rangeQueryOptionsModule (ref), isSourceAssetModule (ref), findSourceAssetsFromDescendantModule (ref), getSourceAssetsFromDescendantsModule (ref)
	local t = {}
	
	for i, v in workspace:GetPartBoundsInRadius(value, rangeQueryOptionsModule.new(p0).maxDistance) do
		if isSourceAssetModule(v) or #findSourceAssetsFromDescendantModule(v) > 0 then
			table.insert(t, v)
		end
	end
	return getSourceAssetsFromDescendantsModule(t)
end