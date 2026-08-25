local safelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(value)
	-- upvalues: safelyAccessPropertyModule (ref)
	return safelyAccessPropertyModule(value, "SourceAssetId", -1) > 0
end