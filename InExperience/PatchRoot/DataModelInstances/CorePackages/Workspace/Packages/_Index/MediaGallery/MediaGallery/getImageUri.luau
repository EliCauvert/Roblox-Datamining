local fFlagLuaAppMediaGalleryNilImageIdFix = require(script:FindFirstAncestor("MediaGallery").Parent.SharedFlags).FFlagLuaAppMediaGalleryNilImageIdFix

return function(p1)
	-- upvalues: fFlagLuaAppMediaGalleryNilImageIdFix (ref)
	if fFlagLuaAppMediaGalleryNilImageIdFix and (p1 == nil or p1 == "") then
		return ""
	end
	local matchIndex = string.find(p1, "http://www.roblox.com/asset/?id=", 1, true)
	
	return if matchIndex and matchIndex == 1 then `rbxthumb://type=Asset&id={string.sub(p1, 33)}&w=768&h=432` elseif tonumber(p1) then `rbxthumb://type=Asset&id={p1}&w=768&h=432` else p1
end