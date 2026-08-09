local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local appNotificationService = require(parent.RoactServiceTags).AppNotificationService
local convertPresenceEnumModule = require(profilePlatform.Utils.convertPresenceEnum)
local presenceModule = require(profilePlatform.Rodux.Presence)
local presenceType = presenceModule.Enums.PresenceType
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local refreshProfilePlatformUserInfoModule = require(profilePlatform.Networking.refreshProfilePlatformUserInfo)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local useActionsComponentRequestModule = require(profilePlatform.Hooks.useActionsComponentRequest)
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local robloxEventReceiver = require(parent.RealtimeDelivery).RobloxEventReceiver
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local roactUtilsModule = require(parent.RoactUtils)
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useRoactService = robloxAppHooksModule.useRoactService
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local enumsModule = require(profilePlatform.Common.Enums)
local refreshProfileOnTrustedFriendsRtn = game:DefineFastFlag("RefreshProfileOnTrustedFriendsRtn", false)

return function() --[[ line: 33 ]]
	-- upvalues: useProfileWrapperContextModule (ref), useRoactService (ref), appNotificationService (ref), reactModule (ref), robloxEventReceiver (ref), useDispatch (ref), useLocalUserId (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useSelector (ref), presenceModule (ref), presenceType (ref), convertPresenceEnumModule (ref), enumsModule (ref), refreshProfilePlatformActionInfoModule (ref), refreshProfilePlatformUserInfoModule (ref), refreshProfileOnTrustedFriendsRtn (ref)
	local var13 = useProfileWrapperContextModule()
	local var14 = useRoactService(appNotificationService)
	local var15 = reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: robloxEventReceiver (copy), var14 (ref)
		return robloxEventReceiver.new(var14)
	end, { var14 })
	local var16 = useDispatch()
	local var17 = useLocalUserId()
	local profileId = var13.profileId
	local profileType = var13.profileType
	local var18 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var19 = useSelector(function(p0) --[[ line: 47 ]]
		-- upvalues: presenceModule (copy), profileId (ref), presenceType (copy)
		return presenceModule.Selectors.getUserPresenceByUserId(p0, profileId) or {
			lastLocation = "",
			userPresenceType = presenceType.Offline
		}
	end)
	local var20 = convertPresenceEnumModule(var19.userPresenceType, var19.universeId)
	local var21 = reactModule.useRef(var20)
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: profileType (ref), enumsModule (copy), var21 (ref), var20 (ref), var16 (ref), refreshProfilePlatformActionInfoModule (copy), profileId (ref), var18 (ref)
		if profileType ~= enumsModule.ProfileTypes.User then return end
		if var21.current ~= var20 then
			if var21.current == enumsModule.PresenceTypes.InGame or var20 == enumsModule.PresenceTypes.InGame then
				var16(refreshProfilePlatformActionInfoModule(profileId, var18))
			end
			var21.current = var20
		end
	end, {
		var20,
		var16,
		profileId,
		profileType,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var18 else nil
	})
	reactModule.useEffect(function() --[[ line: 77 ]]
		-- upvalues: profileType (ref), enumsModule (copy), var15 (ref), profileId (ref), var16 (ref), refreshProfilePlatformUserInfoModule (copy)
		if profileType == enumsModule.ProfileTypes.User then
			local userProfileNotifications = var15:observeEvent("UserProfileNotifications", function(p1) --[[ line: 82 ]]
				-- upvalues: profileId (copy), enumsModule (copy), var16 (copy), refreshProfilePlatformUserInfoModule (copy)
				local var23 = tostring(p1.VieweeUserId)
				local type = p1.Type
				
				if profileId == var23 and (type == enumsModule.NameTypes.DisplayName or type == enumsModule.NameTypes.Alias or type == enumsModule.NameTypes.Username) then
					var16(refreshProfilePlatformUserInfoModule(var23))
				end
			end)
			
			return function() --[[ line: 97 ]]
				-- upvalues: userProfileNotifications (ref)
				userProfileNotifications:disconnect()
			end
		end
	end, { var15, var16, profileId, profileType })
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: profileType (ref), enumsModule (copy), var15 (ref), var17 (ref), profileId (ref), var16 (ref), refreshProfilePlatformActionInfoModule (copy), var18 (ref)
		if profileType == enumsModule.ProfileTypes.User then
			local friendshipNotifications = var15:observeEvent("FriendshipNotifications", function(p2) --[[ line: 112 ]]
				-- upvalues: var17 (copy), profileId (copy), var16 (copy), refreshProfilePlatformActionInfoModule (copy), var18 (copy)
				if profileId == (if tostring(var17) == tostring(p2.EventArgs.UserId1) then tostring(p2.EventArgs.UserId2) else tostring(p2.EventArgs.UserId1)) then
					var16(refreshProfilePlatformActionInfoModule(profileId, var18))
				end
			end)
			
			return function() --[[ line: 122 ]]
				-- upvalues: friendshipNotifications (ref)
				friendshipNotifications:disconnect()
			end
		end
	end, {
		var15, var16, profileId, var17, profileType,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var18 else nil
	})
	
	if refreshProfileOnTrustedFriendsRtn then
		reactModule.useEffect(function() --[[ line: 135 ]]
			-- upvalues: profileType (ref), enumsModule (copy), var15 (ref), var17 (ref), profileId (ref), var16 (ref), refreshProfilePlatformActionInfoModule (copy), var18 (ref)
			if profileType == enumsModule.ProfileTypes.User then
				local trustedConnectionNotifications = var15:observeEvent("TrustedConnectionNotifications", function(p3) --[[ line: 140 ]]
					-- upvalues: var17 (copy), profileId (copy), var16 (copy), refreshProfilePlatformActionInfoModule (copy), var18 (copy)
					if profileId == (if tostring(var17) == tostring(p3.Actor) then tostring(p3.Target) else tostring(p3.Actor)) then
						var16(refreshProfilePlatformActionInfoModule(profileId, var18))
					end
				end)
				
				return function() --[[ line: 150 ]]
					-- upvalues: trustedConnectionNotifications (ref)
					trustedConnectionNotifications:disconnect()
				end
			end
		end, {
			var15, var16, profileId, var17, profileType,
			if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var18 else nil
		})
	end
end