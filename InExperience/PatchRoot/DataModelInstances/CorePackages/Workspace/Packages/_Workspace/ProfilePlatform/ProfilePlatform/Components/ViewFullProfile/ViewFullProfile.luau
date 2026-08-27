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
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

function ViewFullProfile(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), navigateDownToViewUserProfile (ref), urlBuilder (ref), urlBase (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), horizontalPageMargin (ref), constantsModule (ref), button (ref), buttonType (ref)
	local viewFullProfile = useProfileJsonComponentModule(enumsModule.Components.ViewFullProfile) or {}
	local var2 = useProfileWrapperContextModule()
	local profileId = var2.profileId
	local profileType = var2.profileType
	local var3 = useProfileAnalyticsContextModule()
	local var4 = useDispatch()
	local var5 = useLocalization({
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
					-- upvalues: var3 (ref), eventNamesModule (copy), var2 (ref), enumsModule (copy), profileType (ref), var4 (ref), navigateDownToViewUserProfile (copy), profileId (ref), viewFullProfile (ref), urlBuilder (copy), urlBase (copy), appPage (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					var3.fireAnalyticsEvent(eventNamesModule.ViewPlayerProfileButton, {
						absolutePosition = var2.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = var2.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
						source = var2.sourceInfo.source,
						isRecommendation = var2.sourceInfo.isRecommendation,
						recommendationContextType = var2.sourceInfo.recommendationContextType,
						recommendationRank = var2.sourceInfo.recommendationRank,
						recommendationSessionId = var2.sourceInfo.recommendationSessionId
					})
					
					if profileType == enumsModule.ProfileTypes.User then
						var4(navigateDownToViewUserProfile(profileId))
						
						return
					elseif profileType == enumsModule.ProfileTypes.Community then
						local t = {
							name = appPage.GenericWebPage,
							detail = if viewFullProfile.type == enumsModule.ViewFullProfileTypes.Profile then urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })() else urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = if viewFullProfile.type == enumsModule.ViewFullProfileTypes.Profile then textKeysModule.Profile else textKeysModule.Community
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var4(navigateDown(t))
					end
				end, { var4, profileId, var3, var2 }),
				text = reactModule.useMemo(function()
					-- upvalues: profileType (ref), enumsModule (copy), var5 (ref), viewFullProfile (ref)
					if profileType == enumsModule.ProfileTypes.User then
						return var5.viewFullProfileLabel
					elseif profileType == enumsModule.ProfileTypes.Community then
						return if viewFullProfile.type == enumsModule.ViewFullProfileTypes.Profile then var5.viewFullProfileLabel elseif viewFullProfile.type == enumsModule.ViewFullProfileTypes.Community then var5.viewCommunityLabel else var5.viewFullProfileLabel
					end
				end, { var5 })
			})
		})
	})
end

return ViewFullProfile