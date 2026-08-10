local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local convertUserPresenceTypeToString = require(parent.SocialCommon).Utils.convertUserPresenceTypeToString
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)
local presenceType = roduxPresenceModule.Enums.PresenceType

return if require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration) then nil else function(p0) --[[ line: 19 ]]
	-- upvalues: useSelector (ref), roduxPresenceModule (ref), presenceType (ref), convertUserPresenceTypeToString (ref)
	local var2 = useSelector(function(p1) --[[ line: 20 ]]
		-- upvalues: p0 (ref), roduxPresenceModule (copy)
		return if p0 and p0 ~= "" then roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p0) else nil
	end)
	
	return convertUserPresenceTypeToString(if var2 then var2.userPresenceType else presenceType.Offline)
end