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
local FFlagProfilePlatformPresenceStoreMigrationModule = require(ProfilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local UseGetPresenceByUserId = if FFlagProfilePlatformPresenceStoreMigrationModule then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local GetResult = if FFlagProfilePlatformPresenceStoreMigrationModule then require(Parent.DataHydration).Presence.PresenceStore.get() else nil
local config = {
	lastLocation = "",
	universeId = "",
	placeId = "",
	userPresenceType = PresenceType.Offline
}
local config1 = { skipFetch = true }
local config2 = {
	[EnumsModule.PresenceTypes.Offline] = Images["component_assets/circle_26_stroke_3"],
	[EnumsModule.PresenceTypes.Online] = Images["component_assets/circle_16"],
	[EnumsModule.PresenceTypes.InGame] = Images["icons/menu/games_small"],
	[EnumsModule.PresenceTypes.InStudio] = Images["icons/logo/studiologo_small"]
}

return function(p1) --[[ Line: 73 | Named "contextualPresence" ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), UseProfileAnalyticsContextModule (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), ReactModule (copy), UseProfileWrapperContextModule (copy), FFlagProfilePlatformPresenceStoreMigrationModule (copy), UseEffectOnMountFunction (copy), GetResult (copy), UseGetPresenceByUserId (copy), config1 (copy), config (copy), ConvertPresenceEnumModule (copy), EventNamesModule (copy), NetworkingPresenceModule (copy), UseSelectorFunction (copy), PresenceModule (copy), PresenceType (copy), AppPage (copy), OpenGameDetailsFunction (copy), UseLocalizationFunction (copy), EnumsModule (copy), TextKeysModule (copy), config2 (copy), GetIconSizeFunction (copy), IconSize (copy), PlayerContext (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseRoactServiceResult = if FFlagProfilePlatformImproveGameDetailsAnalytics then UseRoactServiceFunction(RoactAnalyticsCommonGameEvents) else nil
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local UseGetPresenceByUserIdResult1 = nil
	
	if FFlagProfilePlatformPresenceStoreMigrationModule then
		UseEffectOnMountFunction(function() --[[ Line: 89 ]]
			-- upvalues: GetResult (upval), ProfileId (copy)
			GetResult.RefreshPresenceByUserId((tostring(ProfileId)))
		end)
		local UseGetPresenceByUserIdResult, UseGetPresenceByUserIdResult2 = UseGetPresenceByUserId(ProfileId, config1)
		UseGetPresenceByUserIdResult1 = if UseGetPresenceByUserIdResult then UseGetPresenceByUserIdResult else p1.presenceInfoOverride or config
		ReactModule.useEffect(function() --[[ Line: 96 ]]
			-- upvalues: UseRefResult1 (copy), UseGetPresenceByUserIdResult2 (copy), ConvertPresenceEnumModule (upval), UseGetPresenceByUserIdResult1 (ref), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval)
			if UseRefResult1.current then return end
			if UseGetPresenceByUserIdResult2 == "Ready" or UseGetPresenceByUserIdResult2 == "Failed" then
				UseRefResult1.current = true
				UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfilePresenceLoaded, {
					presenceType = ConvertPresenceEnumModule(UseGetPresenceByUserIdResult1.userPresenceType, if UseGetPresenceByUserIdResult1.universeId then tonumber(UseGetPresenceByUserIdResult1.universeId) else nil),
					universeId = UseGetPresenceByUserIdResult1.universeId
				})
				
				return
			end
		end, {
			UseGetPresenceByUserIdResult1,
			UseGetPresenceByUserIdResult2,
			UseProfileAnalyticsContextModuleResult
		})
	else
		UseEffectOnMountFunction(function() --[[ Line: 116 ]]
			-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), ProfileId (copy), UseRefResult (copy)
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ ProfileId })):andThen(function() --[[ Line: 118 ]]
				-- upvalues: UseRefResult (upval)
				UseRefResult.current = true
			end):catch(function(_) --[[ Line: 121 ]] end)
		end)
		local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 124 ]]
			-- upvalues: PresenceModule (upval), ProfileId (copy), PresenceType (upval)
			return PresenceModule.Selectors.getUserPresenceByUserId(p2, ProfileId) or {
				lastLocation = "",
				userPresenceType = PresenceType.Offline
			}
		end)
		UseGetPresenceByUserIdResult1 = if UseRefResult.current then UseSelectorResult else p1.presenceInfoOverride or UseSelectorResult
		ReactModule.useEffect(function() --[[ Line: 135 ]]
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), ConvertPresenceEnumModule (upval), UseGetPresenceByUserIdResult1 (ref), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval)
			if UseRefResult.current and not UseRefResult1.current then
				UseRefResult1.current = true
				UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfilePresenceLoaded, {
					presenceType = ConvertPresenceEnumModule(UseGetPresenceByUserIdResult1.userPresenceType, UseGetPresenceByUserIdResult1.universeId),
					universeId = UseGetPresenceByUserIdResult1.universeId
				})
				
				return
			end
		end, { UseGetPresenceByUserIdResult1 })
	end
	local ConvertPresenceEnumModuleResult = ConvertPresenceEnumModule(UseGetPresenceByUserIdResult1.userPresenceType, if FFlagProfilePlatformPresenceStoreMigrationModule then if UseGetPresenceByUserIdResult1.universeId then tonumber(UseGetPresenceByUserIdResult1.universeId) else nil else UseGetPresenceByUserIdResult1.universeId)
	local LastLocation = UseGetPresenceByUserIdResult1.lastLocation
	local UniverseId = UseGetPresenceByUserIdResult1.universeId
	local UseResult = ReactModule.useCallback(function() --[[ Line: 159 ]]
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), UseRoactServiceResult (copy), UseGetPresenceByUserIdResult1 (ref), AppPage (upval), ProfileId (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UniverseId (copy), UseNavigationResult (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.GameDetailsButton)
		
		if FFlagProfilePlatformImproveGameDetailsAnalytics then
			UseRoactServiceResult.reportOpenGameDetailFromProfileContext(UseGetPresenceByUserIdResult1.placeId, UseGetPresenceByUserIdResult1.universeId, AppPage.ProfilePlatform, ProfileId, "ProfilePlatformContextualPresence")
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
	
	if UseGetPresenceByUserIdResult1 then
		if ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.Online then
			Icon = config2[EnumsModule.PresenceTypes.Online]
			Color = UseStyleResult.Theme.OnlineStatus.Color
			Transparency = UseStyleResult.Theme.OnlineStatus.Transparency
			InStudio = UseLocalizationResult.Online
			TextMuted = UseStyleResult.Theme.TextMuted
			XOffset = 12
		elseif ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.InGame then
			Icon = config2[EnumsModule.PresenceTypes.InGame]
			Color = UseStyleResult.Theme.IconEmphasis.Color
			Transparency = UseStyleResult.Theme.IconEmphasis.Transparency
			InStudio = LastLocation
			TextMuted = UseStyleResult.Theme.TextEmphasis
			XOffset = GetIconSizeFunction(IconSize.Small)
			OnActivated = UseResult
		elseif ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.InStudio then
			Icon = config2[EnumsModule.PresenceTypes.InStudio]
			Color = UseStyleResult.Theme.TextDefault.Color
			Transparency = UseStyleResult.Theme.TextDefault.Transparency
			InStudio = UseLocalizationResult.InStudio
			TextMuted = UseStyleResult.Theme.TextMuted
			XOffset = GetIconSizeFunction(IconSize.Small)
		else
			Icon = config2[EnumsModule.PresenceTypes.Offline]
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