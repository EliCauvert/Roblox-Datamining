local constants = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.UserLib).Utils.Constants

return function(p1)
	-- upvalues: constants (ref)
	return if p1 == "Bundle" then constants.RbxthumbTypes.BundleThumbnail elseif p1 == "Asset" then constants.RbxthumbTypes.Asset else nil
end