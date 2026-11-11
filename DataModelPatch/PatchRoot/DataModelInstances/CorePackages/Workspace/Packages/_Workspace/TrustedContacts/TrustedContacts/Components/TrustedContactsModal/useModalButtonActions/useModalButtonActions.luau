local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TFActionsEnumModule = require(TrustedContacts.TrustedFriendActions.TFActionsEnum)
local UseGetTFActionsCallbacksModule = require(script.Parent.useGetTFActionsCallbacks)
local UseGetTFActionsEnumLegacyModule = require(script.Parent.useGetTFActionsEnum_legacy)
local FFlagTrustedFriendsLinkVPCModule = require(TrustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local FFlagTFWithActionsCheck = require(Parent.SharedFlags).FFlagTFWithActionsCheck

return function(p1, _, ModalVariant, p2)
	-- upvalues: FFlagTFWithActionsCheck (copy), UseGetTFActionsEnumLegacyModule (copy), UseGetTFActionsCallbacksModule (copy), UseLocalizationFunction (copy), ReactModule (copy), TFActionsEnumModule (copy), FoundationModule (copy), FFlagTrustedFriendsLinkVPCModule (copy)
	local ModalVariant1 = if FFlagTFWithActionsCheck then ModalVariant else UseGetTFActionsEnumLegacyModule(p1, {
		modalVariant = ModalVariant,
		tokens = p2.tokens,
		isShareLinkSender = p2.isShareLinkSender
	})
	local UseGetTFActionsCallbacksModuleResult = UseGetTFActionsCallbacksModule(p1, p2)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = "CommonUI.Controls.Action.Cancel",
		add = "Feature.Friends.Action.Add",
		addViaLink = "Feature.Friends.Button.AddViaLink",
		ok = "CommonUI.Controls.Action.OK",
		accept = "CommonUI.Controls.Action.Accept"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), UseGetTFActionsCallbacksModuleResult (copy), TFActionsEnumModule (upval), FFlagTFWithActionsCheck (upval), FoundationModule (upval), FFlagTrustedFriendsLinkVPCModule (upval)
		local config = {
			icon = nil,
			isLoading = false,
			text = UseLocalizationResult.cancel,
			onActivated = UseGetTFActionsCallbacksModuleResult.onCancelButtonPress
		}
		
		return {
			[TFActionsEnumModule.Loading] = if FFlagTFWithActionsCheck then nil else {
				{
					isLoading = true,
					onActivated = function() end
				},
				config
			},
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
					onActivated = function() end
				},
				config
			},
			[TFActionsEnumModule.PendingTrustedConnection] = {
				{
					isDisabled = true,
					text = UseLocalizationResult.add,
					onActivated = function() end
				},
				config
			},
			[TFActionsEnumModule.PendingIncomingTrustedConnection] = {
				{
					isDisabled = true,
					text = UseLocalizationResult.accept,
					onActivated = function() end
				},
				config
			}
		}
	end, {
		ModalVariant1,
		UseLocalizationResult,
		UseGetTFActionsCallbacksModuleResult
	})
	
	return if ModalVariant1 then UseMemoResult[ModalVariant1] else nil
end