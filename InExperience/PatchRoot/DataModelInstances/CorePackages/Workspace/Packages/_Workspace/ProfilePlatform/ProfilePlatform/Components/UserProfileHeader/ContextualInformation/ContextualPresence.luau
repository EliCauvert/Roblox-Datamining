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
local var1 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
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

return function(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useStyle (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), reactModule (ref), useProfileWrapperContextModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var2 (ref), var1 (ref), t_1 (ref), t (ref), convertPresenceEnumModule (ref), eventNamesModule (ref), networkingPresenceModule (ref), useSelector (ref), presenceModule (ref), presenceType (ref), appPage (ref), openGameDetails (ref), useLocalization (ref), enumsModule (ref), textKeysModule (ref), t_2 (ref), getIconSize (ref), iconSize (ref), playerContext (ref)
	local var3
	local var4 = useDispatch()
	local var5 = useNavigation()
	local var6 = useStyle()
	local var7 = useProfileAnalyticsContextModule()
	local var8 = if fFlagProfilePlatformImproveGameDetailsAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(false)
	local profileId = useProfileWrapperContextModule().profileId
	local _ = nil
	
	if fFlagProfilePlatformPresenceStoreMigrationModule then
		useEffectOnMount(function()
			-- upvalues: var2 (copy), profileId (ref)
			var2.RefreshPresenceByUserId(tostring(profileId))
		end)
		local var11, var12 = var1(profileId, t_1)
		var3 = var11 or (p1.presenceInfoOverride or t)
		reactModule.useEffect(function()
			-- upvalues: var10 (ref), var12 (ref), convertPresenceEnumModule (copy), var3 (write), var7 (ref), eventNamesModule (copy)
			if var10.current then return end
			if var12 == "Ready" or var12 == "Failed" then
				var10.current = true
				var7.fireAnalyticsEvent(eventNamesModule.ProfilePresenceLoaded, {
					presenceType = convertPresenceEnumModule(var3.userPresenceType, if var3.universeId then tonumber(var3.universeId) else nil),
					universeId = var3.universeId
				})
				
				return
			end
		end, { var3, var12, var7 })
	else
		useEffectOnMount(function()
			-- upvalues: var4 (ref), networkingPresenceModule (copy), profileId (ref), var9 (ref)
			var4(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):andThen(function()
				-- upvalues: var9 (copy)
				var9.current = true
			end):catch(function(_) end)
		end)
		local var13 = useSelector(function(p2)
			-- upvalues: presenceModule (copy), profileId (ref), presenceType (copy)
			return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
				lastLocation = "",
				userPresenceType = presenceType.Offline
			}
		end)
		var3 = if not var9.current then p1.presenceInfoOverride or var13 else var13
		reactModule.useEffect(function()
			-- upvalues: var9 (ref), var10 (ref), convertPresenceEnumModule (copy), var3 (write), var7 (ref), eventNamesModule (copy)
			if var9.current and not var10.current then
				var10.current = true
				var7.fireAnalyticsEvent(eventNamesModule.ProfilePresenceLoaded, {
					presenceType = convertPresenceEnumModule(var3.userPresenceType, var3.universeId),
					universeId = var3.universeId
				})
				
				return
			end
		end, { var3 })
	end
	local var14 = convertPresenceEnumModule(var3.userPresenceType, if fFlagProfilePlatformPresenceStoreMigrationModule then if var3.universeId then tonumber(var3.universeId) else nil else var3.universeId)
	local lastLocation = var3.lastLocation
	local universeId = var3.universeId
	local var15 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), eventNamesModule (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), var8 (ref), var3 (write), appPage (copy), profileId (ref), var4 (ref), openGameDetails (copy), universeId (ref), var5 (ref)
		var7.fireAnalyticsEvent(eventNamesModule.GameDetailsButton)
		
		if fFlagProfilePlatformImproveGameDetailsAnalytics then
			var8.reportOpenGameDetailFromProfileContext(var3.placeId, var3.universeId, appPage.ProfilePlatform, profileId, "ProfilePlatformContextualPresence")
		end
		var4(openGameDetails(universeId, var5, { mountAsFullView = true, showBackButton = true }))
	end, { universeId, var5, var7 })
	local var16 = useLocalization({
		[enumsModule.PresenceTypes.Online] = textKeysModule.Online,
		[enumsModule.PresenceTypes.Offline] = textKeysModule.Offline,
		[enumsModule.PresenceTypes.InStudio] = textKeysModule.InStudio
	})
	local offline = nil
	local color = nil
	local transparency = nil
	local offline_1 = nil
	local textMuted = nil
	local var17 = nil
	local var18 = nil
	
	if var3 then
		if var14 == enumsModule.PresenceTypes.Online then
			offline = t_2[enumsModule.PresenceTypes.Online]
			color = var6.Theme.OnlineStatus.Color
			transparency = var6.Theme.OnlineStatus.Transparency
			offline_1 = var16.Online
			textMuted = var6.Theme.TextMuted
			var17 = 12
		elseif var14 == enumsModule.PresenceTypes.InGame then
			offline = t_2[enumsModule.PresenceTypes.InGame]
			color = var6.Theme.IconEmphasis.Color
			transparency = var6.Theme.IconEmphasis.Transparency
			offline_1 = lastLocation
			textMuted = var6.Theme.TextEmphasis
			var17 = getIconSize(iconSize.Small)
			var18 = var15
		elseif var14 == enumsModule.PresenceTypes.InStudio then
			offline = t_2[enumsModule.PresenceTypes.InStudio]
			color = var6.Theme.TextDefault.Color
			transparency = var6.Theme.TextDefault.Transparency
			offline_1 = var16.InStudio
			textMuted = var6.Theme.TextMuted
			var17 = getIconSize(iconSize.Small)
		else
			offline = t_2[enumsModule.PresenceTypes.Offline]
			color = var6.Theme.OfflineStatus.Color
			transparency = var6.Theme.OfflineStatus.Transparency
			var17 = 12
			offline_1 = var16.Offline
			textMuted = var6.Theme.TextMuted
		end
	end
	return reactModule.createElement(playerContext, {
		layoutOrder = 2,
		fontStyle = var6.Font.CaptionBody,
		icon = offline,
		iconColor = color,
		iconSize = UDim2.fromOffset(var17, var17),
		iconTransparency = transparency,
		text = offline_1,
		textColorStyle = textMuted,
		onActivated = var18
	})
end