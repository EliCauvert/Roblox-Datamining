local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local Images = UIBloxModule.App.ImageSet.Images
local OtterModule = require(CorePackages.Packages.Otter)
local CryoModule = require(CorePackages.Packages.Cryo)
local ApolloClientModule = require(CorePackages.Packages.ApolloClient)
local UseQuery = ApolloClientModule.useQuery
local GqlFunction = ApolloClientModule.gql
local ExternalContentSharingProtocol = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local UseUserExperiment = RoactAppExperimentModule.useUserExperiment
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local ToastType = require(CorePackages.Workspace.Packages.ToastRodux).Enums.ToastType
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local Selectors = NavigationRoduxModule.Selectors
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local SetCurrentToastMessageFunction = require(CorePackages.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
local GameInviteModalManager = GameInviteModule.GameInviteModalManager
local GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager
local GameInviteConstants = GameInviteModule.GameInviteConstants
local AbuseVectorModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.OpenDynamicAbuseReport)
local UseEdpServerIxpVariablesModule = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables)
local ExperienceDetailsExperimentationModule = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation)
local GameDetailRoduxModule = require(CorePackages.Workspace.Packages.GameDetailRodux)
local ApiFetchGameDetails = GameDetailRoduxModule.GameDetails.ApiFetchGameDetails
local FetchGamePlayabilityAndProductInfo = GameDetailRoduxModule.FetchGamePlayabilityAndProductInfo
local GameDetailsEvents = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents
local CopyExperienceLinkFunction = GameDetailsEvents.CopyExperienceLink
local FavoriteFunction = GameDetailsEvents.Favorite
local FollowFunction = GameDetailsEvents.Follow
local OpenMoreFunction = GameDetailsEvents.OpenMore
local RequestRefundClickFunction = GameDetailsEvents.RequestRefundClick
local ShareExperienceLinkFunction = GameDetailsEvents.ShareExperienceLink
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local SetGameFavoriteModule = require(Modules.LuaApp.Actions.Games.SetGameFavorite)
local GamePostFavoriteModule = require(Modules.LuaApp.Thunks.Games.GamePostFavorite)
local SetGameFollowModule = require(Modules.LuaApp.Actions.SetGameFollow)
local SendGameFollowModule = require(Modules.LuaApp.Thunks.SendGameFollow)
local SetExperienceNotificationsEnabledCountModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount)
local OpenReportDialogModule = require(Modules.LuaApp.Thunks.OpenReportDialog)
local OpenReportScreenModule = require(Modules.LuaApp.Thunks.OpenReportScreen)
local OpenRequestRefundPageModule = require(Modules.LuaApp.Thunks.OpenRequestRefundPage)
local ConstantsModule = require(Modules.LuaApp.Constants)
local ShareLinkTypesModule = require(Modules.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes)
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagLuaAppFixFavoriteAndFollowOptionsTextModule = require(Modules.LuaApp.Flags.FFlagLuaAppFixFavoriteAndFollowOptionsText)
local GetLuaAppGameDetailsMoreShareButtonEnabledV2Module = require(Modules.LuaApp.Flags.GetLuaAppGameDetailsMoreShareButtonEnabledV2)
local GetFFlagLuafiedReportEntryPointsFunction = SharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local GetFFlagEnableAbuseReport10ftFunction = SharedFlagsModule.GetFFlagEnableAbuseReport10ft
local GetNotificationsExperienceDetailsVariant = require(CorePackages.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant
local GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagLuaAppRenameFriendsToConnectionsEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppRenameFriendsToConnectionsEdp
local FFlagEnableAbuseReportRevampFlow = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow
local EnableAbuseReportRevampExperience = game:DefineFastFlag("EnableAbuseReportRevampExperience", false)
local FFlagAddThumbnailSelectorReport = SharedFlagsModule.FFlagAddThumbnailSelectorReport
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local ExperienceDetailsCopyLinkExperimentVariant = game:DefineFastString("ExperienceDetailsCopyLinkExperimentVariant", "enableCopyLinkButton")
local SocialExperienceDetailsContextualMenuLayer = game:DefineFastString("SocialExperienceDetailsContextualMenuLayer", "Social.ExperienceDetailsContextualMenu")
local GameDetailMoreContextualMenu = RoactModule.PureComponent:extend("GameDetailMoreContextualMenu")
GameDetailMoreContextualMenu.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	menuPosition = TModule.optional(TModule.UDim2),
	onClose = TModule.optional(TModule.callback),
	menuAnchorPoint = TModule.optional(TModule.Vector2),
	externalContentSharingProtocol = TModule.table,
	hideCloseButton = TModule.optional(TModule.boolean),
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	edpServerIxpVariables = TModule.optional(TModule.table),
	closeCentralOverlayThunk = TModule.optional(TModule.callback),
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	rootPlaceId = TModule.optional(TModule.string),
	isFavorite = TModule.optional(TModule.boolean),
	gameFollowings = TModule.optional(TModule.table),
	currentPage = TModule.string,
	shareButtonEnabled = TModule.boolean,
	screenSize = TModule.optional(TModule.Vector2),
	deviceOrientation = TModule.string,
	notificationsEnabled = TModule.table,
	refundLink = TModule.optional(TModule.string),
	closeCallback = TModule.callback,
	gamePostFavorite = TModule.callback,
	setGameFavorite = TModule.callback,
	sendGameFollow = TModule.callback,
	setGameFollow = TModule.callback,
	setCurrentToastMessage = TModule.callback,
	navigateDown = TModule.callback,
	setToastMessage = TModule.callback,
	reportExperienceDialog = if GetFFlagLuafiedReportEntryPointsFunction() then TModule.callback else nil,
	reportExperienceScreen = if GetFFlagEnableAbuseReport10ftFunction() then TModule.callback else nil,
	setExperienceNotificationsEnabledCount = TModule.callback,
	openRequestRefundPage = TModule.callback,
	fetchGameDetail = TModule.callback,
	fetchPlayabilityAndProductInfo = TModule.callback,
	openDynamicAbuseReport = if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampExperience then TModule.callback else nil,
	shouldShowShareButton = TModule.boolean,
	shouldShareToProvider = TModule.boolean,
	reportingDisabled = TModule.boolean,
	supportsWebViews = TModule.boolean,
	useLuafiedReportFlow = if GetFFlagLuafiedReportEntryPointsFunction() or GetFFlagEnableAbuseReport10ftFunction() then TModule.optional(TModule.boolean) else nil,
	inviteFriendsDisabled = TModule.boolean,
	webViewSupport = TModule.boolean,
	notificationsCanEnableExperience = TModule.boolean,
	renameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then TModule.optional(TModule.boolean) else nil,
	enableNotificationsDiscoverability = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then nil else TModule.boolean,
	enableNotificationsRebrand = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then nil else TModule.boolean,
	enableCopyLink = TModule.optional(TModule.any),
	shareLinkId = TModule.optional(TModule.string),
	networking = TModule.callback,
	localization = TModule.table,
	eventIngest = TModule.table,
	guiService = if GetFFlagEnableAbuseReport10ftFunction() then TModule.union(TModule.Instance, TModule.table) else nil
})

