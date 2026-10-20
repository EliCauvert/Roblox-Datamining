local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local EntryPoints = require(CorePackages.Workspace.Packages.DiscoverabilityModal).Analytics.EntryPoints
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInfoWidgetModule = require(Modules.LuaApp.Components.Home.UserInfoWidget)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local UseNavigateToDiscoverabilityModalModule = require(Modules.LuaApp.Components.DiscoverabilityModal.useNavigateToDiscoverabilityModal)
local Sources = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources
local FFlagLuaAppMoveProfileIntoTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar
local HomeUserInfoWidget = RoactModule.PureComponent:extend("HomeUserInfoWidget")

function HomeUserInfoWidget.init(p1)
	-- upvalues: Sources (copy), EntryPoints (copy)
	function p1.navigateToProfile()
		-- upvalues: p1 (copy), Sources (upval)
		p1.props.openProfilePeekView(p1.props.localUserModel.id, { source = Sources.HomePageSelfWidget })
	end
	
	function p1.onUsernameActivated()
		-- upvalues: p1 (copy), EntryPoints (upval)
		if p1.props.enableHomeProfileLink then
			p1.props.navigateToDiscoverabilityModal({
				isStandaloneDiscoverabilityModal = true,
				navigateOnActivated = p1.navigateToProfile,
				entryPoint = EntryPoints.HomePageProfile
			})
			
			return
		end
	end
end

function HomeUserInfoWidget.render(p1)
	-- upvalues: FFlagLuaAppMoveProfileIntoTopBar (copy), RoactModule (copy), UserInfoWidgetModule (copy)
	local LocalUserModel = p1.props.localUserModel
	local LayoutOrder = p1.props.layoutOrder
	local SideMargin = p1.props.sideMargin
	local ShouldOnlyDisplayAvatarIcon = if FFlagLuaAppMoveProfileIntoTopBar then p1.props.shouldOnlyDisplayAvatarIcon else nil
	local OnlyAvatarButtonRef = if FFlagLuaAppMoveProfileIntoTopBar then p1.props.onlyAvatarButtonRef else nil
	
	return if LocalUserModel then RoactModule.createElement(UserInfoWidgetModule, {
		layoutOrder = LayoutOrder,
		localUserModel = LocalUserModel,
		onActivated = p1.onUsernameActivated,
		sideMargin = SideMargin,
		shouldOnlyDisplayAvatarIcon = if FFlagLuaAppMoveProfileIntoTopBar then ShouldOnlyDisplayAvatarIcon else nil,
		onlyAvatarButtonRef = if FFlagLuaAppMoveProfileIntoTopBar then OnlyAvatarButtonRef else nil
	}) else nil
end

local MemoizeResult = MemoizeFunction(function(p1, p2)
	return p1[p2]
end)
local v1 = RoactServices.connect({ networking = RoactNetworking })((RoactAppPolicy.connect(function(p1, _)
	return { enableHomeProfileLink = p1.getHomePageProfileLink() }
end)((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: MemoizeResult (copy)
	return { localUserModel = MemoizeResult(p1.Users, p1.LocalUserId) }
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), OpenProfilePeekViewModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownFunction(p1))
			end
		end,
		openProfilePeekView = function(p1, p2)
			-- upvalues: Callback (copy), OpenProfilePeekViewModule (upval)
			Callback(OpenProfilePeekViewModule(p1, p2))
		end
	}
end)(HomeUserInfoWidget)))))

function HomeUserInfoWidgetWrapper(p1)
	-- upvalues: UseNavigateToDiscoverabilityModalModule (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join({
		navigateToDiscoverabilityModal = UseNavigateToDiscoverabilityModalModule()
	}, p1))
end

return HomeUserInfoWidgetWrapper