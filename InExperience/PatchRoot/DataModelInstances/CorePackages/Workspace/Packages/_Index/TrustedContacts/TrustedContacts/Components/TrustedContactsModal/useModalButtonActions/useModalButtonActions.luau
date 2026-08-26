local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local TFActionsEnumModule = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local useGetTFActionsCallbacksModule = require(script.Parent.useGetTFActionsCallbacks)
local useGetTFActionsEnumLegacyModule = require(script.Parent.useGetTFActionsEnum_legacy)
local fFlagTrustedFriendsLinkVPCModule = require(trustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local fFlagTFWithActionsCheck = require(parent.SharedFlags).FFlagTFWithActionsCheck

return function(p1, _, p2, p3)
	-- upvalues: fFlagTFWithActionsCheck (ref), useGetTFActionsEnumLegacyModule (ref), useGetTFActionsCallbacksModule (ref), useLocalization (ref), reactModule (ref), TFActionsEnumModule (ref), foundationModule (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local var1 = if fFlagTFWithActionsCheck then p2 else useGetTFActionsEnumLegacyModule(p1, {
		modalVariant = p2,
		tokens = p3.tokens,
		isShareLinkSender = p3.isShareLinkSender
	})
	local var2 = useGetTFActionsCallbacksModule(p1, p3)
	local var3 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		add = "Feature.Friends.Action.Add",
		addViaLink = "Feature.Friends.Button.AddViaLink",
		ok = "CommonUI.Controls.Action.OK",
		accept = "CommonUI.Controls.Action.Accept"
	})
	
	return if var1 then reactModule.useMemo(function()
		-- upvalues: var3 (ref), var2 (ref), TFActionsEnumModule (copy), fFlagTFWithActionsCheck (copy), foundationModule (copy), fFlagTrustedFriendsLinkVPCModule (copy)
		local t = {
			icon = nil,
			isLoading = false,
			text = var3.cancel,
			onActivated = var2.onCancelButtonPress
		}
		
		return {
			[TFActionsEnumModule.Loading] = if fFlagTFWithActionsCheck then nil else {
				{
					isLoading = true,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.RemoveTrustedConnection] = { { text = var3.ok, onActivated = var2.onOkButtonPress } },
			[TFActionsEnumModule.AddTrustedConnectionViaLink] = {
				{
					text = var3.addViaLink,
					onActivated = var2.onAddViaLinkButtonPress
				},
				t
			},
			[TFActionsEnumModule.AddTrustedFriendDoubleOptin] = {
				{
					text = var3.add,
					onActivated = var2.onSendTrustedConnectionRequest
				},
				t
			},
			[TFActionsEnumModule.AddTrustedFriendWithVpc] = {
				{
					text = var3.add,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var2.onOpenVPCProloguePress
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient] = {
				{
					text = var3.accept,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var2.onOpenVPCProloguePress
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLink] = {
				{
					text = var3.accept,
					onActivated = var2.onAddTrustedFriendFromLink
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriend] = {
				{
					text = var3.accept,
					onActivated = var2.onAcceptRequestReceived
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient] = if fFlagTrustedFriendsLinkVPCModule then {
				{
					text = var3.accept,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var2.onAddTrustedFriendFromLinkWithVPC
				},
				t
			} else nil,
			[TFActionsEnumModule.AcceptTrustedFriendInvalid] = {
				{
					isDisabled = true,
					text = var3.accept,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.PendingTrustedConnection] = {
				{
					isDisabled = true,
					text = var3.add,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.PendingIncomingTrustedConnection] = {
				{
					isDisabled = true,
					text = var3.accept,
					onActivated = function() end
				},
				t
			}
		}
	end, { var1, var3, var2 })[var1] else nil
end