local function generateExperienceDetailsShareLinkUrl(ShareLinkId, UniverseId, RootPlaceId)
	-- upvalues: UrlBuilder (copy), ShareLinkTypesModule (copy)
	local Stamp: string? = nil
	
	if ShareLinkId then
		Stamp = tostring(DateTime.now().UnixTimestampMillis)
		
		return UrlBuilder.sharelinks.shortUrl({
			linkId = ShareLinkId,
			type = ShareLinkTypesModule.ExperienceDetails,
			stamp = Stamp
		}), Stamp
	else
		return UrlBuilder.game.info.appsflyer({ universeId = UniverseId, placeId = RootPlaceId }), Stamp
	end
end

GameDetailMoreContextualMenu.defaultProps = {
	externalContentSharingProtocol = ExternalContentSharingProtocol.default,
	onClose = function() end
}

function GameDetailMoreContextualMenu.init(p1)
	-- upvalues: UrlBuilder (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	p1.isMounted = false
	p1.menuItemNames = {}
	
	function p1.getMenuPos()
		-- upvalues: p1 (copy)
		return if p1.props.menuPosition == nil then UDim2.fromOffset(0, 0) else p1.props.menuPosition
	end
	
	function p1.getMenuSize(): UDim2
		return UDim2.new(0, 300, 1, 0)
	end
	
	function p1.getMenuAnchor()
		-- upvalues: p1 (copy)
		return if p1.props.menuPosition == nil or p1.props.screenSize == nil then nil elseif p1.props.menuAnchorPoint then p1.props.menuAnchorPoint else Vector2.new(0, 0)
	end
	
	function p1.getLinkPage()
		-- upvalues: UrlBuilder (upval), p1 (copy)
		return (UrlBuilder.game.report({ placeId = p1.props.rootPlaceId }))
	end
	
	function p1.closeCallback()
		-- upvalues: p1 (copy)
		if p1.props.onClose then
			p1.props.onClose()
		end
		p1.props.closeCallback()
	end
	
	function p1.onRequestRefundPageClose()
		-- upvalues: p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
		p1.props.fetchGameDetail(p1.props.networking, p1.props.universeId, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil)
		p1.props.fetchPlayabilityAndProductInfo(p1.props.networking, p1.props.universeId)
	end
end

function GameDetailMoreContextualMenu.renderContextualMenuContent(p1, p2)
	-- upvalues: FFlagLuaAppRenameFriendsToConnectionsEdp (copy), Images (copy), FFlagLuaAppFixFavoriteAndFollowOptionsTextModule (copy), GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), FavoriteFunction (copy), ToastType (copy), FollowFunction (copy), GameInviteAnalyticsManager (copy), GameInviteModalManager (copy), GameInviteConstants (copy), generateExperienceDetailsShareLinkUrl (copy), CopyExperienceLinkFunction (copy), AppPage (copy), ShareExperienceLinkFunction (copy), GetFFlagEnableAbuseReport10ftFunction (copy), ConstantsModule (copy), FFlagEnableAbuseReportRevampFlow (copy), EnableAbuseReportRevampExperience (copy), AbuseVectorModule (copy), FFlagAddThumbnailSelectorReport (copy), RequestRefundClickFunction (copy)
	local List = {}
	p1.menuItemNames = {}
	local RootPlaceId = p1.props.rootPlaceId
	local EventIngest = p1.props.eventIngest
	local Networking = p1.props.networking
	local UniverseId = p1.props.universeId
	local GuiService = p1.props.guiService
	local NotificationsCanEnableExperience = p1.props.notificationsCanEnableExperience
	local RenameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then p1.props.renameFriendsToConnections else nil
	local IconsActionsFavoriteOn = Images["icons/actions/favoriteOn"]
	local IconsActionsFavoriteOff = Images["icons/actions/favoriteOff"]
	local IsFavorite = p1.props.isFavorite ~= nil and (p1.props.isFavorite or false)
	local NoIsFavorite = p1.props.isFavorite == nil
	local IconsActionsFavoriteOn1 = IsFavorite and IconsActionsFavoriteOn or IconsActionsFavoriteOff
	local FavoritedLabel = FFlagLuaAppFixFavoriteAndFollowOptionsTextModule and (IsFavorite and p2.favoritedLabel) or p2.favoriteLabel
	local EnableNotificationsDiscoverability = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then true else p1.props.enableNotificationsDiscoverability
	
	if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) or (not p1.props.edpServerIxpVariables or p1.props.edpServerIxpVariables.hideFavoritesInContextMenu ~= true) then
		table.insert(List, {
			stayOnActivated = true,
			icon = IconsActionsFavoriteOn1,
			text = FavoritedLabel,
			onActivated = function()
				-- upvalues: p1 (copy), NoIsFavorite (copy), RootPlaceId (copy), Networking (copy), UniverseId (copy), IsFavorite (copy), FavoriteFunction (upval), EventIngest (copy)
				if p1.isMounted and not NoIsFavorite and RootPlaceId then
					p1.props.setGameFavorite(UniverseId, not IsFavorite)
					p1.props.gamePostFavorite(Networking, UniverseId, not IsFavorite)
					FavoriteFunction(EventIngest, "GameDetailMoreContextualMenu", RootPlaceId, not IsFavorite)
					
					return
				end
			end
		})
		table.insert(p1.menuItemNames, "Favorite")
	end
	if NotificationsCanEnableExperience and not EnableNotificationsDiscoverability and (not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) or (not p1.props.edpServerIxpVariables or p1.props.edpServerIxpVariables.hideNotifyInContextMenu ~= true)) then
		local NoGameFollowings = p1.props.gameFollowings == nil
		local IsFollowed = p1.props.gameFollowings ~= nil and (p1.props.gameFollowings.isFollowed or false)
		local IconsCommonNotificationOn = Images["icons/common/notificationOn"]
		local IconsCommonNotificationOff = Images["icons/common/notificationOff"]
		table.insert(List, {
			stayOnActivated = true,
			text = FFlagLuaAppFixFavoriteAndFollowOptionsTextModule and (IsFollowed and p2.followingLabel) or p2.followLabel,
			icon = IsFollowed and IconsCommonNotificationOn or IconsCommonNotificationOff,
			disabled = NoGameFollowings,
			onActivated = function()
				-- upvalues: p1 (copy), NoGameFollowings (copy), RootPlaceId (copy), ToastType (upval), UniverseId (copy), Networking (copy), FollowFunction (upval), EventIngest (copy)
				if not p1.isMounted or NoGameFollowings or not RootPlaceId then return end
				local IsFollowed = p1.props.gameFollowings.isFollowed
				local SetCurrentToastMessageFunction: (any) -> () = p1.props.setCurrentToastMessage
				local Count = p1.props.notificationsEnabled.count or 0
				local Limit = p1.props.notificationsEnabled.limit or 0
				
				if IsFollowed then
					p1.props.setExperienceNotificationsEnabledCount(Count - 1)
				else
					if Limit <= Count then
						SetCurrentToastMessageFunction({
							toastType = ToastType.GameFollowError,
							toastMessage = if p1.props.enableNotificationsRebrand then "Feature.GameFollows.TooltipNotificationsLimitReached" else "Feature.GameFollows.TooltipFollowLimitReached"
						})
						
						return
					end
					p1.props.setExperienceNotificationsEnabledCount(Count + 1)
				end
				p1.props.setGameFollow(UniverseId, not IsFollowed)
				p1.props.sendGameFollow(Networking, UniverseId, not IsFollowed, false, Count, Limit)
				FollowFunction(EventIngest, "GameDetailMoreContextualMenu", RootPlaceId, not IsFollowed)
			end
		})
		table.insert(p1.menuItemNames, "Follow")
	end
	if not p1.props.inviteFriendsDisabled then
		table.insert(List, {
			text = if FFlagLuaAppRenameFriendsToConnectionsEdp and RenameFriendsToConnections then p2.inviteConnections else p2.inviteFriends,
			icon = Images["icons/actions/friends/friendInvite"],
			onActivated = function()
				-- upvalues: p1 (copy), RootPlaceId (copy), GameInviteAnalyticsManager (upval), UniverseId (copy), GameInviteModalManager (upval), GameInviteConstants (upval)
				if p1.isMounted and RootPlaceId then
					GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.GameDetailsMoreMenu)
					GameInviteAnalyticsManager:inputShareGameEntryPoint(RootPlaceId, UniverseId)
					GameInviteModalManager:openModal({
						trigger = GameInviteConstants.Triggers.GameDetailsMoreMenu,
						rootPlaceId = RootPlaceId,
						universeId = UniverseId,
						hideCloseButton = p1.props.hideCloseButton
					})
					p1.closeCallback()
					
					return
				end
			end
		})
		table.insert(p1.menuItemNames, "InviteFriends")
	end
	if p1.props.enableCopyLink then
		table.insert(List, {
			icon = Images["icons/menu/link"],
			onActivated = function()
				-- upvalues: p1 (copy), RootPlaceId (copy), generateExperienceDetailsShareLinkUrl (upval), UniverseId (copy), CopyExperienceLinkFunction (upval), EventIngest (copy), ToastType (upval)
				if p1.isMounted and RootPlaceId then
					local ExperienceDetailsShareLinkUrl, ExperienceDetailsShareLinkUrl2 = generateExperienceDetailsShareLinkUrl(p1.props.shareLinkId, UniverseId, RootPlaceId)
					p1.props.externalContentSharingProtocol:shareUrl({
						context = "GameDetailsMoreWebURL",
						url = ExperienceDetailsShareLinkUrl
					})
					CopyExperienceLinkFunction(EventIngest, "GameDetailMoreContextualMenu", RootPlaceId, { stamp = ExperienceDetailsShareLinkUrl2 })
					p1.props.setCurrentToastMessage({
						toastMessage = "Feature.GameDetails.Toast.LinkCopied",
						toastType = ToastType.SuccessConfirmation
					})
					p1.closeCallback()
					
					return
				end
			end,
			text = p2.copyLink
		})
		table.insert(p1.menuItemNames, "CopyLink")
	end
	if p1.props.shareButtonEnabled and p1.props.shouldShowShareButton then
		table.insert(List, {
			text = p2.share,
			icon = Images["icons/actions/share"],
			onActivated = function()
				-- upvalues: p1 (copy), RootPlaceId (copy), AppPage (upval), UniverseId (copy), generateExperienceDetailsShareLinkUrl (upval), ShareExperienceLinkFunction (upval), EventIngest (copy)
				if not p1.isMounted or not RootPlaceId then return end
				if p1.props.shouldShareToProvider then
					p1.props.navigateDown({
						name = AppPage.SdkShare,
						extraProps = {
							context = "GameDetailsMoreWebURL",
							universeId = UniverseId
						}
					})
				else
					local ExperienceDetailsShareLinkUrl, ExperienceDetailsShareLinkUrl2 = generateExperienceDetailsShareLinkUrl(p1.props.shareLinkId, UniverseId, RootPlaceId)
					ShareExperienceLinkFunction(EventIngest, "GameDetailMoreContextualMenu", RootPlaceId, {
						shareToAppsflyer = true,
						shortShareLinkFailed = not p1.props.shareLinkId,
						stamp = ExperienceDetailsShareLinkUrl2,
						linkId = p1.props.shareLinkId
					})
					p1.props.externalContentSharingProtocol:shareUrl({
						context = "GameDetailsMoreWebURL",
						url = ExperienceDetailsShareLinkUrl
					})
				end
				p1.closeCallback()
			end
		})
		table.insert(p1.menuItemNames, "ShareExperienceLink")
	end
	if not p1.props.reportingDisabled then
		table.insert(List, {
			text = p2.report,
			icon = Images["icons/actions/feedback"],
			onActivated = function()
				-- upvalues: p1 (copy), RootPlaceId (copy), GetFFlagEnableAbuseReport10ftFunction (upval), GuiService (copy), ConstantsModule (upval), UniverseId (copy), FFlagEnableAbuseReportRevampFlow (upval), EnableAbuseReportRevampExperience (upval), AbuseVectorModule (upval), FFlagAddThumbnailSelectorReport (upval), AppPage (upval), p2 (copy)
				if not p1.isMounted or not RootPlaceId then return end
				if p1.props.useLuafiedReportFlow then
					if GetFFlagEnableAbuseReport10ftFunction() and GuiService and GuiService:IsTenFootInterface() then
						p1.props.reportExperienceScreen({
							context = ConstantsModule.ReportScreen.Contexts.Experience,
							assetId = tostring(RootPlaceId),
							reportAbuseVector = ConstantsModule.ReportScreen.AbuseVectors.Place,
							platform = ConstantsModule.ReportScreen.Platforms.Console
						})
					else
						p1.props.reportExperienceDialog({
							reportEntryPoint = ConstantsModule.ReportDialogEntryPoints.ExperienceDetails,
							universeId = UniverseId,
							rootPlaceId = RootPlaceId
						})
					end
					p1.closeCallback()
					
					return
				elseif FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampExperience then
					p1.props.openDynamicAbuseReport({
						abuseVector = AbuseVectorModule.Place,
						targetId = RootPlaceId,
						custom = if FFlagAddThumbnailSelectorReport then { universeId = UniverseId } else nil,
						onClose = function()
							-- upvalues: p1 (upval)
							p1.closeCallback()
						end
					})
					
					return
				else
					if p1.props.supportsWebViews then
						p1.props.navigateDown({
							name = AppPage.GenericWebPage,
							detail = p1:getLinkPage(),
							extraProps = { title = p2.localizedTextReport }
						})
						p1.closeCallback()
						
						return
					else
						p1.props.setToastMessage(ConstantsModule.WEBVIEWS_UNAVAILABLE_TOAST)
					end
				end
			end
		})
		table.insert(p1.menuItemNames, "Report")
	end
	if p1.props.refundLink and p1.props.webViewSupport then
		table.insert(List, {
			text = p2.requestRefund,
			icon = Images["icons/menu/wallet"],
			onActivated = function()
				-- upvalues: p1 (copy), RootPlaceId (copy), RequestRefundClickFunction (upval)
				if p1.isMounted and RootPlaceId then
					RequestRefundClickFunction(p1.props.eventIngest, "GameDetailMoreContextualMenu", RootPlaceId)
					p1.props.openRequestRefundPage(p1.props.refundLink, p1.onRequestRefundPageClose)
					p1.closeCallback()
					
					return
				end
			end
		})
		table.insert(p1.menuItemNames, "RequestRefund")
	end
	return List
