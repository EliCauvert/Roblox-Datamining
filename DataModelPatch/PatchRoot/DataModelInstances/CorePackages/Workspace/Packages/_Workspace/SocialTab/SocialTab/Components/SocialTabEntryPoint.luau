local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local LoggerModule = require(SocialTab.Logger)
local AnalyticsModule = require(SocialTab.Analytics)
local UIBlox = DependenciesModule.UIBlox
local Roact = DependenciesModule.Roact
local RoactRodux = DependenciesModule.RoactRodux
local RoactNavigation = DependenciesModule.RoactNavigation
local MemoizeFunction = DependenciesModule.memoize
local RetrievalStatus = DependenciesModule.RetrievalStatus
local SocialTabContextModule = require(SocialTab.SocialTabContext)
local GetSocialTabNavigatorModule = require(SocialTab.Navigators.getSocialTabNavigator)
local EnumScreensModule = require(SocialTab.EnumScreens)
local LoadingStateContainer = UIBlox.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBlox.App.Loading.Enum.RetrievalStatus
local MapStateToPropsModule = require(SocialTab.Components.SocialTabEntryPoint.mapStateToProps)
local MapDispatchToPropsModule = require(SocialTab.Components.SocialTabEntryPoint.mapDispatchToProps)
local FFlagCreateConnectionsHub = require(SocialTab.Parent.SharedFlags).FFlagCreateConnectionsHub
local SocialTabEntryPoint = Roact.PureComponent:extend("SocialTabEntryPoint")
SocialTabEntryPoint.defaultProps = { logger = nil }

function SocialTabEntryPoint.getDerivedStateFromProps(p1, _)
	-- upvalues: RetrievalStatus (copy)
	return {
		wasEverDoneRetrieving = p1.retrievalStatus == RetrievalStatus.Done or nil
	}
end

function SocialTabEntryPoint.init(p1)
	-- upvalues: LoggerModule (copy), EnumScreensModule (copy), RoactNavigation (copy), MemoizeFunction (copy), GetSocialTabNavigatorModule (copy), FFlagCreateConnectionsHub (copy), AnalyticsModule (copy), DependenciesModule (copy), SocialTabContextModule (copy), Roact (copy), RetrievalStatus1 (copy), RetrievalStatus (copy), LoadingStateContainer (copy)
	if p1.props.logger then
		LoggerModule:setParent(p1.props.logger)
	end
	function p1.connectSocTabExternalDispatch(Callback)
		-- upvalues: p1 (copy), EnumScreensModule (upval), RoactNavigation (upval)
		if p1.props.updateExternalNavigationForScreen then
			local RoactChat = EnumScreensModule.RoactChat
			p1.props.updateExternalNavigationForScreen(function(Params)
				-- upvalues: Callback (copy), RoactNavigation (upval), EnumScreensModule (upval), p1 (upval)
				Callback(RoactNavigation.Actions.navigate({ routeName = EnumScreensModule.RoactChat }))
				p1.props.navigateIntoChat({ screen = "ChatConversation", params = Params })
			end, RoactChat)
			
			return function()
				-- upvalues: p1 (upval), RoactChat (copy)
				p1.props.updateExternalNavigationForScreen(nil, RoactChat)
			end
		else
			return function() end
		end
	end
	
	p1._performanceTesting = p1.props.performanceTesting
	p1.androidBackButtonSignal = {
		[EnumScreensModule.SocialTab] = p1.props.signal.new(),
		[EnumScreensModule.RoactChat] = p1.props.signal.new()
	}
	p1.getAppContainer = MemoizeFunction(function(p2, _)
		-- upvalues: EnumScreensModule (upval), GetSocialTabNavigatorModule (upval), p1 (copy), FFlagCreateConnectionsHub (upval), RoactNavigation (upval)
		return RoactNavigation.createAppContainer((GetSocialTabNavigatorModule({ [EnumScreensModule.RoactChat] = p2 }, {
			setTabBarVisible = p1.props.setTabBarVisible,
			androidBackButtonSignal = p1.androidBackButtonSignal,
			connectToAndroidBackButton = p1.props.androidBackButtonConnection.connect,
			disconnectFromAndroidBackButton = p1.props.androidBackButtonConnection.disconnect,
			androidBackButtonConnection = p1.props.androidBackButtonConnection,
			initialRouteName = p1.props.initialRouteName,
			navigateToAddFriends = if FFlagCreateConnectionsHub then nil else p1.props.navigateToAddFriends
		})))
	end)
	p1.getAnalytics = MemoizeFunction(function(p2)
		-- upvalues: AnalyticsModule (upval), DependenciesModule (upval)
		return AnalyticsModule.Class.new(DependenciesModule.AnalyticsService, p2.localUserId)
	end)
	
	function p1.fetchChatSettings(SetAppLoaded)
		-- upvalues: p1 (copy)
		return p1.props.fetchChatSettings(SetAppLoaded)
	end
	
	function p1.renderRoactChat()
		-- upvalues: p1 (copy), SocialTabContextModule (upval), Roact (upval)
		return if p1.props.debug_mockRenderRoactChat then p1.props.debug_mockRenderRoactChat() else SocialTabContextModule.with(function(p2)
			-- upvalues: Roact (upval), p1 (upval)
			return p2.wasEverVisible and Roact.createElement(p1.props.roactChatEntryPoint, p2) or nil
		end)
	end
	
	function p1.renderAppContainer(AppContainer, p2)
		-- upvalues: p1 (copy), Roact (upval)
		return if p1.props.debug_mockRenderAppContainer then p1.props.debug_mockRenderAppContainer() else Roact.createElement(AppContainer, {
			externalDispatchConnector = p1.connectSocTabExternalDispatch,
			androidBackButtonHandlerDisabled = p2.androidBackButtonHandlerDisabled
		})
	end
	
	function p1.getLoadingState()
		-- upvalues: RetrievalStatus1 (upval), p1 (copy), RetrievalStatus (upval), Roact (upval), LoadingStateContainer (upval)
		return Roact.createElement(LoadingStateContainer, {
			dataStatus = if p1.state.wasEverDoneRetrieving then RetrievalStatus1.fromRawValue(RetrievalStatus.Done) else RetrievalStatus1.fromRawValue(p1.props.retrievalStatus),
			onRetry = p1.fetchChatSettings,
			renderOnLoaded = p1.renderOnLoaded
		})
	end
	
	function p1.renderOnLoaded()
		-- upvalues: SocialTabContextModule (upval), p1 (copy), Roact (upval), AnalyticsModule (upval)
		return SocialTabContextModule.with(function(p2)
			-- upvalues: p1 (upval), Roact (upval), AnalyticsModule (upval)
			return Roact.createElement(AnalyticsModule.Context.Provider, { value = p1.getAnalytics(p2) }, {
				appContainer = p1.renderAppContainer(p1.getAppContainer(p2.roactChatEntryPoint), p2)
			})
		end)
	end
