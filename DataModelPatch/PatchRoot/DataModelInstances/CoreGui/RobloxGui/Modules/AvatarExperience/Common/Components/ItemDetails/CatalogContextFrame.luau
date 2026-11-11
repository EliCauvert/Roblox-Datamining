local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AppPageModule = require(Modules.LuaApp.AppPage)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute
local Overlay = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Overlay
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AssetTypeIdStringToName = require(Modules.AvatarExperience.Common.Constants).AssetTypeIdStringToName
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local GetAssetFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.GetAssetFavorite)
local SetAssetFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.SetAssetFavorite)
local GetBundleFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.GetBundleFavorite)
local SetBundleFavoriteModule = require(Modules.AvatarExperience.Catalog.Thunks.SetBundleFavorite)
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local OpenAppItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenAppItemDetails)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithNamedRefsModule = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local NamedRefConstantsModule = require(Modules.AvatarExperience.Common.NamedRefConstants)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local UrlModule = require(Modules.LuaApp.Http.Url)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local AbuseVectorModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.OpenDynamicAbuseReport)
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle
local GetFFlagRestrictLimited2ToSoothsayersModule = require(Modules.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers)
local GetFFlagLuafiedReportEntryPointsFunction = SharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local GetFFlagEnableAbuseReport10ftFunction = SharedFlagsModule.GetFFlagEnableAbuseReport10ft
local GetFFlagFixCatalogContextItemReportURLConstructionFunction = SharedFlagsModule.GetFFlagFixCatalogContextItemReportURLConstruction
local FFlagEnableAbuseReportRevampFlow = SharedFlagsModule.FFlagEnableAbuseReportRevampFlow
local EnableAbuseReportRevampItem2 = game:DefineFastFlag("EnableAbuseReportRevampItem2", false)
local EnableAbuseReportRevampUgcBundle = game:DefineFastFlag("EnableAbuseReportRevampUgcBundle", false)
local AXOpenAppItemDetailsOnTryOnPage = game:DefineFastFlag("AXOpenAppItemDetailsOnTryOnPage", false)
local MigrateConsoleToReportingRevampFlow = game:DefineFastFlag("MigrateConsoleToReportingRevampFlow", false)
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local ReportBundleModule = require(Modules.AvatarExperience.Catalog.Thunks.ReportBundle)
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local ExternalContentSharingProtocol = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local Platform = UserInputService:GetPlatform()
local IsPlatformMatch: boolean = Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or (Platform == Enum.Platform.Linux or Platform == Enum.Platform.UWP))
local IconsActionsFavoriteOff = Images["icons/actions/favoriteOff"]
local IconsActionsFavoriteOn = Images["icons/actions/favoriteOn"]
local IconsMenuCustomize = Images["icons/menu/customize"]
local IconsMenuShop = Images["icons/menu/shop"]
local IconsActionsShare = Images["icons/actions/share"]
local IconsActionsFeedback = Images["icons/actions/feedback"]
local IconsMenuLink = Images["icons/menu/link"]
local IconsActionsInfo = Images["icons/actions/info"]
local CatalogContextFrame = RoactModule.PureComponent:extend("CatalogContextFrame")
CatalogContextFrame.validateProps = TModule.strictInterface({
	itemId = TModule.string,
	itemType = TModule.string,
	onOverlayClosed = TModule.optional(TModule.callback),
	centered = TModule.optional(TModule.boolean),
	itemDetailsPeekViewRefs = TModule.optional(TModule.table),
	hideItemDetailsButtonVisible = TModule.optional(TModule.boolean),
	navigation = TModule.table,
	avatarRoute = AvatarRoute.Interface,
	analytics = TModule.any,
	networking = TModule.any,
	namedRefs = TModule.table,
	shouldShowShareButton = TModule.boolean,
	shouldShareToProvider = TModule.boolean,
	reportingDisabled = TModule.boolean,
	webViewSupport = TModule.boolean,
	useLuafiedReportFlow = if GetFFlagLuafiedReportEntryPointsFunction() or GetFFlagEnableAbuseReport10ftFunction() then TModule.boolean else nil,
	favoritesFetchingState = TModule.any,
	localUserId = TModule.string,
	isFavorited = TModule.optional(TModule.boolean),
	itemData = TModule.optional((require(Modules.AvatarExperience.Common.Validators.ItemDataValidator))),
	screenSize = TModule.Vector2,
	userHasMembership = TModule.boolean,
	isCollectiblesEnabled = if GetFFlagRestrictLimited2ToSoothsayersModule() then TModule.optional(TModule.boolean) else nil,
	collectiblesResaleRestriction = TModule.number,
	itemSubType = TModule.optional(TModule.string),
	priceInRobux = TModule.optional(TModule.number),
	navigateDown = TModule.callback,
	getAssetFavorite = TModule.callback,
	getBundleFavorite = TModule.callback,
	setAssetFavorite = TModule.callback,
	setBundleFavorite = TModule.callback,
	isPortrait = TModule.optional(TModule.boolean),
	getOrGenerateShortShareLink = TModule.callback,
	externalContentSharingProtocol = TModule.any,
	setCurrentToastMessage = TModule.callback,
	openItemDetails = TModule.callback,
	openAppItemDetails = if AXOpenAppItemDetailsOnTryOnPage then TModule.callback else nil,
	reportBundle = TModule.callback,
	openDynamicAbuseReport = if FFlagEnableAbuseReportRevampFlow then TModule.callback else nil,
	closeCentralOverlay = TModule.callback
})

