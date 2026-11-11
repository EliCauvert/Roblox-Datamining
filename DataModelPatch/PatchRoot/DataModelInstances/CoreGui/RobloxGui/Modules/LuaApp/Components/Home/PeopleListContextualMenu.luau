local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppPageModule = require(Modules.LuaApp.AppPage)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local ApiFetchGamesDataByPlaceIdsFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds
local ConvertUniverseIdToStringFunction = require(CorePackages.Workspace.Packages.SharedFlags).ConvertUniverseIdToString
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local InitializeProfileAnalyticsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.initializeProfileAnalytics)
local EventNamesModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EventNames)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FeatureContextModule = require(Modules.LuaApp.Enum.FeatureContext)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local UserModule = require(Modules.LuaApp.Models.User)
local ListPickerModule = require(Modules.LuaApp.Components.ListPicker)
local UserActiveGameModule = require(Modules.LuaApp.Components.Home.UserActiveGame)
local FormBasedContextualMenuModule = require(Modules.LuaApp.Components.FormBasedContextualMenu)
local EnteredChatFromEntryPointModule = require(CorePackages.Workspace.Packages.AppChat.EnteredChatFromEntryPoint)
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local SocialStopwatchModule = require(CorePackages.Workspace.Packages.SocialStopwatch)
local FFlagMobileGameJoinCardTTITracking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagMobileGameJoinCardTTITracking
local GameJoinCardTTI = if FFlagMobileGameJoinCardTTITracking then require(CorePackages.Workspace.Packages.GameJoinCard).Telemetry.GameJoinCardTTI else nil
local FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel = require(CorePackages.Workspace.Packages.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel
local JoinGameCardViewProfileNavigateToProfilePlatform = game:DefineFastFlag("JoinGameCardViewProfileNavigateToProfilePlatform", false)
local JoinGameCardViewProfileExperimentLayer = game:DefineFastString("JoinGameCardViewProfileExperimentLayer", "Social.ViewFriendSortInGameFriends")
local PeopleListContextualMenu = RoactModule.PureComponent:extend("PeopleListContextualMenu")
local DEFAULTWIDECONTEXTUALMENUWIDTH = require(Modules.LuaApp.Constants).DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH
PeopleListContextualMenu.defaultProps = { positionIndex = 0, absolutePosition = 0 }

function PeopleListContextualMenu.init(p1)
	-- upvalues: InitializeProfileAnalyticsModule (copy), ChatEntryPointNames (copy), NotificationTypeModule (copy), IXPService (copy), JoinGameCardViewProfileExperimentLayer (copy), JoinGameCardViewProfileNavigateToProfilePlatform (copy), AppPageModule (copy), EnumsModule (copy), UserModule (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy)
	local Analytics = p1.props.analytics
	local GuiService = p1.props.guiService
	local CloseCentralOverlayFunction = p1.props.closeCentralOverlay
	local NavigateDownFunction = p1.props.navigateDown
	local User = p1.props.user
	local PositionIndex = p1.props.positionIndex
	local AbsolutePosition = p1.props.absolutePosition
	local Source = p1.props.source
	p1.profileAnalytics = if p1.props.mockProfileAnalytics_dev then p1.props.mockProfileAnalytics_dev else InitializeProfileAnalyticsModule()
	
	function p1.chatWithUser(Id)
		-- upvalues: Analytics (copy), PositionIndex (copy), AbsolutePosition (copy), p1 (copy), Source (copy), ChatEntryPointNames (upval), GuiService (copy), NotificationTypeModule (upval)
		Analytics.reportPeopleListInteraction("ChatDropdown", Id, PositionIndex, AbsolutePosition, p1.props.analyticContext, { source = Source })
		p1.props.enteredChatFromEntryPoint(ChatEntryPointNames.PeopleListDropdown)
		GuiService:BroadcastNotification(Id, NotificationTypeModule.LAUNCH_CONVERSATION)
	end
	
	function p1.viewProfile(Detail)
		-- upvalues: Analytics (copy), PositionIndex (copy), AbsolutePosition (copy), p1 (copy), IXPService (upval), JoinGameCardViewProfileExperimentLayer (upval), JoinGameCardViewProfileNavigateToProfilePlatform (upval), NavigateDownFunction (copy), AppPageModule (upval), EnumsModule (upval), CloseCentralOverlayFunction (copy)
		Analytics.reportPeopleListInteraction("ProfileDropdown", Detail, PositionIndex, AbsolutePosition, p1.props.analyticContext)
		IXPService:LogFlagLinkedUserLayerExposure(JoinGameCardViewProfileExperimentLayer)
		
		if JoinGameCardViewProfileNavigateToProfilePlatform then
			NavigateDownFunction({
				name = AppPageModule.ProfilePlatform,
				detail = Detail,
				extraProps = { source = EnumsModule.Sources.JoinGameCard }
			})
			
			return
		else
			NavigateDownFunction({
				name = AppPageModule.ViewUserProfile,
				detail = Detail,
				extraProps = {
					onClose = function()
						-- upvalues: CloseCentralOverlayFunction (upval), p1 (upval)
						CloseCentralOverlayFunction()
						
						if p1.props.onCloseProfileWebview then
							p1.props.onCloseProfileWebview()
						end
					end
				}
			})
		end
	end
	
	Analytics.reportPeopleListInteraction("openPeopleList", User.id, PositionIndex, AbsolutePosition, p1.props.analyticContext, {
		source = p1.props.source,
		universeId = if User.presence == UserModule.PresenceType.IN_GAME then User.universeId else nil
	})
	
	if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel and User.presence == UserModule.PresenceType.IN_GAME and p1.props.universePlaceInfo == nil then
		p1.props.requestGameData(p1.props.networking, p1.props.user.placeId)
	end
end

function PeopleListContextualMenu.didMount(p1)
	-- upvalues: SocialStopwatchModule (copy), EventNamesModule (copy), SocialLuaAnalyticsModule (copy), FFlagMobileGameJoinCardTTITracking (copy), GameJoinCardTTI (copy)
	local OnOpenFunction: () -> () = p1.props.onOpen
	local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.JoinGameCardOpened)
	p1.profileAnalytics.fireAnalyticsEvent(EventNamesModule.ProfileInExperienceUserLoadingStage, {
		status = SocialLuaAnalyticsModule.Analytics.Enums.LoadingStages.Done,
		statValue = StopResult and StopResult.timeElapsed or nil
	})
	
	if FFlagMobileGameJoinCardTTITracking then
		GameJoinCardTTI.trackPeopleListMounted()
	end
	if OnOpenFunction then
		OnOpenFunction()
	end
