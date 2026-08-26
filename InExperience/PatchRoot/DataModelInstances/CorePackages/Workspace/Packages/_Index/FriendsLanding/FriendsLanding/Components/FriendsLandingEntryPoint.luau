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

local var1 = function() end

local friendsLandingEntryPoint = roact.PureComponent:extend("FriendsLandingEntryPoint")
friendsLandingEntryPoint.defaultProps = {
	renderAndroidBackButtonNavigationHandler = nil,
	isLuobu = false,
	logger = nil,
	debug_willUnmount = nil,
	luaAppPages = {}
}

function friendsLandingEntryPoint.init(p1)
	-- upvalues: logger (ref), filterStatesModule (ref), enumScreensModule (ref), var1 (ref), memoize (ref), friendsLandingAnalyticsModule (ref)
	if p1.props.logger then
		logger:setParent(p1.props.logger)
	end
	p1.state = {
		filter = filterStatesModule.All,
		topBar = {
			[enumScreensModule.FriendsLanding] = { shouldRenderCenter = false }
		}
	}
	p1.localization = { pageError = "CommonUI.Messages.Response.PageError" }
	
	function p0.setFilterKeys(p2)
		-- upvalues: p1 (ref)
		assert(type(p2) == "string", "Expected value to be a string")
		p1:setState({ filter = p2 })
	end
	
	function p0.showErrorToast(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.navigate(enumScreensModule.GenericToast, { toastProps = { toastContent = { toastTitle = p2 } } })
	end
	
	function p0.refreshPage(p2)
		-- upvalues: p1 (ref), logger (copy), var1 (copy)
		return p1.props.refreshPageData({
			localUserId = p1.props.localUserId,
			inactiveFriendsNetworkRequestStatus = p1.props.inactiveFriendsNetworkRequestStatus,
			onError = function()
				-- upvalues: p1 (copy), p2 (ref), logger (copy)
				p1.showErrorToast(p2.errorMessage)
				logger:info("Refreshing FriendsLanding data failed")
			end,
			onResolve = p2.onResolve or var1
		})
	end
	
	p1.getAnalytics = memoize(function(p2)
		-- upvalues: friendsLandingAnalyticsModule (copy), p1 (ref)
		return friendsLandingAnalyticsModule.Class.new({
			Diag = p1.props.diagService,
			EventStream = p1.props.eventIngestService
		}, p2, p1.props.getLoadingTimeInfo)
	end)
end

function friendsLandingEntryPoint.render(p1)
	-- upvalues: withLocalization (ref), roact (ref), friendsLandingAnalyticsModule (ref), friendsLandingContextModule (ref), fFlagContactImporterIXPCleanup (ref), fFlagFriendsPageAlwaysOpenPPV (ref), navigatorModule (ref), bottomInsetBackground (ref)
	return withLocalization(p1.localization)(function(_)
		-- upvalues: roact (copy), friendsLandingAnalyticsModule (copy), p1 (ref), friendsLandingContextModule (copy), fFlagContactImporterIXPCleanup (copy), fFlagFriendsPageAlwaysOpenPPV (copy), navigatorModule (copy), bottomInsetBackground (copy)
		return roact.createElement(friendsLandingAnalyticsModule.Context.Provider, { value = p1.getAnalytics(p1.props.localUserId) }, {
			roact.createElement(friendsLandingContextModule.Provider, {
				value = {
					navigateToLuaAppPages = p1.props.navigateToLuaAppPages,
					filter = p1.state.filter,
					setFilterKeys = p1.setFilterKeys,
					screenSize = p1.props.screenSize,
					friendRequestCount = p1.props.friendRequestCount,
					totalFriendCount = p1.props.totalFriendCount,
					wideMode = p1.props.wideMode,
					playerSearchPage = p1.props.luaAppPages.playerSearchPage,
					diagService = p1.props.diagService,
					eventIngestService = p1.props.eventIngestService,
					isLuobu = p1.props.isLuobu,
					refreshPage = p1.refreshPage,
					friendsRequestEventListener = p1.props.friendsRequestEventListener,
					robloxEventReceiver = p1.props.robloxEventReceiver,
					contactImporterAndPYMKEnabled = if fFlagContactImporterIXPCleanup then nil else p1.props.contactImporterAndPYMKEnabled,
					contactImporterExperimentVariant = if fFlagContactImporterIXPCleanup then nil else p1.props.contactImporterExperimentVariant,
					addFriendsPageSearchbarEnabled = p1.props.addFriendsPageSearchbarEnabled,
					openProfilePeekView = p1.props.openProfilePeekView,
					openPlayerContextualMenu = if fFlagFriendsPageAlwaysOpenPPV then nil else p1.props.openPlayerContextualMenu,
					openAmpUpsell = p1.props.openAmpUpsell,
					passedNavParams = p1.props.passedNavParams
				}
			}, {
				navigation = roact.createElement(navigatorModule, { navigation = p1.props.navigation }),
				BottomInsetBackground = roact.createElement(bottomInsetBackground)
			})
		})
	end)
end

function friendsLandingEntryPoint.didMount(_)
	-- upvalues: logger (ref)
	logger:info("FriendsLandingEntryPoint mounted")
end

function friendsLandingEntryPoint.willUnmount(p1)
	-- upvalues: logger (ref)
	logger:info("FriendsLandingEntryPoint unmounted")
	
	if p1.props.debug_willUnmount then
		p1.props.debug_willUnmount()
	end
end

return compose(roactRodux.connect(mapStateToPropsModule, mapDispatchToPropsModule), roactAppExperiment.connectUserLayer({ getFStringSocialAddFriendsPageLayer() }, function(p1, _)
	-- upvalues: getFStringSocialAddFriendsPageLayer (ref)
	return {
		addFriendsPageSearchbarEnabled = (p1[getFStringSocialAddFriendsPageLayer()] or {}).show_add_friends_page_search_bar
	}
end, false))(friendsLandingEntryPoint)