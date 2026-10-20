local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local AnalyticsModule = require(script.Parent.Parent.Parent.Analytics)
local UseTCAnalyticsFunction = AnalyticsModule.useTCAnalytics
local EventNames = AnalyticsModule.EventNames
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local FStringConnectionGraphCoreAmpNameSpace = require(Parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local FFlagTCUpdateProfileCTAButton = require(Parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local _ = require(TrustedContacts.Common.Types)

local function TrustedFriendsVPCPrologue(p1)
	-- upvalues: UseLocalizationFunction (copy), UseTCAnalyticsFunction (copy), ReactModule (copy), EventNames (copy), FFlagTCUpdateProfileCTAButton (copy), Contexts (copy), FStringConnectionGraphCoreAmpNameSpace (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = "CommonUI.Controls.Action.Cancel",
		ask = "Feature.Friends.Label.Ask",
		askYourParent = "Feature.Friends.Label.AskYourParent",
		vpcRequired = "Feature.Friends.Label.AddFriendVPC"
	})
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction({ friendId = p1.userId }).fireAnalyticsEvent
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.externalNavigation.closeModal()
	end, { p1.externalNavigation })
	local UseResult1 = ReactModule.useCallback(function(_, _)
		-- upvalues: FFlagTCUpdateProfileCTAButton (upval), p1 (copy)
		if FFlagTCUpdateProfileCTAButton and p1.completionCallback then
			p1.completionCallback()
		end
	end, {
		if FFlagTCUpdateProfileCTAButton then p1.completionCallback else nil
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Small }, {
		Title = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult.askYourParent
		}),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Text = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.vpcRequired })
		}),
		Buttons = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.ask,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseResult (copy), p1 (copy), UseResult1 (copy), Contexts (upval), FStringConnectionGraphCoreAmpNameSpace (upval)
						FireAnalyticsEventFunction(EventNames.TrustedFriendsVPCAskClicked)
						UseResult()
						p1.externalNavigation.openAmpWizard({
							featureName = "TriggerTrustedFriendVPCRecourse",
							completionCallback = UseResult1,
							recourseData = { targetUserId = p1.userId },
							entryPointEventCtx = Contexts.TrustedFriendsVPCPrologue,
							extraParameters = {
								{ name = "targetUser", type = "UserId", value = p1.userId }
							},
							nameSpace = FStringConnectionGraphCoreAmpNameSpace
						})
					end, {
						FireAnalyticsEventFunction,
						UseResult,
						p1.externalNavigation,
						p1.userId,
						UseResult1
					})
				},
				{
					text = UseLocalizationResult.cancel,
					variant = ButtonVariant.Standard,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseResult (copy)
						FireAnalyticsEventFunction(EventNames.TrustedFriendsVPCCancelClicked)
						UseResult()
					end, { UseResult, FireAnalyticsEventFunction })
				}
			}
		})
	})
end

return {
	Screen = function(p2)
		-- upvalues: ReactModule (copy), TrustedFriendsVPCPrologue (copy)
		return ReactModule.createElement(TrustedFriendsVPCPrologue, {
			userId = p2.navigation.getParam("userId"),
			completionCallback = p2.navigation.getParam("completionCallback"),
			externalNavigation = p2.screenProps.externalNavigation
		})
	end
}