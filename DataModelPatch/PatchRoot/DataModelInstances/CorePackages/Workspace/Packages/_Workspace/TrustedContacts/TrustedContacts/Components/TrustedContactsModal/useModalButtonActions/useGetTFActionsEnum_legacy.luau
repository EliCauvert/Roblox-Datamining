local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AmpEnums = require(Parent.AmpUpsell).AmpEnums
local TrustedConnectionStatus = require(TrustedContacts.Enums).TrustedConnectionStatus
local TFActionsEnumModule = require(TrustedContacts.TrustedFriendActions.TFActionsEnum)
local FFlagTrustedFriendsLinkVPCModule = require(TrustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local FStringConnectionGraphCoreAmpNameSpace = require(Parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace

return function(Value, p1)
	-- upvalues: ReactModule (copy), AmpApiProvider (copy), FStringConnectionGraphCoreAmpNameSpace (copy), AmpEnums (copy), TrustedConnectionStatus (copy), TFActionsEnumModule (copy), FFlagTrustedFriendsLinkVPCModule (copy)
	local ModalVariant = p1.modalVariant
	local Tokens = p1.tokens
	local IsShareLinkSender = p1.isShareLinkSender
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: Value (copy), AmpApiProvider (upval), FStringConnectionGraphCoreAmpNameSpace (upval), AmpEnums (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if AmpApiProvider.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, FStringConnectionGraphCoreAmpNameSpace, { { name = "targetUser", type = "UserId", value = Value } }).access == AmpEnums.AccessResponseEnum.Granted then
			UseStateResult2(true)
		end
		UseStateResult2_1(false)
	end, { Value })
	
	return (ReactModule.useMemo(function()
		-- upvalues: ModalVariant (copy), TrustedConnectionStatus (upval), TFActionsEnumModule (upval), UseStateResult1 (copy), FFlagTrustedFriendsLinkVPCModule (upval), UseStateResult (copy), Tokens (copy), IsShareLinkSender (copy)
		return if ModalVariant then if ModalVariant == TrustedConnectionStatus.TrustedFriends then TFActionsEnumModule.RemoveTrustedConnection elseif UseStateResult1 then TFActionsEnumModule.Loading elseif ModalVariant == TrustedConnectionStatus.RequestReceived then if FFlagTrustedFriendsLinkVPCModule and UseStateResult and Tokens and #Tokens > 0 then TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient elseif UseStateResult then TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient elseif Tokens and #Tokens > 0 then TFActionsEnumModule.AcceptTrustedFriendViaLink else TFActionsEnumModule.AcceptTrustedFriend elseif ModalVariant == TrustedConnectionStatus.Friends then if UseStateResult then TFActionsEnumModule.AddTrustedFriendWithVpc elseif IsShareLinkSender then TFActionsEnumModule.AddTrustedConnectionViaLink else TFActionsEnumModule.AddTrustedFriendDoubleOptin else nil else nil
	end, {
		ModalVariant,
		UseStateResult1,
		UseStateResult,
		Tokens,
		IsShareLinkSender
	}))
end