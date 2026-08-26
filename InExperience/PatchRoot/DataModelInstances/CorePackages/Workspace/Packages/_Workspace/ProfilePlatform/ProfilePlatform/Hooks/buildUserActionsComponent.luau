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
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

local function filterSupportedActions(p1)
	-- upvalues: fFlagProfilePlatformCTAsRefactorModule (ref), getSupportedActionsForProfileTypeModule (ref), enumsModule (ref), cryoModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref)
	return cryoModule.List.filter(if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User) else cryoModule.Dictionary.values(enumsModule.ProfileActions), function(p2)
		-- upvalues: enumsModule (copy), p1 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
		return if p2 == enumsModule.ProfileActions.QrCode then p1 and p1.isProfileQrCodeEnabled elseif p2 == enumsModule.ProfileActions.EditProfile then p1 and p1.areWebViewsSupported elseif fFlagProfilePlatformEnableCurrencyTransfer and p2 == enumsModule.ProfileActions.CurrencyTransfer then p1 and p1.canRenderTransferInProfile elseif fFlagProfilePlatformEnableTradeItemsModule and p2 == enumsModule.ProfileActions.TradeItems then p1 and p1.areWebViewsSupported elseif p2 == enumsModule.ProfileActions.Chat then p1 and p1.canSeeChatTab ~= false else true
	end)
end

return function(p1, p2)
	-- upvalues: socialCommonModule (ref), enumsModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), fFlagProfilePlatformEnableVRModule (ref), filterSupportedActions (ref), getSupportedActionsForProfileTypeModule (ref)
	local var1 = if p1 == socialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then enumsModule.ContextualTypes.OffNetworkFriendRequest else nil
	local var2 = if fFlagProfilePlatformCTAsRefactorModule and p2 and p2.isSelfView then true else nil
	local var3 = if fFlagProfilePlatformCTAsRefactorModule then true else nil
	
	return if fFlagProfilePlatformEnableVRModule then {
		component = enumsModule.Components.Actions,
		context = var1,
		supportedActions = filterSupportedActions(p2),
		excludeContextualActions = var2,
		isActionsV2Supported = var3
	} else {
		component = enumsModule.Components.Actions,
		context = var1,
		supportedActions = if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User) else nil,
		excludeContextualActions = var2,
		isActionsV2Supported = var3
	}
end