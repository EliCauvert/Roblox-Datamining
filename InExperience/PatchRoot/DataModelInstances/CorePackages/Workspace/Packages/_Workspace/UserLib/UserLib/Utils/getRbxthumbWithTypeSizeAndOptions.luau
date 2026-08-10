local constantsModule = require(script.Parent.Constants)
local sharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local t = {
	[constantsModule.RbxthumbTypes.Avatar] = sharedFlagsModule.FFlagAXBackgroundsInAvatarThumbnails,
	[constantsModule.RbxthumbTypes.AvatarBust] = sharedFlagsModule.FFlagAXBackgroundsInAvatarBustThumbnails,
	[constantsModule.RbxthumbTypes.AvatarHeadShot] = sharedFlagsModule.FFlagAXBackgroundsInHeadshotThumbnails,
	[constantsModule.RbxthumbTypes.Outfit] = sharedFlagsModule.FFlagAXBackgroundsInOutfitThumbnails
}

return function(p0, p1, p2, p3, p4, p5) --[[ line: 14 ]]
	-- upvalues: t (ref), constantsModule (ref)
	local formattedText = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", p1, tostring(p0), p2, p2)
	
	if p3 then
		formattedText ..= "&filters=circular"
	end
	if p4 then
		formattedText ..= "&timestamp=" .. os.time()
	end
	if t[p1] then
		formattedText ..= "&includeBackground=true"
	end
	if p5 and p1 == constantsModule.RbxthumbTypes.AvatarHeadShot then
		formattedText ..= "&includeprofileframe=true"
	end
	return formattedText
end