end

function PeopleListContextualMenu:createMenuItem(DisplayIcon, Text, OnSelect)
	return {
		displayIcon = DisplayIcon,
		text = Text,
		onSelect = OnSelect
	}
end

function PeopleListContextualMenu.render(p1)
	-- upvalues: UserModule (copy), FormFactor (copy), DEFAULTWIDECONTEXTUALMENUWIDTH (copy), RoactModule (copy), FormBasedContextualMenuModule (copy), FitChildrenModule (copy), UserActiveGameModule (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), FeatureContextModule (copy), ListPickerModule (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationModule (copy)
	local Localization = p1.props.localization
	local ScreenSize = p1.props.screenSize
	local FormFactor1 = p1.props.formFactor
	local CloseCentralOverlay = p1.props.closeCentralOverlay
	local User = p1.props.user
	local PositionIndex = p1.props.positionIndex
	local AbsolutePosition = p1.props.absolutePosition
	local AnchorSpaceSize = p1.props.anchorSpaceSize
	local AnchorSpacePosition = p1.props.anchorSpacePosition
	local CombinedName = p1.props.combinedName
	local UniverseId = User.presence == UserModule.PresenceType.IN_GAME and User.universeId
	local X = FormFactor1 == FormFactor.COMPACT and ScreenSize.X or DEFAULTWIDECONTEXTUALMENUWIDTH
	
	local function v59(p2)
		-- upvalues: p1 (copy), User (copy), RoactModule (upval), FormBasedContextualMenuModule (upval), AnchorSpaceSize (copy), AnchorSpacePosition (copy), X (copy), FitChildrenModule (upval), UniverseId (copy), UserActiveGameModule (upval), PositionIndex (copy), AbsolutePosition (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (upval), CloseCentralOverlay (copy), FeatureContextModule (upval), ListPickerModule (upval), FormFactor1 (copy)
		local List = {}
		
		if p1.props.canUsePlatformChat then
			table.insert(List, p1:createMenuItem("LuaApp/icons/menu/menu_messages", p2.chatWithFriendText, function()
				-- upvalues: p1 (upval), User (upval)
				p1.chatWithUser(User.id)
			end))
		end
		if p1.props.areWebViewsSupported then
			table.insert(List, p1:createMenuItem("LuaApp/icons/menu/menu_profile", p2.viewProfileText, function()
				-- upvalues: p1 (upval), User (upval)
				p1.viewProfile(User.id)
			end))
		end
		return RoactModule.createElement(FormBasedContextualMenuModule, {
			anchorSpaceSize = AnchorSpaceSize,
			anchorSpacePosition = AnchorSpacePosition,
			itemWidth = X
		}, {
			Content = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				GameHeader = UniverseId and RoactModule.createElement(UserActiveGameModule, {
					layoutOrder = 1,
					friend = User,
					width = X,
					index = PositionIndex,
					absolutePosition = AbsolutePosition,
					universeId = User.universeId,
					universeRootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then User.rootPlaceId else nil,
					placeId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then User.placeId else nil,
					dismissContextualMenu = CloseCentralOverlay,
					featureContext = FeatureContextModule.PeopleList,
					onCloseGameDetails = p1.props.onCloseGameDetails,
					source = p1.props.source
				}),
				ListPicker = RoactModule.createElement(ListPickerModule, {
					layoutOrder = 2,
					maxHeight = 162,
					formFactor = FormFactor1,
					items = List,
					width = X
				})
			})
		})
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationModule({
		viewProfileText = "Feature.Chat.Label.ViewProfile",
		chatWithFriendText = {
			"Feature.Home.PeopleList.ChatWith",
			username = CombinedName
		}
	})(v59) else v59({
		chatWithFriendText = Localization:Format("Feature.Home.PeopleList.ChatWith", { username = CombinedName }),
		viewProfileText = Localization:Format("Feature.Chat.Label.ViewProfile")
	})
