local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local _ = require(NotApprovedPage.Common.Types)
local EVENTTYPES = require(Parent.NotApprovedPageShared).Constants.EVENT_TYPES
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local UseOpenLinkModule = require(NotApprovedPage.Utils.useOpenLink)
local STATICPAGENAMES = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils).STATIC_PAGE_NAMES
local FFlagNavigateToSafetyDashboardForAppeals = require(Parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local FFlagEnableNapNewWebViewModule = require(NotApprovedPage.Flags.FFlagEnableNapNewWebView)

return {
	getIsVisible = function(_, _, p1, p2): boolean
		-- upvalues: STATICPAGENAMES (copy)
		local EducationalPassEligible = if p2 then p2.educational_pass_eligible else false
		
		return (if p1 then p1 else STATICPAGENAMES.Unknown) == STATICPAGENAMES.SecondChanceIntro or not EducationalPassEligible
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), FFlagEnableNapNewWebViewModule (copy), UseOpenLinkModule (copy), FFlagNavigateToSafetyDashboardForAppeals (copy), UrlBuilder (copy), UseCallbackFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		local DispatchFunction = p1.dispatch
		local UseOpenLinkModuleResult = if FFlagEnableNapNewWebViewModule then UseOpenLinkModule(if FFlagNavigateToSafetyDashboardForAppeals then UrlBuilder.static.safetyDashboard.main() else UrlBuilder.static.appealsPortal.main(), if FFlagNavigateToSafetyDashboardForAppeals then Translations.accountStatusTitle else Translations.appealsPortalTitle) else nil
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = p1.layoutOrder
		}, {
			Content = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-large text-align-x-left text-wrap",
				LayoutOrder = 2,
				Text = Translations.reportMistakeDescriptionV3
			}),
			ReportMistakeButton = ReactModule.createElement(Button, {
				LayoutOrder = 3,
				text = Translations.sendAppealButton,
				onActivated = UseCallbackFunction(function()
					-- upvalues: SendNotApprovedPageEventModule (upval), EVENTTYPES (upval), FFlagEnableNapNewWebViewModule (upval), UseOpenLinkModuleResult (copy), AppPage (upval), FFlagNavigateToSafetyDashboardForAppeals (upval), UrlBuilder (upval), Translations (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), DispatchFunction (copy), NavigateDownFunction (upval)
					SendNotApprovedPageEventModule({ eventType = EVENTTYPES.AppealsPortalClicked })
					
					if FFlagEnableNapNewWebViewModule and UseOpenLinkModuleResult then
						UseOpenLinkModuleResult()
						
						return
					end
					local config = {
						name = AppPage.GenericWebPage,
						detail = if FFlagNavigateToSafetyDashboardForAppeals then UrlBuilder.static.safetyDashboard.main() else UrlBuilder.static.appealsPortal.main(),
						extraProps = {
							title = if FFlagNavigateToSafetyDashboardForAppeals then Translations.accountStatusTitle else Translations.appealsPortalTitle
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						DispatchFunction(NavigateDownFunction(config))
					end
				end, { DispatchFunction, UseOpenLinkModuleResult, Translations }),
				variant = ButtonVariant.Standard,
				size = InputSize.Small,
				width = UDim.new(1, 0)
			})
		})
	end)
}