end

function GameDetailMoreContextualMenu.renderLandscapeContextualMenu(p1, p2)
	-- upvalues: RoactModule (copy), ContextualMenu (copy), OtterModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.getMenuPos(),
		Size = p1.getMenuSize()
	}, {
		ContextMenu = RoactModule.createElement(ContextualMenu, {
			open = true,
			closeBackgroundVisible = false,
			buttonProps = p1:renderContextualMenuContent(p2),
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			openPositionX = UDim.new(0, 0),
			openPositionY = UDim.new(0, 0),
			screenSize = p1.props.screenSize,
			onDismiss = p1.closeCallback,
			contextMenuWidthOverride = UDim.new(1, 0),
			anchorPointOverride = p1:getMenuAnchor(),
			motorOverrideOptions = {
				motorCallback = OtterModule.instant,
				open = { targetValue = 1 },
				close = { targetValue = 0 }
			}
		})
	})
end

function GameDetailMoreContextualMenu.renderPortraitContextualMenu(p1, p2)
	-- upvalues: DeviceOrientationMode (copy), RoactModule (copy), ContextualMenu (copy), MenuDirection (copy)
	local ScreenSize = p1.props.screenSize
	local IsDeviceOrientationMatch = p1.props.deviceOrientation == DeviceOrientationMode.Portrait
	local OffsetRatio = if ScreenSize == nil or ScreenSize.X <= 0 then 0 else p1.props.menuPosition.X.Offset / ScreenSize.X / 2 or 0
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(if IsDeviceOrientationMatch then 0 else OffsetRatio, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		ContextMenu = RoactModule.createElement(ContextualMenu, {
			open = true,
			closeBackgroundVisible = false,
			buttonProps = p1:renderContextualMenuContent(p2),
			menuDirection = MenuDirection.Up,
			openPositionY = UDim.new(1, -76),
			screenSize = ScreenSize,
			onDismiss = p1.closeCallback
		})
	})
