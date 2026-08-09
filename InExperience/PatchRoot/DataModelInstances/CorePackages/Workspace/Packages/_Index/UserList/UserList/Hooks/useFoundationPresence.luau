local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local roduxPresenceModule = require(userList.Rodux.RoduxPresence)
local socialCommonModule = require(parent.SocialCommon)
local convertUserPresenceTypeToString = socialCommonModule.Utils.convertUserPresenceTypeToString
local convertToFoundationPresenceEnum = socialCommonModule.Utils.convertToFoundationPresenceEnum
local foundationModule = require(parent.Foundation)
local _ = require(userList.Common.Types)
local presenceType = roduxPresenceModule.Enums.PresenceType

return function(p0) --[[ line: 17 | named "useFoundationPresence" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), useSelector (ref), roduxPresenceModule (ref), presenceType (ref), convertUserPresenceTypeToString (ref), convertToFoundationPresenceEnum (ref)
	local var5, var6 = reactModule.useState(foundationModule.Enums.UserPresence.None)
	local var7 = useSelector(function(p1) --[[ line: 20 ]]
		-- upvalues: p0 (ref), roduxPresenceModule (copy)
		return if p0 and p0 ~= "" then roduxPresenceModule.Selectors.getUserPresenceByUserId(p1, p0) else nil
	end)
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: presenceType (copy), var7 (ref), convertUserPresenceTypeToString (copy), convertToFoundationPresenceEnum (copy), var6 (ref)
		var6(convertToFoundationPresenceEnum(convertUserPresenceTypeToString(if var7 then var7.userPresenceType else presenceType.Offline)))
	end, { var7 })
	
	return var5
end