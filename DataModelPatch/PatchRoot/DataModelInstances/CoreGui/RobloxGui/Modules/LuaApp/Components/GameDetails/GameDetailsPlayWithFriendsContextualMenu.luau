local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local OtterModule = require(CorePackages.Packages.Otter)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UserIconList = require(CorePackages.Workspace.Packages.GameTile).UserIconList
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
local GameInviteModalManager = GameInviteModule.GameInviteModalManager
local GameInviteConstants = GameInviteModule.GameInviteConstants
local GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager
local GameDetailsEvents = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents
local CreatePrivateGameFunction = GameDetailsEvents.CreatePrivateGame
local JoinFriendsInGameFunction = GameDetailsEvents.JoinFriendsInGame
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local SortFriendsByPresenceAndRecencyModule = require(Modules.LuaApp.sortFriendsByPresenceAndRecency)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local FFlagLuaAppRenameFriendsToConnectionsEdp = SharedFlagsModule.FFlagLuaAppRenameFriendsToConnectionsEdp
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3fGameDetails then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local LuaAppCheckPlayabilityStatusPrivateServersEnabled = game:DefineFastFlag("LuaAppCheckPlayabilityStatusPrivateServersEnabled", false)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local GetSubscriptionPurchaseCloseCallbackFunction = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback
local _Vector2 = Vector2.new(64, 24)
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1, List)
	-- upvalues: SortFriendsByPresenceAndRecencyModule (copy)
	if not p1 or not List then
		return {}
	end
	local List1 = {}
	
	for _, value in pairs(List) do
		local v1 = p1[value]
		
		if v1 and v1.isFriend then
			table.insert(List1, v1)
		end
	end
	table.sort(List1, SortFriendsByPresenceAndRecencyModule)
	
	return List1
end)
local GameDetailsPlayWithFriendsContextualMenu = RoactModule.PureComponent:extend("GameDetailsPlayWithFriendsContextualMenu")
GameDetailsPlayWithFriendsContextualMenu.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	menuPosition = TModule.optional(TModule.UDim2),
	hideCloseButton = TModule.optional(TModule.boolean),
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	closeCentralOverlayThunk = TModule.optional(TModule.callback),
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	rootPlaceId = TModule.optional(TModule.string),
	currentPage = TModule.string,
	users = TModule.optional(TModule.table),
	inGameUsersByGame = TModule.optional(TModule.table),
	screenSize = TModule.optional(TModule.Vector2),
	deviceOrientation = TModule.string,
	privateServersEnabled = TModule.optional(TModule.boolean),
	closeCallback = TModule.callback,
	navigateDown = TModule.callback,
	appTheme = TModule.any,
	webViewSupport = TModule.optional(TModule.boolean),
	renameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then TModule.optional(TModule.boolean) else nil,
	networking = TModule.callback,
	localization = TModule.table,
	eventIngest = TModule.table
})

function GameDetailsPlayWithFriendsContextualMenu.init(p2)
	function p2.getMenuPos()
		-- upvalues: p2 (copy)
		return if p2.props.menuPosition == nil then UDim2.fromOffset(0, 0) else p2.props.menuPosition
	end
	
	function p2.getMenuSize(): UDim2
		return UDim2.new(0, 300, 1, 0)
	end
	
	function p2.getMenuAnchor()
		-- upvalues: p2 (copy)
		return if p2.props.menuPosition == nil or p2.props.screenSize == nil then nil else Vector2.new(0, 0)
	end
end

