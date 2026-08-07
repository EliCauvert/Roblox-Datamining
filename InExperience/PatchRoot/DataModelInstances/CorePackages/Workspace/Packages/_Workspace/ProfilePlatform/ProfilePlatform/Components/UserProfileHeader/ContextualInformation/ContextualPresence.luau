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
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var13 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var14 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local t = {
	lastLocation = "",
	universeId = "",
	placeId = "",
	userPresenceType = presenceType.Offline
}
local t_1 = { skipFetch = true }
local t_2 = {
	[enumsModule.PresenceTypes.Offline] = images["component_assets/circle_26_stroke_3"],
	[enumsModule.PresenceTypes.Online] = images["component_assets/circle_16"],
	[enumsModule.PresenceTypes.InGame] = images["icons/menu/games_small"],
	[enumsModule.PresenceTypes.InStudio] = images["icons/logo/studiologo_small"]
}

return function(p0) --[[ line: 73 | named "contextualPresence" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useStyle (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), reactModule (ref), useProfileWrapperContextModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var14 (ref), var13 (ref), t_1 (ref), t (ref), convertPresenceEnumModule (ref), eventNamesModule (ref), networkingPresenceModule (ref), useSelector (ref), presenceModule (ref), presenceType (ref), appPage (ref), openGameDetails (ref), useLocalization (ref), enumsModule (ref), textKeysModule (ref), t_2 (ref), getIconSize (ref), iconSize (ref), playerContext (ref)
	local var26
	local var18 = useDispatch()
	local var19 = useNavigation()
	local var20 = useStyle()
	local var21 = useProfileAnalyticsContextModule()
	local var22 = if fFlagProfilePlatformImproveGameDetailsAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local var23 = reactModule.useRef(false)
	local var24 = reactModule.useRef(false)
	local profileId = useProfileWrapperContextModule().profileId
	local _ = nil
	
	if fFlagProfilePlatformPresenceStoreMigrationModule then
		useEffectOnMount(function() --[[ line: 89 ]]
			-- upvalues: var14 (copy), profileId (ref)
			var14.RefreshPresenceByUserId(tostring(profileId))
		end)
		local var27, var28 = var13(profileId, t_1)
		var26 = var27 or (p0.presenceInfoOverride or t)
		reactModule.useEffect(function() --[[ line: 96 ]]
			-- upvalues: var24 (ref), var28 (ref), convertPresenceEnumModule (copy), var26 (write), var21 (ref), eventNamesModule (copy)
			if var24.current then return end
			if var28 == "Ready" or var28 == "Failed" then
				var24.current = true
				var21.fireAnalyticsEvent(eventNamesModule.ProfilePresenceLoaded, {
					presenceType = convertPresenceEnumModule(var26.userPresenceType, if var26.universeId then tonumber(var26.universeId) else nil),
					universeId = var26.universeId
				})
				
				return
			end
		end, { var26, var28, var21 })
	else
		useEffectOnMount(function() --[[ line: 116 ]]
			-- upvalues: var18 (ref), networkingPresenceModule (copy), profileId (ref), var23 (ref)
			var18(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):andThen(function() --[[ line: 118 ]]
				-- upvalues: var23 (copy)
				var23.current = true
			end):catch(function(_) --[[ line: 121 ]] end)
		end)
		local var25 = useSelector(function(p1) --[[ line: 124 ]]
			-- upvalues: presenceModule (copy), profileId (ref), presenceType (copy)
			return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
				lastLocation = "",
				userPresenceType = presenceType.Offline
			}
		end)
		var26 = if not var23.current then p0.presenceInfoOverride or var25 else var25
		reactModule.useEffect(function() --[[ line: 135 ]]
			-- upvalues: var23 (ref), var24 (ref), convertPresenceEnumModule (copy), var26 (write), var21 (ref), eventNamesModule (copy)
			if var23.current and not var24.current then
				var24.current = true
				var21.fireAnalyticsEvent(eventNamesModule.ProfilePresenceLoaded, {
					presenceType = convertPresenceEnumModule(var26.userPresenceType, var26.universeId),
					universeId = var26.universeId
				})
				
				return
			end
		end, { var26 })
	end
	local var29 = convertPresenceEnumModule(var26.userPresenceType, if fFlagProfilePlatformPresenceStoreMigrationModule then if var26.universeId then tonumber(var26.universeId) else nil else var26.universeId)
	local lastLocation = var26.lastLocation
	local universeId = var26.universeId
	local var30 = reactModule.useCallback(function() --[[ line: 159 ]]
		-- upvalues: var21 (ref), eventNamesModule (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), var22 (ref), var26 (write), appPage (copy), profileId (ref), var18 (ref), openGameDetails (copy), universeId (ref), var19 (ref)
		var21.fireAnalyticsEvent(eventNamesModule.GameDetailsButton)
		
		if fFlagProfilePlatformImproveGameDetailsAnalytics then
			var22.reportOpenGameDetailFromProfileContext(var26.placeId, var26.universeId, appPage.ProfilePlatform, profileId, "ProfilePlatformContextualPresence")
		end
		var18(openGameDetails(universeId, var19, { mountAsFullView = true, showBackButton = true }))
	end, { universeId, var19, var21 })
	local var31 = useLocalization({
		[enumsModule.PresenceTypes.Online] = textKeysModule.Online,
		[enumsModule.PresenceTypes.Offline] = textKeysModule.Offline,
		[enumsModule.PresenceTypes.InStudio] = textKeysModule.InStudio
	})
	local offline = nil
	local color = nil
	local transparency = nil
	local offline_1 = nil
	local textMuted = nil
	local var32 = nil
	local var33 = nil
	
	if var26 then
		if var29 == enumsModule.PresenceTypes.Online then
			offline = t_2[enumsModule.PresenceTypes.Online]
			color = var20.Theme.OnlineStatus.Color
			transparency = var20.Theme.OnlineStatus.Transparency
			offline_1 = var31.Online
			textMuted = var20.Theme.TextMuted
			var32 = 12
		elseif var29 == enumsModule.PresenceTypes.InGame then
			offline = t_2[enumsModule.PresenceTypes.InGame]
			color = var20.Theme.IconEmphasis.Color
			transparency = var20.Theme.IconEmphasis.Transparency
			offline_1 = lastLocation
			textMuted = var20.Theme.TextEmphasis
			var32 = getIconSize(iconSize.Small)
			var33 = var30
		elseif var29 == enumsModule.PresenceTypes.InStudio then
			offline = t_2[enumsModule.PresenceTypes.InStudio]
			color = var20.Theme.TextDefault.Color
			transparency = var20.Theme.TextDefault.Transparency
			offline_1 = var31.InStudio
			textMuted = var20.Theme.TextMuted
			var32 = getIconSize(iconSize.Small)
		else
			offline = t_2[enumsModule.PresenceTypes.Offline]
			color = var20.Theme.OfflineStatus.Color
			transparency = var20.Theme.OfflineStatus.Transparency
			var32 = 12
			offline_1 = var31.Offline
			textMuted = var20.Theme.TextMuted
		end
	end
	return reactModule.createElement(playerContext, {
		layoutOrder = 2,
		fontStyle = var20.Font.CaptionBody,
		icon = offline,
		iconColor = color,
		iconSize = UDim2.fromOffset(var32, var32),
		iconTransparency = transparency,
		text = offline_1,
		textColorStyle = textMuted,
		onActivated = var33
	})
end