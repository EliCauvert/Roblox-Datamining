local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local UseCTAForRowModule = require(SocialTabsPage.Hooks.useCTAForRow)
local _ = require(SocialTabsPage.Common.Types)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local config = {
	lastLocation = "",
	userPresenceType = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType.Offline
}

return require(Parent.React).memo(function(p1) --[[ Line: 30 | Named "RowDataProvider" ]]
	-- upvalues: UseGetPresenceByUserIdFunction (copy), config (copy), UseJoinUserInExperienceFunction (copy), UseCTAForRowModule (copy)
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(p1.entity.id) or config
	
	return p1.createRow({
		presence = UseGetPresenceByUserIdResult.userPresenceType,
		primaryCta = UseCTAForRowModule(p1.ctaResult, p1.actionHandlers, p1.entity.id, (UseJoinUserInExperienceFunction(p1.entity.id, { presence = UseGetPresenceByUserIdResult })))
	})
end)