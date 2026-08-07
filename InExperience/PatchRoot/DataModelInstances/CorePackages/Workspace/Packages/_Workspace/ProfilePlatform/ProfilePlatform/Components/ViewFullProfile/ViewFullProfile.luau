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
local var12 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

function ViewFullProfile(p0) --[[ line: 38 ]]
	-- upvalues: fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), navigateDownToViewUserProfile (ref), urlBuilder (ref), urlBase (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var12 (ref), navigateDown (ref), horizontalPageMargin (ref), constantsModule (ref), button (ref), buttonType (ref)
	local var13 = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then useProfileJsonComponentModule(enumsModule.Components.ViewFullProfile) or {} else nil
	local var14 = useProfileWrapperContextModule()
	local profileId = var14.profileId
	local profileType = var14.profileType
	local var15 = useProfileAnalyticsContextModule()
	local var16 = useDispatch()
	local var17 = useLocalization({
		viewFullProfileLabel = textKeysModule.ViewFullProfile,
		viewCommunityLabel = textKeysModule.ViewCommunity
	})
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.fromScale(1, 0),
		layoutOrder = p0.layoutOrder
	}, {
		ViewFullProfileFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p0.layoutOrder
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, constantsModule.ADDITIONAL_PADDING)
			}),
			ViewFullProfile = reactModule.createElement(button, {
				buttonType = buttonType.Secondary,
				size = UDim2.new(1, 0, 0, constantsModule.CTA_BUTTON_HEIGHT),
				onActivated = reactModule.useCallback(function() --[[ line: 74 ]]
					-- upvalues: var15 (ref), eventNamesModule (copy), var14 (ref), enumsModule (copy), profileType (ref), var16 (ref), navigateDownToViewUserProfile (copy), profileId (ref), var13 (ref), urlBuilder (copy), urlBase (copy), appPage (copy), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var12 (copy), navigateDown (copy)
					var15.fireAnalyticsEvent(eventNamesModule.ViewPlayerProfileButton, {
						absolutePosition = var14.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = var14.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						source = var14.sourceInfo.source,
						isRecommendation = var14.sourceInfo.isRecommendation,
						recommendationContextType = var14.sourceInfo.recommendationContextType,
						recommendationRank = var14.sourceInfo.recommendationRank,
						recommendationSessionId = var14.sourceInfo.recommendationSessionId
					})
					
					if profileType == enumsModule.ProfileTypes.User then
						var16(navigateDownToViewUserProfile(profileId))
						
						return
					elseif profileType == enumsModule.ProfileTypes.Community then
						local t = {
							name = appPage.GenericWebPage,
							detail = if var13.type == enumsModule.ViewFullProfileTypes.Profile then urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })() else urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and var13.type == enumsModule.ViewFullProfileTypes.Profile then textKeysModule.Profile else textKeysModule.Community
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var12.down(var12.fromLegacyPage(t))
							
							return
						end
						var16(navigateDown(t))
					end
				end, { var16, profileId, var15, var14 }),
				text = reactModule.useMemo(function() --[[ line: 52 ]]
					-- upvalues: profileType (ref), enumsModule (copy), var17 (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), var13 (ref)
					if profileType == enumsModule.ProfileTypes.User then
						return var17.viewFullProfileLabel
					elseif profileType == enumsModule.ProfileTypes.Community then
						return if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then if var13.type == enumsModule.ViewFullProfileTypes.Profile then var17.viewFullProfileLabel elseif var13.type == enumsModule.ViewFullProfileTypes.Community then var17.viewCommunityLabel else var17.viewFullProfileLabel else var17.viewCommunityLabel
					end
				end, { var17 })
			})
		})
	})
end

return ViewFullProfile