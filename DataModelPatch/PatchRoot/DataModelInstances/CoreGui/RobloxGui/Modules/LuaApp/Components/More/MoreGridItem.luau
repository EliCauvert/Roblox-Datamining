local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local MenuTile = UIBloxModule.App.Tile.MenuTile
local CryoModule = require(CorePackages.Packages.Cryo)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local ValidateColorInfo = UIBloxModule.Style.Validator.validateColorInfo
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ConstantsModule = require(Modules.LuaApp.Constants)
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local OpenCentralOverlayForReportLogsModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForReportLogs)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local NavigateToFriendsLandingEventModule = require(Modules.LuaApp.Components.FriendsLanding.navigateToFriendsLandingEvent)
local Sources = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local FFlagCreateConnectionsHub = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub
local FFlagEnableArgusFlyoutEntry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableArgusFlyoutEntry
local FFlagArgoEnableMoments = require(CorePackages.Workspace.Packages.SharedFlags).FFlagArgoEnableMoments
local FFlagArgusTabImpliesFlyout = require(CorePackages.Workspace.Packages.SharedFlags).FFlagArgusTabImpliesFlyout
local FFlagEnableMorePageDirectionalLayoutRolloutFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix
local FFlagBlackbirdRequiresIAP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBlackbirdRequiresIAP
local FFlagEnableBlackbird = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbird
local FFlagEnableBlackbirdOnMorePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdOnMorePage
local FoundationModule = if FFlagEnableBlackbird and FFlagEnableBlackbirdOnMorePage then require(CorePackages.Packages.Foundation) else nil
local GetFFlagEnableCommunityListExperimentationFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityListExperimentation
local CommunityListExperimentation = require(CorePackages.Workspace.Packages.Groups).Experiments.CommunityListExperimentation
local MoreGridItem = RoactModule.PureComponent:extend("MoreGridItem")
MoreGridItem.validateProps = TModule.strictInterface({
	item = TModule.table,
	layoutOrder = TModule.integer,
	formFactor = TModule.string,
	localUserId = TModule.string,
	navigateDown = TModule.callback,
	openLeaveRobloxAlertUIBlox = TModule.callback,
	openReportLogConfirmation = TModule.callback,
	closeAlert = TModule.callback,
	catalogAnalytics = TModule.table,
	shouldUseExternalBrowserForMorePageItem = TModule.callback,
	linking = TModule.table,
	linkingProtocol = TModule.optional(TModule.table),
	navigation = TModule.table,
	eventIngest = TModule.any,
	disableWebViewSupport = TModule.boolean,
	disableIAPEntryPoint = TModule.optional(TModule.boolean),
	shouldSkipWebViewCheck = TModule.boolean,
	showWebViewNotAvailableToastMessage = TModule.callback,
	isDirectional = if FFlagEnableMorePageDirectionalLayoutRolloutFix then TModule.boolean else nil,
	itemStyleProps = TModule.optional(TModule.strictInterface({
		iconStyle = TModule.optional(ValidateColorInfo),
		iconSize = TModule.optional(IconSize.isEnumValue),
		titleStyle = TModule.optional(ValidateColorInfo),
		titleFont = TModule.optional(TModule.union(UIBloxModule.Style.Validator.validateFontInfo, UIBloxModule.Style.Validator.validateTypographyInfo))
	}))
})
MoreGridItem.defaultProps = { linkingProtocol = LinkingProtocol.default }

