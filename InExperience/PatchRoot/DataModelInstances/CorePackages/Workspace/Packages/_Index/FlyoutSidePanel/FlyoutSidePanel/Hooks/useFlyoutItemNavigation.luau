local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusFlyoutEntry = sharedFlagsModule.FFlagEnableArgusFlyoutEntry
local fFlagArgusTabImpliesFlyout = sharedFlagsModule.FFlagArgusTabImpliesFlyout
local fFlagEnableArgusImmersiveNav = sharedFlagsModule.FFlagEnableArgusImmersiveNav
local fFlagMomentsEntryImmersiveNav = sharedFlagsModule.FFlagMomentsEntryImmersiveNav
local fFlagFlyoutResolveItemContextOnActivationModule = require(flyoutSidePanel.Flags.FFlagFlyoutResolveItemContextOnActivation)
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutGiftCardSourceParam = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel")

return function(p1, p2, p3)
	-- upvalues: useDispatch (ref), fFlagCreateConnectionsHub (ref), fFlagEnableArgus (ref), useNavigation (ref), useSelector (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), fFlagFlyoutResolveItemContextOnActivationModule (ref), appPage (ref), fFlagEnableArgusImmersiveNav (ref), fFlagMomentsEntryImmersiveNav (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagArgusTabImpliesFlyout (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), default (ref), flyoutContentSettingsModule (ref), flyoutGiftCardSourceParam (ref), flyoutAnalyticsModule (ref)
	local var2 = useDispatch()
	local var3 = if fFlagCreateConnectionsHub or fFlagEnableArgus then useNavigation() else nil
	local var4 = useSelector(function(p4)
		return p4.LocalUserId
	end)
	local var5 = useAppPolicy(function(p4)
		return p4.getGiftCardSourceRefOverride()
	end)
	local var6 = useAppPolicy(function(p4)
		return p4
	end)
	local var7 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function()
		-- upvalues: p2 (ref), fFlagFlyoutResolveItemContextOnActivationModule (copy), p1 (ref), fFlagCreateConnectionsHub (copy), appPage (copy), var3 (ref), fFlagEnableArgus (copy), fFlagEnableArgusImmersiveNav (copy), fFlagMomentsEntryImmersiveNav (copy), fFlagEnableArgusFlyoutEntry (copy), fFlagArgusTabImpliesFlyout (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy), default (copy), flyoutContentSettingsModule (copy), var4 (ref), var5 (ref), flyoutGiftCardSourceParam (copy), p3 (ref), var6 (ref), flyoutAnalyticsModule (copy), var7 (ref)
		local appPage_1
		p2()
		local var8 = nil
		local var9 = if fFlagFlyoutResolveItemContextOnActivationModule and p1.getContext then p1.getContext() else p1.context
		
		if var9 then
			if var9.url then
				var8 = var9.url
			elseif var9.appPage then
				appPage_1 = var9.appPage
				
				if fFlagCreateConnectionsHub and appPage_1 == appPage.CoHubMyConnections then
					var3.navigate(appPage_1)
				elseif fFlagEnableArgus and fFlagEnableArgusImmersiveNav and appPage_1 == appPage.Moments and (fFlagMomentsEntryImmersiveNav or fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout) then
					local t = { source = "flyout_menu", name = appPage.MomentsImmersive }
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
					else
						var2(navigateDown(t))
					end
				elseif appPage_1 == appPage.Moments then
					var3.navigate(appPage_1, { source = "flyout_menu" })
				else
					local t = { name = appPage_1 }
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
					else
						var2(navigateDown(t))
					end
				end
			elseif var9.appUri then
				local appUri = var9.appUri
				default:isURLRegistered(appUri):andThen(function(p4)
					-- upvalues: default (copy), appUri (ref)
					if p4 then
						default:detectURL(appUri)
					end
				end)
			elseif var9.urlGenerator then
				local urlGenerator = var9.urlGenerator
				
				if p1.itemType == flyoutContentSettingsModule.ItemType.Inventory then
					var8 = urlGenerator(var4)
				elseif p1.itemType == flyoutContentSettingsModule.ItemType.GiftCards then
					if var5 and var5 ~= "" then
						var8 = urlGenerator(var5 .. "-" .. flyoutGiftCardSourceParam)
					end
				elseif p1.itemType == flyoutContentSettingsModule.ItemType.CreateGames then
					var8 = urlGenerator(p3)
				elseif p1.itemType == flyoutContentSettingsModule.ItemType.Terms or p1.itemType == flyoutContentSettingsModule.ItemType.Privacy then
					var8 = urlGenerator(var4, var6)
				end
			end
		end
		if var8 then
			appPage_1 = {
				name = appPage.GenericWebPage,
				detail = var8,
				extraProps = { titleKey = p1.textKey }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(appPage_1))
			else
				var2(navigateDown(appPage_1))
			end
		end
		flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var7, p1.itemType, var4, var8)
	end, {
		p1, p2, var4, var5, var7, p3, var2, var6,
		if fFlagCreateConnectionsHub then var3.navigate else nil
	})
end