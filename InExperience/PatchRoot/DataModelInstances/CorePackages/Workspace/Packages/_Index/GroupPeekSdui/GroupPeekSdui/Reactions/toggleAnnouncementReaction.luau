local GroupPeekSdui = script:FindFirstAncestor("GroupPeekSdui")
local Parent = GroupPeekSdui.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.SduiSharedContent)
local AnnouncementReactionRequestsModule = require(GroupPeekSdui.Reactions.AnnouncementReactionRequests)

return function(p1)
	-- upvalues: PromiseModule (copy), AnnouncementReactionRequestsModule (copy)
	local Parts = string.split(p1.entityId, "/")
	
	if #Parts == 3 and table.find(Parts, "") == nil then
		local config = {
			groupId = Parts[1],
			announcementId = Parts[2],
			messageId = Parts[3],
			emoteId = p1.emoteId
		}
		
		return if p1.shouldAdd then AnnouncementReactionRequestsModule.addAnnouncementReaction(config) else AnnouncementReactionRequestsModule.removeAnnouncementReaction(config)
	else
		return PromiseModule.reject(`entityId must be groupId/announcementId/messageId: {p1.entityId}`)
	end
end