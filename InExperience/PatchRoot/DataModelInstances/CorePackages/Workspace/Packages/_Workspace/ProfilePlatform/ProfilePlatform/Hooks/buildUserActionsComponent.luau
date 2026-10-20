local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SocialCommonModule = require(Parent.SocialCommon)
local CryoModule = require(Parent.Cryo)
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)
local FFlagProfilePlatformEnableVRModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableTradeItemsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)

local function _(p1)
	-- upvalues: GetSupportedActionsForProfileTypeModule (copy), EnumsModule (copy), CryoModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformEnableTradeItemsModule (copy)
	return CryoModule.List.filter(GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User), function(Chat): boolean
		-- upvalues: EnumsModule (upval), p1 (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), FFlagProfilePlatformEnableTradeItemsModule (upval)
		return if Chat == EnumsModule.ProfileActions.QrCode then if p1 and p1.isProfileQrCodeEnabled then true else false elseif Chat == EnumsModule.ProfileActions.EditProfile then if p1 and p1.areWebViewsSupported then true else false elseif FFlagProfilePlatformEnableCurrencyTransfer and Chat == EnumsModule.ProfileActions.CurrencyTransfer then if p1 and p1.canRenderTransferInProfile then true else false elseif FFlagProfilePlatformEnableTradeItemsModule and Chat == EnumsModule.ProfileActions.TradeItems then if p1 and p1.areWebViewsSupported then true else false else Chat ~= EnumsModule.ProfileActions.Chat or (p1 and p1.canSeeChatTab ~= false or false)
	end)
end

return function(OffNetworkFriendRequest, p1)
	-- upvalues: SocialCommonModule (copy), EnumsModule (copy), FFlagProfilePlatformEnableVRModule (copy), GetSupportedActionsForProfileTypeModule (copy), CryoModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformEnableTradeItemsModule (copy)
	local OffNetworkFriendRequest1 = if OffNetworkFriendRequest == SocialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then EnumsModule.ContextualTypes.OffNetworkFriendRequest else nil
	local ExcludeContextualActions = if p1 and p1.isSelfView then true else nil
	
	return if FFlagProfilePlatformEnableVRModule then {
		isActionsV2Supported = true,
		component = EnumsModule.Components.Actions,
		context = OffNetworkFriendRequest1,
		supportedActions = CryoModule.List.filter(GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User), function(Chat): boolean
			-- upvalues: EnumsModule (upval), p1 (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), FFlagProfilePlatformEnableTradeItemsModule (upval)
			return if Chat == EnumsModule.ProfileActions.QrCode then if p1 and p1.isProfileQrCodeEnabled then true else false elseif Chat == EnumsModule.ProfileActions.EditProfile then if p1 and p1.areWebViewsSupported then true else false elseif FFlagProfilePlatformEnableCurrencyTransfer and Chat == EnumsModule.ProfileActions.CurrencyTransfer then if p1 and p1.canRenderTransferInProfile then true else false elseif FFlagProfilePlatformEnableTradeItemsModule and Chat == EnumsModule.ProfileActions.TradeItems then if p1 and p1.areWebViewsSupported then true else false else Chat ~= EnumsModule.ProfileActions.Chat or (p1 and p1.canSeeChatTab ~= false or false)
		end),
		excludeContextualActions = ExcludeContextualActions
	} else {
		isActionsV2Supported = true,
		component = EnumsModule.Components.Actions,
		context = OffNetworkFriendRequest1,
		supportedActions = GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.User),
		excludeContextualActions = ExcludeContextualActions
	}
end