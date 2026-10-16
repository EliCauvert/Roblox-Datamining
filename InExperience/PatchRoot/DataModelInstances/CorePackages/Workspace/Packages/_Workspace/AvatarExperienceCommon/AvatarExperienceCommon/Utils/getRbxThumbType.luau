local Constants = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.UserLib).Utils.Constants

return function(p1) --[[ Line: 7 | Named "getRbxThumbType" ]]
	-- upvalues: Constants (copy)
	return if p1 == "Bundle" then Constants.RbxthumbTypes.BundleThumbnail elseif p1 == "Asset" then Constants.RbxthumbTypes.Asset else nil
end