function GameDetailsPlayWithFriendsContextualMenu.getItems(p2, p3)
	-- upvalues: MemoizeResult (copy), FFlagLuaAppRenameFriendsToConnectionsEdp (copy), Images (copy), GameInviteAnalyticsManager (copy), GameInviteModalManager (copy), GameInviteConstants (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GetSubscriptionPurchaseCloseCallbackFunction (copy), UrlBuilder (copy), AppPage (copy), CreatePrivateGameFunction (copy), JoinFriendsInGameFunction (copy), RoactModule (copy), UserIconList (copy), _Vector2 (copy)
	local CloseCallbackFunction = p2.props.closeCallback
	local EventIngest = p2.props.eventIngest
	local RootPlaceId = p2.props.rootPlaceId
	local MemoizeResultResult = MemoizeResult(p2.props.users, p2.props.inGameUsersByGame)
	local AppTheme = p2.props.appTheme
	local PrivateServersEnabled = p2.props.privateServersEnabled
	local RenameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then p2.props.renameFriendsToConnections else nil
	local List = {}
	table.insert(List, {
		text = if FFlagLuaAppRenameFriendsToConnectionsEdp and RenameFriendsToConnections then p3.inviteConnections else p3.inviteFriends,
		icon = Images["icons/actions/friends/friendInvite"],
		onActivated = function()
			-- upvalues: p2 (copy), RootPlaceId (copy), GameInviteAnalyticsManager (upval), GameInviteModalManager (upval), GameInviteConstants (upval), CloseCallbackFunction (copy)
			if p2.isMounted and RootPlaceId then
				GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.GameDetailsPlayWithFriendsMenu)
				GameInviteAnalyticsManager:inputShareGameEntryPoint(RootPlaceId, p2.props.universeId)
				GameInviteModalManager:openModal({
					trigger = GameInviteConstants.Triggers.GameDetailsPlayWithFriendsMenu,
					rootPlaceId = RootPlaceId,
					universeId = p2.props.universeId,
					hideCloseButton = p2.props.hideCloseButton
				})
				CloseCallbackFunction()
				
				return
			end
		end
	})
	local SubscriptionPurchaseCloseCallback = if FFlagEnableBlackbirdPageCloseCallback and GetSubscriptionPurchaseCloseCallbackFunction then GetSubscriptionPurchaseCloseCallbackFunction() else nil
	
	if p2.props.webViewSupport and PrivateServersEnabled then
		table.insert(List, {
			text = p3.createPrivateGame,
			icon = Images["icons/actions/edit/add"],
			onActivated = function()
				-- upvalues: p2 (copy), RootPlaceId (copy), UrlBuilder (upval), AppPage (upval), p3 (copy), FFlagEnableBlackbirdPageCloseCallback (upval), SubscriptionPurchaseCloseCallback (copy), CreatePrivateGameFunction (upval), EventIngest (copy), CloseCallbackFunction (copy)
				if p2.isMounted and RootPlaceId then
					p2.props.navigateDown({
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.game.info.serversPreopenCreateVip({ universeId = p2.props.universeId }),
						extraProps = {
							title = p3.createPrivateGame,
							onClose = if FFlagEnableBlackbirdPageCloseCallback then SubscriptionPurchaseCloseCallback else nil
						}
					})
					CreatePrivateGameFunction(EventIngest, "GameDetailsPlayWithFriendsContextualMenu", RootPlaceId)
					CloseCallbackFunction()
					
					return
				end
			end
		})
	end
	if p2.props.webViewSupport then
		table.insert(List, {
			text = if FFlagLuaAppRenameFriendsToConnectionsEdp and RenameFriendsToConnections then p3.joinConnections else p3.joinFriendsInGame,
			icon = Images["icons/actions/friends/friendsplaying"],
			onActivated = function()
				-- upvalues: p2 (copy), RootPlaceId (copy), UrlBuilder (upval), AppPage (upval), FFlagLuaAppRenameFriendsToConnectionsEdp (upval), RenameFriendsToConnections (copy), p3 (copy), FFlagEnableBlackbirdPageCloseCallback (upval), SubscriptionPurchaseCloseCallback (copy), JoinFriendsInGameFunction (upval), EventIngest (copy), CloseCallbackFunction (copy)
				if p2.isMounted and RootPlaceId then
					p2.props.navigateDown({
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.game.info.servers({ universeId = p2.props.universeId }),
						extraProps = {
							title = if FFlagLuaAppRenameFriendsToConnectionsEdp and RenameFriendsToConnections then p3.joinConnections else p3.joinFriendsInGame,
							onClose = if FFlagEnableBlackbirdPageCloseCallback then SubscriptionPurchaseCloseCallback else nil
						}
					})
					JoinFriendsInGameFunction(EventIngest, "GameDetailsPlayWithFriendsContextualMenu", RootPlaceId)
					CloseCallbackFunction()
					
					return
				end
			end,
			renderRightSideGadget = function()
				-- upvalues: RoactModule (upval), UserIconList (upval), MemoizeResultResult (copy), _Vector2 (upval), AppTheme (copy)
				return {
					UserIconList = RoactModule.createElement(UserIconList, {
						users = MemoizeResultResult,
						width = _Vector2.X,
						height = _Vector2.Y,
						maskColor = AppTheme.Background and AppTheme.Background.Color or nil
					})
				}
			end,
			rightSideGadgetSize = _Vector2
		})
	end
	return List
