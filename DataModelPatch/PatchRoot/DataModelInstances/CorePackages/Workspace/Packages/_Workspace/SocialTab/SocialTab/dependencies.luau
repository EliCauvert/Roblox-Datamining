local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local LumberyakModule = require(Parent.Lumberyak)
local SocialTab = LumberyakModule.Logger.new(nil, "SocialTab")
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local SocialTabNetworking = SocialTab:new("SocialTab Networking")
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "SocialTab.NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: SocialTabNetworking (copy), HttpRequest (copy)
			SocialTabNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: SocialTabNetworking (copy)
			SocialTabNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("SocialTabHttpRetryCount", 3)
	})
})

return {
	LocalizationService = game:GetService("LocalizationService"),
	Promise = require(Parent.Promise),
	llama = LuaSocialLibrariesDepsModule.llama,
	FitFrame = require(Parent.FitFrame),
	Otter = require(Parent.Otter),
	Roact = require(Parent.Roact),
	React = require(Parent.React),
	Rodux = require(Parent.Rodux),
	Cryo = require(Parent.Cryo),
	RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus,
	RoactNavigation = require(Parent.RoactNavigation),
	RoactAppExperiment = require(Parent.RoactAppExperiment),
	RoactRodux = require(Parent.RoactRodux),
	ExternalEventConnection = require(Parent.RoactUtils).ExternalEventConnection,
	Logger = SocialTab,
	t = require(Parent.t),
	Text = require(Parent.AppCommonLib).Text,
	UIBlox = require(Parent.UIBlox),
	withLocalization = require(Parent.Localization).withLocalization,
	useDispatch = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch,
	useLocalization = require(Parent.Localization).Hooks.useLocalization,
	useSelector = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector,
	memoize = require(Parent.AppCommonLib).memoize,
	PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities,
	enumerate = require(Parent.enumerate),
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	Url = require(Parent.Http).Url,
	VerifiedBadges = require(Parent.VerifiedBadges),
	DiscoverabilityModal = require(Parent.DiscoverabilityModal),
	ShowContactImporterParams = require(Parent.ContactImporter).ShowContactImporterParams,
	SocialCommon = require(Parent.SocialCommon),
	UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy,
	UiModeStyleProvider = require(Parent.Style).UiModeStyleProvider,
	Mock = LuaSocialLibrariesDepsModule.Mock,
	tutils = require(Parent.tutils),
	AnalyticsService = require(Parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")),
	NetworkingPresence = LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = ConfigResult }),
	NetworkingFriends = require(Parent.FriendsNetworking).config({ roduxNetworking = ConfigResult }),
	NetworkingUsers = LuaSocialLibrariesDepsModule.NetworkingUsers.config({ roduxNetworking = ConfigResult }),
	NetworkingGames = LuaSocialLibrariesDepsModule.NetworkingGames.config({ roduxNetworking = ConfigResult }) or nil,
	Players = game:GetService("Players"),
	RoduxNetworking = ConfigResult,
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "SocialTab.Users" }),
	RoduxFriends = require(Parent.FriendsRodux).config({ keyPath = "SocialTab.Friends" }),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "SocialTab.Presence" }),
	RoduxGames = LuaSocialLibrariesDepsModule.RoduxGames.config({ keyPath = "SocialTab.Games" }),
	NetworkingChat = require(Parent.SharedFlags).getFFlagSocialTabReplaceRefreshConversations() and LuaSocialLibrariesDepsModule.NetworkingChat.config({ roduxNetworking = ConfigResult }) or nil,
	CollisionMatchers = LuaSocialLibrariesDepsModule.CollisionMatchers,
	Lumberyak = LumberyakModule,
	RunService = game:GetService("RunService"),
	validatePropsWithForwardRef = require(Parent.RoactUtils).validatePropsWithForwardRef,
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	GetFFlagHideConnectPageWebViewItemsForVR = require(Parent.SharedFlags).GetFFlagHideConnectPageWebViewItemsForVR,
	UserLib = require(Parent.UserLib),
	getStandardSizeAvatarHeadShotRbxthumb = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb,
	StreamNotifications = require(Parent.StreamNotifications),
	AppPage = require(Parent.RobloxAppEnums).AppPage,
	BuilderIcons = require(Parent.BuilderIcons),
	Foundation = require(Parent.Foundation)
}