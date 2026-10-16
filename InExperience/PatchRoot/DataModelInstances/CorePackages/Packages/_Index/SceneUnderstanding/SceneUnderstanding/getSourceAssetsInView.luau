local SceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local QueryViewportModule = require(SceneUnderstanding.queryViewport)
local FindSourceAssetsFromDescendantModule = require(SceneUnderstanding.findSourceAssetsFromDescendant)
local GetSourceAssetsFromDescendantsModule = require(SceneUnderstanding.getSourceAssetsFromDescendants)
local IsSourceAssetModule = require(SceneUnderstanding.isSourceAsset)
local _ = require(SceneUnderstanding.options.ViewportQueryOptions)

return function(p1, p2) --[[ Line: 62 | Named "getSourceAssetsInView" ]]
	-- upvalues: QueryViewportModule (copy), IsSourceAssetModule (copy), FindSourceAssetsFromDescendantModule (copy), GetSourceAssetsFromDescendantsModule (copy)
	return GetSourceAssetsFromDescendantsModule((QueryViewportModule(p1, function(p3) --[[ Line: 63 ]]
		-- upvalues: IsSourceAssetModule (upval), FindSourceAssetsFromDescendantModule (upval)
		return IsSourceAssetModule(p3) or #FindSourceAssetsFromDescendantModule(p3) > 0
	end, p2)))
end