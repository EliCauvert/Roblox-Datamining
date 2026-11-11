local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local AppNotificationService = require(Parent.RoactServiceTags).AppNotificationService
local ConvertPresenceEnumModule = require(ProfilePlatform.Utils.convertPresenceEnum)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local PresenceType = PresenceModule.Enums.PresenceType
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local RefreshProfilePlatformUserInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local UseActionsComponentRequestModule = require(ProfilePlatform.Hooks.useActionsComponentRequest)
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local RobloxEventReceiver = require(Parent.RealtimeDelivery).RobloxEventReceiver
local ReactModule = require(Parent.React)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseLocalUserIdFunction = RobloxAppHooksModule.useLocalUserId
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local EnumsModule = require(ProfilePlatform.Common.Enums)
local RefreshProfileOnTrustedFriendsRtn = game:DefineFastFlag("RefreshProfileOnTrustedFriendsRtn", false)

return function()
	-- upvalues: UseProfileWrapperContextModule (copy), UseRoactServiceFunction (copy), AppNotificationService (copy), ReactModule (copy), RobloxEventReceiver (copy), UseDispatchFunction (copy), UseLocalUserIdFunction (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), UseActionsComponentRequestModule (copy), UseSelectorFunction (copy), PresenceModule (copy), PresenceType (copy), ConvertPresenceEnumModule (copy), EnumsModule (copy), RefreshProfilePlatformActionInfoModule (copy), RefreshProfilePlatformUserInfoModule (copy), RefreshProfileOnTrustedFriendsRtn (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseRoactServiceResult = UseRoactServiceFunction(AppNotificationService)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RobloxEventReceiver (upval), UseRoactServiceResult (copy)
		return RobloxEventReceiver.new(UseRoactServiceResult)
	end, { UseRoactServiceResult })
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local UseActionsComponentRequestModuleResult = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModule() else nil
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: PresenceModule (upval), ProfileId (copy), PresenceType (upval)
		return PresenceModule.Selectors.getUserPresenceByUserId(p1, ProfileId) or {
			lastLocation = "",
			userPresenceType = PresenceType.Offline
		}
	end)
	local ConvertPresenceEnumModuleResult = ConvertPresenceEnumModule(UseSelectorResult.userPresenceType, UseSelectorResult.universeId)
	local UseRefResult = ReactModule.useRef(ConvertPresenceEnumModuleResult)
	ReactModule.useEffect(function()
		-- upvalues: ProfileType (copy), EnumsModule (upval), UseRefResult (copy), ConvertPresenceEnumModuleResult (copy), UseDispatchResult (copy), RefreshProfilePlatformActionInfoModule (upval), ProfileId (copy), UseActionsComponentRequestModuleResult (copy)
		if ProfileType ~= EnumsModule.ProfileTypes.User then return end
		if UseRefResult.current ~= ConvertPresenceEnumModuleResult then
			if UseRefResult.current == EnumsModule.PresenceTypes.InGame or ConvertPresenceEnumModuleResult == EnumsModule.PresenceTypes.InGame then
				UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
			end
			UseRefResult.current = ConvertPresenceEnumModuleResult
		end
	end, {
		ConvertPresenceEnumModuleResult,
		UseDispatchResult,
		ProfileId,
		ProfileType,
		if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: ProfileType (copy), EnumsModule (upval), UseMemoResult (copy), ProfileId (copy), UseDispatchResult (copy), RefreshProfilePlatformUserInfoModule (upval)
		if ProfileType ~= EnumsModule.ProfileTypes.User then return end
		local UserProfileNotifications = UseMemoResult:observeEvent("UserProfileNotifications", function(p1)
			-- upvalues: ProfileId (upval), EnumsModule (upval), UseDispatchResult (upval), RefreshProfilePlatformUserInfoModule (upval)
			local Text = tostring(p1.VieweeUserId)
			local Type = p1.Type
			
			if ProfileId == Text and (Type == EnumsModule.NameTypes.DisplayName or Type == EnumsModule.NameTypes.Alias or Type == EnumsModule.NameTypes.Username) then
				UseDispatchResult(RefreshProfilePlatformUserInfoModule(Text))
			end
		end)
		
		return function()
			-- upvalues: UserProfileNotifications (copy)
			UserProfileNotifications:disconnect()
		end
	end, { UseMemoResult, UseDispatchResult, ProfileId, ProfileType })
	ReactModule.useEffect(function()
		-- upvalues: ProfileType (copy), EnumsModule (upval), UseMemoResult (copy), UseLocalUserIdResult (copy), ProfileId (copy), UseDispatchResult (copy), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (copy)
		if ProfileType ~= EnumsModule.ProfileTypes.User then return end
		local FriendshipNotifications = UseMemoResult:observeEvent("FriendshipNotifications", function(p1)
			-- upvalues: UseLocalUserIdResult (upval), ProfileId (upval), UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
			if ProfileId == (if tostring(UseLocalUserIdResult) == tostring(p1.EventArgs.UserId1) then tostring(p1.EventArgs.UserId2) else tostring(p1.EventArgs.UserId1)) then
				UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
			end
		end)
		
		return function()
			-- upvalues: FriendshipNotifications (copy)
			FriendshipNotifications:disconnect()
		end
	end, {
		UseMemoResult, UseDispatchResult, ProfileId, UseLocalUserIdResult, ProfileType,
		if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
	})
	
	if RefreshProfileOnTrustedFriendsRtn then
		ReactModule.useEffect(function()
			-- upvalues: ProfileType (copy), EnumsModule (upval), UseMemoResult (copy), UseLocalUserIdResult (copy), ProfileId (copy), UseDispatchResult (copy), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (copy)
			if ProfileType ~= EnumsModule.ProfileTypes.User then return end
			local TrustedConnectionNotifications = UseMemoResult:observeEvent("TrustedConnectionNotifications", function(Mouse)
				-- upvalues: UseLocalUserIdResult (upval), ProfileId (upval), UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
				if ProfileId == (if tostring(UseLocalUserIdResult) == tostring(Mouse.Actor) then tostring(Mouse.Target) else tostring(Mouse.Actor)) then
					UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
				end
			end)
			
			return function()
				-- upvalues: TrustedConnectionNotifications (copy)
				TrustedConnectionNotifications:disconnect()
			end
		end, {
			UseMemoResult, UseDispatchResult, ProfileId, UseLocalUserIdResult, ProfileType,
			if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
		})
	end
end