local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local Logger = DependenciesModule.Logger
local RoactRodux = DependenciesModule.RoactRodux
local RoactAppExperiment = DependenciesModule.RoactAppExperiment
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FriendsLandingAnalyticsModule = require(FriendsLanding.FriendsLandingAnalytics)
local NavigatorModule = require(FriendsLanding.Navigator)
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local MemoizeFunction = DependenciesModule.memoize
local BottomInsetBackground = DependenciesModule.SocialCommon.Components.BottomInsetBackground
local ComposeFunction = DependenciesModule.SocialLibraries.RoduxTools.compose
local MapStateToPropsModule = require(script.mapStateToProps)
local MapDispatchToPropsModule = require(script.mapDispatchToProps)
local WithLocalizationFunction = DependenciesModule.withLocalization
local GetFStringSocialAddFriendsPageLayerFunction = DependenciesModule.getFStringSocialAddFriendsPageLayer
local FFlagContactImporterIXPCleanup = require(Parent.SharedFlags).FFlagContactImporterIXPCleanup
local FFlagFriendsPageAlwaysOpenPPV = require(Parent.SharedFlags).FFlagFriendsPageAlwaysOpenPPV

local function v17() end

local FriendsLandingEntryPoint = Roact.PureComponent:extend("FriendsLandingEntryPoint")
FriendsLandingEntryPoint.defaultProps = {
	renderAndroidBackButtonNavigationHandler = nil,
	isLuobu = false,
	logger = nil,
	debug_willUnmount = nil,
	luaAppPages = {}
}

function FriendsLandingEntryPoint.init(p1)
	-- upvalues: Logger (copy), FilterStatesModule (copy), EnumScreensModule (copy), v17 (copy), MemoizeFunction (copy), FriendsLandingAnalyticsModule (copy)
	if p1.props.logger then
		Logger:setParent(p1.props.logger)
	end
	p1.state = {
		filter = FilterStatesModule.All,
		topBar = {
			[EnumScreensModule.FriendsLanding] = { shouldRenderCenter = false }
		}
	}
	p1.localization = { pageError = "CommonUI.Messages.Response.PageError" }
	
	function p1.setFilterKeys(Filter)
		-- upvalues: p1 (copy)
		assert(type(Filter) == "string", "Expected value to be a string")
		p1:setState({ filter = Filter })
	end
	
	function p1.showErrorToast(ToastTitle)
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.navigation.navigate(EnumScreensModule.GenericToast, {
			toastProps = { toastContent = { toastTitle = ToastTitle } }
		})
	end
	
	function p1.refreshPage(p2)
		-- upvalues: p1 (copy), Logger (upval), v17 (upval)
		return p1.props.refreshPageData({
			localUserId = p1.props.localUserId,
			inactiveFriendsNetworkRequestStatus = p1.props.inactiveFriendsNetworkRequestStatus,
			onError = function()
				-- upvalues: p1 (upval), p2 (copy), Logger (upval)
				p1.showErrorToast(p2.errorMessage)
				Logger:info("Refreshing FriendsLanding data failed")
			end,
			onResolve = p2.onResolve or v17
		})
	end
	
	p1.getAnalytics = MemoizeFunction(function(p2)
		-- upvalues: FriendsLandingAnalyticsModule (upval), p1 (copy)
		return FriendsLandingAnalyticsModule.Class.new({
			Diag = p1.props.diagService,
			EventStream = p1.props.eventIngestService
		}, p2, p1.props.getLoadingTimeInfo)
	end)
end

function FriendsLandingEntryPoint.render(p1)
	-- upvalues: WithLocalizationFunction (copy), Roact (copy), FriendsLandingAnalyticsModule (copy), FriendsLandingContextModule (copy), FFlagContactImporterIXPCleanup (copy), FFlagFriendsPageAlwaysOpenPPV (copy), NavigatorModule (copy), BottomInsetBackground (copy)
	return WithLocalizationFunction(p1.localization)(function(_)
		-- upvalues: Roact (upval), FriendsLandingAnalyticsModule (upval), p1 (copy), FriendsLandingContextModule (upval), FFlagContactImporterIXPCleanup (upval), FFlagFriendsPageAlwaysOpenPPV (upval), NavigatorModule (upval), BottomInsetBackground (upval)
		return Roact.createElement(FriendsLandingAnalyticsModule.Context.Provider, { value = p1.getAnalytics(p1.props.localUserId) }, {
			Roact.createElement(FriendsLandingContextModule.Provider, {
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
					contactImporterAndPYMKEnabled = if FFlagContactImporterIXPCleanup then nil else p1.props.contactImporterAndPYMKEnabled,
					contactImporterExperimentVariant = if FFlagContactImporterIXPCleanup then nil else p1.props.contactImporterExperimentVariant,
					addFriendsPageSearchbarEnabled = p1.props.addFriendsPageSearchbarEnabled,
					openProfilePeekView = p1.props.openProfilePeekView,
					openPlayerContextualMenu = if FFlagFriendsPageAlwaysOpenPPV then nil else p1.props.openPlayerContextualMenu,
					openAmpUpsell = p1.props.openAmpUpsell,
					passedNavParams = p1.props.passedNavParams
				}
			}, {
				navigation = Roact.createElement(NavigatorModule, { navigation = p1.props.navigation }),
				BottomInsetBackground = Roact.createElement(BottomInsetBackground)
			})
		})
	end)
end

function FriendsLandingEntryPoint:didMount()
	-- upvalues: Logger (copy)
	Logger:info("FriendsLandingEntryPoint mounted")
end

function FriendsLandingEntryPoint.willUnmount(p1)
	-- upvalues: Logger (copy)
	Logger:info("FriendsLandingEntryPoint unmounted")
	
	if p1.props.debug_willUnmount then
		p1.props.debug_willUnmount()
	end
end

return (ComposeFunction(RoactRodux.connect(MapStateToPropsModule, MapDispatchToPropsModule), RoactAppExperiment.connectUserLayer({ GetFStringSocialAddFriendsPageLayerFunction() }, function(p1, _)
	-- upvalues: GetFStringSocialAddFriendsPageLayerFunction (copy)
	return {
		addFriendsPageSearchbarEnabled = (p1[GetFStringSocialAddFriendsPageLayerFunction()] or {}).show_add_friends_page_search_bar
	}
end, false))(FriendsLandingEntryPoint))