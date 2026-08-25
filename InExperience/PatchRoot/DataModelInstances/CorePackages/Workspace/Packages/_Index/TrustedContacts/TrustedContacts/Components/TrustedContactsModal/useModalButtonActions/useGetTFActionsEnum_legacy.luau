local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local ampEnums = require(parent.AmpUpsell).AmpEnums
local trustedConnectionStatus = require(trustedContacts.Enums).TrustedConnectionStatus
local TFActionsEnumModule = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local fFlagTrustedFriendsLinkVPCModule = require(trustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local fStringConnectionGraphCoreAmpNameSpace = require(parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace

return function(p0, p1)
	-- upvalues: reactModule (ref), ampApiProvider (ref), fStringConnectionGraphCoreAmpNameSpace (ref), ampEnums (ref), trustedConnectionStatus (ref), TFActionsEnumModule (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local modalVariant = p1.modalVariant
	local tokens = p1.tokens
	local isShareLinkSender = p1.isShareLinkSender
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), ampApiProvider (copy), fStringConnectionGraphCoreAmpNameSpace (copy), ampEnums (copy), var5 (ref), var7 (ref)
		if ampApiProvider.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, fStringConnectionGraphCoreAmpNameSpace, { { name = "targetUser", type = "UserId", value = p0 } }).access == ampEnums.AccessResponseEnum.Granted then
			var5(true)
		end
		var7(false)
	end, { p0 })
	
	return reactModule.useMemo(function()
		-- upvalues: modalVariant (ref), trustedConnectionStatus (copy), TFActionsEnumModule (copy), var6 (ref), fFlagTrustedFriendsLinkVPCModule (copy), var4 (ref), tokens (ref), isShareLinkSender (ref)
		return if modalVariant then if modalVariant == trustedConnectionStatus.TrustedFriends then TFActionsEnumModule.RemoveTrustedConnection elseif var6 then TFActionsEnumModule.Loading elseif modalVariant == trustedConnectionStatus.RequestReceived then if fFlagTrustedFriendsLinkVPCModule and var4 and (tokens and #tokens > 0) then TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient elseif var4 then TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient elseif tokens and #tokens > 0 then TFActionsEnumModule.AcceptTrustedFriendViaLink else TFActionsEnumModule.AcceptTrustedFriend elseif modalVariant == trustedConnectionStatus.Friends then if var4 then TFActionsEnumModule.AddTrustedFriendWithVpc elseif isShareLinkSender then TFActionsEnumModule.AddTrustedConnectionViaLink else TFActionsEnumModule.AddTrustedFriendDoubleOptin else nil else nil
	end, {
		modalVariant,
		var6,
		var4,
		tokens,
		isShareLinkSender
	})
end