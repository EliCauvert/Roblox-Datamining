local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SocialCommonModule = require(Parent.SocialCommon)
local CryoModule = require(Parent.Cryo)
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)
local FFlagProfilePlatformEnableVRModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local FFlagProfilePlatformFilterChatActionByPolicyModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

local function filterSupportedActions(p1)
	-- upvalues: FFlagProfilePlatformCTAsRefactorModule (copy), GetSupportedActionsForProfileTypeModule (copy), EnumsModule (copy), CryoModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformFilterChatActionByPolicyModule (copy)
	return CryoModule.List.filter(if FFlagProfilePlatformCTAsRefactorModule then GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User) else CryoModule.Dictionary.values(EnumsModule.ProfileActions), function(Chat): boolean
		-- upvalues: EnumsModule (upval), p1 (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), FFlagProfilePlatformFilterChatActionByPolicyModule (upval)
		return if Chat == EnumsModule.ProfileActions.QrCode then if p1 and p1.isProfileQrCodeEnabled then true else false elseif Chat == EnumsModule.ProfileActions.EditProfile then if p1 and p1.areWebViewsSupported then true else false elseif FFlagProfilePlatformEnableCurrencyTransfer and Chat == EnumsModule.ProfileActions.CurrencyTransfer then if p1 and p1.canRenderTransferInProfile then true else false else not FFlagProfilePlatformFilterChatActionByPolicyModule or Chat ~= EnumsModule.ProfileActions.Chat or (p1 and p1.canSeeChatTab ~= false or false)
	end)
end

return function(OffNetworkFriendRequest, p1)
	-- upvalues: SocialCommonModule (copy), EnumsModule (copy), FFlagProfilePlatformCTAsRefactorModule (copy), FFlagProfilePlatformEnableVRModule (copy), filterSupportedActions (copy), GetSupportedActionsForProfileTypeModule (copy)
	local OffNetworkFriendRequest1 = if OffNetworkFriendRequest == SocialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then EnumsModule.ContextualTypes.OffNetworkFriendRequest else nil
	local ExcludeContextualActions = if FFlagProfilePlatformCTAsRefactorModule and p1 and p1.isSelfView then true else nil
	local IsActionsV2Supported = if FFlagProfilePlatformCTAsRefactorModule then true else nil
	
	return if FFlagProfilePlatformEnableVRModule then {
		component = EnumsModule.Components.Actions,
		context = OffNetworkFriendRequest1,
		supportedActions = filterSupportedActions(p1),
		excludeContextualActions = ExcludeContextualActions,
		isActionsV2Supported = IsActionsV2Supported
	} else {
		component = EnumsModule.Components.Actions,
		context = OffNetworkFriendRequest1,
		supportedActions = if FFlagProfilePlatformCTAsRefactorModule then GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User) else nil,
		excludeContextualActions = ExcludeContextualActions,
		isActionsV2Supported = IsActionsV2Supported
	}
end