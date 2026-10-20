local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local AXPartialPageModal = AvatarExperienceCommonModule.Components.AXPartialPageModal
local GetTimeoutStatusStoreFunction = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore
local FormatTimeoutEndTimeFunction = AvatarExperienceCommonModule.Utils.formatTimeoutEndTime
local LabelAbuseTypeMapping = AvatarExperienceCommonModule.Constants.LabelAbuseTypeMapping
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function()
	-- upvalues: UseNavigationFunction (copy), GetTimeoutStatusStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), RoactNavigationModule (copy), LabelAbuseTypeMapping (copy), UseLocalizationFunction (copy), FormatTimeoutEndTimeFunction (copy), AXPartialPageModal (copy), ButtonVariant (copy), InputSize (copy), View (copy), Text (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseSignalStateResult = UseSignalStateFunction(GetTimeoutStatusStoreFunction().getTimeoutDetails)
	ReactModule.useEffect(function()
		-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), UseSignalStateResult (copy)
		SendAXCounterV2Function(ConstantsModule.COUNTERS.TimeoutStatusPromptShown, {
			labelTranslationKey = if UseSignalStateResult then UseSignalStateResult.labelTranslationKey else ""
		})
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), RoactNavigationModule (upval)
		UseNavigationResult.dispatch(RoactNavigationModule.Actions.back(nil))
	end, { UseNavigationResult })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Timeout.Prompt.TitleText",
		closeText = "Feature.Timeout.Label.OK",
		bodyText = {
			"Feature.Timeout.Prompt.BodyText",
			rule = UseLocalizationFunction({
				rule = UseSignalStateResult and LabelAbuseTypeMapping and LabelAbuseTypeMapping[UseSignalStateResult.labelTranslationKey] or "Feature.NotApproved.Label.AbuseType.Other"
			}).rule,
			time = if UseSignalStateResult then FormatTimeoutEndTimeFunction(UseSignalStateResult.endDate) else ""
		}
	})
	
	return ReactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = UseResult,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.closeText,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium
					}
				}
			}
		}
	}, {
		ViewFrame = ReactModule.createElement(View, {
			tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
		}, {
			PromptBodyTitle = ReactModule.createElement(Text, {
				tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
				LayoutOrder = 2,
				Text = UseLocalizationResult.titleText
			}),
			PromptBodyText = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-left text-body-large text-wrap font-family-code",
				LayoutOrder = 3,
				Text = UseLocalizationResult.bodyText
			})
		})
	})
end