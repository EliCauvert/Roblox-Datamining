local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local fFlagAppChatSanitizeConversationTitleRichText = require(parent.SharedFlags).FFlagAppChatSanitizeConversationTitleRichText
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local escapeRichText = require(parent.ChatUIPrimitives).Utils.escapeRichText
local getFacePileParticipantIdsModule = require(script.Parent.getFacePileParticipantIds)
local useFacePilePresenceModule = require(script.Parent.useFacePilePresence)

return function(p1)
	-- upvalues: getFacePileParticipantIdsModule (ref), useFacePilePresenceModule (ref), reactModule (ref), userTile (ref), layoutMode (ref), fFlagAppChatSanitizeConversationTitleRichText (ref), escapeRichText (ref)
	local var1 = getFacePileParticipantIdsModule(p1.participantUserIds or {}, p1.localUserId)
	
	return if p1.participantUserIds ~= nil and #p1.participantUserIds > 0 then reactModule.createElement(userTile, {
		userId = tostring(var1[1]),
		facePileSecondUserId = if var1[2] then tostring(var1[2]) else nil,
		layoutMode = layoutMode.wide,
		title = if fFlagAppChatSanitizeConversationTitleRichText and p1.titleText then escapeRichText(p1.titleText) else p1.titleText,
		titleStyle = p1.titleStyle,
		userPresenceType = useFacePilePresenceModule(var1),
		onActivated = p1.onActivated,
		selectable = p1.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord
	}) else nil
end