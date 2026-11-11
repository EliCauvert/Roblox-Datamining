local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RoactUtilsModule = require(Parent.RoactUtils)
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local PlayerContext = UIBloxModule.App.Indicator.PlayerContext
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local PresenceType = PresenceModule.Enums.PresenceType
local NetworkingPresenceModule = require(ProfilePlatform.Networking.NetworkingPresence)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local ConvertPresenceEnumModule = require(ProfilePlatform.Utils.convertPresenceEnum)
local FFlagProfilePlatformImproveGameDetailsAnalytics = require(Parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local config = {
	[EnumsModule.PresenceTypes.Offline] = Images["component_assets/circle_26_stroke_3"],
	[EnumsModule.PresenceTypes.Online] = Images["component_assets/circle_16"],
	[EnumsModule.PresenceTypes.InGame] = Images["icons/menu/games_small"],
	[EnumsModule.PresenceTypes.InStudio] = Images["icons/logo/studiologo_small"]
}

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), UseProfileAnalyticsContextModule (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), ReactModule (copy), UseProfileWrapperContextModule (copy), UseEffectOnMountFunction (copy), NetworkingPresenceModule (copy), UseSelectorFunction (copy), PresenceModule (copy), PresenceType (copy), ConvertPresenceEnumModule (copy), EventNamesModule (copy), AppPage (copy), OpenGameDetailsFunction (copy), UseLocalizationFunction (copy), EnumsModule (copy), TextKeysModule (copy), config (copy), GetIconSizeFunction (copy), IconSize (copy), PlayerContext (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseRoactServiceResult = if FFlagProfilePlatformImproveGameDetailsAnalytics then UseRoactServiceFunction(RoactAnalyticsCommonGameEvents) else nil
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local ProfileId = UseProfileWrapperContextModule().profileId
	UseEffectOnMountFunction(function()
		-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), ProfileId (copy), UseRefResult (copy)
		UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ ProfileId })):andThen(function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = true
		end):catch(function(_) end)
	end)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: PresenceModule (upval), ProfileId (copy), PresenceType (upval)
		return PresenceModule.Selectors.getUserPresenceByUserId(p2, ProfileId) or {
			lastLocation = "",
			userPresenceType = PresenceType.Offline
		}
	end)
	local UseSelectorResult1 = if UseRefResult.current then UseSelectorResult else p1.presenceInfoOverride or UseSelectorResult
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), ConvertPresenceEnumModule (upval), UseSelectorResult1 (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval)
		if UseRefResult.current and not UseRefResult1.current then
			UseRefResult1.current = true
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfilePresenceLoaded, {
				presenceType = ConvertPresenceEnumModule(UseSelectorResult1.userPresenceType, UseSelectorResult1.universeId),
				universeId = UseSelectorResult1.universeId
			})
			
			return
		end
	end, { UseSelectorResult1 })
	local ConvertPresenceEnumModuleResult = ConvertPresenceEnumModule(UseSelectorResult1.userPresenceType, UseSelectorResult1.universeId)
	local LastLocation = UseSelectorResult1.lastLocation
	local UniverseId = UseSelectorResult1.universeId
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), UseRoactServiceResult (copy), UseSelectorResult1 (copy), AppPage (upval), ProfileId (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UniverseId (copy), UseNavigationResult (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.GameDetailsButton)
		
		if FFlagProfilePlatformImproveGameDetailsAnalytics then
			UseRoactServiceResult.reportOpenGameDetailFromProfileContext(UseSelectorResult1.placeId, UseSelectorResult1.universeId, AppPage.ProfilePlatform, ProfileId, "ProfilePlatformContextualPresence")
		end
		UseDispatchResult(OpenGameDetailsFunction(UniverseId, UseNavigationResult, { mountAsFullView = true, showBackButton = true }))
	end, {
		UniverseId,
		UseNavigationResult,
		UseProfileAnalyticsContextModuleResult
	})
	local UseLocalizationResult = UseLocalizationFunction({
		[EnumsModule.PresenceTypes.Online] = TextKeysModule.Online,
		[EnumsModule.PresenceTypes.Offline] = TextKeysModule.Offline,
		[EnumsModule.PresenceTypes.InStudio] = TextKeysModule.InStudio
	})
	local Icon = nil
	local Color = nil
	local Transparency = nil
	local InStudio = nil
	local TextMuted = nil
	local XOffset = nil
	local OnActivated = nil
	
	if UseSelectorResult1 then
		if ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.Online then
			Icon = config[EnumsModule.PresenceTypes.Online]
			Color = UseStyleResult.Theme.OnlineStatus.Color
			Transparency = UseStyleResult.Theme.OnlineStatus.Transparency
			InStudio = UseLocalizationResult.Online
			TextMuted = UseStyleResult.Theme.TextMuted
			XOffset = 12
		elseif ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.InGame then
			Icon = config[EnumsModule.PresenceTypes.InGame]
			Color = UseStyleResult.Theme.IconEmphasis.Color
			Transparency = UseStyleResult.Theme.IconEmphasis.Transparency
			InStudio = LastLocation
			TextMuted = UseStyleResult.Theme.TextEmphasis
			XOffset = GetIconSizeFunction(IconSize.Small)
			OnActivated = UseResult
		elseif ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.InStudio then
			Icon = config[EnumsModule.PresenceTypes.InStudio]
			Color = UseStyleResult.Theme.TextDefault.Color
			Transparency = UseStyleResult.Theme.TextDefault.Transparency
			InStudio = UseLocalizationResult.InStudio
			TextMuted = UseStyleResult.Theme.TextMuted
			XOffset = GetIconSizeFunction(IconSize.Small)
		else
			Icon = config[EnumsModule.PresenceTypes.Offline]
			Color = UseStyleResult.Theme.OfflineStatus.Color
			Transparency = UseStyleResult.Theme.OfflineStatus.Transparency
			XOffset = 12
			InStudio = UseLocalizationResult.Offline
			TextMuted = UseStyleResult.Theme.TextMuted
		end
	end
	return ReactModule.createElement(PlayerContext, {
		layoutOrder = 2,
		fontStyle = UseStyleResult.Font.CaptionBody,
		icon = Icon,
		iconColor = Color,
		iconSize = UDim2.fromOffset(XOffset, XOffset),
		iconTransparency = Transparency,
		text = InStudio,
		textColorStyle = TextMuted,
		onActivated = OnActivated
	})
end