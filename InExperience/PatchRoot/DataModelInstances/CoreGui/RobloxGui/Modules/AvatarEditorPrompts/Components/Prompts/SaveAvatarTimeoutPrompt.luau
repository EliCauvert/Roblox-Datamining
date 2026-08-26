local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local useSignalState = require(corePackagesService.Packages.SignalsReact).useSignalState
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local useDispatch = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local avatarExperienceCommonModule = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon)
local AXPartialPageModal = avatarExperienceCommonModule.Components.AXPartialPageModal
local getTimeoutStatusStore = avatarExperienceCommonModule.Stores.getTimeoutStatusStore
local formatTimeoutEndTime = avatarExperienceCommonModule.Utils.formatTimeoutEndTime
local labelAbuseTypeMapping = avatarExperienceCommonModule.Constants.LabelAbuseTypeMapping
local foundationModule = require(corePackagesService.Packages.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local closeOpenPromptModule = require(script.Parent.Parent.Parent.Thunks.CloseOpenPrompt)

return function()
	-- upvalues: useDispatch (ref), getTimeoutStatusStore (ref), useSignalState (ref), reactModule (ref), closeOpenPromptModule (ref), labelAbuseTypeMapping (ref), useLocalization (ref), formatTimeoutEndTime (ref), AXPartialPageModal (ref), buttonVariant (ref), inputSize (ref), view (ref), text (ref)
	local var1 = useDispatch()
	local var2 = useSignalState(getTimeoutStatusStore().getTimeoutDetails)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), closeOpenPromptModule (copy)
		var1(closeOpenPromptModule)
	end, { var1 })
	local _ = nil
	local var4 = useLocalization({
		titleText = "Feature.Timeout.Prompt.SaveTitleText",
		closeText = "Feature.Timeout.Label.OK",
		bodyText = {
			"Feature.Timeout.Prompt.BodyText",
			rule = useLocalization({
				rule = if var2 and labelAbuseTypeMapping then labelAbuseTypeMapping[var2.labelTranslationKey] or "Feature.NotApproved.Label.AbuseType.Other" else "Feature.NotApproved.Label.AbuseType.Other"
			}).rule or "",
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