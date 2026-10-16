local ConstantsModule = require(script.Parent.Constants)
local SharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local config = {
	[ConstantsModule.RbxthumbTypes.Avatar] = SharedFlagsModule.FFlagAXBackgroundsInAvatarThumbnails,
	[ConstantsModule.RbxthumbTypes.AvatarBust] = SharedFlagsModule.FFlagAXBackgroundsInAvatarBustThumbnails,
	[ConstantsModule.RbxthumbTypes.AvatarHeadShot] = SharedFlagsModule.FFlagAXBackgroundsInHeadshotThumbnails,
	[ConstantsModule.RbxthumbTypes.Outfit] = SharedFlagsModule.FFlagAXBackgroundsInOutfitThumbnails
}

return function(p1, AvatarHeadShot, p2, p3, p4, p5): string --[[ Line: 14 ]]
	-- upvalues: config (copy), ConstantsModule (copy)
	local Formatted = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", AvatarHeadShot, tostring(p1), p2, p2)
	
	if p3 then
		Formatted ..= "&filters=circular"
	end
	if p4 then
		Formatted ..= "&timestamp=" .. os.time()
	end
	if config[AvatarHeadShot] then
		Formatted ..= "&includeBackground=true"
	end
	if p5 and AvatarHeadShot == ConstantsModule.RbxthumbTypes.AvatarHeadShot then
		Formatted ..= "&includeprofileframe=true"
	end
	return Formatted
end