end

function GameDetailMoreContextualMenu.didMount(p1)
	-- upvalues: AppPage (copy), OpenMoreFunction (copy)
	p1.isMounted = true
	local CurrentPage = p1.props.currentPage
	
	if CurrentPage == AppPage.GameDetail or CurrentPage == AppPage.ExperienceDetail then
		OpenMoreFunction(p1.props.eventIngest, "GameDetailMoreContextualMenu", p1.props.rootPlaceId, { moreMenuItems = table.concat(p1.menuItemNames, ",") })
		
		return
	else
		p1.closeCallback()
	end
end

function GameDetailMoreContextualMenu.willUnmount(p1)
	p1.isMounted = false
end

function GameDetailMoreContextualMenu.render(p1)
	-- upvalues: WithLocalizationFunction (copy), FFlagLuaAppRenameFriendsToConnectionsEdp (copy), DeviceOrientationMode (copy)
	return WithLocalizationFunction({
		favoriteLabel = "Feature.Favorites.Label.Favorite",
		favoritedLabel = "Feature.Favorites.Label.Favorited",
		followingLabel = "Feature.Friends.Label.Following",
		inviteFriends = "Feature.GameDetails.Action.InviteFriends",
		copyLink = "Feature.GameDetails.Action.CopyLink",
		share = "Feature.SocialShare.Action.Share",
		report = "Feature.GameDetails.Action.Report",
		requestRefund = "Feature.GameDetails.Action.Refund",
		followLabel = if p1.props.enableNotificationsRebrand then "Feature.GameFollows.LabelNotifications" else "Feature.GameDetails.Label.Follow",
		inviteConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then "CommonUI.Features.Label.InviteConnections" else nil
	})(function(p2)
		-- upvalues: p1 (copy), DeviceOrientationMode (upval)
		return if p1.props.deviceOrientation == DeviceOrientationMode.Portrait then p1:renderPortraitContextualMenu(p2) else p1:renderLandscapeContextualMenu(p2)
	end)
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	-- upvalues: GetFFlagLuafiedReportEntryPointsFunction (copy), GetFFlagEnableAbuseReport10ftFunction (copy), FFlagLuaAppRenameFriendsToConnectionsEdp (copy)
	return {
		shouldShowShareButton = p1.shouldShowGameDetailsShareButton(),
		shouldShareToProvider = p1.shouldShareToAccountProvider(),
		reportingDisabled = p1.getGameReportingDisabled(),
		supportsWebViews = p1.getWebViewSupport(),
		useLuafiedReportFlow = if GetFFlagLuafiedReportEntryPointsFunction() or GetFFlagEnableAbuseReport10ftFunction() then p1.getUseLuafiedReportFlow() else nil,
		inviteFriendsDisabled = p1.getInviteFriendsDisabled(),
		webViewSupport = p1.getWebViewSupport(),
		notificationsCanEnableExperience = p1.getNotificationsCanReceiveExperience(),
		renameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then p1.getRenameFriendsToConnections() else nil
	}
