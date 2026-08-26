local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
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
local _ = require(trustedContacts.Common.Types)

local function TrustedFriendsVPCPrologue(p1)
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), contexts (ref), fStringConnectionGraphCoreAmpNameSpace (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var1 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		ask = "Feature.Friends.Label.Ask",
		askYourParent = "Feature.Friends.Label.AskYourParent",
		vpcRequired = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.AddFriendVPC" else "Feature.Friends.Label.AddConnectionVPC"
	})
	local fireAnalyticsEvent = useTCAnalytics({ friendId = p1.userId }).fireAnalyticsEvent
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.externalNavigation.closeModal()
	end, { p1.externalNavigation })
	local var3 = reactModule.useCallback(function(_, _)
		-- upvalues: fFlagTCUpdateProfileCTAButton (copy), p1 (ref)
		if fFlagTCUpdateProfileCTAButton and p1.completionCallback then
			p1.completionCallback()
		end
	end, {
		if fFlagTCUpdateProfileCTAButton then p1.completionCallback else nil
	})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Small }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.askYourParent }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Text = reactModule.createElement(dialog.Text, { Text = var1.vpcRequired })
		}),
		Buttons = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.ask,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var2 (ref), p1 (ref), var3 (ref), contexts (copy), fStringConnectionGraphCoreAmpNameSpace (copy)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCAskClicked)
						var2()
						p1.externalNavigation.openAmpWizard({
							featureName = "TriggerTrustedFriendVPCRecourse",
							completionCallback = var3,
							recourseData = { targetUserId = p1.userId },
							entryPointEventCtx = contexts.TrustedFriendsVPCPrologue,
							extraParameters = {
								{ name = "targetUser", type = "UserId", value = p1.userId }
							},
							nameSpace = fStringConnectionGraphCoreAmpNameSpace
						})
					end, {
						fireAnalyticsEvent,
						var2,
						p1.externalNavigation,
						p1.userId,
						var3
					})
				},
				{
					text = var1.cancel,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function()
						-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var2 (ref)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCCancelClicked)
						var2()
					end, { var2, fireAnalyticsEvent })
				}
			}
		})
	})
end

return {
	Screen = function(p2)
		-- upvalues: reactModule (ref), TrustedFriendsVPCPrologue (ref)
		return reactModule.createElement(TrustedFriendsVPCPrologue, {
			userId = p2.navigation.getParam("userId"),
			completionCallback = p2.navigation.getParam("completionCallback"),
			externalNavigation = p2.screenProps.externalNavigation
		})
	end
}