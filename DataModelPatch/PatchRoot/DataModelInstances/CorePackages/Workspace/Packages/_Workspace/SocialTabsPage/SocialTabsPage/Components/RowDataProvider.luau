local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConvertUserPresenceTypeToStringFunction = require(Parent.SocialCommon).Utils.convertUserPresenceTypeToString
local _ = require(Parent.DataHydration)
local UseCTAForRowModule = require(SocialTabsPage.Hooks.useCTAForRow)
local RoduxPresenceModule = require(SocialTabsPage.Rodux.RoduxPresence)
local _ = require(SocialTabsPage.Common.Types)
local config = {
	lastLocation = "",
	userPresenceType = RoduxPresenceModule.Enums.PresenceType.Offline
}

return require(Parent.React).memo(function(p1)
	-- upvalues: UseSelectorFunction (copy), RoduxPresenceModule (copy), config (copy), ConvertUserPresenceTypeToStringFunction (copy), UseJoinUserInExperienceFunction (copy), UseCTAForRowModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: RoduxPresenceModule (upval), p1 (copy), config (upval)
		return RoduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1.entity.id) or config
	end)
	
	return p1.createRow({
		presence = ConvertUserPresenceTypeToStringFunction(UseSelectorResult.userPresenceType),
		primaryCta = UseCTAForRowModule(p1.ctaResult, p1.actionHandlers, p1.entity.id, (UseJoinUserInExperienceFunction(p1.entity.id, { presence = UseSelectorResult })))
	})
end)