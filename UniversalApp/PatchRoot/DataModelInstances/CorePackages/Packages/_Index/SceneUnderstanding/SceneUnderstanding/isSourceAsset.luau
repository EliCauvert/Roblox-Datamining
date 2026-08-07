local safelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(value) --[[ line: 26 | named "isSourceAsset" ]]
	-- upvalues: safelyAccessPropertyModule (ref)
	return safelyAccessPropertyModule(value, "SourceAssetId", -1) > 0
end