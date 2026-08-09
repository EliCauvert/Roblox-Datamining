local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = require(parent.RobloxAppEnums).AppPage
local roactUtilsModule = require(parent.RoactUtils)
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local playerContext = UIBloxModule.App.Indicator.PlayerContext
local presenceModule = require(profilePlatform.Rodux.Presence)
local presenceType = presenceModule.Enums.PresenceType
local networkingPresenceModule = require(profilePlatform.Networking.NetworkingPresence)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local convertPresenceEnumModule = require(profilePlatform.Utils.convertPresenceEnum)
local fFlagProfilePlatformImproveGameDetailsAnalytics = require(parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local t = {
	[enumsModule.PresenceTypes.Offline] = images["component_assets/circle_26_stroke_3"],
	[enumsModule.PresenceTypes.Online] = images["component_assets/circle_16"],
	[enumsModule.PresenceTypes.InGame] = images["icons/menu/games_small"],
	[enumsModule.PresenceTypes.InStudio] = images["icons/logo/studiologo_small"]
}

return function(p0) --[[ line: 54 | named "contextualPresence" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useStyle (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), reactModule (ref), useProfileWrapperContextModule (ref), useEffectOnMount (ref), networkingPresenceModule (ref), useSelector (ref), presenceModule (ref), presenceType (ref), convertPresenceEnumModule (ref), eventNamesModule (ref), appPage (ref), openGameDetails (ref), useLocalization (ref), enumsModule (ref), textKeysModule (ref), t (ref), getIconSize (ref), iconSize (ref), playerContext (ref)
	local var13 = useDispatch()
	local var14 = useNavigation()
	local var15 = useStyle()
	local var16 = useProfileAnalyticsContextModule()
	local var17 = if fFlagProfilePlatformImproveGameDetailsAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useRef(false)
	local profileId = useProfileWrapperContextModule().profileId
	useEffectOnMount(function() --[[ line: 68 ]]
		-- upvalues: var13 (ref), networkingPresenceModule (copy), profileId (ref), var18 (ref)
		var13(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):andThen(function() --[[ line: 70 ]]
			-- upvalues: var18 (copy)
			var18.current = true
		end):catch(function(_) --[[ line: 73 ]] end)
	end)
	local var20 = useSelector(function(p1) --[[ line: 76 ]]
		-- upvalues: presenceModule (copy), profileId (ref), presenceType (copy)
		return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
			lastLocation = "",
			userPresenceType = presenceType.Offline
		}
	end)
	local var21 = if not var18.current then p0.presenceInfoOverride or var20 else var20
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var18 (ref), var19 (ref), convertPresenceEnumModule (copy), var21 (ref), var16 (ref), eventNamesModule (copy)
		if var18.current and not var19.current then
			var19.current = true
			var16.fireAnalyticsEvent(eventNamesModule.ProfilePresenceLoaded, {
				presenceType = convertPresenceEnumModule(var21.userPresenceType, var21.universeId),
				universeId = var21.universeId
			})
			
			return
		end
	end, { var21 })
	local var22 = convertPresenceEnumModule(var21.userPresenceType, var21.universeId)
	local lastLocation = var21.lastLocation
	local universeId = var21.universeId
	local var23 = reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: var16 (ref), eventNamesModule (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), var17 (ref), var21 (ref), appPage (copy), profileId (ref), var13 (ref), openGameDetails (copy), universeId (ref), var14 (ref)
		var16.fireAnalyticsEvent(eventNamesModule.GameDetailsButton)
		
		if fFlagProfilePlatformImproveGameDetailsAnalytics then
			var17.reportOpenGameDetailFromProfileContext(var21.placeId, var21.universeId, appPage.ProfilePlatform, profileId, "ProfilePlatformContextualPresence")
		end
		var13(openGameDetails(universeId, var14, { mountAsFullView = true, showBackButton = true }))
	end, { universeId, var14, var16 })
	local var24 = useLocalization({
		[enumsModule.PresenceTypes.Online] = textKeysModule.Online,
		[enumsModule.PresenceTypes.Offline] = textKeysModule.Offline,
		[enumsModule.PresenceTypes.InStudio] = textKeysModule.InStudio
	})
	local offline = nil
	local color = nil
	local transparency = nil
	local offline_1 = nil
	local textMuted = nil
	local var25 = nil
	local var26 = nil
	
	if var21 then
		if var22 == enumsModule.PresenceTypes.Online then
			offline = t[enumsModule.PresenceTypes.Online]
			color = var15.Theme.OnlineStatus.Color
			transparency = var15.Theme.OnlineStatus.Transparency
			offline_1 = var24.Online
			textMuted = var15.Theme.TextMuted
			var25 = 12
		elseif var22 == enumsModule.PresenceTypes.InGame then
			offline = t[enumsModule.PresenceTypes.InGame]
			color = var15.Theme.IconEmphasis.Color
			transparency = var15.Theme.IconEmphasis.Transparency
			offline_1 = lastLocation
			textMuted = var15.Theme.TextEmphasis
			var25 = getIconSize(iconSize.Small)
			var26 = var23
		elseif var22 == enumsModule.PresenceTypes.InStudio then
			offline = t[enumsModule.PresenceTypes.InStudio]
			color = var15.Theme.TextDefault.Color
			transparency = var15.Theme.TextDefault.Transparency
			offline_1 = var24.InStudio
			textMuted = var15.Theme.TextMuted
			var25 = getIconSize(iconSize.Small)
		else
			offline = t[enumsModule.PresenceTypes.Offline]
			color = var15.Theme.OfflineStatus.Color
			transparency = var15.Theme.OfflineStatus.Transparency
			var25 = 12
			offline_1 = var24.Offline
			textMuted = var15.Theme.TextMuted
		end
	end
	return reactModule.createElement(playerContext, {
		layoutOrder = 2,
		fontStyle = var15.Font.CaptionBody,
		icon = offline,
		iconColor = color,
		iconSize = UDim2.fromOffset(var25, var25),
		iconTransparency = transparency,
		text = offline_1,
		textColorStyle = textMuted,
		onActivated = var26
	})
end