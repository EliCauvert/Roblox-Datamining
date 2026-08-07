local getRbxthumbWithTypeSizeAndOptionsModule = require(script.Parent.getRbxthumbWithTypeSizeAndOptions)
local constantsModule = require(script.Parent.Constants)

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: getRbxthumbWithTypeSizeAndOptionsModule (ref), constantsModule (ref)
	return getRbxthumbWithTypeSizeAndOptionsModule(p0, constantsModule.RbxthumbTypes.AvatarHeadShot, 150, nil, nil, p1)
end