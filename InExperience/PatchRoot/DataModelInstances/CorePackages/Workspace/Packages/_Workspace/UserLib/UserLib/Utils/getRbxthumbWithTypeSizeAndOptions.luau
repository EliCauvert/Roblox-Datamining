local constantsModule = require(script.Parent.Constants)
local sharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local t = {
	[constantsModule.RbxthumbTypes.Avatar] = sharedFlagsModule.FFlagAXBackgroundsInAvatarThumbnails,
	[constantsModule.RbxthumbTypes.AvatarBust] = sharedFlagsModule.FFlagAXBackgroundsInAvatarBustThumbnails,
	[constantsModule.RbxthumbTypes.AvatarHeadShot] = sharedFlagsModule.FFlagAXBackgroundsInHeadshotThumbnails,
	[constantsModule.RbxthumbTypes.Outfit] = sharedFlagsModule.FFlagAXBackgroundsInOutfitThumbnails
}

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref), constantsModule (ref)
	local formattedText = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", p2, tostring(p1), p3, p3)
	
	if p4 then
		formattedText ..= "&filters=circular"
	end
	if p5 then
		formattedText ..= "&timestamp=" .. os.time()
	end
	if t[p2] then
		formattedText ..= "&includeBackground=true"
	end
	if p6 and p2 == constantsModule.RbxthumbTypes.AvatarHeadShot then
		formattedText ..= "&includeprofileframe=true"
	end
	return formattedText
end