end)((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameInfosReducer (copy), FFlagSignalsNavP3fGameDetails (copy), SharedFlagsModule (copy), Selectors (copy), GetLuaAppGameDetailsMoreShareButtonEnabledV2Module (copy)
	local GameDetailsVEntry = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2.shouldHydrateLegacyIxp then p1.GameDetailsV2 and p1.GameDetailsV2[p2.universeId] or nil else p1.GameDetails[p2.universeId]
	local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2.universeId]
	
	return {
		rootPlaceId = GameDetailsVEntry and GameDetailsVEntry.rootPlaceId or PersonalizationEntry and PersonalizationEntry.placeId,
		isFavorite = p1.GameFavorites[p2.universeId],
		gameFollowings = p1.GameFollowings[p2.universeId],
		currentPage = if FFlagSignalsNavP3fGameDetails then nil elseif SharedFlagsModule.FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p1).routeName else p1.Navigation.currentRoute.routeName,
		shareButtonEnabled = GetLuaAppGameDetailsMoreShareButtonEnabledV2Module(p1.LocalUserId),
		screenSize = p1.ScreenSize,
		deviceOrientation = p1.DeviceOrientation,
		notificationsEnabled = p1.ExperienceNotificationsEnabled or {},
		refundLink = if GameDetailsVEntry then GameDetailsVEntry.refundLink else nil
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayFunction (copy), GamePostFavoriteModule (copy), SetGameFavoriteModule (copy), SendGameFollowModule (copy), SetGameFollowModule (copy), SetCurrentToastMessageFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), GetFFlagLuafiedReportEntryPointsFunction (copy), OpenReportDialogModule (copy), GetFFlagEnableAbuseReport10ftFunction (copy), OpenReportScreenModule (copy), SetExperienceNotificationsEnabledCountModule (copy), OpenRequestRefundPageModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameDetails (copy), FetchGamePlayabilityAndProductInfo (copy), FFlagEnableAbuseReportRevampFlow (copy), EnableAbuseReportRevampExperience (copy), OpenDynamicAbuseReportModule (copy)
	return {
		closeCallback = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			Callback(CloseCentralOverlayFunction())
		end,
		gamePostFavorite = function(p1, p2, p3)
			-- upvalues: Callback (copy), GamePostFavoriteModule (upval)
			return Callback(GamePostFavoriteModule(p1, p2, p3))
		end,
		setGameFavorite = function(p1, p2)
			-- upvalues: Callback (copy), SetGameFavoriteModule (upval)
			return Callback(SetGameFavoriteModule(p1, p2))
		end,
		sendGameFollow = function(p1, p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), SendGameFollowModule (upval)
			return Callback(SendGameFollowModule(p1, p2, p3, p4, p5, p6))
		end,
		setGameFollow = function(p1, p2)
			-- upvalues: Callback (copy), SetGameFollowModule (upval)
			return Callback(SetGameFollowModule(p1, p2))
		end,
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			return Callback(SetCurrentToastMessageFunction(p1))
		end,
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end,
		setToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			return Callback(SetCurrentToastMessageFunction(p1))
		end,
		reportExperienceDialog = if GetFFlagLuafiedReportEntryPointsFunction() then function(p1)
			-- upvalues: Callback (copy), OpenReportDialogModule (upval)
			return Callback(OpenReportDialogModule(p1))
		end else nil,
		reportExperienceScreen = if GetFFlagEnableAbuseReport10ftFunction() then function(p1)
			-- upvalues: Callback (copy), OpenReportScreenModule (upval)
			return Callback(OpenReportScreenModule(p1))
		end else nil,
		setExperienceNotificationsEnabledCount = function(p1)
			-- upvalues: Callback (copy), SetExperienceNotificationsEnabledCountModule (upval)
			return Callback(SetExperienceNotificationsEnabledCountModule(p1))
		end,
		openRequestRefundPage = function(p1, p2)
			-- upvalues: Callback (copy), OpenRequestRefundPageModule (upval)
			return Callback(OpenRequestRefundPageModule(p1, p2))
		end,
		fetchGameDetail = function(p1, p2, p3)
			-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), Callback (copy), ApiFetchExperienceDetailsPageModule (upval), ApiFetchGameDetails (upval)
			return if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3 then Callback(ApiFetchExperienceDetailsPageModule.Fetch(p1, p2, p3, nil)) else Callback(ApiFetchGameDetails.Fetch(p1, { p2 }))
		end,
		fetchPlayabilityAndProductInfo = function(p1, p2)
			-- upvalues: Callback (copy), FetchGamePlayabilityAndProductInfo (upval)
			return Callback(FetchGamePlayabilityAndProductInfo.Fetch(p1, p2))
		end,
		openDynamicAbuseReport = if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampExperience then function(p1)
			-- upvalues: Callback (copy), OpenDynamicAbuseReportModule (upval)
			return Callback(OpenDynamicAbuseReportModule(p1))
		end else nil
	}