local function _(p1, p2)
	-- upvalues: ConstantsModule (copy)
	local AssetFavorite = nil
	local ItemId = p2.itemId
	local ItemType = p2.itemType
	
	if ItemType == ConstantsModule.ItemType.Asset then
		AssetFavorite = p1.AvatarExperience.Catalog.AssetFavorites[ItemId]
		
		return AssetFavorite
	end
	if ItemType == ConstantsModule.ItemType.Bundle then
		AssetFavorite = p1.AvatarExperience.Catalog.BundleFavorites[ItemId]
	end
	return AssetFavorite
end

local _ = function(p1, p2)
	-- upvalues: ConstantsModule (copy), CatalogConstantsModule (copy), PerformFetch (copy)
	local SetFavoriteAssetKey = nil
	local ItemId = p2.itemId
	local ItemType = p2.itemType
	
	if ItemType == ConstantsModule.ItemType.Asset then
		SetFavoriteAssetKey = CatalogConstantsModule.SetFavoriteAssetKey
	elseif ItemType == ConstantsModule.ItemType.Bundle then
		SetFavoriteAssetKey = CatalogConstantsModule.SetFavoriteBundleKey
	end
	return PerformFetch.GetStatus(p1, SetFavoriteAssetKey .. tostring(ItemId))
end

