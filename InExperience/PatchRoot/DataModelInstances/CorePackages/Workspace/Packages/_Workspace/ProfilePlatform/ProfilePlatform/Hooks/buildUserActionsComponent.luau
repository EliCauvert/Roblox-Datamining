local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local socialCommonModule = require(parent.SocialCommon)
local cryoModule = require(parent.Cryo)
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local getSupportedActionsForProfileTypeModule = require(profilePlatform.Hooks.getSupportedActionsForProfileType)
local fFlagProfilePlatformEnableVRModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableVR)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)

local function _(p1)
	-- upvalues: getSupportedActionsForProfileTypeModule (ref), enumsModule (ref), cryoModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref)
	return cryoModule.List.filter(getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User), function(p2)
		-- upvalues: enumsModule (copy), p1 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
		return if p2 == enumsModule.ProfileActions.QrCode then p1 and p1.isProfileQrCodeEnabled elseif p2 == enumsModule.ProfileActions.EditProfile then p1 and p1.areWebViewsSupported elseif fFlagProfilePlatformEnableCurrencyTransfer and p2 == enumsModule.ProfileActions.CurrencyTransfer then p1 and p1.canRenderTransferInProfile elseif fFlagProfilePlatformEnableTradeItemsModule and p2 == enumsModule.ProfileActions.TradeItems then p1 and p1.areWebViewsSupported elseif p2 == enumsModule.ProfileActions.Chat then p1 and p1.canSeeChatTab ~= false else true
	end)
end

return function(p1, p2)
	-- upvalues: socialCommonModule (ref), enumsModule (ref), fFlagProfilePlatformEnableVRModule (ref), getSupportedActionsForProfileTypeModule (ref), cryoModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref)
	local var1 = if p1 == socialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then enumsModule.ContextualTypes.OffNetworkFriendRequest else nil
	local var2 = if p2 and p2.isSelfView then true else nil
	
	return if fFlagProfilePlatformEnableVRModule then {
		isActionsV2Supported = true,
		component = enumsModule.Components.Actions,
		context = var1,
		supportedActions = cryoModule.List.filter(getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User), function(p3)
			-- upvalues: enumsModule (copy), p2 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
			return if p3 == enumsModule.ProfileActions.QrCode then p2 and p2.isProfileQrCodeEnabled elseif p3 == enumsModule.ProfileActions.EditProfile then p2 and p2.areWebViewsSupported elseif fFlagProfilePlatformEnableCurrencyTransfer and p3 == enumsModule.ProfileActions.CurrencyTransfer then p2 and p2.canRenderTransferInProfile elseif fFlagProfilePlatformEnableTradeItemsModule and p3 == enumsModule.ProfileActions.TradeItems then p2 and p2.areWebViewsSupported elseif p3 == enumsModule.ProfileActions.Chat then p2 and p2.canSeeChatTab ~= false else true
		end),
		excludeContextualActions = var2
	} else {
		isActionsV2Supported = true,
		component = enumsModule.Components.Actions,
		context = var1,
		supportedActions = getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User),
		excludeContextualActions = var2
	}
end