end)(GameDetailMoreContextualMenu)))

if not GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then
	v1 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.ExperienceDetailsPageLayer }, function(p1, _)
		-- upvalues: AppUserLayers (copy), GetNotificationsExperienceDetailsVariant (copy)
		local v2 = (p1[AppUserLayers.ExperienceDetailsPageLayer] or {})[GetNotificationsExperienceDetailsVariant.getNotificationsVariantFieldName] or -1
		
		return {
			enableNotificationsDiscoverability = v2 == 2,
			enableNotificationsRebrand = v2 > 0
		}
	end)(v1)
end
local QueryExperienceDetailsLinkUniverseIdStringExperienceDetailsLinkByUniverseIdUniverseIdUniverseIdLinkId = GqlFunction("\t\tquery ExperienceDetailsLink($universeId: String!) {\n\t\t\texperienceDetailsLinkByUniverseId(universeId: $universeId) {\n\t\t\t\tlinkId\n\t\t\t}\n\t\t}\n\t")

return RoactServices.connect({
	networking = RoactNetworking,
	localization = RoactLocalizationModule,
	eventIngest = AppEventIngestService,
	guiService = if GetFFlagEnableAbuseReport10ftFunction() then AppGuiService else nil
})(function(p1)
	-- upvalues: UseQuery (copy), QueryExperienceDetailsLinkUniverseIdStringExperienceDetailsLinkByUniverseIdUniverseIdUniverseIdLinkId (copy), UseUserExperiment (copy), SocialExperienceDetailsContextualMenuLayer (copy), ExperienceDetailsCopyLinkExperimentVariant (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), UseEdpServerIxpVariablesModule (copy), FFlagSignalsNavP3fGameDetails (copy), GetLegacyNavigationStore (copy), UseSignalState (copy), CryoModule (copy), ExperienceDetailsExperimentationModule (copy), RoactModule (copy), v1 (copy)
	local LinkId = nil
	local v2 = UseQuery(QueryExperienceDetailsLinkUniverseIdStringExperienceDetailsLinkByUniverseIdUniverseIdUniverseIdLinkId, { variables = { universeId = p1.universeId } })
	
	if v2.data and v2.data.experienceDetailsLinkByUniverseId then
		LinkId = v2.data.experienceDetailsLinkByUniverseId.linkId
	end
	local v3 = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then UseEdpServerIxpVariablesModule() else nil
	local v4 = if FFlagSignalsNavP3fGameDetails then UseSignalState(GetLegacyNavigationStore(false).getCurrentPage) else nil
	
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		enableCopyLink = UseUserExperiment({ SocialExperienceDetailsContextualMenuLayer }, function(p2)
			-- upvalues: SocialExperienceDetailsContextualMenuLayer (upval), ExperienceDetailsCopyLinkExperimentVariant (upval)
			return (p2[SocialExperienceDetailsContextualMenuLayer] or {})[ExperienceDetailsCopyLinkExperimentVariant]
		end, true),
		shareLinkId = LinkId,
		edpServerIxpVariables = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() then v3 else nil,
		currentPage = if FFlagSignalsNavP3fGameDetails then v4.name else nil
	})))
end)