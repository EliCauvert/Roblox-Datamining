local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local GuiService = game:GetService("GuiService")
local Parent = NotApprovedPage.Parent
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ReactModule = require(Parent.React)
local Fragment = ReactModule.Fragment
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local EVENTTYPES = require(Parent.NotApprovedPageShared).Constants.EVENT_TYPES
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local ErrorAlertModule = require(NotApprovedPage.Components.ErrorAlert)
local PostConsequenceCommutationModule = require(NotApprovedPage.Http.PostConsequenceCommutation)
local SetModerationStatusFunction = require(Parent.NotApprovedPageShared).SetModerationStatus
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local UseOpenLinkModule = require(NotApprovedPage.Utils.useOpenLink)
local FFlagNavigateToSafetyDashboardForAppeals = require(Parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals

return ReactModule.memo(function(p1)
	-- upvalues: UseNotApprovedPageContextFunction (copy), UseOpenLinkModule (copy), FFlagNavigateToSafetyDashboardForAppeals (copy), UrlBuilder (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseStateFunction (copy), UseCallbackFunction (copy), EVENTTYPES (copy), PostConsequenceCommutationModule (copy), SetModerationStatusFunction (copy), GuiService (copy), NotificationType (copy), ReactModule (copy), Fragment (copy), ErrorAlertModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local Translations = UseNotApprovedPageContextFunction().translations
	local UseOpenLinkModuleResult = UseOpenLinkModule(if FFlagNavigateToSafetyDashboardForAppeals then UrlBuilder.static.safetyDashboard.main() else UrlBuilder.static.appealsPortal.main(), if FFlagNavigateToSafetyDashboardForAppeals then Translations.accountStatusTitle else Translations.appealsPortalTitle)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local DispatchFunction = p1.dispatch
	local SendPageEventFunction = p1.sendPageEvent
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy), SendPageEventFunction (copy), EVENTTYPES (upval), PostConsequenceCommutationModule (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), DispatchFunction (copy), SetModerationStatusFunction (upval), GuiService (upval), NotificationType (upval)
		UseStateResult2(true)
		
		if SendPageEventFunction then
			SendPageEventFunction(EVENTTYPES.SecondChanceReactivateClicked)
		end
		PostConsequenceCommutationModule(UseRoactServiceResult):andThen(function(_)
			-- upvalues: UseStateResult2_1 (upval), DispatchFunction (upval), SetModerationStatusFunction (upval), GuiService (upval), NotificationType (upval)
			UseStateResult2_1(false)
			DispatchFunction(SetModerationStatusFunction(false))
			GuiService:BroadcastNotification("", NotificationType.RESTART_LUA_APP)
		end):catch(function(_)
			-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
			UseStateResult2_1(true)
			UseStateResult2(false)
		end)
	end, {
		SendPageEventFunction,
		UseRoactServiceResult,
		DispatchFunction
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: SendPageEventFunction (copy), EVENTTYPES (upval), UseOpenLinkModuleResult (copy)
		if SendPageEventFunction then
			SendPageEventFunction(EVENTTYPES.AppealsPortalClicked)
		end
		UseOpenLinkModuleResult()
	end, { UseOpenLinkModuleResult, SendPageEventFunction })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	
	return ReactModule.createElement(Fragment, nil, {
		ErrorAlert = UseStateResult1 and ReactModule.createElement(ErrorAlertModule, { layoutOrder = 1, onClose = UseCallbackResult2 }),
		ReactivateButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			testId = "second-chance-reactivate-button",
			text = Translations.okButton,
			onActivated = UseCallbackResult,
			variant = ButtonVariant.Emphasis,
			size = InputSize.Medium,
			width = UDim.new(1, 0),
			isLoading = UseStateResult,
			isDisabled = UseStateResult
		}),
		SendAppealButton = ReactModule.createElement(Button, {
			LayoutOrder = 3,
			testId = "second-chance-send-appeal-button",
			text = Translations.sendAppealButton,
			onActivated = UseCallbackResult1,
			variant = ButtonVariant.Standard,
			size = InputSize.Medium,
			width = UDim.new(1, 0)
		})
	})
end)