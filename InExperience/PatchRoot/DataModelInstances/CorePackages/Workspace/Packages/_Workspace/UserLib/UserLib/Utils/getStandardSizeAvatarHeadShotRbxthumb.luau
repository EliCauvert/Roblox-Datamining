local GetRbxthumbWithTypeSizeAndOptionsModule = require(script.Parent.getRbxthumbWithTypeSizeAndOptions)
local ConstantsModule = require(script.Parent.Constants)

return function(p1, p2)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsModule (copy), ConstantsModule (copy)
	return GetRbxthumbWithTypeSizeAndOptionsModule(p1, ConstantsModule.RbxthumbTypes.AvatarHeadShot, 150, nil, nil, p2)
end