function MoreGridItem.init(p1)
	-- upvalues: OpenExternalBrowserModule (copy), FFlagCreateConnectionsHub (copy), MorePageSettingsModule (copy), FFlagEnableArgusFlyoutEntry (copy), FFlagArgoEnableMoments (copy), FFlagArgusTabImpliesFlyout (copy), AvatarScreen (copy), CryoModule (copy), Logging (copy), FFlagBlackbirdRequiresIAP (copy), NavigateToFriendsLandingEventModule (copy), AppPageModule (copy), Sources (copy), GetFFlagEnableCommunityListExperimentationFunction (copy), CommunityListExperimentation (copy)
	function p1.navigateDown(p2)
		-- upvalues: p1 (copy), OpenExternalBrowserModule (upval), FFlagCreateConnectionsHub (upval), MorePageSettingsModule (upval), FFlagEnableArgusFlyoutEntry (upval), FFlagArgoEnableMoments (upval), FFlagArgusTabImpliesFlyout (upval), AvatarScreen (upval), CryoModule (upval)
		local Item = p1.props.item
		local Url = Item.context.url
		local TitleKey = Item.context.titleKey
		
		if Item.urlGenerator then
			Url = Item.urlGenerator(p1.props.localUserId)
		end
		local SearchParams = if Item.getSearchParams then Item.getSearchParams(p1.props.formFactor) else nil
		local Config = if TitleKey or SearchParams then { titleKey = TitleKey, searchParams = SearchParams } else nil
		local ShouldUseExternalBrowserForMorePageItem = Item.shouldOpenInExternalBrowser and p1.props.shouldUseExternalBrowserForMorePageItem()
		local IsFallbackToExternalBrowser: boolean = p1.props.disableWebViewSupport == true and Item.context.fallbackToExternalBrowser == true
		local AppURI = Item.context.appURI
		
		if AppURI then
			p1.props.linkingProtocol:isURLRegistered(AppURI):andThen(function(Result)
				-- upvalues: p1 (upval), AppURI (copy)
				if Result then
					p1.props.linkingProtocol:detectURL(AppURI)
				end
			end)
			
			return
		end
		if ShouldUseExternalBrowserForMorePageItem or IsFallbackToExternalBrowser then
			OpenExternalBrowserModule(p1.props.linking, Url)
			
			return
		end
		if FFlagCreateConnectionsHub and Item.itemType == MorePageSettingsModule.ItemType.Friends then
			p1.props.navigation.navigate(Item.context.page)
			
			return
		end
		if (FFlagEnableArgusFlyoutEntry or FFlagArgoEnableMoments or FFlagArgusTabImpliesFlyout) and Item.itemType == MorePageSettingsModule.ItemType.RM then
			p1.props.navigation.navigate(Item.context.page, { source = "flyout_menu" })
			
			return
		end
		if Item.itemType == MorePageSettingsModule.ItemType.Catalog then
			p1.props.navigation.navigate(AvatarScreen.Catalog)
			
			return
		end
		if Item.itemType == MorePageSettingsModule.ItemType.OfficialStore then
			p1.props.openLeaveRobloxAlertUIBlox(p1.openUrl)
			
			return
		end
		if Item.itemType == MorePageSettingsModule.ItemType.ReportLogs then
			p1.props.openReportLogConfirmation()
			
			return
		else
			p1.props.navigateDown({
				name = Item.context.page,
				detail = Url,
				extraProps = CryoModule.Dictionary.join(Config or {}, p2 or {})
			})
		end
	end
	
	function p1.openUrl()
		-- upvalues: p1 (copy), Logging (upval)
		p1.props.linking:openURL(p1.props.item.context.url):andThen(function(Enabled)
			-- upvalues: Logging (upval)
			if Enabled == false then
				Logging.warn("LinkingProtocol:openURL failed for offical amazon store.")
			end
		end)
		p1.props.closeAlert()
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy), MorePageSettingsModule (upval), FFlagBlackbirdRequiresIAP (upval), NavigateToFriendsLandingEventModule (upval), AppPageModule (upval), Sources (upval), GetFFlagEnableCommunityListExperimentationFunction (upval), CommunityListExperimentation (upval)
		local CatalogAnalytics = p1.props.catalogAnalytics
		local Item = p1.props.item
		local Config = nil
		
		if not p1.props.shouldSkipWebViewCheck then
			local DisableIAPEntryPoint = Item.itemType == MorePageSettingsModule.ItemType.BuildersClub and p1.props.disableIAPEntryPoint
			local DisableIAPEntryPoint1 = FFlagBlackbirdRequiresIAP and (Item.itemType == MorePageSettingsModule.ItemType.Blackbird and p1.props.disableIAPEntryPoint)
			
			if Item.itemType == MorePageSettingsModule.ItemType.Settings and p1.props.disableWebViewSupport or DisableIAPEntryPoint or DisableIAPEntryPoint1 then
				p1.props.showWebViewNotAvailableToastMessage()
				
				return
			end
		end
		if Item.itemType == MorePageSettingsModule.ItemType.Catalog then
			CatalogAnalytics.moreMenuToCatalogButton()
		end
		if Item.itemType == MorePageSettingsModule.ItemType.Friends then
			NavigateToFriendsLandingEventModule({ context = "morePage", localUserId = p1.props.localUserId })
			Config = {
				navigateToFriendsLandingEventStart = { startPage = AppPageModule.More, startTime = os.clock() }
			}
		end
		if Item.itemType == MorePageSettingsModule.ItemType.Profile then
			Config = { source = Sources.MorePageTile }
		end
		if Item.itemType == MorePageSettingsModule.ItemType.RM then
			Config = { source = "flyout_menu" }
		end
		if Item.itemType == MorePageSettingsModule.ItemType.Groups and GetFFlagEnableCommunityListExperimentationFunction() then
			CommunityListExperimentation.logExposure()
		end
		p1.navigateDown(Config)
		p1.props.eventIngest:sendEventDeferred("moreGridItem", "moreGridItemClick", {
			itemType = Item.itemType,
			url = Item.context.url,
			localUserId = p1.props.localUserId
		})
	end
