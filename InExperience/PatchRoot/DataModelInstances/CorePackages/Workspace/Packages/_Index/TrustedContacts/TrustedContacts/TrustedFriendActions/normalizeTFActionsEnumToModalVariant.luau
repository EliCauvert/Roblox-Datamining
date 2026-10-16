local TrustedConnectionStatus = require(script:FindFirstAncestor("TrustedContacts").Enums).TrustedConnectionStatus
local TFActionsEnumModule = require(script.Parent.TFActionsEnum)
local config = {
	[TFActionsEnumModule.RemoveTrustedConnection] = TrustedConnectionStatus.TrustedFriends,
	[TFActionsEnumModule.AddTrustedConnectionViaLink] = TrustedConnectionStatus.Friends,
	[TFActionsEnumModule.AddTrustedFriendDoubleOptin] = TrustedConnectionStatus.Friends,
	[TFActionsEnumModule.AddTrustedFriendWithVpc] = TrustedConnectionStatus.Friends,
	[TFActionsEnumModule.PendingTrustedConnection] = TrustedConnectionStatus.Friends,
	[TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient] = TrustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient] = TrustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriendViaLink] = TrustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriend] = TrustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.AcceptTrustedFriendInvalid] = TrustedConnectionStatus.RequestReceived,
	[TFActionsEnumModule.PendingIncomingTrustedConnection] = TrustedConnectionStatus.RequestReceived
}

return function(p1) --[[ Line: 24 | Named "normalizeTFActionsEnumToModalVariant" ]]
	-- upvalues: config (copy)
	return config[p1]
end