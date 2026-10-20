local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SocialCommonModule = require(Parent.SocialCommon)
local CryoModule = require(Parent.Cryo)
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local BuildUserActionsComponentModule = require(ProfilePlatform.Hooks.buildUserActionsComponent)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)
local FFlagProfilePlatformEnableFavoriteExperiencesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableFavoriteExperiences)
local FFlagProfilePlatformEnableInventory = require(Parent.SharedFlags).FFlagProfilePlatformEnableInventory
local FFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformServiceModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformService)
local FFlagProfilePlatformEnableStore = require(Parent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagProfilePlatformEnableVRModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagExperiencesOnProfile = require(Parent.SharedFlags).FFlagExperiencesOnProfile
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagProfilePlatformEnableMomentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableTradeItemsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local FFlagEnableProfileCompletion = require(Parent.SharedFlags).FFlagEnableProfileCompletion
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local config = {
	[SocialCommonModule.Enums.ContextualInfoTypes.MutualFriends] = EnumsModule.ContextualTypes.MutualFriends,
	[SocialCommonModule.Enums.ContextualInfoTypes.Frequents] = EnumsModule.ContextualTypes.PlayedTogether
}

return function(MutualFriends, p1)
	-- upvalues: FFlagProfilePlatformEnableVRModule (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), BuildUserActionsComponentModule (copy), GetSupportedActionsForProfileTypeModule (copy), EnumsModule (copy), CryoModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformEnableTradeItemsModule (copy), SocialCommonModule (copy), FFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformServiceModule (copy), config (copy), FFlagProfilePlatformEnableFavoriteExperiencesModule (copy), FFlagProfilePlatformEnableInventory (copy), FFlagProfilePlatformEnableStore (copy), FFlagExperiencesOnProfile (copy), FFlagEnableProfileCompletion (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), FFlagProfilePlatformEnableMomentsModule (copy)
	local List = nil
	if FFlagProfilePlatformEnableVRModule then
		List = {
			{
				component = EnumsModule.Components.UserProfileHeader,
				context = if FFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformServiceModule then config[MutualFriends] elseif MutualFriends == SocialCommonModule.Enums.ContextualInfoTypes.MutualFriends then EnumsModule.ContextualTypes.MutualFriends else nil
			},
			{ component = EnumsModule.Components.SocialLinks },
			{ component = EnumsModule.Components.About },
			{ component = EnumsModule.Components.CurrentlyWearing },
			if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then BuildUserActionsComponentModule(MutualFriends, p1) else {
				isActionsV2Supported = true,
				component = EnumsModule.Components.Actions,
				context = if MutualFriends == SocialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then EnumsModule.ContextualTypes.OffNetworkFriendRequest else nil,
				supportedActions = CryoModule.List.filter(GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User), function(Chat): boolean
					-- upvalues: EnumsModule (upval), p1 (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), FFlagProfilePlatformEnableTradeItemsModule (upval)
					return if Chat == EnumsModule.ProfileActions.QrCode then if p1 and p1.isProfileQrCodeEnabled then true else false elseif Chat == EnumsModule.ProfileActions.EditProfile then if p1 and p1.areWebViewsSupported then true else false elseif FFlagProfilePlatformEnableCurrencyTransfer and Chat == EnumsModule.ProfileActions.CurrencyTransfer then if p1 and p1.canRenderTransferInProfile then true else false elseif FFlagProfilePlatformEnableTradeItemsModule and Chat == EnumsModule.ProfileActions.TradeItems then if p1 and p1.areWebViewsSupported then true else false else Chat ~= EnumsModule.ProfileActions.Chat or (p1 and p1.canSeeChatTab ~= false or false)
				end),
				excludeContextualActions = if p1 and p1.isSelfView then true else nil
			}
		}
		table.insert(List, { component = EnumsModule.Components.ProfileBackground })
		
		if p1 and p1.areWebViewsSupported then
			table.insert(List, { component = EnumsModule.Components.ViewFullProfile })
		end
	else
		List = {
			{
				component = EnumsModule.Components.UserProfileHeader,
				context = if MutualFriends == SocialCommonModule.Enums.ContextualInfoTypes.MutualFriends then EnumsModule.ContextualTypes.MutualFriends else nil
			},
			{ component = EnumsModule.Components.SocialLinks },
			{ component = EnumsModule.Components.About },
			{ component = EnumsModule.Components.CurrentlyWearing },
			{ component = EnumsModule.Components.ViewFullProfile },
			if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then BuildUserActionsComponentModule(MutualFriends, p1) else {
				isActionsV2Supported = true,
				component = EnumsModule.Components.Actions,
				context = if MutualFriends == SocialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then EnumsModule.ContextualTypes.OffNetworkFriendRequest else nil,
				supportedActions = GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User),
				excludeContextualActions = if p1 and p1.isSelfView then true else nil
			}
		}
		table.insert(List, { component = EnumsModule.Components.ProfileBackground })
	end
	if FFlagProfilePlatformEnableFavoriteExperiencesModule and (not FFlagProfilePlatformEnableVRModule or p1 and p1.areWebViewsSupported) then
		table.insert(List, { component = EnumsModule.Components.FavoriteExperiences })
	end
	if FFlagProfilePlatformEnableInventory and (not FFlagProfilePlatformEnableVRModule or p1 and p1.areWebViewsSupported) then
		table.insert(List, { component = EnumsModule.Components.Inventory })
	end
	if FFlagProfilePlatformEnableStore and (not FFlagProfilePlatformEnableVRModule or p1 and p1.areWebViewsSupported) then
		table.insert(List, { component = EnumsModule.Components.Store })
	end
	if FFlagExperiencesOnProfile then
		table.insert(List, { component = EnumsModule.Components.Experiences })
	end
	if FFlagEnableProfileCompletion then
		table.insert(List, { component = EnumsModule.Components.ProfileCompletion })
	end
	if FFlagProfilePlatformAddCurrentlyPlayingModule then
		table.insert(List, { component = EnumsModule.Components.CurrentlyPlaying })
	end
	if FFlagProfilePlatformEnableMomentsModule then
		table.insert(List, { component = EnumsModule.Components.Moments })
	end
	return List
end