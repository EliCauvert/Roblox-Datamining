local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalization = require(parent.Localization).Hooks.useLocalization
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local primaryNavigationItemModule = require(script.Parent.PrimaryNavigationItem)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagCreateConnectionsHub = sharedFlagsModule.FFlagCreateConnectionsHub
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusFlyoutEntry = sharedFlagsModule.FFlagEnableArgusFlyoutEntry
local fFlagArgusTabImpliesFlyout = sharedFlagsModule.FFlagArgusTabImpliesFlyout
local fFlagEnableArgusImmersiveNav = sharedFlagsModule.FFlagEnableArgusImmersiveNav
local fFlagMomentsEntryImmersiveNav = sharedFlagsModule.FFlagMomentsEntryImmersiveNav
local fFlagFixMomentsExperienceFallback = sharedFlagsModule.FFlagFixMomentsExperienceFallback
local fFlagFlyoutTermsPrivacyFooterModule = require(script.Parent.Parent.Flags.FFlagFlyoutTermsPrivacyFooter)
local var8 = if fFlagFlyoutTermsPrivacyFooterModule then require(script.Parent.Parent.Hooks.useFlyoutItemNavigation) else nil
local flyoutGiftCardSourceParam = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel")

return function(p0) --[[ line: 47 | named "FlyoutNavigationItem" ]]
	-- upvalues: fFlagFlyoutTermsPrivacyFooterModule (ref), var8 (ref), useDispatch (ref), fFlagCreateConnectionsHub (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagArgusTabImpliesFlyout (ref), fFlagFixMomentsExperienceFallback (ref), useNavigation (ref), useSelector (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), appPage (ref), fFlagEnableArgus (ref), fFlagEnableArgusImmersiveNav (ref), fFlagMomentsEntryImmersiveNav (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref), default (ref), flyoutContentSettingsModule (ref), flyoutGiftCardSourceParam (ref), flyoutAnalyticsModule (ref), useLocalization (ref), primaryNavigationItemModule (ref)
	local var10
	local _ = nil
	
	if fFlagFlyoutTermsPrivacyFooterModule then
		var10 = var8(p0.item, p0.closeDrawer, p0.buildCreatorWebNavUrl)
	else
		local var11 = useDispatch()
		local var12 = if fFlagCreateConnectionsHub or fFlagEnableArgusFlyoutEntry or (fFlagArgusTabImpliesFlyout or fFlagFixMomentsExperienceFallback) then useNavigation() else nil
		local var13 = useSelector(function(p1) --[[ line: 59 ]]
			return p1.LocalUserId
		end)
		local var14 = useAppPolicy(function(p2) --[[ line: 62 ]]
			return p2.getGiftCardSourceRefOverride()
		end)
		local var15 = useRoactService(appEventIngestService)
		var10 = reactModule.useCallback(function() --[[ line: 68 ]]
			-- upvalues: p0 (ref), fFlagCreateConnectionsHub (copy), appPage (copy), var12 (ref), fFlagEnableArgus (copy), fFlagEnableArgusImmersiveNav (copy), fFlagMomentsEntryImmersiveNav (copy), fFlagEnableArgusFlyoutEntry (copy), fFlagArgusTabImpliesFlyout (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), var11 (ref), navigateDown (copy), fFlagFixMomentsExperienceFallback (copy), default (copy), flyoutContentSettingsModule (copy), var13 (ref), var14 (ref), flyoutGiftCardSourceParam (copy), flyoutAnalyticsModule (copy), var15 (ref)
			local appPage_1
			p0.closeDrawer()
			local var16 = nil
			
			if p0.item.context then
				if p0.item.context.url then
					var16 = p0.item.context.url
				elseif p0.item.context.appPage then
					appPage_1 = p0.item.context.appPage
					
					if fFlagCreateConnectionsHub and appPage_1 == appPage.CoHubMyConnections then
						var12.navigate(appPage_1)
					elseif fFlagEnableArgus and fFlagEnableArgusImmersiveNav and appPage_1 == appPage.Moments and (fFlagMomentsEntryImmersiveNav or fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout) then
						local t = { source = "flyout_menu", name = appPage.MomentsImmersive }
						
						if fFlagSignalsNavP3Dispatch then
							var2.down(var2.fromLegacyPage(t))
						else
							var11(navigateDown(t))
						end
					elseif fFlagFixMomentsExperienceFallback and appPage_1 == appPage.Moments then
						var12.navigate(appPage_1, { source = "flyout_menu" })
					elseif (fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout) and appPage_1 == appPage.Moments then
						var12.navigate(appPage_1, { source = "flyout_menu" })
					else
						local t = { name = appPage_1 }
						
						if fFlagSignalsNavP3Dispatch then
							var2.down(var2.fromLegacyPage(t))
						else
							var11(navigateDown(t))
						end
					end
				elseif p0.item.context.appUri then
					local appUri = p0.item.context.appUri
					default:isURLRegistered(appUri):andThen(function(p3) --[[ line: 123 ]]
						-- upvalues: default (copy), appUri (ref)
						if p3 then
							default:detectURL(appUri)
						end
					end)
				elseif p0.item.context.urlGenerator then
					local urlGenerator = p0.item.context.urlGenerator
					
					if p0.item.itemType == flyoutContentSettingsModule.ItemType.Inventory then
						var16 = urlGenerator(var13)
					elseif p0.item.itemType == flyoutContentSettingsModule.ItemType.GiftCards then
						if var14 and var14 ~= "" then
							var16 = urlGenerator(var14 .. "-" .. flyoutGiftCardSourceParam)
						end
					elseif p0.item.itemType == flyoutContentSettingsModule.ItemType.CreateGames then
						var16 = urlGenerator(p0.buildCreatorWebNavUrl)
					end
				end
			end
			if var16 then
				appPage_1 = {
					name = appPage.GenericWebPage,
					detail = var16,
					extraProps = { titleKey = p0.item.textKey }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var2.down(var2.fromLegacyPage(appPage_1))
				else
					var11(navigateDown(appPage_1))
				end
			end
			flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var15, p0.item.itemType, var13, var16)
		end, {
			p0.item, p0.closeDrawer, var13, var14, var15, p0.buildCreatorWebNavUrl, var11,
			if fFlagCreateConnectionsHub then var12.navigate else nil
		})
	end
	return reactModule.createElement(primaryNavigationItemModule, {
		layoutOrder = p0.layoutOrder,
		onActivated = var10,
		icon = p0.item.icon,
		text = useLocalization({ text = p0.item.textKey }).text,
		notificationCount = p0.item.notificationCount
	})
end