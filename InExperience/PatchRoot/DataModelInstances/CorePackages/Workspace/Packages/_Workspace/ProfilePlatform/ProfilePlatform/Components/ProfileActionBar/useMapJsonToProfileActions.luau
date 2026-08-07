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
local var5 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local networkStatus = myRoduxNetworkingModule.Enum.NetworkStatus
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileActionsModule = require(profilePlatform.Hooks.useProfileActions)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
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
local var20 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
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
	[enumsModule.ProfileActions.Follow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then true else nil,
	[enumsModule.ProfileActions.CancelJoinCommunityRequest] = true,
	[enumsModule.ProfileActions.ViewCommunity] = true,
	[enumsModule.ProfileActions.ViewFullProfile] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then true else nil,
	[enumsModule.ProfileActions.ShareProfile] = true,
	[enumsModule.ProfileActions.Unfriend] = true,
	[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then true else nil
}

function isJoinExperience(p0) --[[ line: 94 ]]
	-- upvalues: enumsModule (ref)
	for i, v in p0 do
		if v.type == enumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p1) --[[ line: 103 ]]
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useSelector (ref), networkingPresenceModule (ref), networkStatus (ref), useProfileActionsModule (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), reactModule (ref), var20 (ref), useEffectOnce (ref), fFlagProfilePlatformEnableUserProfileButtonsBacktestModule (ref), dashModule (ref), t (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagEnableProfilePlatformDisabledActions (ref), fFlagEnableCommunityVerificationModalModule (ref), fFlagPortEnableCommunityVerificationModalModule (ref), iconName (ref), fFlagSignalsNavP3Dispatch (ref), var5 (ref), navigateDown (ref), fFlagEnableProfilePlatformDisabledReasonTextModule (ref)
	local var23 = useDispatch()
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var25 = if fFlagProfilePlatformPresenceStoreMigrationModule then nil else useSelector(function(p2) --[[ line: 109 ]]
		-- upvalues: networkingPresenceModule (copy), p1 (ref), networkStatus (copy)
		return networkingPresenceModule.GetPresencesFromUserIds.getStatus(p2, p1) == networkStatus.NotStarted
	end)
	local var26 = useProfileActionsModule(enumsModule.ButtonSurface.Actions)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		reactModule.useEffect(function() --[[ line: 122 ]]
			-- upvalues: actions (ref), fFlagProfilePlatformPresenceStoreMigrationModule (copy), var20 (copy), p1 (ref), var23 (ref), networkingPresenceModule (copy)
			if isJoinExperience(actions.buttons) then
				if fFlagProfilePlatformPresenceStoreMigrationModule then
					var20.RefreshPresenceByUserId(p1)
					
					return
				end
				var23(networkingPresenceModule.GetPresencesFromUserIds.API({ p1 }))
			end
		end, { actions.buttons, var23, p1 })
	else
		useEffectOnce(function() --[[ line: 133 ]]
			-- upvalues: fFlagProfilePlatformPresenceStoreMigrationModule (copy), var20 (copy), p1 (ref), var23 (ref), networkingPresenceModule (copy)
			if fFlagProfilePlatformPresenceStoreMigrationModule then
				var20.RefreshPresenceByUserId(p1)
				
				return
			end
			var23(networkingPresenceModule.GetPresencesFromUserIds.API({ p1 }))
		end, isJoinExperience(actions.buttons) and (if fFlagProfilePlatformPresenceStoreMigrationModule then true else var25))
	end
	local buttons = fFlagProfilePlatformEnableUserProfileButtonsBacktestModule and dashModule.find(actions.buttons, function(p3) --[[ line: 146 ]]
		-- upvalues: enumsModule (copy)
		return p3.type == enumsModule.ProfileActions.JoinExperience
	end)
	
	for i, v in ipairs(actions.buttons) do
		if not buttons or v.type == enumsModule.ProfileActions.JoinExperience or not t[v.type] then
			local type = var26[v.type]
			
			if fFlagProfilePlatformEnableEditAppearanceMenuModule and v.subActions then
				local t_4 = {}
				
				for i_1, v_1 in v.subActions do
					local var32 = var26[v_1]
					
					if var32 then
						table.insert(t_4, {
							id = v_1,
							text = var32.text,
							icon = var32.icon,
							onActivated = var32.onActivated
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
					
					function type.onActivated() --[[ line: 195 ]]
						-- upvalues: enumsModule (copy), v (ref), fFlagSignalsNavP3Dispatch (copy), var5 (copy), var23 (ref), navigateDown (copy)
						local t = {
							name = enumsModule.Screens.CommunityVerificationModal,
							extraProps = { disabledReason = v.disabledReason }
						}
						
						return if fFlagSignalsNavP3Dispatch then var5.down(var5.fromLegacyPage(t)) else var23(navigateDown(t))
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