local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConvertUserPresenceTypeToStringFunction = require(Parent.SocialCommon).Utils.convertUserPresenceTypeToString
local RoduxPresenceModule = require(SocialTabsPage.Rodux.RoduxPresence)
local PresenceType = RoduxPresenceModule.Enums.PresenceType

return function(p1)
	-- upvalues: UseSelectorFunction (copy), RoduxPresenceModule (copy), PresenceType (copy), ConvertUserPresenceTypeToStringFunction (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), RoduxPresenceModule (upval)
		return if p1 and p1 ~= "" then RoduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1) else nil
	end)
	
	return (ConvertUserPresenceTypeToStringFunction(if UseSelectorResult then UseSelectorResult.userPresenceType else PresenceType.Offline))
end