end

function PeopleListContextualMenu.willUnmount(p1)
	local OnCloseFunction: () -> () = p1.props.onClose
	
	if OnCloseFunction then
		OnCloseFunction()
	end
end

return (RoactAppPolicy.connect(function(p1, _)
	return {
		enableDisplayNamePolicy = p1.getShowDisplayName(),
		areWebViewsSupported = p1.getWebViewSupport(),
		canUsePlatformChat = p1.getCanUsePlatformChat()
	}
end)((RoactServices.connect({
	analytics = RoactAnalyticsCommonGameEvents,
	localization = RoactLocalizationModule,
	guiService = AppGuiService,
	networking = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then RoactNetworkingModule else nil
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), UserModule (copy), ConvertUniverseIdToStringFunction (copy)
	local UniversePlaceInfo = nil
	
	if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then
		local User = p2.user
		
		if User.presence == UserModule.PresenceType.IN_GAME then
			UniversePlaceInfo = p1.UniversePlaceInfos[ConvertUniverseIdToStringFunction(User.universeId)]
		end
	end
	return {
		universePlaceInfo = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo else nil,
		formFactor = p1.FormFactor,
		screenSize = p1.ScreenSize
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), CloseCentralOverlayModule (copy), EnteredChatFromEntryPointModule (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), ApiFetchGamesDataByPlaceIdsFunction (copy)
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
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		enteredChatFromEntryPoint = function(p1)
			-- upvalues: Callback (copy), EnteredChatFromEntryPointModule (upval)
			Callback(EnteredChatFromEntryPointModule(p1))
		end,
		requestGameData = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGamesDataByPlaceIdsFunction (upval)
			return Callback(ApiFetchGamesDataByPlaceIdsFunction(p1, { p2 }))
		end else nil
	}
end)(PeopleListContextualMenu))))))