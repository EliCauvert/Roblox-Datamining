local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppCommonLib)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local TrustedFriendCandidatesSection = require(Parent.TrustedFriendCandidates).TrustedFriendCandidatesSection
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local FFlagFriendsLandingRefreshKeepsFilter = require(Parent.SharedFlags).FFlagFriendsLandingRefreshKeepsFilter
local ConstantsModule = require(FriendsLanding.Common.Constants)
local EnumScreensModule = require(FriendsLanding.EnumScreens)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), AppPage (copy), Sources (copy), FFlagEnableSplitPane (copy), ConstantsModule (copy), TrustedFriendCandidatesSection (copy), EnumScreensModule (copy), FFlagFriendsLandingRefreshKeepsFilter (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(TrustedFriendCandidatesSection, {
		onAddPress = ReactModule.useCallback(function(UserId, OnRequestSent)
			-- upvalues: UseNavigationResult (copy), AppPage (upval), Sources (upval)
			UseNavigationResult.push(AppPage.TrustedContactsModal, {
				props = {
					userId = UserId,
					source = Sources.FriendsLandingTrustedCandidates,
					onRequestSent = OnRequestSent
				}
			})
		end, { UseNavigationResult }),
		onAcceptPress = ReactModule.useCallback(function(UserId)
			-- upvalues: UseNavigationResult (copy), AppPage (upval), Sources (upval)
			UseNavigationResult.push(AppPage.TrustedContactsModal, {
				props = {
					userId = UserId,
					source = Sources.FriendsLandingTrustedCandidates
				}
			})
		end, { UseNavigationResult }),
		onRowSelected = ReactModule.useCallback(function(Detail)
			-- upvalues: FFlagEnableSplitPane (upval), UseNavigationResult (copy), AppPage (upval), ConstantsModule (upval)
			(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, {
				detail = Detail,
				extraProps = {
					source = ConstantsModule.FriendsLandingTrustedCandidatesSourceName
				}
			})
		end, { UseNavigationResult }),
		pageContext = EnumScreensModule.FriendsLanding,
		layoutOrder = p1.layoutOrder,
		refreshSignal = if FFlagFriendsLandingRefreshKeepsFilter then p1.refreshSignal else nil
	})
end