end

function GameDetailsPlayWithFriendsContextualMenu.renderLandscapeContextualMenu(p2)
	-- upvalues: RoactModule (copy), ContextualMenu (copy), OtterModule (copy), WithLocalizationFunction (copy), FFlagLuaAppRenameFriendsToConnectionsEdp (copy)
	local CloseCallback = p2.props.closeCallback
	local ScreenSize = p2.props.screenSize
	
	return WithLocalizationFunction({
		inviteFriends = "Feature.GameDetails.Action.InviteFriends",
		joinFriendsInGame = "Feature.GameDetails.Action.JoinFriendsInGame",
		createPrivateGame = "Feature.GameDetails.Action.CreatePrivateGame",
		inviteConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then "CommonUI.Features.Label.InviteConnections" else nil,
		joinConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then "CommonUI.Features.Label.JoinConnections" else nil
	})(function(p3)
		-- upvalues: p2 (copy), RoactModule (upval), ContextualMenu (upval), ScreenSize (copy), CloseCallback (copy), OtterModule (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = p2.getMenuPos(),
			Size = p2.getMenuSize()
		}, {
			ContextMenu = RoactModule.createElement(ContextualMenu, {
				open = true,
				closeBackgroundVisible = false,
				buttonProps = p2:getItems(p3),
				horizontalAlignment = Enum.HorizontalAlignment.Left,
				openPositionX = UDim.new(0, 0),
				openPositionY = UDim.new(0, 0),
				screenSize = ScreenSize,
				onDismiss = CloseCallback,
				contextMenuWidthOverride = UDim.new(1, 0),
				anchorPointOverride = p2:getMenuAnchor(),
				motorOverrideOptions = {
					motorCallback = OtterModule.instant,
					open = { targetValue = 1 },
					close = { targetValue = 0 }
				}
			})
		})
	end)
end

function GameDetailsPlayWithFriendsContextualMenu.didMount(p2)
	-- upvalues: AppPage (copy)
	p2.isMounted = true
	local CurrentPage = p2.props.currentPage
	local CloseCallbackFunction: () -> () = p2.props.closeCallback
	
	if CurrentPage ~= AppPage.GameDetail and CurrentPage ~= AppPage.ExperienceDetail then
		CloseCallbackFunction()
	end
end

function GameDetailsPlayWithFriendsContextualMenu.WillUnmount(p2)
	p2.isMounted = false
end

