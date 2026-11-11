local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local Fragment = ReactModule.Fragment
local UseCallbackFunction = ReactModule.useCallback
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local UseOpenLinkModule = require(NotApprovedPage.Utils.useOpenLink)
local EVENTTYPES = require(Parent.NotApprovedPageShared).Constants.EVENT_TYPES
local FFlagNavigateToSafetyDashboardForAppeals = require(Parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)

return ReactModule.memo(function(_)
	-- upvalues: UseNotApprovedPageContextFunction (copy), UseOpenLinkModule (copy), FFlagNavigateToSafetyDashboardForAppeals (copy), UrlBuilder (copy), UseCallbackFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), ReactModule (copy), Fragment (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local Translations = UseNotApprovedPageContextFunction().translations
	local UseOpenLinkModuleResult = UseOpenLinkModule(if FFlagNavigateToSafetyDashboardForAppeals then UrlBuilder.static.safetyDashboard.main() else UrlBuilder.static.appealsPortal.main(), if FFlagNavigateToSafetyDashboardForAppeals then Translations.accountStatusTitle else Translations.appealsPortalTitle)
	
	return ReactModule.createElement(Fragment, nil, {
		AppealButton = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = Translations.reportMistakeButton,
			onActivated = UseCallbackFunction(function()
				-- upvalues: SendNotApprovedPageEventModule (upval), EVENTTYPES (upval), UseOpenLinkModuleResult (copy)
				SendNotApprovedPageEventModule({ eventType = EVENTTYPES.AppealsPortalClicked })
				UseOpenLinkModuleResult()
			end, { UseOpenLinkModuleResult }),
			variant = ButtonVariant.SoftEmphasis,
			size = InputSize.Medium,
			width = UDim.new(1, 0)
		})
	})
end)