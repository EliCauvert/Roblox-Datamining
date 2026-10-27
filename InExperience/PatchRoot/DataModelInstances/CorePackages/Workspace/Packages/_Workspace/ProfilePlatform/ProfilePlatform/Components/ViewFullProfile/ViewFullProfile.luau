local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NavigationRoduxModule = require(Parent.NavigationRodux)
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local NavigateDownToViewUserProfileFunction = NavigationRoduxModule.Thunks.NavigateDownToViewUserProfile
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local UIBloxModule = require(Parent.UIBlox)
local HorizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local MakeViewGroupPageModule = require(ProfilePlatform.Utils.makeViewGroupPage)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableGroupOverviewPane = SharedFlagsModule.FFlagEnableGroupOverviewPane
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

function ViewFullProfile(p1)
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), FFlagEnableGroupOverviewPane (copy), EventNamesModule (copy), NavigateDownToViewUserProfileFunction (copy), AppPage (copy), UrlBuilder (copy), UrlBase (copy), MakeViewGroupPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), HorizontalPageMargin (copy), ConstantsModule (copy), Button (copy), ButtonType (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.ViewFullProfile) or {}
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		viewFullProfileLabel = TextKeysModule.ViewFullProfile,
		viewCommunityLabel = TextKeysModule.ViewCommunity
	})
	
	return ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.fromScale(1, 0),
		layoutOrder = p1.layoutOrder
	}, {
		ViewFullProfileFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ConstantsModule.ADDITIONAL_PADDING)
			}),
			ViewFullProfile = ReactModule.createElement(Button, {
				buttonType = ButtonType.Secondary,
				size = UDim2.new(1, 0, 0, ConstantsModule.CTA_BUTTON_HEIGHT),
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseProfileWrapperContextModuleResult (copy), EnumsModule (upval), ProfileType (copy), UseDispatchResult (copy), NavigateDownToViewUserProfileFunction (upval), ProfileId (copy), UseProfileJsonComponentModuleResult (copy), AppPage (upval), UrlBuilder (upval), UrlBase (upval), TextKeysModule (upval), MakeViewGroupPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ViewPlayerProfileButton, {
						absolutePosition = UseProfileWrapperContextModuleResult.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
						source = UseProfileWrapperContextModuleResult.sourceInfo.source,
						isRecommendation = UseProfileWrapperContextModuleResult.sourceInfo.isRecommendation,
						recommendationContextType = UseProfileWrapperContextModuleResult.sourceInfo.recommendationContextType,
						recommendationRank = UseProfileWrapperContextModuleResult.sourceInfo.recommendationRank,
						recommendationSessionId = UseProfileWrapperContextModuleResult.sourceInfo.recommendationSessionId
					})
					
					if ProfileType == EnumsModule.ProfileTypes.User then
						UseDispatchResult(NavigateDownToViewUserProfileFunction(ProfileId))
						
						return
					end
					if ProfileType == EnumsModule.ProfileTypes.Community then
						local Config = if UseProfileJsonComponentModuleResult.type == EnumsModule.ViewFullProfileTypes.Profile then {
							name = AppPage.GenericWebPage,
							detail = UrlBuilder.new({ base = UrlBase.WWW, path = `profiles/{ProfileId}` })(),
							extraProps = { titleKey = TextKeysModule.Profile }
						} else MakeViewGroupPageModule(ProfileId)
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(Config))
							
							return
						end
						UseDispatchResult(NavigateDownFunction(Config))
					end
				end, {
					UseDispatchResult, ProfileId, UseProfileAnalyticsContextModuleResult,
					UseProfileWrapperContextModuleResult,
					if FFlagEnableGroupOverviewPane then ProfileType else nil,
					if FFlagEnableGroupOverviewPane then UseProfileJsonComponentModuleResult.type else nil
				}),
				text = ReactModule.useMemo(function()
					-- upvalues: ProfileType (copy), EnumsModule (upval), UseLocalizationResult (copy), UseProfileJsonComponentModuleResult (copy)
					if ProfileType == EnumsModule.ProfileTypes.User then
						return UseLocalizationResult.viewFullProfileLabel
					elseif ProfileType == EnumsModule.ProfileTypes.Community then
						if UseProfileJsonComponentModuleResult.type == EnumsModule.ViewFullProfileTypes.Profile then
							return UseLocalizationResult.viewFullProfileLabel
						elseif UseProfileJsonComponentModuleResult.type == EnumsModule.ViewFullProfileTypes.Community then
							return UseLocalizationResult.viewCommunityLabel
						end
					end
					return UseLocalizationResult.viewFullProfileLabel
				end, {
					UseLocalizationResult,
					if FFlagEnableGroupOverviewPane then ProfileType else nil,
					if FFlagEnableGroupOverviewPane then UseProfileJsonComponentModuleResult.type else nil
				})
			})
		})
	})
end

return ViewFullProfile