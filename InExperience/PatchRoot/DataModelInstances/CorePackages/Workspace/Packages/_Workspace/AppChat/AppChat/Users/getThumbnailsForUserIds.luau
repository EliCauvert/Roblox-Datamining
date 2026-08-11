local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(p0) --[[ line: 7 ]]
	-- upvalues: cryoModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref)
	return cryoModule.List.map(p0, function(p1) --[[ line: 8 ]]
		-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy)
		return getStandardSizeAvatarHeadShotRbxthumb(tostring(p1))
	end)
end