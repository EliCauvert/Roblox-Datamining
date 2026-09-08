local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local networkingPresenceModule = require(profilePlatform.Networking.NetworkingPresence)
local myRoduxNetworkingModule = require(profilePlatform.Networking.myRoduxNetworking)
local iconName = require(parent.Foundation).Enums.IconName
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local networkStatus = myRoduxNetworkingModule.Enum.NetworkStatus
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileActionsModule = require(profilePlatform.Hooks.useProfileActions)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local fFlagEnableProfilePlatformDisabledActions = require(parent.SharedFlags).FFlagEnableProfilePlatformDisabledActions
local fFlagEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local fFlagPortEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local fFlagEnableProfilePlatformDisabledReasonTextModule = require(profilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local fFlagProfilePlatformEnableUserProfileButtonsBacktestModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableUserProfileButtonsBacktest)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local fFlagProfilePlatformEnableUnlockChatModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat)
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var2 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local dashModule = require(parent.Dash)
local t = {
	[enumsModule.ProfileActions.AcceptFriendRequest] = true,
	[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = true,
	[enumsModule.ProfileActions.AddFriend] = true,
	[enumsModule.ProfileActions.AddFriendFromContacts] = true,
	[enumsModule.ProfileActions.AddFriendFromContactsSent] = true,
	[enumsModule.ProfileActions.CannotAddFriend] = true,
	[enumsModule.ProfileActions.Chat] = true,
	[enumsModule.ProfileActions.UnlockChat] = if fFlagProfilePlatformEnableUnlockChatModule then true else nil,
	[enumsModule.ProfileActions.EditAlias] = true,
	[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then true else nil,
	[enumsModule.ProfileActions.EditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEditBackgroundMenuItemModule then true else nil,
	[enumsModule.ProfileActions.EditAvatar] = true,
	[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then true else nil,
	[enumsModule.ProfileActions.EditProfile] = true,
	[enumsModule.ProfileActions.JoinExperience] = true,
	[enumsModule.ProfileActions.PendingFriendRequest] = true,
	[enumsModule.ProfileActions.Unblock] = true,
	[enumsModule.ProfileActions.JoinCommunity] = true,
	[enumsModule.ProfileActions.Follow] = true,
	[enumsModule.ProfileActions.CancelJoinCommunityRequest] = true,
	[enumsModule.ProfileActions.ViewCommunity] = true,
	[enumsModule.ProfileActions.ViewFullProfile] = true,
	[enumsModule.ProfileActions.ShareProfile] = true,
	[enumsModule.ProfileActions.Unfriend] = true,
	[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then true else nil
}

function isJoinExperience(p1)
	-- upvalues: enumsModule (ref)
	for i, v in p1 do
		if v.type == enumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p2)
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useSelector (ref), networkingPresenceModule (ref), networkStatus (ref), useProfileActionsModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), reactModule (ref), var2 (ref), useEffectOnce (ref), fFlagProfilePlatformEnableUserProfileButtonsBacktestModule (ref), dashModule (ref), t (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagEnableProfilePlatformDisabledActions (ref), fFlagEnableCommunityVerificationModalModule (ref), fFlagPortEnableCommunityVerificationModalModule (ref), iconName (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), fFlagEnableProfilePlatformDisabledReasonTextModule (ref)
	local var3 = useDispatch()
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var4 = if fFlagProfilePlatformPresenceStoreMigrationModule then nil else useSelector(function(p3)
		-- upvalues: networkingPresenceModule (copy), p2 (ref), networkStatus (copy)
		return networkingPresenceModule.GetPresencesFromUserIds.getStatus(p3, p2) == networkStatus.NotStarted
	end)
	local var5 = useProfileActionsModule(enumsModule.ButtonSurface.Actions)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		reactModule.useEffect(function()
			-- upvalues: actions (ref), fFlagProfilePlatformPresenceStoreMigrationModule (copy), var2 (copy), p2 (ref), var3 (ref), networkingPresenceModule (copy)
			if isJoinExperience(actions.buttons) then
				if fFlagProfilePlatformPresenceStoreMigrationModule then
					var2.RefreshPresenceByUserId(p2)
					
					return
				end
				var3(networkingPresenceModule.GetPresencesFromUserIds.API({ p2 }))
			end
		end, { actions.buttons, var3, p2 })
	else
		useEffectOnce(function()
			-- upvalues: fFlagProfilePlatformPresenceStoreMigrationModule (copy), var2 (copy), p2 (ref), var3 (ref), networkingPresenceModule (copy)
			if fFlagProfilePlatformPresenceStoreMigrationModule then
				var2.RefreshPresenceByUserId(p2)
				
				return
			end
			var3(networkingPresenceModule.GetPresencesFromUserIds.API({ p2 }))
		end, isJoinExperience(actions.buttons) and (if fFlagProfilePlatformPresenceStoreMigrationModule then true else var4))
	end
	local buttons = fFlagProfilePlatformEnableUserProfileButtonsBacktestModule and dashModule.find(actions.buttons, function(p3)
		-- upvalues: enumsModule (copy)
		return p3.type == enumsModule.ProfileActions.JoinExperience
	end)
	
	for i, v in ipairs(actions.buttons) do
		if not buttons or v.type == enumsModule.ProfileActions.JoinExperience or not t[v.type] then
			local type = var5[v.type]
			
			if fFlagProfilePlatformEnableEditAppearanceMenuModule and v.subActions then
				local t_4 = {}
				
				for i_1, v_1 in v.subActions do
					local var6 = var5[v_1]
					
					if var6 then
						table.insert(t_4, {
							id = v_1,
							text = var6.text,
							icon = var6.icon,
							onActivated = var6.onActivated
						})
					end
				end
				if #t_4 > 0 then
					type.menuItems = t_4
				end
			end
			if fFlagEnableProfilePlatformDisabledActions and v.disabledReason then
				if fFlagEnableCommunityVerificationModalModule and v.type == enumsModule.ProfileActions.JoinCommunity and (v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					type.icon = if fFlagEnableCommunityVerificationModalModule and fFlagPortEnableCommunityVerificationModalModule then iconName.LockClosed else nil
					
					function type.onActivated()
						-- upvalues: enumsModule (copy), v (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateDown (copy)
						local t = {
							name = enumsModule.Screens.CommunityVerificationModal,
							extraProps = { disabledReason = v.disabledReason }
						}
						
						return if fFlagSignalsNavP3Dispatch then var1.down(var1.fromLegacyPage(t)) else var3(navigateDown(t))
					end
				else
					type.isDisabled = true
					type.disabledReason = if fFlagEnableProfilePlatformDisabledReasonTextModule then v.disabledReason else nil
				end
			end
			if t[v.type] then
				table.insert(t_2, type)
			else
				table.insert(t_3, type)
			end
		end
	end
	if #t_2 > 0 then
		t_1.primary = t_2
	end
	if #t_3 > 0 then
		t_1.secondary = t_3
	end
	return t_1, if actions.contextual then true else false
end