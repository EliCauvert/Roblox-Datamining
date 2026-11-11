local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(p1)
	-- upvalues: CryoModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy)
	return CryoModule.List.map(p1, function(p2)
		-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (upval)
		return GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p2)))
	end)
end