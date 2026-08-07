-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local _ = require(reactSceneUnderstanding.Parent.SceneUnderstanding)
local sceneAnalysisContextModule = require(reactSceneUnderstanding.SceneAnalysisContext)
local useSourceAssetsModule = require(reactSceneUnderstanding.useSourceAssets)

return function(value) --[[ line: 72 | named "useAssetsInView" ]]
	-- upvalues: sceneAnalysisContextModule (ref), useSourceAssetsModule (ref)
	return useSourceAssetsModule({
		viewportQueryOptions = value or sceneAnalysisContextModule.use().viewportQueryOptions
	}).assetsInView
end