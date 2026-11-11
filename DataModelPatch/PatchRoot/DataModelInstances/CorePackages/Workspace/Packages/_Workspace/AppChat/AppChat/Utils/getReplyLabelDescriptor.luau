return function(p1)
	local SenderIsLocalUser = p1.senderIsLocalUser
	local SenderRepliedToSelf = p1.senderRepliedToSelf
	local SenderRepliedToLocalUser = p1.senderRepliedToLocalUser
	
	if SenderIsLocalUser and SenderRepliedToSelf then
		return "Feature.Chat.Label.YouRepliedToYou"
	elseif p1.isGroup then
		if SenderIsLocalUser and not SenderRepliedToSelf then
			return {
				"Feature.Chat.Label.Group.YouRepliedToThem",
				DISPLAY_NAME = p1.repliedToName
			}
		elseif not SenderIsLocalUser and SenderRepliedToLocalUser then
			return {
				"Feature.Chat.Label.Group.ThemRepliedToYou",
				DISPLAY_NAME = p1.senderName
			}
		elseif not SenderIsLocalUser and SenderRepliedToSelf then
			return {
				"Feature.Chat.Label.Group.ThemRepliedToThem",
				DISPLAY_NAME = p1.senderName
			}
		elseif not SenderIsLocalUser and not SenderRepliedToLocalUser then
			return {
				"Feature.Chat.Label.Group.ThemRepliedToOther",
				DISPLAY_NAME_1 = p1.senderName,
				DISPLAY_NAME_2 = p1.repliedToName
			}
		end
	elseif SenderIsLocalUser and not SenderRepliedToSelf then
		return "Feature.Chat.Label.OneToOne.YouRepliedToThem"
	elseif not SenderIsLocalUser and SenderRepliedToLocalUser then
		return "Feature.Chat.Label.OneToOne.ThemRepliedToYou"
	elseif not SenderIsLocalUser and SenderRepliedToSelf then
		return "Feature.Chat.Label.OneToOne.ThemRepliedToThem"
	end
	return "Feature.Chat.Label.UnknownUser"
end