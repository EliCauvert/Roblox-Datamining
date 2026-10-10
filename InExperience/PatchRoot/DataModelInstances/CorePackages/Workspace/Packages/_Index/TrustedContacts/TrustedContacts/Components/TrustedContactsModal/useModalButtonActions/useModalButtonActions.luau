local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local TFActionsEnumModule = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local useGetTFActionsCallbacksModule = require(script.Parent.useGetTFActionsCallbacks)
local fFlagTrustedFriendsLinkVPCModule = require(trustedContacts.Flags.FFlagTrustedFriendsLinkVPC)

return function(p1, _, p2, p3)
	-- upvalues: useGetTFActionsCallbacksModule (ref), useLocalization (ref), reactModule (ref), TFActionsEnumModule (ref), foundationModule (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local var1 = useGetTFActionsCallbacksModule(p1, p3)
	local var2 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		add = "Feature.Friends.Action.Add",
		addViaLink = "Feature.Friends.Button.AddViaLink",
		ok = "CommonUI.Controls.Action.OK",
		accept = "CommonUI.Controls.Action.Accept"
	})
	
	return if p2 then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var1 (ref), TFActionsEnumModule (copy), foundationModule (copy), fFlagTrustedFriendsLinkVPCModule (copy)
		local t = {
			icon = nil,
			isLoading = false,
			text = var2.cancel,
			onActivated = var1.onCancelButtonPress
		}
		
		return {
			[TFActionsEnumModule.RemoveTrustedConnection] = { { text = var2.ok, onActivated = var1.onOkButtonPress } },
			[TFActionsEnumModule.AddTrustedConnectionViaLink] = {
				{
					text = var2.addViaLink,
					onActivated = var1.onAddViaLinkButtonPress
				},
				t
			},
			[TFActionsEnumModule.AddTrustedFriendDoubleOptin] = {
				{
					text = var2.add,
					onActivated = var1.onSendTrustedConnectionRequest
				},
				t
			},
			[TFActionsEnumModule.AddTrustedFriendWithVpc] = {
				{
					text = var2.add,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var1.onOpenVPCProloguePress
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient] = {
				{
					text = var2.accept,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var1.onOpenVPCProloguePress
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLink] = {
				{
					text = var2.accept,
					onActivated = var1.onAddTrustedFriendFromLink
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriend] = {
				{
					text = var2.accept,
					onActivated = var1.onAcceptRequestReceived
				},
				t
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient] = if fFlagTrustedFriendsLinkVPCModule then {
				{
					text = var2.accept,
					icon = foundationModule.Enums.IconName.LockClosed,
					onActivated = var1.onAddTrustedFriendFromLinkWithVPC
				},
				t
			} else nil,
			[TFActionsEnumModule.AcceptTrustedFriendInvalid] = {
				{
					isDisabled = true,
					text = var2.accept,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.PendingTrustedConnection] = {
				{
					isDisabled = true,
					text = var2.add,
					onActivated = function() end
				},
				t
			},
			[TFActionsEnumModule.PendingIncomingTrustedConnection] = {
				{
					isDisabled = true,
					text = var2.accept,
					onActivated = function() end
				},
				t
			}
		}
	end, { p2, var2, var1 })[p2] else nil
end