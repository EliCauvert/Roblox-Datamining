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
local var1 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local t = {
	lastLocation = "",
	userPresenceType = roduxPresenceModule.Enums.PresenceType.Offline
}
local var2 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then {
	lastLocation = "",
	userPresenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType.Offline
} else nil

return reactModule.memo(function(p1)
	-- upvalues: fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), var1 (ref), var2 (ref), useSelector (ref), roduxPresenceModule (ref), t (ref), convertUserPresenceTypeToString (ref), useJoinUserInExperience (ref), useCTAForRowModule (ref)
	local _ = nil
	local var3 = if fFlagSocialTabsPagePresenceSignalsMigrationModule then var1(p1.entity.id) or var2 else useSelector(function(p2)
		-- upvalues: roduxPresenceModule (copy), p1 (ref), t (copy)
		return roduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1.entity.id) or t
	end)
	
	return p1.createRow({
		presence = if fFlagSocialTabsPagePresenceSignalsMigrationModule then var3.userPresenceType else convertUserPresenceTypeToString(var3.userPresenceType),
		primaryCta = useCTAForRowModule(p1.ctaResult, p1.actionHandlers, p1.entity.id, useJoinUserInExperience(p1.entity.id, { presence = var3 }))
	})
end)