local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusFlyoutEntry = SharedFlagsModule.FFlagEnableArgusFlyoutEntry
local FFlagArgusTabImpliesFlyout = SharedFlagsModule.FFlagArgusTabImpliesFlyout
local FFlagEnableArgusImmersiveNav = SharedFlagsModule.FFlagEnableArgusImmersiveNav
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local FlyoutGiftCardSourceParam = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel")

return function(p1, Callback, p2)
	-- upvalues: UseDispatchFunction (copy), FFlagCreateConnectionsHub (copy), FFlagEnableArgus (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), AppPage (copy), FFlagEnableArgusFlyoutEntry (copy), FFlagArgusTabImpliesFlyout (copy), FFlagEnableArgusImmersiveNav (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Default (copy), FlyoutContentSettingsModule (copy), FlyoutGiftCardSourceParam (copy), FlyoutAnalyticsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = if FFlagCreateConnectionsHub or FFlagEnableArgus then UseNavigationFunction() else nil
	local UseSelectorResult = UseSelectorFunction(function(p3)
		return p3.LocalUserId
	end)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return p3.getGiftCardSourceRefOverride()
	end)
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p3)
		return p3
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	
	return ReactModule.useCallback(function()
		-- upvalues: Callback (copy), p1 (copy), FFlagCreateConnectionsHub (upval), AppPage (upval), UseNavigationResult (copy), FFlagEnableArgus (upval), FFlagEnableArgusFlyoutEntry (upval), FFlagArgusTabImpliesFlyout (upval), FFlagEnableArgusImmersiveNav (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), Default (upval), FlyoutContentSettingsModule (upval), UseSelectorResult (copy), UseAppPolicyResult (copy), FlyoutGiftCardSourceParam (upval), p2 (copy), UseAppPolicyResult1 (copy), FlyoutAnalyticsModule (upval), UseRoactServiceResult (copy)
		Callback()
		local Url = nil
		
		if p1.context then
			if p1.context.url then
				Url = p1.context.url
			elseif p1.context.appPage then
				local AppPage1 = p1.context.appPage
				
				if FFlagCreateConnectionsHub and AppPage1 == AppPage.CoHubMyConnections then
					UseNavigationResult.navigate(AppPage1)
				elseif FFlagEnableArgus and (FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout) and (FFlagEnableArgusImmersiveNav and AppPage1 == AppPage.Moments) then
					local config = { source = "flyout_menu", name = AppPage.MomentsImmersive }
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					else
						UseDispatchResult(NavigateDownFunction(config))
					end
				elseif AppPage1 == AppPage.Moments then
					UseNavigationResult.navigate(AppPage1, { source = "flyout_menu" })
				else
					local config = { name = AppPage1 }
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					else
						UseDispatchResult(NavigateDownFunction(config))
					end
				end
			elseif p1.context.appUri then
				local AppUri = p1.context.appUri
				Default:isURLRegistered(AppUri):andThen(function(Result)
					-- upvalues: Default (upval), AppUri (copy)
					if Result then
						Default:detectURL(AppUri)
					end
				end)
			elseif p1.context.urlGenerator then
				local UrlGeneratorFunction = p1.context.urlGenerator
				
				if p1.itemType == FlyoutContentSettingsModule.ItemType.Inventory then
					Url = UrlGeneratorFunction(UseSelectorResult)
				elseif p1.itemType == FlyoutContentSettingsModule.ItemType.GiftCards then
					if UseAppPolicyResult and UseAppPolicyResult ~= "" then
						Url = UrlGeneratorFunction(UseAppPolicyResult .. "-" .. FlyoutGiftCardSourceParam)
					end
				elseif p1.itemType == FlyoutContentSettingsModule.ItemType.CreateGames then
					Url = UrlGeneratorFunction(p2)
				elseif p1.itemType == FlyoutContentSettingsModule.ItemType.Terms or p1.itemType == FlyoutContentSettingsModule.ItemType.Privacy then
					Url = UrlGeneratorFunction(UseSelectorResult, UseAppPolicyResult1)
				end
			end
		end
		if Url then
			local config = {
				name = AppPage.GenericWebPage,
				detail = Url,
				extraProps = { titleKey = p1.textKey }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end
		FlyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(UseRoactServiceResult, p1.itemType, UseSelectorResult, Url)
	end, {
		p1, Callback, UseSelectorResult, UseAppPolicyResult, UseRoactServiceResult, p2,
		UseDispatchResult, UseAppPolicyResult1,
		if FFlagCreateConnectionsHub then UseNavigationResult.navigate else nil
	})
end