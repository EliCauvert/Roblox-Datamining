local ConstantsModule = require(script.Parent.Constants)
local SharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local config = {
	[ConstantsModule.RbxthumbTypes.Avatar] = SharedFlagsModule.FFlagAXBackgroundsInAvatarThumbnails,
	[ConstantsModule.RbxthumbTypes.AvatarBust] = SharedFlagsModule.FFlagAXBackgroundsInAvatarBustThumbnails,
	[ConstantsModule.RbxthumbTypes.AvatarHeadShot] = SharedFlagsModule.FFlagAXBackgroundsInHeadshotThumbnails,
	[ConstantsModule.RbxthumbTypes.Outfit] = SharedFlagsModule.FFlagAXBackgroundsInOutfitThumbnails
}

return function(p1, p2, p3, p4, p5): string
	-- upvalues: config (copy)
	local Formatted = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", p2, tostring(p1), p3, p3)
	
	if p4 then
		Formatted ..= "&filters=circular"
	end
	if p5 then
		Formatted ..= "&timestamp=" .. os.time()
	end
	if config[p2] then
		Formatted ..= "&includeBackground=true"
	end
	return Formatted
end