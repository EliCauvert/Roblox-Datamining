local appChat = script:FindFirstAncestor("AppChat")
local cryoModule = require(appChat.Parent.Cryo)
local getUserDisplayName = require(appChat.SocialLibraries).User.getUserDisplayName
local getThumbnailsForUserIdsModule = require(script.Parent.getThumbnailsForUserIds)
local roduxPresenceModule = require(appChat.Http.RoduxPresence)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local userPresenceUtilsModule = require(script.Parent.userPresenceUtils)

return function(p0, p1, p2) --[[ line: 16 ]]
	-- upvalues: fFlagAppChatPresenceStoreMigrationModule (ref), roduxPresenceModule (ref), userPresenceUtilsModule (ref), cryoModule (ref), getUserDisplayName (ref), getThumbnailsForUserIdsModule (ref)
	local var6 = if not fFlagAppChatPresenceStoreMigrationModule then userPresenceUtilsModule.getUserDisplayPresence(roduxPresenceModule.Selectors.getUserPresenceByUserId(p0, p1.id), p1.id == p0.LocalUserId) else nil
	
	return cryoModule.Dictionary.join(p1, {
		isLocalUser = p0.LocalUserId == p1.id,
		displayName = if p2 then p2.names.combinedName else getUserDisplayName(p0, p1),
		presenceText = if fFlagAppChatPresenceStoreMigrationModule then nil else var6.text,
		presenceImage = if fFlagAppChatPresenceStoreMigrationModule then nil else var6.image,
		thumbnail = getThumbnailsForUserIdsModule({ p1.id })[1]
	})
end