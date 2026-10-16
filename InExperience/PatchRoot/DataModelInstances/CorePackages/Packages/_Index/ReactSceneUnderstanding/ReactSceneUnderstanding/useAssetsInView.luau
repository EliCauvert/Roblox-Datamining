local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local _ = require(ReactSceneUnderstanding.Parent.SceneUnderstanding)
local SceneAnalysisContextModule = require(ReactSceneUnderstanding.SceneAnalysisContext)
local UseSourceAssetsModule = require(ReactSceneUnderstanding.useSourceAssets)

return function(p1) --[[ Line: 72 | Named "useAssetsInView" ]]
	-- upvalues: SceneAnalysisContextModule (copy), UseSourceAssetsModule (copy)
	local UseResult = SceneAnalysisContextModule.use()
	
	return UseSourceAssetsModule({
		viewportQueryOptions = if p1 then p1 else UseResult.viewportQueryOptions
	}).assetsInView
end