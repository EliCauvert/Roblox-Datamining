local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AbuseReporting.Constants)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy)
	local Type = nil
	local Size = nil
	
	if p2 == "Profile" or p2 == "Chat" then
		Type = ConstantsModule.PROFILE_THUMBNAIL_DATA.Type
		Size = ConstantsModule.PROFILE_THUMBNAIL_DATA.Size
	elseif p2 == "ExperienceDetails" then
		Type = ConstantsModule.EXP_THUMBNAIL_DATA.Type
		Size = ConstantsModule.EXP_THUMBNAIL_DATA.Size
	elseif p2 == "Item" then
		Type = ConstantsModule.ITEM_THUMBNAIL_DATA.Type
		Size = ConstantsModule.ITEM_THUMBNAIL_DATA.Size
	end
	return if Type then string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", Type, p1, Size, Size) else nil
end