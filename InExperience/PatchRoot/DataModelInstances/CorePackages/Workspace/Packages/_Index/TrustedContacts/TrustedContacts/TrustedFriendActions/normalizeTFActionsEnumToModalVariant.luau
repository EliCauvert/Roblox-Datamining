local trustedConnectionStatus = require(script:FindFirstAncestor("TrustedContacts").Enums).TrustedConnectionStatus
local TFActionsEnumModule = require(script.Parent.TFActionsEnum)
local t = {
	[TFActionsEnumModule.RemoveTrustedConnection] = trustedConnectionStatus.TrustedFriends,
	[TFActionsEnumModule.AddTrustedConnectionViaLink] = trustedConnectionStatus.Friends,
	[TFActionsEnumModule.AddTrustedFriendDoubleOptin] = trustedConnectionStatus.Friends,
	[TFActionsEnumModule.AddTrustedFriendWithVpc] = trustedConnectionStatus.Friends,
	[TFActionsEnumModule.PendingTrustedConnection] = trustedConnectionStatus.Friends,
	[TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient] = trustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient] = trustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriendViaLink] = trustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriend] = trustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriendInvalid] = trustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.PendingIncomingTrustedConnection] = trustedConnectionStatus.RequestReceived
}

return function(p0) --[[ line: 24 | named "normalizeTFActionsEnumToModalVariant" ]]
	-- upvalues: t (ref)
	return t[p0]
end