end

function SocialTabEntryPoint.didMount(p1)
	-- upvalues: EnumScreensModule (copy)
	if p1.props.isVisible and p1.props.toggleChatPaused ~= nil then
		p1.props.toggleChatPaused(false)
	end
	if p1.androidBackButtonSignal then
		p1.androidBackButtonSignal[EnumScreensModule.SocialTab]:connect(function()
			-- upvalues: p1 (copy)
			if p1.props.isVisible then
				p1.props.androidBackButtonConnection.showExitDialog()
			end
		end)
	end
end

function SocialTabEntryPoint.didUpdate(p1, p2, _)
	-- upvalues: RetrievalStatus (copy)
	if not p2.chatLoaded and p1.props.chatLoaded then
		p1.props.notificationService:ActionEnabled(Enum.AppShellActionType.TapConversationEntry)
	end
	if p1.props.retrievalStatus == RetrievalStatus.NotStarted then
		p1.fetchChatSettings(p1.props.setAppLoaded)
	end
end

function SocialTabEntryPoint.render(p1)
	-- upvalues: SocialTabContextModule (copy), Roact (copy), AnalyticsModule (copy)
	return SocialTabContextModule.with(function(p2)
		-- upvalues: Roact (upval), AnalyticsModule (upval), p1 (copy)
		return Roact.createElement(AnalyticsModule.Context.Provider, { value = p1.getAnalytics(p2) }, { LoadingState = p1.getLoadingState() })
	end)
end

return (SocialTabContextModule.connect(function(p1)
	return {
		fetchUnreadConversationCount = p1.fetchUnreadConversationCount,
		setAppLoaded = p1.setAppLoaded,
		roactChatEntryPoint = p1.roactChatEntryPoint,
		notificationService = p1.notificationService,
		config = p1.config,
		toggleChatPaused = p1.toggleChatPaused,
		performanceTesting = p1.performanceTesting,
		notificationType = p1.notificationType,
		updateExternalNavigationForScreen = p1.updateExternalNavigationForScreen
	}
end)((RoactRodux.connect(MapStateToPropsModule, MapDispatchToPropsModule)(SocialTabEntryPoint))))