local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
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
local fFlagEnableArgusImmersiveNav = sharedFlagsModule.FFlagEnableArgusImmersiveNav
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutGiftCardSourceParam = game:DefineFastString("FlyoutGiftCardSourceParam", "flyout-side-panel")

return function(p0, p1, p2) --[[ line: 31 | named "useFlyoutItemNavigation" ]]
	-- upvalues: useDispatch (ref), fFlagCreateConnectionsHub (ref), fFlagEnableArgus (ref), useNavigation (ref), useSelector (ref), useAppPolicy (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), appPage (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagEnableArgusImmersiveNav (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateDown (ref), default (ref), flyoutContentSettingsModule (ref), flyoutGiftCardSourceParam (ref), flyoutAnalyticsModule (ref)
	local var7 = useDispatch()
	local var8 = if fFlagCreateConnectionsHub or fFlagEnableArgus then useNavigation() else nil
	local var9 = useSelector(function(p3) --[[ line: 38 ]]
		return p3.LocalUserId
	end)
	local var10 = useAppPolicy(function(p4) --[[ line: 41 ]]
		return p4.getGiftCardSourceRefOverride()
	end)
	local var11 = useAppPolicy(function(p5) --[[ line: 44 ]]
		return p5
	end)
	local var12 = useRoactService(appEventIngestService)
	
	return reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: p1 (ref), p0 (ref), fFlagCreateConnectionsHub (copy), appPage (copy), var8 (ref), fFlagEnableArgus (copy), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusImmersiveNav (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), var7 (ref), navigateDown (copy), default (copy), flyoutContentSettingsModule (copy), var9 (ref), var10 (ref), flyoutGiftCardSourceParam (copy), p2 (ref), var11 (ref), flyoutAnalyticsModule (copy), var12 (ref)
		p1()
		local var13 = nil
		
		if p0.context then
			if p0.context.url then
				var13 = p0.context.url
			elseif p0.context.appPage then
				local appPage_1 = p0.context.appPage
				
				if fFlagCreateConnectionsHub and appPage_1 == appPage.CoHubMyConnections then
					var8.navigate(appPage_1)
				elseif fFlagEnableArgus and fFlagEnableArgusFlyoutEntry and (fFlagEnableArgusImmersiveNav and appPage_1 == appPage.Moments) then
					local t = { source = "flyout_menu", name = appPage.MomentsImmersive }
					
					if fFlagSignalsNavP3Dispatch then
						var3.down(var3.fromLegacyPage(t))
					else
						var7(navigateDown(t))
					end
				elseif appPage_1 == appPage.Moments then
					var8.navigate(appPage_1, { source = "flyout_menu" })
				else
					local t = { name = appPage_1 }
					
					if fFlagSignalsNavP3Dispatch then
						var3.down(var3.fromLegacyPage(t))
					else
						var7(navigateDown(t))
					end
				end
			elseif p0.context.appUri then
				local appUri = p0.context.appUri
				default:isURLRegistered(appUri):andThen(function(p6) --[[ line: 95 ]]
					-- upvalues: default (copy), appUri (ref)
					if p6 then
						default:detectURL(appUri)
					end
				end)
			elseif p0.context.urlGenerator then
				local urlGenerator = p0.context.urlGenerator
				
				if p0.itemType == flyoutContentSettingsModule.ItemType.Inventory then
					var13 = urlGenerator(var9)
				elseif p0.itemType == flyoutContentSettingsModule.ItemType.GiftCards then
					if var10 and var10 ~= "" then
						var13 = urlGenerator(var10 .. "-" .. flyoutGiftCardSourceParam)
					end
				elseif p0.itemType == flyoutContentSettingsModule.ItemType.CreateGames then
					var13 = urlGenerator(p2)
				elseif p0.itemType == flyoutContentSettingsModule.ItemType.Terms or p0.itemType == flyoutContentSettingsModule.ItemType.Privacy then
					var13 = urlGenerator(var9, var11)
				end
			end
		end
		if var13 then
			local t = {
				name = appPage.GenericWebPage,
				detail = var13,
				extraProps = { titleKey = p0.textKey }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var3.down(var3.fromLegacyPage(t))
			else
				var7(navigateDown(t))
			end
		end
		flyoutAnalyticsModule.sendMoreLegacyAndFlyoutItemClickEvent(var12, p0.itemType, var9, var13)
	end, {
		p0, p1, var9, var10, var12, p2, var7, var11,
		if fFlagCreateConnectionsHub then var8.navigate else nil
	})
end