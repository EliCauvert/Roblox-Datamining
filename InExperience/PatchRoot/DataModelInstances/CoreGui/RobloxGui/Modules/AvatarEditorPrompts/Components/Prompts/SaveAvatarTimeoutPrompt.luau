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
	local var5 = useDispatch()
	local var6 = useSignalState(getTimeoutStatusStore().getTimeoutDetails)
	local var7 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), closeOpenPromptModule (copy)
		var5(closeOpenPromptModule)
	end, { var5 })
	local _ = nil
	local var8 = useLocalization({
		titleText = "Feature.Timeout.Prompt.SaveTitleText",
		closeText = "Feature.Timeout.Label.OK",
		bodyText = {
			"Feature.Timeout.Prompt.BodyText",
			rule = useLocalization({
				rule = if var6 and labelAbuseTypeMapping then labelAbuseTypeMapping[var6.labelTranslationKey] or "Feature.NotApproved.Label.AbuseType.Other" else "Feature.NotApproved.Label.AbuseType.Other"
			}).rule or "",
			time = if var6 then formatTimeoutEndTime(var6.endDate) else ""
		}
	})
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var7,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = var7,
						text = var8.closeText,
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
				Text = var8.titleText
			}),
			PromptBodyText = reactModule.createElement(text, {
				tag = "auto-xy text-align-x-left text-body-large text-wrap font-family-code",
				LayoutOrder = 3,
				Text = var8.bodyText
			})
		})
	})
end