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

return function(p0, _, p1, p2)
	-- upvalues: fFlagTFWithActionsCheck (ref), useGetTFActionsEnumLegacyModule (ref), useGetTFActionsCallbacksModule (ref), useLocalization (ref), reactModule (ref), TFActionsEnumModule (ref), foundationModule (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local var7 = if fFlagTFWithActionsCheck then p1 else useGetTFActionsEnumLegacyModule(p0, {
		modalVariant = p1,
		tokens = p2.tokens,
		isShareLinkSender = p2.isShareLinkSender
	})
	local var8 = useGetTFActionsCallbacksModule(p0, p2)
	local var9 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		add = "Feature.Friends.Action.Add",
		addViaLink = "Feature.Friends.Button.AddViaLink",
		ok = "CommonUI.Controls.Action.OK",
		accept = "CommonUI.Controls.Action.Accept"
	})
	
	return if var7 then reactModule.useMemo(function()
		-- upvalues: var9 (ref), var8 (ref), TFActionsEnumModule (copy), fFlagTFWithActionsCheck (copy), foundationModule (copy), fFlagTrustedFriendsLinkVPCModule (copy)
		local t = {
			icon = nil,
			isLoading = false,
			text = var9.cancel,
			onActivated = var8.onCancelButtonPress
		}
		
		return {
			[TFActionsEnumModule.Loading] = if fFlagTFWithActionsCheck then nil else {
				{
					isLoading = true,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.RemoveTrustedConnection] = { { text = var9.ok, onActivated = var8.onOkButtonPress } },
			[TFActionsEnumModule.AddTrustedConnectionViaLink] = {
				{
					text = var9.addViaLink,
					onActivated = var8.onAddViaLinkButtonPress
				},
				t
			},
			[TFActionsEnumModule.AddTrustedFriendDoubleOptin] = {
				{
					text = var9.add,
					onActivated = var8.onSendTrustedConnectionRequest
				},
				t
			},
			[TFActionsEnumModule.AddTrustedFriendWithVpc] = {
				{
					text = var9.add,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var8.onOpenVPCProloguePress
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient] = {
				{
					text = var9.accept,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var8.onOpenVPCProloguePress
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLink] = {
				{
					text = var9.accept,
					onActivated = var8.onAddTrustedFriendFromLink
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriend] = {
				{
					text = var9.accept,
					onActivated = var8.onAcceptRequestReceived
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient] = if fFlagTrustedFriendsLinkVPCModule then {
				{
					text = var9.accept,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var8.onAddTrustedFriendFromLinkWithVPC
				},
				t
			} else nil,
			[TFActionsEnumModule.AcceptTrustedFriendInvalid] = {
				{
					isDisabled = true,
					text = var9.accept,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.PendingTrustedConnection] = {
				{
					isDisabled = true,
					text = var9.add,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.PendingIncomingTrustedConnection] = {
				{
					isDisabled = true,
					text = var9.accept,
					onActivated = function() end
				},
				t
			}
		}
	end, { var7, var9, var8 })[var7] else nil
end