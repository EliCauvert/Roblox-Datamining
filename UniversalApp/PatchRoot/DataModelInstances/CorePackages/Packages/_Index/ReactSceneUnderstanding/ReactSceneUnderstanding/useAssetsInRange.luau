local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local _ = require(reactSceneUnderstanding.Parent.SceneUnderstanding)
local sceneAnalysisContextModule = require(reactSceneUnderstanding.SceneAnalysisContext)
local useSourceAssetsModule = require(reactSceneUnderstanding.useSourceAssets)

return function(value)
	-- upvalues: sceneAnalysisContextModule (ref), useSourceAssetsModule (ref)
	return useSourceAssetsModule({
		rangeQueryOptions = value or sceneAnalysisContextModule.use().rangeQueryOptions
	}).assetsInRange
end