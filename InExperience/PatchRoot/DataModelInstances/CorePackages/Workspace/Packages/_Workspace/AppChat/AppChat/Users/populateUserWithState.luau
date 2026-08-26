local appChat = script:FindFirstAncestor("AppChat")
local cryoModule = require(appChat.Parent.Cryo)
local getUserDisplayName = require(appChat.SocialLibraries).User.getUserDisplayName
local getThumbnailsForUserIdsModule = require(script.Parent.getThumbnailsForUserIds)
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local userPresenceUtilsModule = require(script.Parent.userPresenceUtils)

return function(p1, p2, p3)
	-- upvalues: fFlagAppChatPresenceStoreMigrationModule (ref), roduxPresenceModule (ref), userPresenceUtilsModule (ref), cryoModule (ref), getUserDisplayName (ref), getThumbnailsForUserIdsModule (ref)
	local var1 = if not fFlagAppChatPresenceStoreMigrationModule then userPresenceUtilsModule.getUserDisplayPresence(roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p2.id), p2.id == p1.LocalUserId) else nil
	
	return cryoModule.Dictionary.join(p2, {
		isLocalUser = p1.LocalUserId == p2.id,
		displayName = if p3 then p3.names.combinedName else getUserDisplayName(p1, p2),
		presenceText = if fFlagAppChatPresenceStoreMigrationModule then nil else var1.text,
		presenceImage = if fFlagAppChatPresenceStoreMigrationModule then nil else var1.image,
		thumbnail = getThumbnailsForUserIdsModule({ p2.id })[1]
	})
end