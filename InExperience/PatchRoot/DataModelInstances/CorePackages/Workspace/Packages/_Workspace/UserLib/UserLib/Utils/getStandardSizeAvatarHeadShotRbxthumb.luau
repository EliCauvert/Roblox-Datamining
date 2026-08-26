local getRbxthumbWithTypeSizeAndOptionsModule = require(script.Parent.getRbxthumbWithTypeSizeAndOptions)
local constantsModule = require(script.Parent.Constants)

return function(p1, p2)
	-- upvalues: getRbxthumbWithTypeSizeAndOptionsModule (ref), constantsModule (ref)
	return getRbxthumbWithTypeSizeAndOptionsModule(p1, constantsModule.RbxthumbTypes.AvatarHeadShot, 150, nil, nil, p2)
end