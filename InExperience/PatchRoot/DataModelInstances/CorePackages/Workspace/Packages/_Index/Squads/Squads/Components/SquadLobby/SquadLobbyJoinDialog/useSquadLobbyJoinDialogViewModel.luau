local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ExperienceServiceModule = require(Parent.ExperienceService)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local UserProfilesModule = require(Parent.UserProfiles)
local UseVoiceStatusFunction = require(Parent.CrossExperienceVoice).Hooks.useVoiceStatus
local DependenciesModule = require(Squads.dependencies)
local SquadPartySheetActionEnumModule = require(Squads.Enums.SquadPartySheetActionEnum)
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadLocationEnum = require(Parent.SquadsCore.Enums).SquadLocationEnum
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local _ = require(script.Parent.SquadLobbyJoinDialogView)
local IsPresenceJoinableModule = require(Squads.Common.isPresenceJoinable)
local FFlagSquadLaunchExperienceMobileFix = DependenciesModule.SharedFlags.FFlagSquadLaunchExperienceMobileFix
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local FFlagSquadsPresenceStoreMigration = require(Parent.SquadsCore.Flags).FFlagSquadsPresenceStoreMigration
local UseGetPresenceByUserId = if FFlagSquadsPresenceStoreMigration then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local GameParams = ExperienceServiceModule.GameParams
local ExperienceService = ExperienceServiceModule.ExperienceService
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function _(p1)
	return if p1 == nil or p1 == "" then nil else tostring(p1)
end

return function(p1)
	-- upvalues: ReactModule (copy), SquadExternalContractContext (copy), UseVoiceStatusFunction (copy), UseCurrentSquadParentChannelIdFunction (copy), FFlagSquadsPresenceStoreMigration (copy), UseGetPresenceByUserId (copy), UseSelectorFunction (copy), IsPresenceJoinableModule (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), FFlagSquadLaunchExperienceMobileFix (copy), SquadLocationEnum (copy), ExperienceService (copy), GameParams (copy), EventNamesModule (copy), SquadPartySheetActionEnumModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseLastInputModeFunction (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local UserId = p1.userId
	local OnCloseFunction = p1.onClose
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseVoiceStatusResult = UseVoiceStatusFunction()
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction() or ""
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UserId (copy)
		return p2.Squad.Presence.byUserId[UserId]
	end, { UserId })
	local UseGetPresenceByUserIdResult = if FFlagSquadsPresenceStoreMigration then UseGetPresenceByUserId(UserId) else UseSelectorFunction(UseResult)
	local PlaceId = nil
	repeat
		if UseGetPresenceByUserIdResult then
			local PlaceId1 = UseGetPresenceByUserIdResult.placeId
			
			if if PlaceId1 == nil or PlaceId1 == "" then nil else tostring(PlaceId1) then
				PlaceId = UseGetPresenceByUserIdResult.placeId
				break
			end
		end
		PlaceId = nil
	until true
	local IsPresenceJoinableModule1 = IsPresenceJoinableModule(UseGetPresenceByUserIdResult)
	local Text = UseGetPresenceByUserIdResult
	
	if Text then
		local RootPlaceId = UseGetPresenceByUserIdResult.rootPlaceId
		Text = if RootPlaceId == nil or RootPlaceId == "" then nil else tostring(RootPlaceId)
		
		if not Text then
			local PlaceId1 = UseGetPresenceByUserIdResult.placeId
			Text = if PlaceId1 == nil or PlaceId1 == "" then nil else tostring(PlaceId1)
		end
	end
	local UseGetPresenceByUserIdResult1 = UseGetPresenceByUserIdResult
	
	if UseGetPresenceByUserIdResult1 then
		local LastLocation = UseGetPresenceByUserIdResult.lastLocation
		UseGetPresenceByUserIdResult1 = if LastLocation == nil or LastLocation == "" then nil else tostring(LastLocation)
	end
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { UserId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local CombinedNameFromId = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UserId) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		inExperience = "Common.Presence.Label.InExperience",
		isPlaying = "Feature.Friends.Text.IsPlaying",
		join = "Feature.Profile.Action.JoinGame",
		viewProfile = "Feature.Profile.Action.ViewProfile"
	})
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: IsPresenceJoinableModule1 (copy), UseRefResult (copy), OnCloseFunction (copy)
		if IsPresenceJoinableModule1 then
			UseRefResult.current = true
			
			return
		end
		if UseRefResult.current then
			OnCloseFunction()
		end
	end, { IsPresenceJoinableModule1, OnCloseFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: OnCloseFunction (copy), p1 (copy), FFlagSquadLaunchExperienceMobileFix (upval), UseContextResult (copy), SquadLocationEnum (upval), ExperienceService (upval), GameParams (upval), UserId (copy), PlaceId (copy)
		OnCloseFunction()
		
		if p1.isInExperience and FFlagSquadLaunchExperienceMobileFix then
			game:Shutdown()
		end
		ExperienceService:LaunchExperience(GameParams.fromUserId(UserId, PlaceId), if UseContextResult.squadLocation == SquadLocationEnum.UniversalApp then "SquadLobbyFromUA" elseif UseContextResult.squadLocation == SquadLocationEnum.InExperience then "SquadLobbyFromInExp" else "SquadLobby", nil)
	end, {
		PlaceId,
		OnCloseFunction,
		p1.isInExperience,
		UseContextResult.squadLocation,
		UserId
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), UseCurrentSquadParentChannelIdResult (copy), SquadPartySheetActionEnumModule (upval), UseVoiceStatusResult (copy), OnCloseFunction (copy), p1 (copy), UserId (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.PartySheetAction, {
			parentChannelId = UseCurrentSquadParentChannelIdResult,
			actionType = SquadPartySheetActionEnumModule.ViewProfileButtonClicked,
			voiceStatus = UseVoiceStatusResult
		})
		OnCloseFunction()
		p1.openViewProfile(UserId)
	end, {
		UseContextResult.fireSquadAnalytics, UseCurrentSquadParentChannelIdResult,
		UseVoiceStatusResult, OnCloseFunction, p1.openViewProfile, UserId
	})
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: OnCloseFunction (upval)
						OnCloseFunction()
						p2:cancel()
					end)
				}
			}
		end, { OnCloseFunction })
	})
	local IsFocus = UseLastInputModeFunction() == "Focus"
	
	return {
		userId = tonumber(UserId) or 0,
		gameImage = if Text then GetRbxThumbFunction(ThumbnailType.GameThumbnail, Text, ThumbnailSize.Large) else nil,
		playerName = if CombinedNameFromId == nil or CombinedNameFromId == "" then nil else tostring(CombinedNameFromId),
		isPlayingText = UseLocalizationResult.isPlaying,
		experienceName = UseGetPresenceByUserIdResult1 or UseLocalizationResult.inExperience,
		joinText = UseLocalizationResult.join,
		onJoin = UseResult1,
		viewProfileText = if p1.isInExperience then nil else UseLocalizationResult.viewProfile,
		onViewProfile = if p1.isInExperience then nil else UseResult11,
		onClose = if IsFocus then nil else OnCloseFunction,
		dialogRef = UseFocusRootResult,
		testId = `--social-squad-lobby-join-dialog-{UserId}`
	}
end