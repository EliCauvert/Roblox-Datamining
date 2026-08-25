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
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var13 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local refreshProfileOnTrustedFriendsRtn = game:DefineFastFlag("RefreshProfileOnTrustedFriendsRtn", false)
local t = { skipFetch = true }

return function()
	-- upvalues: useProfileWrapperContextModule (ref), useRoactService (ref), appNotificationService (ref), reactModule (ref), robloxEventReceiver (ref), useDispatch (ref), useLocalUserId (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var13 (ref), t (ref), convertPresenceEnumModule (ref), presenceType (ref), useSelector (ref), presenceModule (ref), enumsModule (ref), refreshProfilePlatformActionInfoModule (ref), refreshProfilePlatformUserInfoModule (ref), refreshProfileOnTrustedFriendsRtn (ref)
	local var24, var23
	local var16 = useProfileWrapperContextModule()
	local var17 = useRoactService(appNotificationService)
	local var18 = reactModule.useMemo(function()
		-- upvalues: robloxEventReceiver (copy), var17 (ref)
		return robloxEventReceiver.new(var17)
	end, { var17 })
	local var19 = useDispatch()
	local var20 = useLocalUserId()
	local profileId = var16.profileId
	local profileType = var16.profileType
	local var21 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local _ = nil
	
	if fFlagProfilePlatformPresenceStoreMigrationModule then
		var24 = var13(profileId, t)
		var23 = convertPresenceEnumModule(if var24 then var24.userPresenceType else presenceType.Offline, if var24 and var24.universeId ~= "" then tonumber(var24.universeId) else nil)
	else
		local var22 = useSelector(function(p0)
			-- upvalues: presenceModule (copy), profileId (ref), presenceType (copy)
			return presenceModule.Selectors.getUserPresenceByUserId(p0, profileId) or {
				lastLocation = "",
				userPresenceType = presenceType.Offline
			}
		end)
		var23 = convertPresenceEnumModule(var22.userPresenceType, var22.universeId)
	end
	var24 = reactModule.useRef(var23)
	reactModule.useEffect(function()
		-- upvalues: profileType (ref), enumsModule (copy), var24 (ref), var23 (write), var19 (ref), refreshProfilePlatformActionInfoModule (copy), profileId (ref), var21 (ref)
		if profileType ~= enumsModule.ProfileTypes.User then return end
		if var24.current ~= var23 then
			if var24.current == enumsModule.PresenceTypes.InGame or var23 == enumsModule.PresenceTypes.InGame then
				var19(refreshProfilePlatformActionInfoModule(profileId, var21))
			end
			var24.current = var23
		end
	end, {
		var23,
		var19,
		profileId,
		profileType,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var21 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: profileType (ref), enumsModule (copy), var18 (ref), profileId (ref), var19 (ref), refreshProfilePlatformUserInfoModule (copy)
		if profileType == enumsModule.ProfileTypes.User then
			local userProfileNotifications = var18:observeEvent("UserProfileNotifications", function(p1)
				-- upvalues: profileId (copy), enumsModule (copy), var19 (copy), refreshProfilePlatformUserInfoModule (copy)
				local var26 = tostring(p1.VieweeUserId)
				local type = p1.Type
				
				if profileId == var26 and (type == enumsModule.NameTypes.DisplayName or type == enumsModule.NameTypes.Alias or type == enumsModule.NameTypes.Username) then
					var19(refreshProfilePlatformUserInfoModule(var26))
				end
			end)
			
			return function()
				-- upvalues: userProfileNotifications (ref)
				userProfileNotifications:disconnect()
			end
		end
	end, { var18, var19, profileId, profileType })
	reactModule.useEffect(function()
		-- upvalues: profileType (ref), enumsModule (copy), var18 (ref), var20 (ref), profileId (ref), var19 (ref), refreshProfilePlatformActionInfoModule (copy), var21 (ref)
		if profileType == enumsModule.ProfileTypes.User then
			local friendshipNotifications = var18:observeEvent("FriendshipNotifications", function(p2)
				-- upvalues: var20 (copy), profileId (copy), var19 (copy), refreshProfilePlatformActionInfoModule (copy), var21 (copy)
				if profileId == (if tostring(var20) == tostring(p2.EventArgs.UserId1) then tostring(p2.EventArgs.UserId2) else tostring(p2.EventArgs.UserId1)) then
					var19(refreshProfilePlatformActionInfoModule(profileId, var21))
				end
			end)
			
			return function()
				-- upvalues: friendshipNotifications (ref)
				friendshipNotifications:disconnect()
			end
		end
	end, {
		var18, var19, profileId, var20, profileType,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var21 else nil
	})
	
	if refreshProfileOnTrustedFriendsRtn then
		reactModule.useEffect(function()
			-- upvalues: profileType (ref), enumsModule (copy), var18 (ref), var20 (ref), profileId (ref), var19 (ref), refreshProfilePlatformActionInfoModule (copy), var21 (ref)
			if profileType == enumsModule.ProfileTypes.User then
				local trustedConnectionNotifications = var18:observeEvent("TrustedConnectionNotifications", function(p3)
					-- upvalues: var20 (copy), profileId (copy), var19 (copy), refreshProfilePlatformActionInfoModule (copy), var21 (copy)
					if profileId == (if tostring(var20) == tostring(p3.Actor) then tostring(p3.Target) else tostring(p3.Actor)) then
						var19(refreshProfilePlatformActionInfoModule(profileId, var21))
					end
				end)
				
				return function()
					-- upvalues: trustedConnectionNotifications (ref)
					trustedConnectionNotifications:disconnect()
				end
			end
		end, {
			var18, var19, profileId, var20, profileType,
			if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var21 else nil
		})
	end
end