function GameDetailsPlayWithFriendsContextualMenu.renderPortraitContextualMenu(p2)
	-- upvalues: DeviceOrientationMode (copy), RoactModule (copy), ContextualMenu (copy), MenuDirection (copy), WithLocalizationFunction (copy), FFlagLuaAppRenameFriendsToConnectionsEdp (copy)
	local CloseCallback = p2.props.closeCallback
	local ScreenSize = p2.props.screenSize
	
	return WithLocalizationFunction({
		inviteFriends = "Feature.GameDetails.Action.InviteFriends",
		joinFriendsInGame = "Feature.GameDetails.Action.JoinFriendsInGame",
		createPrivateGame = "Feature.GameDetails.Action.CreatePrivateGame",
		inviteConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then "CommonUI.Features.Label.InviteConnections" else nil,
		joinConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then "CommonUI.Features.Label.JoinConnections" else nil
	})(function(p3)
		-- upvalues: p2 (copy), DeviceOrientationMode (upval), ScreenSize (copy), RoactModule (upval), ContextualMenu (upval), MenuDirection (upval), CloseCallback (copy)
		local IsDeviceOrientationMatch = p2.props.deviceOrientation == DeviceOrientationMode.Portrait
		local OffsetRatio = if ScreenSize == nil or ScreenSize.X <= 0 then 0 else p2.props.menuPosition.X.Offset / ScreenSize.X / 2 or 0
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(if IsDeviceOrientationMatch then 0 else OffsetRatio, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ContextMenu = RoactModule.createElement(ContextualMenu, {
				open = true,
				closeBackgroundVisible = false,
				buttonProps = p2:getItems(p3),
				menuDirection = MenuDirection.Up,
				openPositionY = UDim.new(1, -76),
				screenSize = ScreenSize,
				onDismiss = CloseCallback
			})
		})
	end)
end

function GameDetailsPlayWithFriendsContextualMenu.render(p2)
	-- upvalues: DeviceOrientationMode (copy)
	return if p2.props.deviceOrientation == DeviceOrientationMode.Portrait then p2:renderPortraitContextualMenu() else p2:renderLandscapeContextualMenu()
end

local v2 = if FFlagSignalsNavP3fGameDetails then function(p2)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), RoactModule (copy), v2 (copy), CryoModule (copy)
	return RoactModule.createElement(v2, CryoModule.Dictionary.union(p2, {
		currentPage = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage).name
	}))
end else RoactRoduxModule.connect(function(p2, p3)
	-- upvalues: FFlagSignalsNavP3fGameDetails (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameInfosReducer (copy), LuaAppCheckPlayabilityStatusPrivateServersEnabled (copy)
	local SelectCurrentLegacyRouteResult = if FFlagSignalsNavP3fGameDetails then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p2) else p2.Navigation.history[#p2.Navigation.history]
	local GameDetailsVEntry = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p3.shouldHydrateLegacyIxp then p2.GameDetailsV2[p3.universeId] else p2.GameDetails[p3.universeId]
	local PersonalizationEntry = p2.Personalization[GameInfosReducer.key][p3.universeId]
	
	return {
		rootPlaceId = (if GameDetailsVEntry then GameDetailsVEntry.rootPlaceId else GameDetailsVEntry) or ((if PersonalizationEntry then PersonalizationEntry.placeId else PersonalizationEntry) or nil),
		currentPage = if FFlagSignalsNavP3fGameDetails then nil else SelectCurrentLegacyRouteResult[#SelectCurrentLegacyRouteResult].name,
		users = p2.Users,
		inGameUsersByGame = p2.InGameUsersByGame[p3.universeId],
		screenSize = p2.ScreenSize,
		deviceOrientation = p2.DeviceOrientation,
		privateServersEnabled = if LuaAppCheckPlayabilityStatusPrivateServersEnabled then p2.PlayabilityStatus[p3.universeId] and (p2.PlayabilityStatus[p3.universeId].isPlayable and p2.GamePrivateServersEnabled[p3.universeId]) else p2.GamePrivateServersEnabled[p3.universeId]
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return {
		closeCallback = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			Callback(CloseCentralOverlayFunction())
		end,
		navigateDown = function(p2)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p2)) else Callback(NavigateDownFunction(p2))
		end
	}
end)(GameDetailsPlayWithFriendsContextualMenu)

return RoactServices.connect({
	networking = RoactNetworking,
	localization = RoactLocalizationModule,
	eventIngest = AppEventIngestService
})((RoactAppPolicy.connect(function(p2)
	-- upvalues: FFlagLuaAppRenameFriendsToConnectionsEdp (copy)
	local RenameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then p2.getRenameFriendsToConnections() else nil
	
	return {
		webViewSupport = p2.getWebViewSupport(),
		renameFriendsToConnections = if FFlagLuaAppRenameFriendsToConnectionsEdp then RenameFriendsToConnections else nil
	}
end)((WithThemeDEPRECATEDModule(v2)))))