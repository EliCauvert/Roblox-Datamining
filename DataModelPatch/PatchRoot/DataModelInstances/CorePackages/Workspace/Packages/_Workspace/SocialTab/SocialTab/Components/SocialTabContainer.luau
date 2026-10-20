local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local AnalyticsModule = require(SocialTab.Analytics)
local SocialTabContextModule = require(SocialTab.SocialTabContext)
local ComposeModule = require(SocialTab.ContextUtils.compose)
local Llama = DependenciesModule.llama
local Roact = DependenciesModule.Roact
local RoactRodux = DependenciesModule.RoactRodux
local WithLocalizationFunction = DependenciesModule.withLocalization
local UniversalAppPolicy = DependenciesModule.UniversalAppPolicy
local MapStateToPropsModule = require(script.mapStateToProps)
local MapDispatchToPropsModule = require(script.mapDispatchToProps)
local SocialTabPageModule = require(script.Parent.SocialTabPage)
local UserCarouselModule = require(SocialTab.UserCarousel)
local SocialTabContainer = Roact.PureComponent:extend("SocialTabContainer")
local GetFFlagHideConnectPageWebViewItemsForVRFunction = DependenciesModule.GetFFlagHideConnectPageWebViewItemsForVR
local GetFFlagUseCommunitiesTranslationFunction = require(SocialTab.Parent.SharedFlags).GetFFlagUseCommunitiesTranslation
SocialTabContainer.defaultProps = {}

function SocialTabContainer.init(p1)
	-- upvalues: GetFFlagUseCommunitiesTranslationFunction (copy)
	p1.localization = {
		socialText = "Feature.SocialTab.Label.Connect",
		chatsText = "Feature.SocialTab.Label.Chats",
		groupsText = if GetFFlagUseCommunitiesTranslationFunction() then "Feature.SocialTab.Label.Groups" else "CommonUI.Features.Label.sGroups"
	}
end

function SocialTabContainer.didMount(p1)
	p1.props.fetchFriendsRequestsCount()
end

function SocialTabContainer.render(p1)
	-- upvalues: WithLocalizationFunction (copy), AnalyticsModule (copy), SocialTabContextModule (copy), Roact (copy), SocialTabPageModule (copy), Llama (copy), UserCarouselModule (copy)
	return WithLocalizationFunction(p1.localization)(function(p2)
		-- upvalues: AnalyticsModule (upval), SocialTabContextModule (upval), Roact (upval), SocialTabPageModule (upval), Llama (upval), p1 (copy), UserCarouselModule (upval)
		return AnalyticsModule.with(function(Analytics)
			-- upvalues: SocialTabContextModule (upval), Roact (upval), SocialTabPageModule (upval), Llama (upval), p1 (upval), UserCarouselModule (upval), p2 (copy)
			return SocialTabContextModule.with(function(p3)
				-- upvalues: Roact (upval), SocialTabPageModule (upval), Llama (upval), p1 (upval), Analytics (copy), UserCarouselModule (upval), p2 (upval)
				return Roact.createElement(SocialTabPageModule, Llama.Dictionary.join(p1.props, {
					analytics = Analytics,
					navigateToLuaAppPages = p3.navigateToLuaAppPages,
					renderUserCarousel = UserCarouselModule.render,
					wideMode = p3.wideMode,
					navigatingFromSocialTabEvent = p3.setNavigatingFromSocialTabEvent,
					isLuaProfilePageEnabled = p3.isLuaProfilePageEnabled,
					luaAddFriendsPageEnabled = if p3.luaAddFriendsPageEnabled then true else false,
					closeCentralOverlay = p3.closeCentralOverlay,
					openLearnMoreLink = p3.openLearnMoreLink,
					showToast = p3.showToast
				}, p2))
			end)
		end)
	end)
end

return ComposeModule(RoactRodux.connect(MapStateToPropsModule, MapDispatchToPropsModule), UniversalAppPolicy.connect(function(p1)
	-- upvalues: GetFFlagHideConnectPageWebViewItemsForVRFunction (copy)
	return {
		enableDisplayNamePolicy = p1.getShowDisplayName(),
		shouldShowGroupsTilePolicy = p1.getShouldShowGroupsTile(),
		enableNotificationsPolicy = p1.getChatHeaderNotifications(),
		disableWebViewSupport = if GetFFlagHideConnectPageWebViewItemsForVRFunction() then not p1.getWebViewSupport() else nil
	}
end))(SocialTabContainer)