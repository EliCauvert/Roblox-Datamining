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

local function TrustedFriendsVPCPrologue(p0) --[[ line: 33 ]]
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), contexts (ref), fStringConnectionGraphCoreAmpNameSpace (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var5 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		ask = "Feature.Friends.Label.Ask",
		askYourParent = "Feature.Friends.Label.AskYourParent",
		vpcRequired = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.AddFriendVPC" else "Feature.Friends.Label.AddConnectionVPC"
	})
	local fireAnalyticsEvent = useTCAnalytics({ friendId = p0.userId }).fireAnalyticsEvent
	local var6 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: p0 (ref)
		p0.externalNavigation.closeModal()
	end, { p0.externalNavigation })
	local var7 = reactModule.useCallback(function(_, _) --[[ line: 56 ]]
		-- upvalues: fFlagTCUpdateProfileCTAButton (copy), p0 (ref)
		if fFlagTCUpdateProfileCTAButton and p0.completionCallback then
			p0.completionCallback()
		end
	end, {
		if fFlagTCUpdateProfileCTAButton then p0.completionCallback else nil
	})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Small }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var5.askYourParent }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Text = reactModule.createElement(dialog.Text, { Text = var5.vpcRequired })
		}),
		Buttons = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var5.ask,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 65 ]]
						-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var6 (ref), p0 (ref), var7 (ref), contexts (copy), fStringConnectionGraphCoreAmpNameSpace (copy)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCAskClicked)
						var6()
						p0.externalNavigation.openAmpWizard({
							featureName = "TriggerTrustedFriendVPCRecourse",
							completionCallback = var7,
							recourseData = { targetUserId = p0.userId },
							entryPointEventCtx = contexts.TrustedFriendsVPCPrologue,
							extraParameters = {
								{ name = "targetUser", type = "UserId", value = p0.userId }
							},
							nameSpace = fStringConnectionGraphCoreAmpNameSpace
						})
					end, {
						fireAnalyticsEvent,
						var6,
						p0.externalNavigation,
						p0.userId,
						var7
					})
				},
				{
					text = var5.cancel,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function() --[[ line: 51 ]]
						-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var6 (ref)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCCancelClicked)
						var6()
					end, { var6, fireAnalyticsEvent })
				}
			}
		})
	})
end

return {
	Screen = function(p1) --[[ line: 115 ]]
		-- upvalues: reactModule (ref), TrustedFriendsVPCPrologue (ref)
		return reactModule.createElement(TrustedFriendsVPCPrologue, {
			userId = p1.navigation.getParam("userId"),
			completionCallback = p1.navigation.getParam("completionCallback"),
			externalNavigation = p1.screenProps.externalNavigation
		})
	end
}