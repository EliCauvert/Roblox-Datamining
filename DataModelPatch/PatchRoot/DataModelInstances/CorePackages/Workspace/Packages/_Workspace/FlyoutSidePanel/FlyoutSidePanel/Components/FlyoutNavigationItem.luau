local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local PrimaryNavigationItemModule = require(script.Parent.PrimaryNavigationItem)
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagCreateConnectionsHub = SharedFlagsModule.FFlagCreateConnectionsHub
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusFlyoutEntry = SharedFlagsModule.FFlagEnableArgusFlyoutEntry
local FFlagArgusTabImpliesFlyout = SharedFlagsModule.FFlagArgusTabImpliesFlyout
local FFlagEnableArgusImmersiveNav = SharedFlagsModule.FFlagEnableArgusImmersiveNav
local FFlagFlyoutTermsPrivacyFooterModule = require(script.Parent.Parent.Flags.FFlagFlyoutTermsPrivacyFooter)
local UseFlyoutItemNavigationModule = if FFlagFlyoutTermsPrivacyFooterModule then require(script.Parent.Parent.Hooks.useFlyoutItemNavigation) else nil
local FlyoutGiftCardSourceParam = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel")

return function(p1)
	-- upvalues: FFlagFlyoutTermsPrivacyFooterModule (copy), UseFlyoutItemNavigationModule (copy), UseDispatchFunction (copy), FFlagCreateConnectionsHub (copy), FFlagEnableArgusFlyoutEntry (copy), FFlagArgusTabImpliesFlyout (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), AppPage (copy), FFlagEnableArgus (copy), FFlagEnableArgusImmersiveNav (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Default (copy), FlyoutContentSettingsModule (copy), FlyoutGiftCardSourceParam (copy), FlyoutAnalyticsModule (copy), UseLocalizationFunction (copy), PrimaryNavigationItemModule (copy)
	local UseFlyoutItemNavigationModuleResult = nil
	if FFlagFlyoutTermsPrivacyFooterModule then
		UseFlyoutItemNavigationModuleResult = UseFlyoutItemNavigationModule(p1.item, p1.closeDrawer, p1.buildCreatorWebNavUrl)
	else
		local UseDispatchResult = UseDispatchFunction()
		local UseNavigationResult = if FFlagCreateConnectionsHub or FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout then UseNavigationFunction() else nil
		local UseSelectorResult = UseSelectorFunction(function(p2)
			return p2.LocalUserId
		end)
		local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
			return p2.getGiftCardSourceRefOverride()
		end)
		local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
		UseFlyoutItemNavigationModuleResult = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), FFlagCreateConnectionsHub (upval), AppPage (upval), UseNavigationResult (copy), FFlagEnableArgus (upval), FFlagEnableArgusFlyoutEntry (upval), FFlagArgusTabImpliesFlyout (upval), FFlagEnableArgusImmersiveNav (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), Default (upval), FlyoutContentSettingsModule (upval), UseSelectorResult (copy), UseAppPolicyResult (copy), FlyoutGiftCardSourceParam (upval), FlyoutAnalyticsModule (upval), UseRoactServiceResult (copy)
			p1.closeDrawer()
			local Url = nil
			
			if p1.item.context then
				if p1.item.context.url then
					Url = p1.item.context.url
				elseif p1.item.context.appPage then
					local AppPage1 = p1.item.context.appPage
					
					if FFlagCreateConnectionsHub and AppPage1 == AppPage.CoHubMyConnections then
						UseNavigationResult.navigate(AppPage1)
					elseif FFlagEnableArgus and (FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout) and (FFlagEnableArgusImmersiveNav and AppPage1 == AppPage.Moments) then
						local config = { source = "flyout_menu", name = AppPage.MomentsImmersive }
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						else
							UseDispatchResult(NavigateDownFunction(config))
						end
					elseif (FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout) and AppPage1 == AppPage.Moments then
						UseNavigationResult.navigate(AppPage1, { source = "flyout_menu" })
					else
						local config = { name = AppPage1 }
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						else
							UseDispatchResult(NavigateDownFunction(config))
						end
					end
				elseif p1.item.context.appUri then
					local AppUri = p1.item.context.appUri
					Default:isURLRegistered(AppUri):andThen(function(Result)
						-- upvalues: Default (upval), AppUri (copy)
						if Result then
							Default:detectURL(AppUri)
						end
					end)
				elseif p1.item.context.urlGenerator then
					local UrlGeneratorFunction = p1.item.context.urlGenerator
					
					if p1.item.itemType == FlyoutContentSettingsModule.ItemType.Inventory then
						Url = UrlGeneratorFunction(UseSelectorResult)
					elseif p1.item.itemType == FlyoutContentSettingsModule.ItemType.GiftCards then
						if UseAppPolicyResult and UseAppPolicyResult ~= "" then
							Url = UrlGeneratorFunction(UseAppPolicyResult .. "-" .. FlyoutGiftCardSourceParam)
						end
					elseif p1.item.itemType == FlyoutContentSettingsModule.ItemType.CreateGames then
						Url = UrlGeneratorFunction(p1.buildCreatorWebNavUrl)
					end
				end
			end
			if Url then
				local config = {
					name = AppPage.GenericWebPage,
					detail = Url,
					extraProps = { titleKey = p1.item.textKey }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				else
					UseDispatchResult(NavigateDownFunction(config))
				end
			end
			FlyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(UseRoactServiceResult, p1.item.itemType, UseSelectorResult, Url)
		end, {
			p1.item, p1.closeDrawer, UseSelectorResult, UseAppPolicyResult,
			UseRoactServiceResult, p1.buildCreatorWebNavUrl, UseDispatchResult,
			if FFlagCreateConnectionsHub then UseNavigationResult.navigate else nil
		})
	end
	return ReactModule.createElement(PrimaryNavigationItemModule, {
		layoutOrder = p1.layoutOrder,
		onActivated = UseFlyoutItemNavigationModuleResult,
		icon = p1.item.icon,
		text = UseLocalizationFunction({ text = p1.item.textKey }).text,
		notificationCount = p1.item.notificationCount
	})
end