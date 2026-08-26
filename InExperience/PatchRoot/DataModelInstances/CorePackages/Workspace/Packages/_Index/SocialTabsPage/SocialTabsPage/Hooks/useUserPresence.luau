local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local convertUserPresenceTypeToString = require(parent.SocialCommon).Utils.convertUserPresenceTypeToString
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType

return if require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration) then nil else function(p1)
	-- upvalues: useSelector (ref), roduxPresenceModule (ref), presenceType (ref), convertUserPresenceTypeToString (ref)
	local var1 = useSelector(function(p2)
		-- upvalues: p1 (ref), roduxPresenceModule (copy)
		return if p1 and p1 ~= "" then roduxPresenceModule.Selectors.getUserPresenceByUserId(p2, p1) else nil
	end)
	
	return convertUserPresenceTypeToString(if var1 then var1.userPresenceType else presenceType.Offline)
end