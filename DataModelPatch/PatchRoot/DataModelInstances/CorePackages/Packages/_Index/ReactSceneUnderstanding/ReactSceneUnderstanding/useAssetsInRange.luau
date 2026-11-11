local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local _ = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)
local SceneAnalysisContextModule = require(ReactSceneUnderstanding.SceneAnalysisContext)
local UseSourceAssetsModule = require(ReactSceneUnderstanding.useSourceAssets)

return function(p1)
	-- upvalues: SceneAnalysisContextModule (copy), UseSourceAssetsModule (copy)
	local UseResult = SceneAnalysisContextModule.use()
	
	return UseSourceAssetsModule({
		rangeQueryOptions = if p1 then p1 else UseResult.rangeQueryOptions
	}).assetsInRange
end