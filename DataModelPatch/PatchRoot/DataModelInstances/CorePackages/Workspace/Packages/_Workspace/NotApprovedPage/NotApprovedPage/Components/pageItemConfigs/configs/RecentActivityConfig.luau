local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
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
local RenderPageItemsFromListFunction = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils).renderPageItemsFromList
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local UseOpenLinkModule = require(NotApprovedPage.Utils.useOpenLink)
local FFlagNavigateToSafetyDashboardForAppeals = require(Parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local FFlagEnableNapNewWebViewModule = require(NotApprovedPage.Flags.FFlagEnableNapNewWebView)
local list = {
	require(NotApprovedPage.Components.pageItemConfigs.configs.ViolationEvidenceConfig),
	require(NotApprovedPage.Components.pageItemConfigs.configs.BadUtterancesConfig),
	(require(NotApprovedPage.Components.pageItemConfigs.configs.SimpleModeratorNoteConfig))
}

return {
	getIsVisible = function(): boolean
		return true
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), FFlagEnableNapNewWebViewModule (copy), UseOpenLinkModule (copy), FFlagNavigateToSafetyDashboardForAppeals (copy), UrlBuilder (copy), RenderPageItemsFromListFunction (copy), list (copy), UseCallbackFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		local UseOpenLinkModuleResult = if FFlagEnableNapNewWebViewModule then UseOpenLinkModule(if FFlagNavigateToSafetyDashboardForAppeals then UrlBuilder.static.safetyDashboard.main() else UrlBuilder.static.appealsPortal.main(), if FFlagNavigateToSafetyDashboardForAppeals then Translations.accountStatusTitle else Translations.appealsPortalTitle) else nil
		local ConsequenceTransparencyMessage = p1.moderationDetail.consequenceTransparencyMessage
		local DispatchFunction = p1.dispatch
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = p1.layoutOrder
		}, {
			Heading = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-large text-align-x-left content-emphasis text-wrap",
				LayoutOrder = 1,
				Text = Translations.latestActivityLabel
			}),
			Content = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-xsmall",
				LayoutOrder = 2
			}, {
				EvidenceCard = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col bg-shift-100 radius-medium padding-large gap-small",
					LayoutOrder = 1
				}, {
					Evidence = ReactModule.createElement(View, { tag = "size-full-0 auto-y col", LayoutOrder = 1 }, unpack((RenderPageItemsFromListFunction(list, p1.moderationDetail, p1.dispatch)))),
					DecisionMethod = ConsequenceTransparencyMessage ~= "" and ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-align-x-left text-wrap",
						RichText = true,
						LayoutOrder = 2,
						Text = `<b>{Translations.decisionMethodLabel}:</b>\n{ConsequenceTransparencyMessage}`
					}),
					ViewActivityButton = ReactModule.createElement(Button, {
						LayoutOrder = 3,
						text = Translations.viewMoreButton,
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
				}),
				InterventionId = ReactModule.createElement(Text, {
					tag = "auto-xy text-caption-medium text-align-x-left text-wrap content-muted",
					LayoutOrder = 2,
					Text = p1.moderationDetail.interventionId
				})
			})
		})
	end)
}