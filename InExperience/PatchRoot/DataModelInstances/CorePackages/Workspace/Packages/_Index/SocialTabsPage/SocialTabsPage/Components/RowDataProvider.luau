local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useJoinUserInExperience = require(parent.SocialExperienceJoin).useJoinUserInExperience
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local convertUserPresenceTypeToString = require(parent.SocialCommon).Utils.convertUserPresenceTypeToString
local dataHydrationModule = require(parent.DataHydration)
local useCTAForRowModule = require(socialTabsPage.Hooks.useCTAForRow)
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)
local _ = require(socialTabsPage.Common.Types)
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)
local var6 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local t = {
	lastLocation = "",
	userPresenceType = roduxPresenceModule.Enums.PresenceType.Offline
}
local var8 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then {
	lastLocation = "",
	userPresenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType.Offline
} else nil

return reactModule.memo(function(p0)
	-- upvalues: fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), var6 (ref), var8 (ref), useSelector (ref), roduxPresenceModule (ref), t (ref), convertUserPresenceTypeToString (ref), useJoinUserInExperience (ref), useCTAForRowModule (ref)
	local _ = nil
	local var9 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then var6(p0.entity.id) or var8 else useSelector(function(p1)
		-- upvalues: roduxPresenceModule (copy), p0 (ref), t (copy)
		return roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p0.entity.id) or t
	end)
	
	return p0.createRow({
		presence = if fFlagSocialTabsPagePresenceSignalsMigrationModule then var9.userPresenceType else convertUserPresenceTypeToString(var9.userPresenceType),
		primaryCta = useCTAForRowModule(p0.ctaResult, p0.actionHandlers, p0.entity.id, useJoinUserInExperience(p0.entity.id, { presence = var9 }))
	})
end)