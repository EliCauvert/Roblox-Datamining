local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local NetworkingPresenceModule = require(ProfilePlatform.Networking.NetworkingPresence)
local IconName = require(Parent.Foundation).Enums.IconName
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local NetworkStatus = require(ProfilePlatform.Networking.myRoduxNetworking).Enum.NetworkStatus
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileActionsModule = require(ProfilePlatform.Hooks.useProfileActions)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local FFlagEnableProfilePlatformDisabledActions = require(Parent.SharedFlags).FFlagEnableProfilePlatformDisabledActions
local FFlagEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagPortEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local FFlagEnableProfilePlatformDisabledReasonTextModule = require(ProfilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local FFlagProfilePlatformEnableUserProfileButtonsBacktestModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUserProfileButtonsBacktest)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableEditLookModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local DashModule = require(Parent.Dash)
local config = {
	[EnumsModule.ProfileActions.AcceptFriendRequest] = true,
	[EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = true,
	[EnumsModule.ProfileActions.AddFriend] = true,
	[EnumsModule.ProfileActions.AddFriendFromContacts] = true,
	[EnumsModule.ProfileActions.AddFriendFromContactsSent] = true,
	[EnumsModule.ProfileActions.CannotAddFriend] = true,
	[EnumsModule.ProfileActions.Chat] = true,
	[EnumsModule.ProfileActions.UnlockChat] = if require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat) then true else nil,
	[EnumsModule.ProfileActions.EditAlias] = true,
	[EnumsModule.ProfileActions.EditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then true else nil,
	[EnumsModule.ProfileActions.EditBackground] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then true else nil,
	[EnumsModule.ProfileActions.EditAvatar] = true,
	[EnumsModule.ProfileActions.EditLook] = if FFlagProfilePlatformEnableEditLookModule then true else nil,
	[EnumsModule.ProfileActions.EditProfile] = true,
	[EnumsModule.ProfileActions.JoinExperience] = true,
	[EnumsModule.ProfileActions.PendingFriendRequest] = true,
	[EnumsModule.ProfileActions.Unblock] = true,
	[EnumsModule.ProfileActions.JoinCommunity] = true,
	[EnumsModule.ProfileActions.Follow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then true else nil,
	[EnumsModule.ProfileActions.CancelJoinCommunityRequest] = true,
	[EnumsModule.ProfileActions.ViewCommunity] = true,
	[EnumsModule.ProfileActions.ViewFullProfile] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then true else nil,
	[EnumsModule.ProfileActions.ShareProfile] = true,
	[EnumsModule.ProfileActions.Unfriend] = true,
	[EnumsModule.ProfileActions.CurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then true else nil
}

function isJoinExperience(List): boolean
	-- upvalues: EnumsModule (copy)
	for _, value in List do
		if value.type == EnumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseSelectorFunction (copy), NetworkingPresenceModule (copy), NetworkStatus (copy), UseProfileActionsModule (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), ReactModule (copy), UseEffectOnceFunction (copy), FFlagProfilePlatformEnableUserProfileButtonsBacktestModule (copy), DashModule (copy), config (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), FFlagEnableProfilePlatformDisabledActions (copy), FFlagEnableCommunityVerificationModalModule (copy), FFlagPortEnableCommunityVerificationModalModule (copy), IconName (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagEnableProfilePlatformDisabledReasonTextModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Actions) or {}
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: NetworkingPresenceModule (upval), p1 (copy), NetworkStatus (upval)
		return NetworkingPresenceModule.GetPresencesFromUserIds.getStatus(p2, p1) == NetworkStatus.NotStarted
	end)
	local UseProfileActionsModuleResult = UseProfileActionsModule(EnumsModule.ButtonSurface.Actions)
	local t = {}
	local Primary = {}
	local Secondary = {}
	
	if FFlagProfilePlatformAddCurrentlyPlayingModule then
		ReactModule.useEffect(function()
			-- upvalues: UseProfileJsonComponentModuleResult (copy), UseDispatchResult (copy), NetworkingPresenceModule (upval), p1 (copy)
			if isJoinExperience(UseProfileJsonComponentModuleResult.buttons) then
				UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ p1 }))
			end
		end, {
			UseProfileJsonComponentModuleResult.buttons,
			UseDispatchResult,
			p1
		})
	else
		UseEffectOnceFunction(function()
			-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), p1 (copy)
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ p1 }))
		end, isJoinExperience(UseProfileJsonComponentModuleResult.buttons) and UseSelectorResult)
	end
	local FindResult = FFlagProfilePlatformEnableUserProfileButtonsBacktestModule and DashModule.find(UseProfileJsonComponentModuleResult.buttons, function(p2): boolean
		-- upvalues: EnumsModule (upval)
		return p2.type == EnumsModule.ProfileActions.JoinExperience
	end)
	for _, button in ipairs(UseProfileJsonComponentModuleResult.buttons) do
		if not FindResult or button.type == EnumsModule.ProfileActions.JoinExperience or not config[button.type] then
			local UseProfileActionsModuleResultEntry = UseProfileActionsModuleResult[button.type]
			
			if FFlagProfilePlatformEnableEditAppearanceMenuModule and button.subActions then
				local MenuItems = {}
				
				for _, subAction in button.subActions do
					local UseProfileActionsModuleResultEntry1 = UseProfileActionsModuleResult[subAction]
					
					if UseProfileActionsModuleResultEntry1 then
						table.insert(MenuItems, {
							id = subAction,
							text = UseProfileActionsModuleResultEntry1.text,
							icon = UseProfileActionsModuleResultEntry1.icon,
							onActivated = UseProfileActionsModuleResultEntry1.onActivated
						})
					end
				end
				if #MenuItems > 0 then
					UseProfileActionsModuleResultEntry.menuItems = MenuItems
				end
			end
			if FFlagEnableProfilePlatformDisabledActions and button.disabledReason then
				if FFlagEnableCommunityVerificationModalModule and button.type == EnumsModule.ProfileActions.JoinCommunity and (button.disabledReason == EnumsModule.DisabledReasons.InsufficientVerificationLevelLow or button.disabledReason == EnumsModule.DisabledReasons.InsufficientVerificationLevelMedium or button.disabledReason == EnumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					UseProfileActionsModuleResultEntry.icon = if FFlagEnableCommunityVerificationModalModule and FFlagPortEnableCommunityVerificationModalModule then IconName.LockClosed else nil
					
					function UseProfileActionsModuleResultEntry.onActivated()
						-- upvalues: EnumsModule (upval), button (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
						local config = {
							name = EnumsModule.Screens.CommunityVerificationModal,
							extraProps = { disabledReason = button.disabledReason }
						}
						
						return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else UseDispatchResult(NavigateDownFunction(config))
					end
				else
					UseProfileActionsModuleResultEntry.isDisabled = true
					UseProfileActionsModuleResultEntry.disabledReason = if FFlagEnableProfilePlatformDisabledReasonTextModule then button.disabledReason else nil
				end
			end
			if config[button.type] then
				table.insert(Primary, UseProfileActionsModuleResultEntry)
			else
				table.insert(Secondary, UseProfileActionsModuleResultEntry)
			end
		end
	end
	if #Primary > 0 then
		t.primary = Primary
	end
	if #Secondary > 0 then
		t.secondary = Secondary
	end
	return t, if UseProfileJsonComponentModuleResult.contextual then true else false
end