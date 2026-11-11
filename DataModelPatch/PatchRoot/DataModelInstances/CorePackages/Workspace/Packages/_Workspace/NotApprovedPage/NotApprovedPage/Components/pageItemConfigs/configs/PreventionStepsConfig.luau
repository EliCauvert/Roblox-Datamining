local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local _ = require(NotApprovedPage.Common.Types)
local Constants = require(Parent.NotApprovedPageShared).Constants
local INTERVENTIONTYPES = Constants.INTERVENTION_TYPES
local EVENTTYPES = Constants.EVENT_TYPES
local PUNISHMENTTYPETOINTERVENTIONMAP = Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UseCallbackFunction = ReactModule.useCallback
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local UseOpenLinkModule = require(NotApprovedPage.Utils.useOpenLink)
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local FFlagEnableNapNewWebViewModule = require(NotApprovedPage.Flags.FFlagEnableNapNewWebView)

return {
	getIsVisible = function(p1): boolean
		-- upvalues: PUNISHMENTTYPETOINTERVENTIONMAP (copy), INTERVENTIONTYPES (copy)
		return PUNISHMENTTYPETOINTERVENTIONMAP[p1.punishmentTypeDescription] ~= INTERVENTIONTYPES.Deleted
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), FFlagEnableNapNewWebViewModule (copy), UseOpenLinkModule (copy), UrlBuilder (copy), UseCallbackFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		local DispatchFunction = p1.dispatch
		local HasEducationalPages = p1.hasEducationalPages
		local ShowUGCAvatarGuidelinesLink = p1.moderationDetail.showUGCAvatarGuidelinesLink
		local IsAltInformed = p1.moderationDetail.isAltInformed
		local UseOpenLinkModuleResult = if FFlagEnableNapNewWebViewModule then UseOpenLinkModule(if ShowUGCAvatarGuidelinesLink then UrlBuilder.static.creatorHub() .. "/docs/marketplace/marketplace-policy#general-creation-guidelines" else UrlBuilder.static.about.guidelines(), if ShowUGCAvatarGuidelinesLink then Translations.avatarGuidelinesLabel else Translations.communityStandardsLabel) else nil
		local UseCallbackResult = UseCallbackFunction(function()
			-- upvalues: SendNotApprovedPageEventModule (upval), ShowUGCAvatarGuidelinesLink (copy), EVENTTYPES (upval), FFlagEnableNapNewWebViewModule (upval), UseOpenLinkModuleResult (copy), AppPage (upval), UrlBuilder (upval), Translations (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), DispatchFunction (copy), NavigateDownFunction (upval)
			SendNotApprovedPageEventModule({
				eventType = if ShowUGCAvatarGuidelinesLink then EVENTTYPES.UGCGuidelinesClicked else EVENTTYPES.CommunityGuidelineClicked
			})
			
			if FFlagEnableNapNewWebViewModule and UseOpenLinkModuleResult then
				UseOpenLinkModuleResult()
				
				return
			end
			local config = {
				name = AppPage.GenericWebPage,
				detail = if ShowUGCAvatarGuidelinesLink then UrlBuilder.static.creatorHub() .. "/docs/marketplace/marketplace-policy#general-creation-guidelines" else UrlBuilder.static.about.guidelines(),
				extraProps = {
					title = if ShowUGCAvatarGuidelinesLink then Translations.avatarGuidelinesLabel else Translations.communityStandardsLabel
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				DispatchFunction(NavigateDownFunction(config))
			end
		end, { DispatchFunction, UseOpenLinkModuleResult })
		
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-medium",
			LayoutOrder = p1.layoutOrder
		}, {
			Heading = ReactModule.createElement(Text, {
				tag = "auto-xy text-align-x-left text-wrap text-heading-medium content-emphasis",
				LayoutOrder = 1,
				Text = Translations.preventionStepsHeading
			}),
			Content = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-medium",
				LayoutOrder = 3
			}, {
				Description = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-large text-wrap text-align-x-left",
					LayoutOrder = 3,
					Text = Translations.foreshadowDescription
				}),
				LinkedAccountsDescription = IsAltInformed and ReactModule.createElement(Text, {
					tag = "auto-xy text-body-large text-wrap text-align-x-left",
					LayoutOrder = 4,
					Text = Translations.linkedAccountsDescription
				}),
				GuidelinesLink = if HasEducationalPages then ShowUGCAvatarGuidelinesLink and ReactModule.createElement(Button, {
					LayoutOrder = 5,
					text = if ShowUGCAvatarGuidelinesLink then Translations.avatarGuidelinesLabel else Translations.viewRulesButton,
					onActivated = UseCallbackResult,
					variant = ButtonVariant.Standard,
					size = InputSize.Small,
					width = UDim.new(1, 0)
				}) else ReactModule.createElement(Button, {
					LayoutOrder = 5,
					text = if ShowUGCAvatarGuidelinesLink then Translations.avatarGuidelinesLabel else Translations.viewRulesButton,
					onActivated = UseCallbackResult,
					variant = ButtonVariant.Standard,
					size = InputSize.Small,
					width = UDim.new(1, 0)
				})
			})
		})
	end)
}