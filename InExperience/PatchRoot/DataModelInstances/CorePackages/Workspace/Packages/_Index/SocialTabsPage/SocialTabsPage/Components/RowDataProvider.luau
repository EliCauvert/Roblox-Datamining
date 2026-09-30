local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useJoinUserInExperience = require(parent.SocialExperienceJoin).useJoinUserInExperience
local dataHydrationModule = require(parent.DataHydration)
local useCTAForRowModule = require(socialTabsPage.Hooks.useCTAForRow)
local _ = require(socialTabsPage.Common.Types)
local useGetPresenceByUserId = require(parent.FriendsCommon).Hooks.useGetPresenceByUserId
local t = {
	lastLocation = "",
	userPresenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType.Offline
}

return reactModule.memo(function(p1)
	-- upvalues: useGetPresenceByUserId (ref), t (ref), useJoinUserInExperience (ref), useCTAForRowModule (ref)
	local _ = nil
	local id = useGetPresenceByUserId(p1.entity.id) or t
	
	return p1.createRow({
		presence = id.userPresenceType,
		primaryCta = useCTAForRowModule(p1.ctaResult, p1.actionHandlers, p1.entity.id, useJoinUserInExperience(p1.entity.id, { presence = id }))
	})
end)