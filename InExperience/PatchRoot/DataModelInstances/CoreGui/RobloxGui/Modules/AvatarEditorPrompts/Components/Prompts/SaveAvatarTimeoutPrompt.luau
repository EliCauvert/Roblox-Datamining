local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AXPartialPageModal = AvatarExperienceCommonModule.Components.AXPartialPageModal
local GetTimeoutStatusStoreFunction = AvatarExperienceCommonModule.Stores.getTimeoutStatusStore
local FormatTimeoutEndTimeFunction = AvatarExperienceCommonModule.Utils.formatTimeoutEndTime
local LabelAbuseTypeMapping = AvatarExperienceCommonModule.Constants.LabelAbuseTypeMapping
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local CloseOpenPromptModule = require(script.Parent.Parent.Parent.Thunks.CloseOpenPrompt)

return function() --[[ Line: 26 | Named "SaveAvatarTimeoutPrompt" ]]
	-- upvalues: UseDispatchFunction (copy), GetTimeoutStatusStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), CloseOpenPromptModule (copy), LabelAbuseTypeMapping (copy), UseLocalizationFunction (copy), FormatTimeoutEndTimeFunction (copy), AXPartialPageModal (copy), ButtonVariant (copy), InputSize (copy), View (copy), Text (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = UseSignalStateFunction(GetTimeoutStatusStoreFunction().getTimeoutDetails)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 31 ]]
		-- upvalues: UseDispatchResult (copy), CloseOpenPromptModule (upval)
		UseDispatchResult(CloseOpenPromptModule)
	end, { UseDispatchResult })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Timeout.Prompt.SaveTitleText",
		closeText = "Feature.Timeout.Label.OK",
		bodyText = {
			"Feature.Timeout.Prompt.BodyText",
			rule = UseLocalizationFunction({
				rule = UseSignalStateResult and LabelAbuseTypeMapping and LabelAbuseTypeMapping[UseSignalStateResult.labelTranslationKey] or "Feature.NotApproved.Label.AbuseType.Other"
			}).rule or "",
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