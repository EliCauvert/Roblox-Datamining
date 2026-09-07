local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local navigationRoduxModule = require(parent.NavigationRodux)
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local navigateDownToViewUserProfile = navigationRoduxModule.Thunks.NavigateDownToViewUserProfile
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local constantsModule = require(profilePlatform.Common.Constants)
local UIBloxModule = require(parent.UIBlox)
local horizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

function ViewFullProfile(p1)
	-- upvalues: fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), navigateDownToViewUserProfile (ref), urlBuilder (ref), urlBase (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), horizontalPageMargin (ref), constantsModule (ref), button (ref), buttonType (ref)
	local var2 = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then useProfileJsonComponentModule(enumsModule.Components.ViewFullProfile) or {} else nil
	local var3 = useProfileWrapperContextModule()
	local profileId = var3.profileId
	local profileType = var3.profileType
	local var4 = useProfileAnalyticsContextModule()
	local var5 = useDispatch()
	local var6 = useLocalization({
		viewFullProfileLabel = textKeysModule.ViewFullProfile,
		viewCommunityLabel = textKeysModule.ViewCommunity
	})
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.fromScale(1, 0),
		layoutOrder = p1.layoutOrder
	}, {
		ViewFullProfileFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, constantsModule.ADDITIONAL_PADDING)
			}),
			ViewFullProfile = reactModule.createElement(button, {
				buttonType = buttonType.Secondary,
				size = UDim2.new(1, 0, 0, constantsModule.CTA_BUTTON_HEIGHT),
				onActivated = reactModule.useCallback(function()
					-- upvalues: var4 (ref), eventNamesModule (copy), var3 (ref), enumsModule (copy), profileType (ref), var5 (ref), navigateDownToViewUserProfile (copy), profileId (ref), var2 (ref), urlBuilder (copy), urlBase (copy), appPage (copy), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					var4.fireAnalyticsEvent(eventNamesModule.ViewPlayerProfileButton, {
						absolutePosition = var3.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = var3.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						source = var3.sourceInfo.source,
						isRecommendation = var3.sourceInfo.isRecommendation,
						recommendationContextType = var3.sourceInfo.recommendationContextType,
						recommendationRank = var3.sourceInfo.recommendationRank,
						recommendationSessionId = var3.sourceInfo.recommendationSessionId
					})
					
					if profileType == enumsModule.ProfileTypes.User then
						var5(navigateDownToViewUserProfile(profileId))
						
						return
					elseif profileType == enumsModule.ProfileTypes.Community then
						local t = {
							name = appPage.GenericWebPage,
							detail = if var2.type == enumsModule.ViewFullProfileTypes.Profile then urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })() else urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and var2.type == enumsModule.ViewFullProfileTypes.Profile then textKeysModule.Profile else textKeysModule.Community
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var5(navigateDown(t))
					end
				end, { var5, profileId, var4, var3 }),
				text = reactModule.useMemo(function()
					-- upvalues: profileType (ref), enumsModule (copy), var6 (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), var2 (ref)
					if profileType == enumsModule.ProfileTypes.User then
						return var6.viewFullProfileLabel
					elseif profileType == enumsModule.ProfileTypes.Community then
						return if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then if var2.type == enumsModule.ViewFullProfileTypes.Profile then var6.viewFullProfileLabel elseif var2.type == enumsModule.ViewFullProfileTypes.Community then var6.viewCommunityLabel else var6.viewFullProfileLabel else var6.viewCommunityLabel
					end
				end, { var6 })
			})
		})
	})
end

return ViewFullProfile