function CatalogContextFrame.init(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), GetFFlagRestrictLimited2ToSoothsayersModule (copy), RetrievalStatusModule (copy), ToastTypeModule (copy), UrlBuilder (copy), GetFFlagFixCatalogContextItemReportURLConstructionFunction (copy), UrlModule (copy), FFlagEnableAbuseReportRevampFlow (copy), EnableAbuseReportRevampUgcBundle (copy), AbuseVectorModule (copy), Platform (copy), MigrateConsoleToReportingRevampFlow (copy), GetFFlagEnableAbuseReport10ftFunction (copy), IsTenFootInterface (copy), AppPageModule (copy), CatalogConstantsModule (copy), AssetTypeIdStringToName (copy), EnableAbuseReportRevampItem2 (copy), AXOpenAppItemDetailsOnTryOnPage (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ImpressionEnums (copy), NamedRefConstantsModule (copy)
	if p1.props.analytics then
		p1.props.analytics.sendAXCounter(ConstantsModule.Counter.ContextFrame.Open)
	end
	p1.contextMenuSize, p1.updateContextMenuSize = RoactModule.createBinding(UDim2.fromScale(1, 1))
	
	function p1.goToAvatarPage()
		-- upvalues: p1 (copy), NavigationUtilsModule (upval), AvatarScreen (upval)
		p1.props.analytics.clickCustomizeItemButton(p1.props.itemId, p1.props.itemType)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.AvatarEditor)
	end
	
	function p1.openSellPage()
		-- upvalues: p1 (copy), GetFFlagRestrictLimited2ToSoothsayersModule (upval), NavigationUtilsModule (upval), AvatarScreen (upval)
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		local Navigation = p1.props.navigation
		
		if not p1.props.userHasMembership then
			NavigationUtilsModule.navigateToNextOverlay(Navigation, AvatarScreen.PremiumSellOnlyPrompt)
			
			return
		end
		if not GetFFlagRestrictLimited2ToSoothsayersModule() or p1.props.isCollectiblesEnabled then
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.ItemOwnershipPage, {
				itemId = ItemId,
				collectibleItemId = p1.props.itemData.collectibleItemId,
				itemType = ItemType
			})
			
			return
		else
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.SellItemPage, { itemId = ItemId, itemType = ItemType })
		end
	end
	
	function p1.favoriteItem()
		-- upvalues: p1 (copy), RetrievalStatusModule (upval), ConstantsModule (upval)
		local IsFavorited = p1.props.isFavorited
		
		if IsFavorited == nil or p1.props.favoritesFetchingState == RetrievalStatusModule.Fetching then return end
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		local Analytics = p1.props.analytics
		
		if ItemType == ConstantsModule.ItemType.Asset then
			p1.props.setAssetFavorite(ItemId, not IsFavorited)
		elseif ItemType == ConstantsModule.ItemType.Bundle then
			p1.props.setBundleFavorite(ItemId, not IsFavorited)
		end
		Analytics.clickFavoriteItemButton(ItemId, ItemType, not IsFavorited)
	end
	
	function p1.shareItemViaShortLink(Callback, Callback1, Callback2)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.props.getOrGenerateShortShareLink(p1.props.itemId, p1.props.itemType):andThen(function(Result)
			-- upvalues: p1 (upval), ConstantsModule (upval), Callback (copy), Callback1 (copy)
			if Result and Result.responseBody and Result.responseBody.shortUrl then
				p1.props.analytics.sendCounter(ConstantsModule.Counter.GetOrGenerateShortShareLink.Success)
				
				if Callback then
					Callback()
				end
				p1.openShareSheetOrCopyLink(Result.responseBody.shortUrl)
				
				return
			else
				p1.props.analytics.sendCounter(ConstantsModule.Counter.GetOrGenerateShortShareLink.Invalid)
				
				if Callback1 then
					Callback1(Result)
				end
				p1.shareItem()
			end
		end):catch(function(Err)
			-- upvalues: p1 (upval), ConstantsModule (upval), Callback2 (copy)
			p1.props.analytics.sendCounter(ConstantsModule.Counter.GetOrGenerateShortShareLink.Failure)
			
			if Callback2 then
				Callback2(Err)
			end
			p1.shareItem()
		end)
	end
	
	function p1.popupLinkCopiedToast()
		-- upvalues: p1 (copy), ToastTypeModule (upval), ConstantsModule (upval)
		p1.props.setCurrentToastMessage({
			toastMessage = "Feature.Catalog.Toast.LinkCopied",
			toastType = ToastTypeModule.SuccessConfirmation
		})
		p1.props.analytics.sendCounter(ConstantsModule.Counter.GetOrGenerateShortShareLink.LinkCopied)
	end
	
	function p1.openShareSheetOrCopyLink(Url)
		-- upvalues: p1 (copy)
		p1.props.analytics.clickShareItemButton(p1.props.itemId, p1.props.itemType)
		p1.closePrompt()
		p1.props.externalContentSharingProtocol:shareUrl({ context = "CatalogMoreMenu", url = Url })
	end
	
	function p1.shareItem()
		-- upvalues: UrlBuilder (upval), p1 (copy)
		p1.openShareSheetOrCopyLink((UrlBuilder.catalog.info.appsflyer({ assetId = p1.props.itemId, assetType = p1.props.itemType })))
	end
	
	function p1.reportItem(Title)
		-- upvalues: p1 (copy), GetFFlagFixCatalogContextItemReportURLConstructionFunction (upval), UrlModule (upval), ConstantsModule (upval), FFlagEnableAbuseReportRevampFlow (upval), EnableAbuseReportRevampUgcBundle (upval), AbuseVectorModule (upval), Platform (upval), MigrateConsoleToReportingRevampFlow (upval), GetFFlagEnableAbuseReport10ftFunction (upval), IsTenFootInterface (upval), AppPageModule (upval), CatalogConstantsModule (upval), AssetTypeIdStringToName (upval), NavigationUtilsModule (upval), AvatarScreen (upval), EnableAbuseReportRevampItem2 (upval)
		local Navigation = p1.props.navigation
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		local ItemData = p1.props.itemData
		local LocalUserId = p1.props.localUserId
		local Text: string = if GetFFlagFixCatalogContextItemReportURLConstructionFunction() then UrlModule.BASE_URL .. "abusereport/asset?id=" .. ItemId else UrlModule.BASE_URL .. "/abusereport/asset?id=" .. ItemId
		local ItemCreatorId = nil
		local Name = nil
		local ItemName = nil
		local ItemDescription = nil
		local AssetType = nil
		
		if ItemData then
			if ItemData.creator then
				ItemCreatorId = ItemData.creator.id
				Name = ItemData.creator.name
			end
			ItemName = ItemData.name
			ItemDescription = ItemData.description
			AssetType = ItemData.assetType
		end
		if ItemType == ConstantsModule.ItemType.Bundle then
			if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampUgcBundle then
				p1.props.openDynamicAbuseReport({
					abuseVector = AbuseVectorModule.UgcBundle,
					targetId = ItemId,
					onClose = function()
						-- upvalues: p1 (upval)
						p1.props.closeCentralOverlay()
					end
				})
			else
				p1.props.reportBundle(p1.props.networking, ItemId, Platform, DateTime.now().UnixTimestampMillis)
			end
			p1.closePrompt()
			
			return
		elseif MigrateConsoleToReportingRevampFlow or not p1.props.useLuafiedReportFlow then
			if not MigrateConsoleToReportingRevampFlow and IsTenFootInterface then
				NavigationUtilsModule.navigateToNextOverlay(Navigation, AvatarScreen.CatalogReport, {
					userId = LocalUserId,
					itemId = ItemId,
					itemCreatorId = ItemCreatorId,
					itemName = ItemName,
					itemDescription = ItemDescription
				})
				
				return
			end
			if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampItem2 then
				p1.props.openDynamicAbuseReport({
					abuseVector = AbuseVectorModule.Accessory,
					targetId = ItemId,
					onClose = function()
						-- upvalues: p1 (upval)
						p1.props.closeCentralOverlay()
					end,
					custom = { assetTypeName = AssetTypeIdStringToName[AssetType] }
				})
				
				return
			else
				p1.closePrompt()
				p1.props.navigateDown({
					name = AppPageModule.GenericWebPage,
					detail = Text,
					extraProps = { title = Title }
				})
				
				return
			end
		elseif GetFFlagEnableAbuseReport10ftFunction() and IsTenFootInterface then
			p1.props.navigateDown({
				name = AppPageModule.ReportScreen,
				reportData = {
					assetId = ItemId,
					platform = CatalogConstantsModule.ReportScreen.Platforms.Console,
					context = CatalogConstantsModule.ReportScreen.Contexts.Item,
					reportAbuseVector = AssetTypeIdStringToName[AssetType]
				}
			})
			
			return
		else
			NavigationUtilsModule.navigateToNextOverlay(Navigation, AvatarScreen.ReportDialog, {
				userId = LocalUserId,
				itemId = ItemId,
				itemCreatorId = ItemCreatorId,
				itemCreatorName = Name,
				itemName = ItemName,
				itemDescription = ItemDescription,
				assetTypeName = AssetTypeIdStringToName[AssetType]
			})
		end
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
	
	function p1.onViewDetailsPageActivate()
		-- upvalues: p1 (copy), ConstantsModule (upval), AXOpenAppItemDetailsOnTryOnPage (upval), AvatarScreen (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ImpressionEnums (upval), NamedRefConstantsModule (upval)
		p1.props.analytics.sendAXCounter(ConstantsModule.Counter.ContextFrame.ViewDetailsPageClick)
		p1.closePrompt()
		
		if not AXOpenAppItemDetailsOnTryOnPage or p1.props.avatarRoute.current.name ~= AvatarScreen.TryOnItem then
			p1.props.openItemDetails({
				showFullWithNoPeekView = true,
				closePreviousItemDetails = true,
				itemId = p1.props.itemId,
				itemType = p1.props.itemType,
				itemSubType = p1.props.itemSubType,
				priceInRobux = p1.props.priceInRobux,
				avatarRoute = p1.props.avatarRoute,
				navigation = p1.props.navigation,
				resultsListRef = p1.props.namedRefs[p1.props.avatarRoute.opaque.name .. NamedRefConstantsModule.ItemsList],
				itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
				catalogAnalytics = p1.props.analytics
			})
			
			return
		end
		if FFlagAXFixPurchaseSurfaceLogging then
			p1.props.openAppItemDetails(p1.props.itemId, p1.props.itemType, true, true, ImpressionEnums.MarketplaceSurfaceType.USER_PROFILE)
			
			return
		else
			p1.props.openAppItemDetails(p1.props.itemId, p1.props.itemType, true)
		end
	end
end

function CatalogContextFrame.didMount(p1)
	-- upvalues: ConstantsModule (copy)
	if p1.props.isFavorited == nil then
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		
		if ItemType == ConstantsModule.ItemType.Asset then
			p1.props.getAssetFavorite(ItemId)
			
			return
		end
		if ItemType == ConstantsModule.ItemType.Bundle then
			p1.props.getBundleFavorite(ItemId)
		end
	end
end

function CatalogContextFrame.renderWithProviders(p1, p2, p3)
	-- upvalues: IconsActionsFavoriteOn (copy), IconsActionsFavoriteOff (copy), CatalogUtilsModule (copy), AvatarScreen (copy), IconsMenuCustomize (copy), IconsActionsInfo (copy), IsTenFootInterface (copy), CatalogConstantsModule (copy), IconsMenuShop (copy), IsPlatformMatch (copy), IconsActionsShare (copy), IconsMenuLink (copy), ConstantsModule (copy), IconsActionsFeedback (copy), RoactModule (copy), Overlay (copy)
	local Centered = p1.props.centered
	local ItemType = p1.props.itemType
	local ItemData = p1.props.itemData
	local IsFavorited = p1.props.isFavorited
	local ScreenSize = p1.props.screenSize
	local Name = p1.props.avatarRoute.opaque.name
	local UserHasMembership = p1.props.userHasMembership
	local ReportingDisabled = p1.props.reportingDisabled
	local CollectiblesResaleRestriction = p1.props.collectiblesResaleRestriction
	local Name1 = p1.props.avatarRoute.current.name
	local IconsActionsFavoriteOn1 = IsFavorited and IconsActionsFavoriteOn or IconsActionsFavoriteOff
	local NoReportingDisabled: boolean = (ItemData.creator and ItemData.creator.id) ~= "1" and not ReportingDisabled
	local IsResellable = CatalogUtilsModule.IsResellable(ItemData)
	local UnfavoriteLabel = IsFavorited and p2.unfavoriteLabel or p2.favoriteLabel
	local ReportLabel = p2.reportLabel
	local List = {}
	local IsOwned = ItemData.isOwned
	
	if IsOwned and Name ~= AvatarScreen.AvatarEditor then
		table.insert(List, {
			icon = IconsMenuCustomize,
			text = p2.customizeLabel,
			onActivated = p1.goToAvatarPage
		})
	end
	if Name1 ~= AvatarScreen.ItemDetails and not p1.props.hideItemDetailsButtonVisible then
		table.insert(List, {
			icon = IconsActionsInfo,
			text = p2.viewDetailsPageLabel,
			onActivated = p1.onViewDetailsPageActivate
		})
	end
	table.insert(List, {
		icon = IconsActionsFavoriteOn1,
		text = UnfavoriteLabel,
		onActivated = p1.favoriteItem
	})
	local IsNotCollectiblesResaleRestrictionMatch: boolean = if IsTenFootInterface then UserHasMembership and CollectiblesResaleRestriction ~= CatalogConstantsModule.ResaleRestriction.Disabled else CollectiblesResaleRestriction ~= CatalogConstantsModule.ResaleRestriction.Disabled
	
	if IsOwned and IsResellable and IsNotCollectiblesResaleRestrictionMatch then
		table.insert(List, {
			icon = IconsMenuShop,
			text = p2.sellLabel,
			onActivated = p1.openSellPage
		})
	end
	if p1.props.shouldShowShareButton and (not IsTenFootInterface and p1.props.webViewSupport) then
		if not p1.props.shouldShareToProvider then
			table.insert(List, {
				icon = IconsActionsShare,
				text = p2.shareLabel,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.shareItemViaShortLink()
				end
			})
		end
	elseif IsPlatformMatch then
		table.insert(List, {
			icon = IconsMenuLink,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.shareItemViaShortLink(p1.popupLinkCopiedToast, p1.popupLinkCopiedToast, p1.popupLinkCopiedToast)
			end,
			text = p2.copyLink
		})
	end
	local IsItemTypeMatch = ItemType == ConstantsModule.ItemType.Bundle
	local UseLuafiedReportFlow = p1.props.useLuafiedReportFlow or (p1.props.webViewSupport or IsItemTypeMatch)
	local IsItemTypeMatch1: boolean = ItemType == ConstantsModule.ItemType.Asset or IsItemTypeMatch
	
	if NoReportingDisabled and (IsItemTypeMatch1 and UseLuafiedReportFlow) then
		table.insert(List, {
			icon = IconsActionsFeedback,
			text = ReportLabel,
			onActivated = function()
				-- upvalues: p1 (copy), ReportLabel (copy)
				p1.reportItem(ReportLabel)
			end
		})
	end
	local IsPortrait = p1.props.isPortrait
	local LandscapeNavWidth = if IsPortrait then 0 else ConstantsModule.LandscapeNavWidth
	local LandscapeSceneWidth = if IsPortrait then 1 else ConstantsModule.LandscapeSceneWidth
	local _UDim2 = nil
	local _UDim2_1 = nil
	
	if Centered and not IsPortrait then
		local Smallest = math.min(ScreenSize.X, 640)
		_UDim2 = UDim2.fromOffset((ScreenSize.X - Smallest) / 2, 0)
		_UDim2_1 = UDim2.new(0, Smallest, 1, 0)
	else
		_UDim2 = UDim2.fromScale(LandscapeNavWidth, 0)
		_UDim2_1 = UDim2.fromScale(LandscapeSceneWidth, 1)
	end
	if Centered then
		_UDim2 = UDim2.fromScale(0.5, 0)
	end
	return RoactModule.createElement(Overlay, {
		BackgroundTransparency = 1,
		Position = _UDim2,
		Size = _UDim2_1,
		AnchorPoint = if Centered then Vector2.new(0.5, 0) else nil
	}, { SizeFrame = p1:renderInnerFrame(List, -76, p3) })
end

function CatalogContextFrame.renderInnerFrame(p1, ButtonProps, Offset, p2)
	-- upvalues: RoactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ContextualMenu (copy), MenuDirection (copy)
	local Tokens = p2.Tokens
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.fromScale(1, 1)
	}, {
		ContextMenuPadding = RoactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then Tokens.Size.Size_600 else Tokens.Global.Size_300),
			PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then Tokens.Size.Size_600 else Tokens.Global.Size_300)
		}),
		ContextMenu = RoactModule.createElement(ContextualMenu, {
			open = true,
			closeBackgroundVisible = true,
			buttonProps = ButtonProps,
			menuDirection = MenuDirection.Up,
			openPositionY = UDim.new(1, Offset),
			screenSize = p1.props.screenSize,
			contextMenuWidthOverride = UDim.new(1, 0),
			onDismiss = p1.closePrompt
		})
	})
