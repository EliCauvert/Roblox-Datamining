local SafelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(p1): boolean --[[ Line: 26 | Named "isSourceAsset" ]]
	-- upvalues: SafelyAccessPropertyModule (copy)
	return SafelyAccessPropertyModule(p1, "SourceAssetId", -1) > 0
end