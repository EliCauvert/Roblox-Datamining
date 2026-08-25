return function(p0)
	local senderIsLocalUser = p0.senderIsLocalUser
	local senderRepliedToSelf = p0.senderRepliedToSelf
	local senderRepliedToLocalUser = p0.senderRepliedToLocalUser
	
	if senderIsLocalUser and senderRepliedToSelf then
		return "Feature.Chat.Label.YouRepliedToYou"
	elseif p0.isGroup then
		return if senderIsLocalUser and not senderRepliedToSelf then {
			"Feature.Chat.Label.Group.YouRepliedToThem",
			DISPLAY_NAME = p0.repliedToName
		} elseif not (not senderIsLocalUser and senderRepliedToLocalUser) then if not (not senderIsLocalUser and senderRepliedToSelf) then if senderIsLocalUser or senderRepliedToLocalUser then "Feature.Chat.Label.UnknownUser" else {
			"Feature.Chat.Label.Group.ThemRepliedToOther",
			DISPLAY_NAME_1 = p0.senderName,
			DISPLAY_NAME_2 = p0.repliedToName
		} else {
			"Feature.Chat.Label.Group.ThemRepliedToThem",
			DISPLAY_NAME = p0.senderName
		} else {
			"Feature.Chat.Label.Group.ThemRepliedToYou",
			DISPLAY_NAME = p0.senderName
		}
	elseif senderIsLocalUser and not senderRepliedToSelf then
		return "Feature.Chat.Label.OneToOne.YouRepliedToThem"
	elseif not senderIsLocalUser and senderRepliedToLocalUser then
		return "Feature.Chat.Label.OneToOne.ThemRepliedToYou"
	elseif senderIsLocalUser or not senderRepliedToSelf then
	else
		return "Feature.Chat.Label.OneToOne.ThemRepliedToThem"
	end
end