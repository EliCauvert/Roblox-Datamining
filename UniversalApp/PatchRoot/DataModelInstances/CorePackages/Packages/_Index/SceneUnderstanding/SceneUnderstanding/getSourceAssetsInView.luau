local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local queryViewportModule = require(sceneUnderstanding.queryViewport)
local findSourceAssetsFromDescendantModule = require(sceneUnderstanding.findSourceAssetsFromDescendant)
local getSourceAssetsFromDescendantsModule = require(sceneUnderstanding.getSourceAssetsFromDescendants)
local isSourceAssetModule = require(sceneUnderstanding.isSourceAsset)
local _ = require(sceneUnderstanding.options.ViewportQueryOptions)

return function(value, p0) --[[ line: 62 | named "getSourceAssetsInView" ]]
	-- upvalues: queryViewportModule (ref), isSourceAssetModule (ref), findSourceAssetsFromDescendantModule (ref), getSourceAssetsFromDescendantsModule (ref)
	return getSourceAssetsFromDescendantsModule(queryViewportModule(value, function(p1) --[[ line: 63 ]]
		-- upvalues: isSourceAssetModule (copy), findSourceAssetsFromDescendantModule (copy)
		return isSourceAssetModule(p1) or #findSourceAssetsFromDescendantModule(p1) > 0
	end, p0))
end