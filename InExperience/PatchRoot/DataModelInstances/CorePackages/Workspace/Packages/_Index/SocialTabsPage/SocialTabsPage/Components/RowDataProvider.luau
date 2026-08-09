local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useJoinUserInExperience = require(parent.SocialExperienceJoin).useJoinUserInExperience
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local convertUserPresenceTypeToString = require(parent.SocialCommon).Utils.convertUserPresenceTypeToString
local _ = require(parent.DataHydration)
local useCTAForRowModule = require(socialTabsPage.Hooks.useCTAForRow)
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)
local _ = require(socialTabsPage.Common.Types)
local t = {
	lastLocation = "",
	userPresenceType = roduxPresenceModule.Enums.PresenceType.Offline
}

return reactModule.memo(function(p0) --[[ line: 35 | named "RowDataProvider" ]]
	-- upvalues: useSelector (ref), roduxPresenceModule (ref), t (ref), convertUserPresenceTypeToString (ref), useJoinUserInExperience (ref), useCTAForRowModule (ref)
	local var5 = useSelector(function(p1) --[[ line: 36 ]]
		-- upvalues: roduxPresenceModule (copy), p0 (ref), t (copy)
		return roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p0.entity.id) or t
	end)
	
	return p0.createRow({
		presence = convertUserPresenceTypeToString(var5.userPresenceType),
		primaryCta = useCTAForRowModule(p0.ctaResult, p0.actionHandlers, p0.entity.id, useJoinUserInExperience(p0.entity.id, { presence = var5 }))
	})
end)