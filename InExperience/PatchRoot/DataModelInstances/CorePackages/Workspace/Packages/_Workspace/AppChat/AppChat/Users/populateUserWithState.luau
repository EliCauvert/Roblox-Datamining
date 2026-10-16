local AppChat = script:FindFirstAncestor("AppChat")
local CryoModule = require(AppChat.Parent.Cryo)
local GetUserDisplayNameFunction = require(AppChat.SocialLibraries).User.getUserDisplayName
local GetThumbnailsForUserIdsModule = require(script.Parent.getThumbnailsForUserIds)
local RoduxPresenceModule = require(AppChat.Http.RoduxPresence)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local UserPresenceUtilsModule = require(script.Parent.userPresenceUtils)

return function(p1, p2, p3) --[[ Line: 16 ]]
	-- upvalues: FFlagAppChatPresenceStoreMigrationModule (copy), RoduxPresenceModule (copy), UserPresenceUtilsModule (copy), CryoModule (copy), GetUserDisplayNameFunction (copy), GetThumbnailsForUserIdsModule (copy)
	local UserDisplayPresence = if FFlagAppChatPresenceStoreMigrationModule then nil else UserPresenceUtilsModule.getUserDisplayPresence(RoduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p2.id), p2.id == p1.LocalUserId)
	
	return CryoModule.Dictionary.join(p2, {
		isLocalUser = p1.LocalUserId == p2.id,
		displayName = if p3 then p3.names.combinedName else GetUserDisplayNameFunction(p1, p2),
		presenceText = if FFlagAppChatPresenceStoreMigrationModule then nil else UserDisplayPresence.text,
		presenceImage = if FFlagAppChatPresenceStoreMigrationModule then nil else UserDisplayPresence.image,
		thumbnail = GetThumbnailsForUserIdsModule({ p2.id })[1]
	})
end