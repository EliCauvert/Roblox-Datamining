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
local var5 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutGiftCardSourceParam = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel")

return function(p0, p1, p2) --[[ line: 34 | named "useFlyoutItemNavigation" ]]
	-- upvalues: useDispatch (ref), fFlagCreateConnectionsHub (ref), fFlagEnableArgus (ref), useNavigation (ref), useSelector (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), fFlagFlyoutResolveItemContextOnActivationModule (ref), appPage (ref), fFlagEnableArgusImmersiveNav (ref), fFlagMomentsEntryImmersiveNav (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagArgusTabImpliesFlyout (ref), fFlagSignalsNavP3Dispatch (ref), var5 (ref), navigateDown (ref), default (ref), flyoutContentSettingsModule (ref), flyoutGiftCardSourceParam (ref), flyoutAnalyticsModule (ref)
	local var9 = useDispatch()
	local var10 = if fFlagCreateConnectionsHub or fFlagEnableArgus then useNavigation() else nil
	local var11 = useSelector(function(p3) --[[ line: 41 ]]
		return p3.LocalUserId
	end)
	local var12 = useAppPolicy(function(p4) --[[ line: 44 ]]
		return p4.getGiftCardSourceRefOverride()
	end)
	local var13 = useAppPolicy(function(p5) --[[ line: 47 ]]
		return p5
	end)
	local var14 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function() --[[ line: 53 ]]
		-- upvalues: p1 (ref), fFlagFlyoutResolveItemContextOnActivationModule (copy), p0 (ref), fFlagCreateConnectionsHub (copy), appPage (copy), var10 (ref), fFlagEnableArgus (copy), fFlagEnableArgusImmersiveNav (copy), fFlagMomentsEntryImmersiveNav (copy), fFlagEnableArgusFlyoutEntry (copy), fFlagArgusTabImpliesFlyout (copy), fFlagSignalsNavP3Dispatch (copy), var5 (copy), var9 (ref), navigateDown (copy), default (copy), flyoutContentSettingsModule (copy), var11 (ref), var12 (ref), flyoutGiftCardSourceParam (copy), p2 (ref), var13 (ref), flyoutAnalyticsModule (copy), var14 (ref)
		local appPage_1
		p1()
		local var15 = nil
		local var16 = if fFlagFlyoutResolveItemContextOnActivationModule and p0.getContext then p0.getContext() else p0.context
		
		if var16 then
			if var16.url then
				var15 = var16.url
			elseif var16.appPage then
				appPage_1 = var16.appPage
				
				if fFlagCreateConnectionsHub and appPage_1 == appPage.CoHubMyConnections then
					var10.navigate(appPage_1)
				elseif fFlagEnableArgus and fFlagEnableArgusImmersiveNav and appPage_1 == appPage.Moments and (fFlagMomentsEntryImmersiveNav or fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout) then
					local t = { source = "flyout_menu", name = appPage.MomentsImmersive }
					
					if fFlagSignalsNavP3Dispatch then
						var5.down(var5.fromLegacyPage(t))
					else
						var9(navigateDown(t))
					end
				elseif appPage_1 == appPage.Moments then
					var10.navigate(appPage_1, { source = "flyout_menu" })
				else
					local t = { name = appPage_1 }
					
					if fFlagSignalsNavP3Dispatch then
						var5.down(var5.fromLegacyPage(t))
					else
						var9(navigateDown(t))
					end
				end
			elseif var16.appUri then
				local appUri = var16.appUri
				default:isURLRegistered(appUri):andThen(function(p6) --[[ line: 104 ]]
					-- upvalues: default (copy), appUri (ref)
					if p6 then
						default:detectURL(appUri)
					end
				end)
			elseif var16.urlGenerator then
				local urlGenerator = var16.urlGenerator
				
				if p0.itemType == flyoutContentSettingsModule.ItemType.Inventory then
					var15 = urlGenerator(var11)
				elseif p0.itemType == flyoutContentSettingsModule.ItemType.GiftCards then
					if var12 and var12 ~= "" then
						var15 = urlGenerator(var12 .. "-" .. flyoutGiftCardSourceParam)
					end
				elseif p0.itemType == flyoutContentSettingsModule.ItemType.CreateGames then
					var15 = urlGenerator(p2)
				elseif p0.itemType == flyoutContentSettingsModule.ItemType.Terms or p0.itemType == flyoutContentSettingsModule.ItemType.Privacy then
					var15 = urlGenerator(var11, var13)
				end
			end
		end
		if var15 then
			appPage_1 = {
				name = appPage.GenericWebPage,
				detail = var15,
				extraProps = { titleKey = p0.textKey }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var5.down(var5.fromLegacyPage(appPage_1))
			else
				var9(navigateDown(appPage_1))
			end
		end
		flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var14, p0.itemType, var11, var15)
	end, {
		p0, p1, var11, var12, var14, p2, var9, var13,
		if fFlagCreateConnectionsHub then var10.navigate else nil
	})
end