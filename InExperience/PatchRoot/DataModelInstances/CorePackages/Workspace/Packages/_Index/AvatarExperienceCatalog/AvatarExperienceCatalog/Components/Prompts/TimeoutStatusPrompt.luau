local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useSignalState = require(parent.SignalsReact).useSignalState
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local constantsModule = require(avatarExperienceCatalog.Constants)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local AXPartialPageModal = avatarExperienceCommonModule.Components.AXPartialPageModal
local getTimeoutStatusStore = avatarExperienceCommonModule.Stores.getTimeoutStatusStore
local formatTimeoutEndTime = avatarExperienceCommonModule.Utils.formatTimeoutEndTime
local labelAbuseTypeMapping = avatarExperienceCommonModule.Constants.LabelAbuseTypeMapping
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function()
	-- upvalues: useNavigation (ref), getTimeoutStatusStore (ref), useSignalState (ref), reactModule (ref), sendAXCounterV2 (ref), constantsModule (ref), roactNavigationModule (ref), labelAbuseTypeMapping (ref), useLocalization (ref), formatTimeoutEndTime (ref), AXPartialPageModal (ref), buttonVariant (ref), inputSize (ref), view (ref), text (ref)
	local var1 = useNavigation()
	local var2 = useSignalState(getTimeoutStatusStore().getTimeoutDetails)
	reactModule.useEffect(function()
		-- upvalues: sendAXCounterV2 (copy), constantsModule (copy), var2 (ref)
		sendAXCounterV2(constantsModule.COUNTERS.TimeoutStatusPromptShown, {
			labelTranslationKey = if var2 then var2.labelTranslationKey else ""
		})
	end, {})
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), roactNavigationModule (copy)
		var1.dispatch(roactNavigationModule.Actions.back(nil))
	end, { var1 })
	local _ = nil
	local var4 = useLocalization({
		titleText = "Feature.Timeout.Prompt.TitleText",
		closeText = "Feature.Timeout.Label.OK",
		bodyText = {
			"Feature.Timeout.Prompt.BodyText",
			rule = useLocalization({
				rule = if var2 and labelAbuseTypeMapping then labelAbuseTypeMapping[var2.labelTranslationKey] or "Feature.NotApproved.Label.AbuseType.Other" else "Feature.NotApproved.Label.AbuseType.Other"
			}).rule,
			time = if var2 then formatTimeoutEndTime(var2.endDate) else ""
		}
	})
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var3,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = var3,
						text = var4.closeText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, {
		ViewFrame = reactModule.createElement(view, {
			tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
		}, {
			PromptBodyTitle = reactModule.createElement(text, {
				tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
				LayoutOrder = 2,
				Text = var4.titleText
			}),
			PromptBodyText = reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left text-body-large text-wrap font-family-code",
				LayoutOrder = 3,
				Text = var4.bodyText
			})
		})
	})
end