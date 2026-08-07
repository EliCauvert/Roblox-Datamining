local constants = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.UserLib).Utils.Constants

return function(p0) --[[ line: 7 | named "getRbxThumbType" ]]
	-- upvalues: constants (ref)
	return if p0 == "Bundle" then constants.RbxthumbTypes.BundleThumbnail elseif p0 == "Asset" then constants.RbxthumbTypes.Asset else nil
end