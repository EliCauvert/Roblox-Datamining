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

local function filterSupportedActions(p0) --[[ line: 24 ]]
	-- upvalues: fFlagProfilePlatformCTAsRefactorModule (ref), getSupportedActionsForProfileTypeModule (ref), enumsModule (ref), cryoModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref)
	return cryoModule.List.filter(if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User) else cryoModule.Dictionary.values(enumsModule.ProfileActions), function(p1) --[[ line: 29 ]]
		-- upvalues: enumsModule (copy), p0 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
		return if p1 == enumsModule.ProfileActions.QrCode then p0 and p0.isProfileQrCodeEnabled elseif p1 == enumsModule.ProfileActions.EditProfile then p0 and p0.areWebViewsSupported elseif fFlagProfilePlatformEnableCurrencyTransfer and p1 == enumsModule.ProfileActions.CurrencyTransfer then p0 and p0.canRenderTransferInProfile elseif fFlagProfilePlatformEnableTradeItemsModule and p1 == enumsModule.ProfileActions.TradeItems then p0 and p0.areWebViewsSupported elseif p1 == enumsModule.ProfileActions.Chat then p0 and p0.canSeeChatTab ~= false else true
	end)
end

return function(p2, p3) --[[ line: 55 | named "buildUserActionsComponent" ]]
	-- upvalues: socialCommonModule (ref), enumsModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), fFlagProfilePlatformEnableVRModule (ref), filterSupportedActions (ref), getSupportedActionsForProfileTypeModule (ref)
	local var9 = if p2 == socialCommonModule.Enums.ContextualInfoTypes.OffNetworkFriendRequest then enumsModule.ContextualTypes.OffNetworkFriendRequest else nil
	local var10 = if fFlagProfilePlatformCTAsRefactorModule and p3 and p3.isSelfView then true else nil
	local var11 = if fFlagProfilePlatformCTAsRefactorModule then true else nil
	
	return if fFlagProfilePlatformEnableVRModule then {
		component = enumsModule.Components.Actions,
		context = var9,
		supportedActions = filterSupportedActions(p3),
		excludeContextualActions = var10,
		isActionsV2Supported = var11
	} else {
		component = enumsModule.Components.Actions,
		context = var9,
		supportedActions = if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.User) else nil,
		excludeContextualActions = var10,
		isActionsV2Supported = var11
	}
end