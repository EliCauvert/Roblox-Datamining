local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FFlagAppChatSanitizeConversationTitleRichText = require(Parent.SharedFlags).FFlagAppChatSanitizeConversationTitleRichText
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local EscapeRichTextFunction = require(Parent.ChatUIPrimitives).Utils.escapeRichText
local GetFacePileParticipantIdsModule = require(script.Parent.getFacePileParticipantIds)
local UseFacePilePresenceModule = require(script.Parent.useFacePilePresence)

return function(p1) --[[ Line: 35 | Named "FriendsChatFacePile" ]]
	-- upvalues: GetFacePileParticipantIdsModule (copy), UseFacePilePresenceModule (copy), ReactModule (copy), UserTile (copy), LayoutMode (copy), FFlagAppChatSanitizeConversationTitleRichText (copy), EscapeRichTextFunction (copy)
	local v1: boolean = p1.participantUserIds ~= nil and #p1.participantUserIds > 0
	local FacePileParticipantIdsModule = GetFacePileParticipantIdsModule(p1.participantUserIds or {}, p1.localUserId)
	local UseFacePilePresenceModuleResult = UseFacePilePresenceModule(FacePileParticipantIdsModule)
	
	return if v1 then ReactModule.createElement(UserTile, {
		userId = tostring(FacePileParticipantIdsModule[1]),
		facePileSecondUserId = if FacePileParticipantIdsModule[2] then tostring(FacePileParticipantIdsModule[2]) else nil,
		layoutMode = LayoutMode.wide,
		title = if FFlagAppChatSanitizeConversationTitleRichText and p1.titleText then EscapeRichTextFunction(p1.titleText) else p1.titleText,
		titleStyle = p1.titleStyle,
		userPresenceType = UseFacePilePresenceModuleResult,
		onActivated = p1.onActivated,
		selectable = p1.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord
	}) else nil
end