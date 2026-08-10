local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local ampUpsellModule = require(parent.AmpUpsell)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local analyticsModule = require(script.Parent.Parent.Parent.Analytics)
local useTCAnalytics = analyticsModule.useTCAnalytics
local eventNames = analyticsModule.EventNames
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local fStringConnectionGraphCoreAmpNameSpace = require(parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local fFlagTCUpdateProfileCTAButton = require(parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagEnableTrustedFriendsInlineVPCPrologueModule = require(trustedContacts.Flags.FFlagEnableTrustedFriendsInlineVPCPrologue)
local _ = require(trustedContacts.Common.Types)

local function TrustedFriendsVPCPrologue(p0) --[[ line: 36 ]]
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), contexts (ref), fStringConnectionGraphCoreAmpNameSpace (ref), fFlagEnableTrustedFriendsInlineVPCPrologueModule (ref), ampUpsellModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var7 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		ask = "Feature.Friends.Label.Ask",
		askYourParent = "Feature.Friends.Label.AskYourParent",
		vpcRequired = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.AddFriendVPC" else "Feature.Friends.Label.AddConnectionVPC"
	})
	local fireAnalyticsEvent = useTCAnalytics({ friendId = p0.userId }).fireAnalyticsEvent
	local var8 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref)
		p0.externalNavigation.closeModal()
	end, { p0.externalNavigation })
	local var9 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var8 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCCancelClicked)
		var8()
	end, { var8, fireAnalyticsEvent })
	local var10 = reactModule.useCallback(function(_, _) --[[ line: 59 ]]
		-- upvalues: fFlagTCUpdateProfileCTAButton (copy), p0 (ref)
		if fFlagTCUpdateProfileCTAButton and p0.completionCallback then
			p0.completionCallback()
		end
	end, {
		if fFlagTCUpdateProfileCTAButton then p0.completionCallback else nil
	})
	local var11 = reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var8 (ref), p0 (ref), var10 (ref), contexts (copy), fStringConnectionGraphCoreAmpNameSpace (copy)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCAskClicked)
		var8()
		p0.externalNavigation.openAmpWizard({
			featureName = "TriggerTrustedFriendVPCRecourse",
			completionCallback = var10,
			recourseData = { targetUserId = p0.userId },
			entryPointEventCtx = contexts.TrustedFriendsVPCPrologue,
			extraParameters = {
				{ name = "targetUser", type = "UserId", value = p0.userId }
			},
			nameSpace = fStringConnectionGraphCoreAmpNameSpace
		})
	end, {
		fireAnalyticsEvent,
		var8,
		p0.externalNavigation,
		p0.userId,
		var10
	})
	
	return if fFlagEnableTrustedFriendsInlineVPCPrologueModule and ampUpsellModule.GetFFlagEnableAmpVPCPrologue() and ampUpsellModule.GetFFlagEnableReusableVPCPrologue() then reactModule.createElement(ampUpsellModule.VPCPrologue, {
		onConfirm = var11,
		onCancel = var9,
		config = {
			titleText = var7.askYourParent,
			bodyText = var7.vpcRequired,
			confirmText = var7.ask,
			cancelText = var7.cancel
		}
	}) else reactModule.createElement(dialog.Root, { size = dialogSize.Small }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var7.askYourParent }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Text = reactModule.createElement(dialog.Text, { Text = var7.vpcRequired })
		}),
		Buttons = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var7.ask,
					variant = buttonVariant.Emphasis,
					onActivated = var11
				},
				{
					text = var7.cancel,
					variant = buttonVariant.Standard,
					onActivated = var9
				}
			}
		})
	})
end

return {
	Screen = function(p1) --[[ line: 135 ]]
		-- upvalues: reactModule (ref), TrustedFriendsVPCPrologue (ref)
		return reactModule.createElement(TrustedFriendsVPCPrologue, {
			userId = p1.navigation.getParam("userId"),
			completionCallback = p1.navigation.getParam("completionCallback"),
			externalNavigation = p1.screenProps.externalNavigation
		})
	end
}