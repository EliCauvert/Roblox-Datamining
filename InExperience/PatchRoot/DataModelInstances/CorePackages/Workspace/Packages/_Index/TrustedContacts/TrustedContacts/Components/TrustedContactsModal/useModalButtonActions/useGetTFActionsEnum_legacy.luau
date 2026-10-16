local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local ampEnums = require(parent.AmpUpsell).AmpEnums
local trustedConnectionStatus = require(trustedContacts.Enums).TrustedConnectionStatus
local TFActionsEnumModule = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local fFlagTrustedFriendsLinkVPCModule = require(trustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local fStringConnectionGraphCoreAmpNameSpace = require(parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace

return function(p1, p2)
	-- upvalues: reactModule (ref), ampApiProvider (ref), fStringConnectionGraphCoreAmpNameSpace (ref), ampEnums (ref), trustedConnectionStatus (ref), TFActionsEnumModule (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local modalVariant = p2.modalVariant
	local tokens = p2.tokens
	local isShareLinkSender = p2.isShareLinkSender
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), ampApiProvider (copy), fStringConnectionGraphCoreAmpNameSpace (copy), ampEnums (copy), var2 (ref), var4 (ref)
		if ampApiProvider.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, fStringConnectionGraphCoreAmpNameSpace, { { name = "targetUser", type = "UserId", value = p1 } }).access == ampEnums.AccessResponseEnum.Granted then
			var2(true)
		end
		var4(false)
	end, { p1 })
	
	return reactModule.useMemo(function()
		-- upvalues: modalVariant (ref), trustedConnectionStatus (copy), TFActionsEnumModule (copy), var3 (ref), fFlagTrustedFriendsLinkVPCModule (copy), var1 (ref), tokens (ref), isShareLinkSender (ref)
		return if modalVariant then if modalVariant == trustedConnectionStatus.TrustedFriends then TFActionsEnumModule.RemoveTrustedConnection elseif var3 then TFActionsEnumModule.Loading elseif modalVariant == trustedConnectionStatus.RequestReceived then if fFlagTrustedFriendsLinkVPCModule and var1 and (tokens and #tokens > 0) then TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient elseif var1 then TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient elseif tokens and #tokens > 0 then TFActionsEnumModule.AcceptTrustedFriendViaLink else TFActionsEnumModule.AcceptTrustedFriend elseif modalVariant == trustedConnectionStatus.Friends then if var1 then TFActionsEnumModule.AddTrustedFriendWithVpc elseif isShareLinkSender then TFActionsEnumModule.AddTrustedConnectionViaLink else TFActionsEnumModule.AddTrustedFriendDoubleOptin else nil else nil
	end, {
		modalVariant,
		var3,
		var1,
		tokens,
		isShareLinkSender
	})
end