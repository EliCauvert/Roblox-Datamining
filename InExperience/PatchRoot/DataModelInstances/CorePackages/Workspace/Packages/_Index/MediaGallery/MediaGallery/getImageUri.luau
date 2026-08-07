local fFlagLuaAppMediaGalleryNilImageIdFix = require(script:FindFirstAncestor("MediaGallery").Parent.SharedFlags).FFlagLuaAppMediaGalleryNilImageIdFix

return function(p0) --[[ line: 9 | named "getImageUri" ]]
	-- upvalues: fFlagLuaAppMediaGalleryNilImageIdFix (ref)
	if fFlagLuaAppMediaGalleryNilImageIdFix and (p0 == nil or p0 == "") then
		return ""
	end
	local matchIndex = string.find(p0, "http://www.roblox.com/asset/?id=", 1, true)
	
	return if matchIndex and matchIndex == 1 then `rbxthumb://type=Asset&id={string.sub(p0, 33)}&w=768&h=432` elseif tonumber(p0) then `rbxthumb://type=Asset&id={p0}&w=768&h=432` else p0
end