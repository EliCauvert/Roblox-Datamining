local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TFActionsEnumModule = require(TrustedContacts.TrustedFriendActions.TFActionsEnum)
local UseGetTFActionsCallbacksModule = require(script.Parent.useGetTFActionsCallbacks)
local FFlagTrustedFriendsLinkVPCModule = require(TrustedContacts.Flags.FFlagTrustedFriendsLinkVPC)

return function(p1, _, p2, p3) --[[ Line: 25 | Named "useModalButtonActions" ]]
	-- upvalues: UseGetTFActionsCallbacksModule (copy), UseLocalizationFunction (copy), ReactModule (copy), TFActionsEnumModule (copy), FoundationModule (copy), FFlagTrustedFriendsLinkVPCModule (copy)
	local UseGetTFActionsCallbacksModuleResult = UseGetTFActionsCallbacksModule(p1, p3)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = "CommonUI.Controls.Action.Cancel",
		add = "Feature.Friends.Action.Add",
		addViaLink = "Feature.Friends.Button.AddViaLink",
		ok = "CommonUI.Controls.Action.OK",
		accept = "CommonUI.Controls.Action.Accept"
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: UseLocalizationResult (copy), UseGetTFActionsCallbacksModuleResult (copy), TFActionsEnumModule (upval), FoundationModule (upval), FFlagTrustedFriendsLinkVPCModule (upval)
		local config = {
			icon = nil,
			isLoading = false,
			text = UseLocalizationResult.cancel,
			onActivated = UseGetTFActionsCallbacksModuleResult.onCancelButtonPress
		}
		
		return {
			[TFActionsEnumModule.RemoveTrustedConnection] = {
				{
					text = UseLocalizationResult.ok,
					onActivated = UseGetTFActionsCallbacksModuleResult.onOkButtonPress
				}
			},
			[TFActionsEnumModule.AddTrustedConnectionViaLink] = {
				{
					text = UseLocalizationResult.addViaLink,
					onActivated = UseGetTFActionsCallbacksModuleResult.onAddViaLinkButtonPress
				},
				config
			},
			[TFActionsEnumModule.AddTrustedFriendDoubleOptin] = {
				{
					text = UseLocalizationResult.add,
					onActivated = UseGetTFActionsCallbacksModuleResult.onSendTrustedConnectionRequest
				},
				config
			},
			[TFActionsEnumModule.AddTrustedFriendWithVpc] = {
				{
					text = UseLocalizationResult.add,
					icon = FoundationModule.Enums.IconName.LockClosed,
					onActivated = UseGetTFActionsCallbacksModuleResult.onOpenVPCProloguePress
				},
				config
			},
			[TFActionsEnumModule.AcceptTrustedFriendWithVpcRecipient] = {
				{
					text = UseLocalizationResult.accept,
					icon = FoundationModule.Enums.IconName.LockClosed,
					onActivated = UseGetTFActionsCallbacksModuleResult.onOpenVPCProloguePress
				},
				config
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLink] = {
				{
					text = UseLocalizationResult.accept,
					onActivated = UseGetTFActionsCallbacksModuleResult.onAddTrustedFriendFromLink
				},
				config
			},
			[TFActionsEnumModule.AcceptTrustedFriend] = {
				{
					text = UseLocalizationResult.accept,
					onActivated = UseGetTFActionsCallbacksModuleResult.onAcceptRequestReceived
				},
				config
			},
			[TFActionsEnumModule.AcceptTrustedFriendViaLinkWithVpcRecipient] = if FFlagTrustedFriendsLinkVPCModule then {
				{
					text = UseLocalizationResult.accept,
					icon = FoundationModule.Enums.IconName.LockClosed,
					onActivated = UseGetTFActionsCallbacksModuleResult.onAddTrustedFriendFromLinkWithVPC
				},
				config
			} else nil,
			[TFActionsEnumModule.AcceptTrustedFriendInvalid] = {
				{
					isDisabled = true,
					text = UseLocalizationResult.accept,
					onActivated = function() --[[ Line: 104 ]] end
				},
				config
			},
			[TFActionsEnumModule.PendingTrustedConnection] = {
				{
					isDisabled = true,
					text = UseLocalizationResult.add,
					onActivated = function() --[[ Line: 112 ]] end
				},
				config
			},
			[TFActionsEnumModule.PendingIncomingTrustedConnection] = {
				{
					isDisabled = true,
					text = UseLocalizationResult.accept,
					onActivated = function() --[[ Line: 120 ]] end
				},
				config
			}
		}
	end, {
		p2,
		UseLocalizationResult,
		UseGetTFActionsCallbacksModuleResult
	})
	
	return if p2 then UseMemoResult[p2] else nil
end