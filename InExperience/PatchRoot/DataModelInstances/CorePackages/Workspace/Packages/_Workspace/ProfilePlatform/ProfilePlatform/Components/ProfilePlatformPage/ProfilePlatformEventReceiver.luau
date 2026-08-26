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
local var1 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local refreshProfileOnTrustedFriendsRtn = game:DefineFastFlag("RefreshProfileOnTrustedFriendsRtn", false)
local t = { skipFetch = true }

return function()
	-- upvalues: useProfileWrapperContextModule (ref), useRoactService (ref), appNotificationService (ref), reactModule (ref), robloxEventReceiver (ref), useDispatch (ref), useLocalUserId (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var1 (ref), t (ref), convertPresenceEnumModule (ref), presenceType (ref), useSelector (ref), presenceModule (ref), enumsModule (ref), refreshProfilePlatformActionInfoModule (ref), refreshProfilePlatformUserInfoModule (ref), refreshProfileOnTrustedFriendsRtn (ref)
	local var2, var3
	local var4 = useProfileWrapperContextModule()
	local var5 = useRoactService(appNotificationService)
	local var6 = reactModule.useMemo(function()
		-- upvalues: robloxEventReceiver (copy), var5 (ref)
		return robloxEventReceiver.new(var5)
	end, { var5 })
	local var7 = useDispatch()
	local var8 = useLocalUserId()
	local profileId = var4.profileId
	local profileType = var4.profileType
	local var9 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local _ = nil
	
	if fFlagProfilePlatformPresenceStoreMigrationModule then
		var2 = var1(profileId, t)
		var3 = convertPresenceEnumModule(if var2 then var2.userPresenceType else presenceType.Offline, if var2 and var2.universeId ~= "" then tonumber(var2.universeId) else nil)
	else
		local var10 = useSelector(function(p1)
			-- upvalues: presenceModule (copy), profileId (ref), presenceType (copy)
			return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
				lastLocation = "",
				userPresenceType = presenceType.Offline
			}
		end)
		var3 = convertPresenceEnumModule(var10.userPresenceType, var10.universeId)
	end
	var2 = reactModule.useRef(var3)
	reactModule.useEffect(function()
		-- upvalues: profileType (ref), enumsModule (copy), var2 (ref), var3 (write), var7 (ref), refreshProfilePlatformActionInfoModule (copy), profileId (ref), var9 (ref)
		if profileType ~= enumsModule.ProfileTypes.User then return end
		if var2.current ~= var3 then
			if var2.current == enumsModule.PresenceTypes.InGame or var3 == enumsModule.PresenceTypes.InGame then
				var7(refreshProfilePlatformActionInfoModule(profileId, var9))
			end
			var2.current = var3
		end
	end, {
		var3,
		var7,
		profileId,
		profileType,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var9 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: profileType (ref), enumsModule (copy), var6 (ref), profileId (ref), var7 (ref), refreshProfilePlatformUserInfoModule (copy)
		if profileType == enumsModule.ProfileTypes.User then
			local userProfileNotifications = var6:observeEvent("UserProfileNotifications", function(p1)
				-- upvalues: profileId (copy), enumsModule (copy), var7 (copy), refreshProfilePlatformUserInfoModule (copy)
				local var11 = tostring(p1.VieweeUserId)
				local type = p1.Type
				
				if profileId == var11 and (type == enumsModule.NameTypes.DisplayName or type == enumsModule.NameTypes.Alias or type == enumsModule.NameTypes.Username) then
					var7(refreshProfilePlatformUserInfoModule(var11))
				end
			end)
			
			return function()
				-- upvalues: userProfileNotifications (ref)
				userProfileNotifications:disconnect()
			end
		end
	end, { var6, var7, profileId, profileType })
	reactModule.useEffect(function()
		-- upvalues: profileType (ref), enumsModule (copy), var6 (ref), var8 (ref), profileId (ref), var7 (ref), refreshProfilePlatformActionInfoModule (copy), var9 (ref)
		if profileType == enumsModule.ProfileTypes.User then
			local friendshipNotifications = var6:observeEvent("FriendshipNotifications", function(p1)
				-- upvalues: var8 (copy), profileId (copy), var7 (copy), refreshProfilePlatformActionInfoModule (copy), var9 (copy)
				if profileId == (if tostring(var8) == tostring(p1.EventArgs.UserId1) then tostring(p1.EventArgs.UserId2) else tostring(p1.EventArgs.UserId1)) then
					var7(refreshProfilePlatformActionInfoModule(profileId, var9))
				end
			end)
			
			return function()
				-- upvalues: friendshipNotifications (ref)
				friendshipNotifications:disconnect()
			end
		end
	end, {
		var6, var7, profileId, var8, profileType,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var9 else nil
	})
	
	if refreshProfileOnTrustedFriendsRtn then
		reactModule.useEffect(function()
			-- upvalues: profileType (ref), enumsModule (copy), var6 (ref), var8 (ref), profileId (ref), var7 (ref), refreshProfilePlatformActionInfoModule (copy), var9 (ref)
			if profileType == enumsModule.ProfileTypes.User then
				local trustedConnectionNotifications = var6:observeEvent("TrustedConnectionNotifications", function(p1)
					-- upvalues: var8 (copy), profileId (copy), var7 (copy), refreshProfilePlatformActionInfoModule (copy), var9 (copy)
					if profileId == (if tostring(var8) == tostring(p1.Actor) then tostring(p1.Target) else tostring(p1.Actor)) then
						var7(refreshProfilePlatformActionInfoModule(profileId, var9))
					end
				end)
				
				return function()
					-- upvalues: trustedConnectionNotifications (ref)
					trustedConnectionNotifications:disconnect()
				end
			end
		end, {
			var6, var7, profileId, var8, profileType,
			if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var9 else nil
		})
	end
end