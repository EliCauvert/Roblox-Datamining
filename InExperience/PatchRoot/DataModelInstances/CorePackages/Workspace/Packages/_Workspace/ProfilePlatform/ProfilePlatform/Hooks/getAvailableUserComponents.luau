local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local socialCommonModule = require(parent.SocialCommon)
local cryoModule = require(parent.Cryo)
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local buildUserActionsComponentModule = require(profilePlatform.Hooks.buildUserActionsComponent)
local getSupportedActionsForProfileTypeModule = require(profilePlatform.Hooks.getSupportedActionsForProfileType)
local fFlagProfilePlatformEnableFavoriteExperiencesModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableFavoriteExperiences)
local fFlagProfilePlatformEnableInventory = require(parent.SharedFlags).FFlagProfilePlatformEnableInventory
local fFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformServiceModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformService)
local fFlagProfilePlatformEnableStore = require(parent.SharedFlags).FFlagProfilePlatformEnableStore
local fFlagProfilePlatformEnableVRModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableVR)
local fFlagExperiencesOnProfile = require(parent.SharedFlags).FFlagExperiencesOnProfile
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local fFlagProfilePlatformEnableMomentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagEnableProfileCompletion = require(parent.SharedFlags).FFlagEnableProfileCompletion
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local t = {
	[socialCommonModule.Enums.ContextualInfoTypes.MutualFriends] = enumsModule.ContextualTypes.MutualFriends,
	[socialCommonModule.Enums.ContextualInfoTypes.Frequents] = enumsModule.ContextualTypes.PlayedTogether
}

return function(p0, p1)
	-- upvalues: fFlagProfilePlatformEnableVRModule (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), buildUserActionsComponentModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), getSupportedActionsForProfileTypeModule (ref), enumsModule (ref), cryoModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref), socialCommonModule (ref), fFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformServiceModule (ref), t (ref), fFlagProfilePlatformEnableFavoriteExperiencesModule (ref), fFlagProfilePlatformEnableInventory (ref), fFlagProfilePlatformEnableStore (ref), fFlagExperiencesOnProfile (ref), fFlagEnableProfileCompletion (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), fFlagProfilePlatformEnableMomentsModule (ref)
	local list
	local _ = nil
	
	if fFlagProfilePlatformEnableVRModule then
		local _ = nil
		list = {
			{
				component = enumsModule.Components.UserProfileHeader,
				context = if fFlagProfilePlatformEnableSendPlayedTogetherContextToProfilePlatformServiceModule then t[p0] elseif p0 == socialCommonModule.Enums.ContextualInfoTypes.MutualFriends then enumsModule.ContextualTypes.MutualFriends else nil
			},
			{ component = enumsModule.Components.SocialLinks },
			{ component = enumsModule.Components.About },
			{ component = enumsModule.Components.CurrentlyWearing },
			if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then buildUserActionsComponentModule(p0, p1) else {
				component = enumsModule.Components.Actions,
				context = if p0 == socialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then enumsModule.ContextualTypes.OffNetworkFriendRequest else nil,
				supportedActions = cryoModule.List.filter(if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User) else cryoModule.Dictionary.values(enumsModule.ProfileActions), function(p2)
					-- upvalues: enumsModule (copy), p1 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
					return if p2 == enumsModule.ProfileActions.QrCode then p1 and p1.isProfileQrCodeEnabled elseif p2 == enumsModule.ProfileActions.EditProfile then p1 and p1.areWebViewsSupported elseif fFlagProfilePlatformEnableCurrencyTransfer and p2 == enumsModule.ProfileActions.CurrencyTransfer then p1 and p1.canRenderTransferInProfile elseif fFlagProfilePlatformEnableTradeItemsModule and p2 == enumsModule.ProfileActions.TradeItems then p1 and p1.areWebViewsSupported elseif p2 == enumsModule.ProfileActions.Chat then p1 and p1.canSeeChatTab ~= false else true
				end),
				excludeContextualActions = if fFlagProfilePlatformCTAsRefactorModule and p1 and p1.isSelfView then true else nil,
				isActionsV2Supported = if fFlagProfilePlatformCTAsRefactorModule then true else nil
			}
		}
		table.insert(list, { component = enumsModule.Components.ProfileBackground })
		
		if p1 and p1.areWebViewsSupported then
			table.insert(list, { component = enumsModule.Components.ViewFullProfile })
		end
	else
		local _ = nil
		list = {
			{
				component = enumsModule.Components.UserProfileHeader,
				context = if p0 == socialCommonModule.Enums.ContextualInfoTypes.MutualFriends then enumsModule.ContextualTypes.MutualFriends else nil
			},
			{ component = enumsModule.Components.SocialLinks },
			{ component = enumsModule.Components.About },
			{ component = enumsModule.Components.CurrentlyWearing },
			{ component = enumsModule.Components.ViewFullProfile },
			if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then buildUserActionsComponentModule(p0, p1) else {
				component = enumsModule.Components.Actions,
				context = if p0 == socialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then enumsModule.ContextualTypes.OffNetworkFriendRequest else nil,
				supportedActions = if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User) else nil,
				excludeContextualActions = if fFlagProfilePlatformCTAsRefactorModule and p1 and p1.isSelfView then true else nil,
				isActionsV2Supported = if fFlagProfilePlatformCTAsRefactorModule then true else nil
			}
		}
		table.insert(list, { component = enumsModule.Components.ProfileBackground })
	end
	if fFlagProfilePlatformEnableFavoriteExperiencesModule and (if fFlagProfilePlatformEnableVRModule then p1 and p1.areWebViewsSupported else true) then
		table.insert(list, { component = enumsModule.Components.FavoriteExperiences })
	end
	if fFlagProfilePlatformEnableInventory and (if fFlagProfilePlatformEnableVRModule then p1 and p1.areWebViewsSupported else true) then
		table.insert(list, { component = enumsModule.Components.Inventory })
	end
	if fFlagProfilePlatformEnableStore and (if fFlagProfilePlatformEnableVRModule then p1 and p1.areWebViewsSupported else true) then
		table.insert(list, { component = enumsModule.Components.Store })
	end
	if fFlagExperiencesOnProfile then
		table.insert(list, { component = enumsModule.Components.Experiences })
	end
	if fFlagEnableProfileCompletion then
		table.insert(list, { component = enumsModule.Components.ProfileCompletion })
	end
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		table.insert(list, { component = enumsModule.Components.CurrentlyPlaying })
	end
	if fFlagProfilePlatformEnableMomentsModule then
		table.insert(list, { component = enumsModule.Components.Moments })
	end
	return list
end