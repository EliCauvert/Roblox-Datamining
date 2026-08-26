return function(p1)
	local senderIsLocalUser = p1.senderIsLocalUser
	local senderRepliedToSelf = p1.senderRepliedToSelf
	local senderRepliedToLocalUser = p1.senderRepliedToLocalUser
	
	if senderIsLocalUser and senderRepliedToSelf then
		return "Feature.Chat.Label.YouRepliedToYou"
	elseif p1.isGroup then
		return if senderIsLocalUser and not senderRepliedToSelf then {
			"Feature.Chat.Label.Group.YouRepliedToThem",
			DISPLAY_NAME = p1.repliedToName
		} elseif not (not senderIsLocalUser and senderRepliedToLocalUser) then if not (not senderIsLocalUser and senderRepliedToSelf) then if senderIsLocalUser or senderRepliedToLocalUser then "Feature.Chat.Label.UnknownUser" else {
			"Feature.Chat.Label.Group.ThemRepliedToOther",
			DISPLAY_NAME_1 = p1.senderName,
			DISPLAY_NAME_2 = p1.repliedToName
		} else {
			"Feature.Chat.Label.Group.ThemRepliedToThem",
			DISPLAY_NAME = p1.senderName
		} else {
			"Feature.Chat.Label.Group.ThemRepliedToYou",
			DISPLAY_NAME = p1.senderName
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