end

function MoreGridItem.render(p1)
	-- upvalues: FFlagEnableBlackbird (copy), FFlagEnableBlackbirdOnMorePage (copy), WithLocalizationModule (copy), RoactModule (copy), MenuTile (copy), FoundationModule (copy)
	local Item = p1.props.item
	local BadgeCount = Item.badgeCount
	local Icon = Item.icon
	local LayoutOrder = p1.props.layoutOrder
	local ItemStyleProps = p1.props.itemStyleProps
	local IsIsFoundationIcon: boolean = FFlagEnableBlackbird and (FFlagEnableBlackbirdOnMorePage and (typeof(Icon) == "table" and Icon.isFoundationIcon == true))
	local Icon1 = if IsIsFoundationIcon then "" else Icon
	
	return WithLocalizationModule({ title = Item.textKey })(function(p2)
		-- upvalues: RoactModule (upval), MenuTile (upval), BadgeCount (copy), Icon1 (copy), LayoutOrder (copy), p1 (copy), ItemStyleProps (copy), IsIsFoundationIcon (copy), FoundationModule (upval), Icon (copy)
		local Element = RoactModule.createElement(MenuTile, {
			badgeValue = BadgeCount > 0 and BadgeCount or nil,
			icon = Icon1,
			layoutOrder = LayoutOrder,
			onActivated = function()
				-- upvalues: p1 (upval)
				p1.onActivated()
			end,
			title = p2.title,
			styleProps = ItemStyleProps
		})
		
		return if IsIsFoundationIcon then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			LayoutOrder = LayoutOrder
		}, {
			MenuTileBase = Element,
			FoundationIcon = RoactModule.createElement(FoundationModule.Icon, {
				size = 48,
				ZIndex = 10,
				name = Icon.name,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.38)
			})
		}) else Element
	end)
end

local v1 = RoactServices.connect({
	catalogAnalytics = AnalyticsModule,
	linking = AppLinking,
	eventIngest = AppEventIngestServiceModule
})((RoactAppPolicy.connect(function(p1)
	return {
		disableWebViewSupport = not p1.getWebViewSupport(),
		disableIAPEntryPoint = p1.getDisableIAPEntryPoint()
	}
end)((RoactNavigationModule.withNavigation((RoactAppPolicy.connect(function(p1)
	return {
		shouldUseExternalBrowserForMorePageItem = p1.shouldUseExternalBrowserForMorePageItem
	}
end)((RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor, localUserId = p1.LocalUserId }
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetCurrentToastMessageModule (copy), ConstantsModule (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), OpenCentralOverlayForReportLogsModule (copy), CloseCentralOverlayModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end,
		showWebViewNotAvailableToastMessage = function()
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ConstantsModule (upval)
			Callback(SetCurrentToastMessageModule(ConstantsModule.WEBVIEWS_UNAVAILABLE_TOAST))
		end,
		openLeaveRobloxAlertUIBlox = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			Callback(OpenCentralOverlayForLeaveRobloxAlertModule(p1))
		end,
		openReportLogConfirmation = function()
			-- upvalues: Callback (copy), OpenCentralOverlayForReportLogsModule (upval)
			Callback(OpenCentralOverlayForReportLogsModule())
		end,
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(MoreGridItem)))))))))

return function(p1)
	-- upvalues: UseIsSpatialFunction (copy), FFlagEnableMorePageDirectionalLayoutRolloutFix (copy), ResponsiveModule (copy), UseDesignTokensFunction (copy), IconSize (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local IsDirectional = if FFlagEnableMorePageDirectionalLayoutRolloutFix then p1.isDirectional else ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local v2 = nil
	
	if IsDirectional then
		local UseDesignTokensResult = UseDesignTokensFunction()
		v2 = {
			iconStyle = UseDesignTokensResult.LuaApps.More.NavigationItemIconStyle,
			iconSize = IconSize.Large,
			titleStyle = UseDesignTokensResult.LuaApps.More.NavigationItemTitleStyle,
			titleFont = UseDesignTokensResult.LuaApps.More.NavigationItemTitleFont
		}
	end
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		shouldSkipWebViewCheck = UseIsSpatialResult or IsDirectional,
		itemStyleProps = if IsDirectional then v2 else nil
	}))
end