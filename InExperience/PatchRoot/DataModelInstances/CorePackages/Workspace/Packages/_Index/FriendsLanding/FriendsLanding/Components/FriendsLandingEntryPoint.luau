local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local logger = dependenciesModule.Logger
local roactRodux = dependenciesModule.RoactRodux
local roactAppExperiment = dependenciesModule.RoactAppExperiment
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local friendsLandingAnalyticsModule = require(friendsLanding.FriendsLandingAnalytics)
local navigatorModule = require(friendsLanding.Navigator)
local enumScreensModule = require(friendsLanding.EnumScreens)
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local memoize = dependenciesModule.memoize
local bottomInsetBackground = dependenciesModule.SocialCommon.Components.BottomInsetBackground
local compose = dependenciesModule.SocialLibraries.RoduxTools.compose
local mapStateToPropsModule = require(script.mapStateToProps)
local mapDispatchToPropsModule = require(script.mapDispatchToProps)
local withLocalization = dependenciesModule.withLocalization
local getFStringSocialAddFriendsPageLayer = dependenciesModule.getFStringSocialAddFriendsPageLayer
local fFlagContactImporterIXPCleanup = require(parent.SharedFlags).FFlagContactImporterIXPCleanup
local fFlagFriendsPageAlwaysOpenPPV = require(parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV

local var9 = function() end

local friendsLandingEntryPoint = roact.PureComponent:extend("FriendsLandingEntryPoint")
friendsLandingEntryPoint.defaultProps = {
	renderAndroidBackButtonNavigationHandler = nil,
	isLuobu = false,
	logger = nil,
	debug_willUnmount = nil,
	luaAppPages = {}
}

function friendsLandingEntryPoint.init(p0)
	-- upvalues: logger (ref), filterStatesModule (ref), enumScreensModule (ref), var9 (ref), memoize (ref), friendsLandingAnalyticsModule (ref)
	if p0.props.logger then
		logger:setParent(p0.props.logger)
	end
	p0.state = {
		filter = filterStatesModule.All,
		topBar = {
			[enumScreensModule.FriendsLanding] = { shouldRenderCenter = false }
		}
	}
	p0.localization = { pageError = "CommonUI.Messages.Response.PageError" }
	
	function p0.setFilterKeys(p1)
		-- upvalues: p0 (ref)
		assert(type(p1) == "string", "Expected value to be a string")
		p0:setState({ filter = p1 })
	end
	
	function p0.showErrorToast(p2)
		-- upvalues: p0 (ref), enumScreensModule (copy)
		p0.props.navigation.navigate(enumScreensModule.GenericToast, { toastProps = { toastContent = { toastTitle = p2 } } })
	end
	
	function p0.refreshPage(p3)
		-- upvalues: p0 (ref), logger (copy), var9 (copy)
		return p0.props.refreshPageData({
			localUserId = p0.props.localUserId,
			inactiveFriendsNetworkRequestStatus = p0.props.inactiveFriendsNetworkRequestStatus,
			onError = function()
				-- upvalues: p0 (copy), p3 (ref), logger (copy)
				p0.showErrorToast(p3.errorMessage)
				logger:info("Refreshing FriendsLanding data failed")
			end,
			onResolve = p3.onResolve or var9
		})
	end
	
	p0.getAnalytics = memoize(function(p4)
		-- upvalues: friendsLandingAnalyticsModule (copy), p0 (ref)
		return friendsLandingAnalyticsModule.Class.new({
			Diag = p0.props.diagService,
			EventStream = p0.props.eventIngestService
		}, p4, p0.props.getLoadingTimeInfo)
	end)
end

function friendsLandingEntryPoint.render(p5)
	-- upvalues: withLocalization (ref), roact (ref), friendsLandingAnalyticsModule (ref), friendsLandingContextModule (ref), fFlagContactImporterIXPCleanup (ref), fFlagFriendsPageAlwaysOpenPPV (ref), navigatorModule (ref), bottomInsetBackground (ref)
	return withLocalization(p5.localization)(function(_)
		-- upvalues: roact (copy), friendsLandingAnalyticsModule (copy), p5 (ref), friendsLandingContextModule (copy), fFlagContactImporterIXPCleanup (copy), fFlagFriendsPageAlwaysOpenPPV (copy), navigatorModule (copy), bottomInsetBackground (copy)
		return roact.createElement(friendsLandingAnalyticsModule.Context.Provider, { value = p5.getAnalytics(p5.props.localUserId) }, {
			roact.createElement(friendsLandingContextModule.Provider, {
				value = {
					navigateToLuaAppPages = p5.props.navigateToLuaAppPages,
					filter = p5.state.filter,
					setFilterKeys = p5.setFilterKeys,
					screenSize = p5.props.screenSize,
					friendRequestCount = p5.props.friendRequestCount,
					totalFriendCount = p5.props.totalFriendCount,
					wideMode = p5.props.wideMode,
					playerSearchPage = p5.props.luaAppPages.playerSearchPage,
					diagService = p5.props.diagService,
					eventIngestService = p5.props.eventIngestService,
					isLuobu = p5.props.isLuobu,
					refreshPage = p5.refreshPage,
					friendsRequestEventListener = p5.props.friendsRequestEventListener,
					robloxEventReceiver = p5.props.robloxEventReceiver,
					contactImporterAndPYMKEnabled = if fFlagContactImporterIXPCleanup then nil else p5.props.contactImporterAndPYMKEnabled,
					contactImporterExperimentVariant = if fFlagContactImporterIXPCleanup then nil else p5.props.contactImporterExperimentVariant,
					addFriendsPageSearchbarEnabled = p5.props.addFriendsPageSearchbarEnabled,
					openProfilePeekView = p5.props.openProfilePeekView,
					openPlayerContextualMenu = if fFlagFriendsPageAlwaysOpenPPV then nil else p5.props.openPlayerContextualMenu,
					openAmpUpsell = p5.props.openAmpUpsell,
					passedNavParams = p5.props.passedNavParams
				}
			}, {
				navigation = roact.createElement(navigatorModule, { navigation = p5.props.navigation }),
				BottomInsetBackground = roact.createElement(bottomInsetBackground)
			})
		})
	end)
end

function friendsLandingEntryPoint.didMount(_)
	-- upvalues: logger (ref)
	logger:info("FriendsLandingEntryPoint mounted")
end

function friendsLandingEntryPoint.willUnmount(p6)
	-- upvalues: logger (ref)
	logger:info("FriendsLandingEntryPoint unmounted")
	
	if p6.props.debug_willUnmount then
		p6.props.debug_willUnmount()
	end
end

return compose(roactRodux.connect(mapStateToPropsModule, mapDispatchToPropsModule), roactAppExperiment.connectUserLayer({ getFStringSocialAddFriendsPageLayer() }, function(p7, _)
	-- upvalues: getFStringSocialAddFriendsPageLayer (ref)
	return {
		addFriendsPageSearchbarEnabled = (p7[getFStringSocialAddFriendsPageLayer()] or {}).show_add_friends_page_search_bar
	}
end, false))(friendsLandingEntryPoint)