end

function CatalogContextFrame.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	if not p1.props.itemData then return end
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy)
		return WithLocalizationFunction({
			copyLink = "Feature.Catalog.Action.CopyLink",
			customizeLabel = "Feature.Catalog.Action.Customize",
			favoriteLabel = "Feature.Catalog.Action.Favorite",
			unfavoriteLabel = "Feature.Catalog.Action.RemoveFavorite",
			sellLabel = "Feature.Catalog.Action.Sell",
			shareLabel = "Feature.SocialShare.Action.Share",
			reportLabel = "Feature.Catalog.Action.Report",
			viewDetailsPageLabel = "Feature.Catalog.Action.ViewDetailsPage"
		})(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p3, p2)
		end)
	end)
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	-- upvalues: GetFFlagLuafiedReportEntryPointsFunction (copy), GetFFlagEnableAbuseReport10ftFunction (copy)
	return {
		shouldShowShareButton = p1.shouldShowCatalogShareButton(),
		shouldShareToProvider = p1.shouldShareToAccountProvider(),
		reportingDisabled = p1.getCatalogReportingDisabled(),
		webViewSupport = p1.getWebViewSupport(),
		useLuafiedReportFlow = if GetFFlagLuafiedReportEntryPointsFunction() or GetFFlagEnableAbuseReport10ftFunction() then p1.getUseLuafiedReportFlow() else nil
	}
