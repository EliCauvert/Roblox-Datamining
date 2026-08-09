local parent = script:FindFirstAncestor("ExpChat").Parent
local reactModule = require(parent.React)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local getFacePileParticipantIdsModule = require(script.Parent.getFacePileParticipantIds)
local useFacePilePresenceModule = require(script.Parent.useFacePilePresence)

return function(p0) --[[ line: 32 | named "FriendsChatFacePile" ]]
	-- upvalues: getFacePileParticipantIdsModule (ref), useFacePilePresenceModule (ref), reactModule (ref), userTile (ref), layoutMode (ref)
	local var3 = getFacePileParticipantIdsModule(p0.participantUserIds or {}, p0.localUserId)
	
	return if p0.participantUserIds ~= nil and #p0.participantUserIds > 0 then reactModule.createElement(userTile, {
		userId = tostring(var3[1]),
		facePileSecondUserId = if var3[2] then tostring(var3[2]) else nil,
		layoutMode = layoutMode.wide,
		title = p0.titleText,
		titleStyle = p0.titleStyle,
		userPresenceType = useFacePilePresenceModule(var3),
		onActivated = p0.onActivated,
		selectable = p0.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord
	}) else nil
end