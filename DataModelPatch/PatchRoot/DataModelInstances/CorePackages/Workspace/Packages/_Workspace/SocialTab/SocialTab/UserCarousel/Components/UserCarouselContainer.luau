local SocialTab = script:FindFirstAncestor("SocialTab")
local ComposeModule = require(SocialTab.ContextUtils.compose)
local AnalyticsModule = require(SocialTab.Analytics)
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local RoactRodux = DependenciesModule.RoactRodux
local UniversalAppPolicy = DependenciesModule.UniversalAppPolicy
local MapStateToPropsModule = require(script.mapStateToProps)
local MapDispatchToPropsModule = require(script.mapDispatchToProps)
local SocialTabContextModule = require(SocialTab.SocialTabContext)
local FreezableUserCarouselModule = require(script.Parent.FreezableUserCarousel)
local UserCarouselContainer = Roact.PureComponent:extend("UserCarouselContainer")
UserCarouselContainer.defaultProps = {
	LayoutOrder = 0,
	wideMode = false,
	navigateToLuaAppPages = nil,
	goToFriendsLanding = nil
}
UserCarouselContainer.validateProps = T.interface({
	LayoutOrder = T.optional(T.number),
	wideMode = T.boolean,
	navigateToLuaAppPages = T.optional(T.table),
	goToFriendsLanding = T.optional(T.callback)
})

function UserCarouselContainer.render(p1)
	-- upvalues: Roact (copy), FreezableUserCarouselModule (copy)
	return Roact.createElement(FreezableUserCarouselModule, p1.props)
end

return ComposeModule(SocialTabContextModule.connect(function(p1)
	return { isLuaProfilePageEnabled = p1.isLuaProfilePageEnabled }
end) or nil, RoactRodux.connect(MapStateToPropsModule, MapDispatchToPropsModule), AnalyticsModule.connect(function(Analytics)
	return { analytics = Analytics }
end), UniversalAppPolicy.connect(function(p1)
	return {
		enableDisplayNamePolicy = p1.getShowDisplayName(),
		enableFriendFinder = p1.getFriendFinder(),
		accountProviderName = p1.getAccountProviderName(),
		inviteFromAccountProvider = p1.shouldInviteFromAccountProvider()
	}
end))(UserCarouselContainer)