end)((RoactServices.connect({
	analytics = AnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), CatalogUtilsModule (copy), CatalogConstantsModule (copy), ConstantsModule (copy), PerformFetch (copy), GetFFlagRestrictLimited2ToSoothsayersModule (copy), SelectIsPortraitModule (copy), ExternalContentSharingProtocol (copy)
	local ItemType = p2.itemType
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, ItemType)
	local ItemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemDataModuleResult)
	local PriceInRobux = ItemDataModuleResult and ItemDataModuleResult.priceInRobux
	local User = p1.Users[p1.LocalUserId]
	local Membership = User and User.membership
	local CollectibleItemId = if ItemDataModuleResult then ItemDataModuleResult.collectibleItemId else nil
	local CollectiblesItem = if CollectibleItemId then p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[CollectibleItemId] else nil
	local ResaleRestriction = if CollectiblesItem then CollectiblesItem.resaleRestriction else CatalogConstantsModule.ResaleRestriction.None
	local t = {}
	local SetFavoriteAssetKey = nil
	local ItemId = p2.itemId
	local ItemType1 = p2.itemType
	
	if ItemType1 == ConstantsModule.ItemType.Asset then
		SetFavoriteAssetKey = CatalogConstantsModule.SetFavoriteAssetKey
	elseif ItemType1 == ConstantsModule.ItemType.Bundle then
		SetFavoriteAssetKey = CatalogConstantsModule.SetFavoriteBundleKey
	end
	t.favoritesFetchingState = PerformFetch.GetStatus(p1, SetFavoriteAssetKey .. tostring(ItemId))
	t.localUserId = p1.LocalUserId
	local AssetFavorite = nil
	local ItemId1 = p2.itemId
	local ItemType2 = p2.itemType
	
	if ItemType2 == ConstantsModule.ItemType.Asset then
		AssetFavorite = p1.AvatarExperience.Catalog.AssetFavorites[ItemId1]
	elseif ItemType2 == ConstantsModule.ItemType.Bundle then
		AssetFavorite = p1.AvatarExperience.Catalog.BundleFavorites[ItemId1]
	end
	t.isFavorited = AssetFavorite
	t.itemData = ItemDataModuleResult
	t.screenSize = p1.ScreenSize
	t.userHasMembership = Membership ~= Enum.MembershipType.None
	t.isCollectiblesEnabled = if GetFFlagRestrictLimited2ToSoothsayersModule() then p1.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled else nil
	t.isPortrait = SelectIsPortraitModule(p1)
	t.collectiblesResaleRestriction = ResaleRestriction
	t.externalContentSharingProtocol = ExternalContentSharingProtocol.default
	t.itemSubType = ItemSubType
	t.priceInRobux = PriceInRobux
	
	return t
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), GetBundleFavoriteModule (copy), GetAssetFavoriteModule (copy), SetAssetFavoriteModule (copy), SetBundleFavoriteModule (copy), WebApiModule (copy), SetCurrentToastMessageModule (copy), OpenItemDetailsModule (copy), AXOpenAppItemDetailsOnTryOnPage (copy), FFlagAXFixPurchaseSurfaceLogging (copy), OpenAppItemDetailsModule (copy), ReportBundleModule (copy), FFlagEnableAbuseReportRevampFlow (copy), OpenDynamicAbuseReportModule (copy), CloseCentralOverlayFunction (copy)
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
		getBundleFavorite = function(p1)
			-- upvalues: Callback (copy), GetBundleFavoriteModule (upval)
			Callback(GetBundleFavoriteModule(p1))
		end,
		getAssetFavorite = function(p1)
			-- upvalues: Callback (copy), GetAssetFavoriteModule (upval)
			Callback(GetAssetFavoriteModule(p1))
		end,
		setAssetFavorite = function(p1, p2)
			-- upvalues: Callback (copy), SetAssetFavoriteModule (upval)
			Callback(SetAssetFavoriteModule(p1, p2))
		end,
		setBundleFavorite = function(p1, p2)
			-- upvalues: Callback (copy), SetBundleFavoriteModule (upval)
			Callback(SetBundleFavoriteModule(p1, p2))
		end,
		getOrGenerateShortShareLink = function(p1, p2)
			-- upvalues: Callback (copy), WebApiModule (upval)
			return Callback(WebApiModule.GetOrGenerateShortShareLink(p1, p2))
		end,
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			return Callback(SetCurrentToastMessageModule(p1))
		end,
		openItemDetails = function(p1)
			-- upvalues: Callback (copy), OpenItemDetailsModule (upval)
			Callback(OpenItemDetailsModule(p1))
		end,
		openAppItemDetails = if AXOpenAppItemDetailsOnTryOnPage then if FFlagAXFixPurchaseSurfaceLogging then function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), OpenAppItemDetailsModule (upval)
			Callback(OpenAppItemDetailsModule(p1, p2, p3, p4, p5))
		end else function(p1, p2, p3)
			-- upvalues: Callback (copy), OpenAppItemDetailsModule (upval)
			Callback(OpenAppItemDetailsModule(p1, p2, p3))
		end else nil,
		reportBundle = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), ReportBundleModule (upval)
			Callback(ReportBundleModule(p1, p2, p3, p4))
		end,
		openDynamicAbuseReport = if FFlagEnableAbuseReportRevampFlow then function(p1)
			-- upvalues: Callback (copy), OpenDynamicAbuseReportModule (upval)
			Callback(OpenDynamicAbuseReportModule(p1))
		end else nil,
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			Callback(CloseCentralOverlayFunction())
		end
	}
end)(CatalogContextFrame)))))

if FFlagAXMigrateAXToGlobalAutofocus then
	v1 = WithOverlayFocusHandlingModule(v1)
end
return (WithNamedRefsModule((WithMappedNavigationParamsModule((WithAvatarRouteModule(v1))))))