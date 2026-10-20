local EnumsModule = require(script.Parent.Enums)
local VPCErrorCategoriesEnum = EnumsModule.VPCErrorCategoriesEnum
local VPCRetryBehaviorEnum = EnumsModule.VPCRetryBehaviorEnum
local VPCErrorCodesEnum = EnumsModule.VPCErrorCodesEnum
local VpcErrorCategoryToMessageStrings = require(script:FindFirstAncestor("AmpUpsell").Common.LocalizationStrings).vpcErrorCategoryToMessageStrings
local config = {
	[VPCErrorCodesEnum.InvalidEmailAddress] = VPCErrorCategoriesEnum.InvalidEmail,
	[VPCErrorCodesEnum.EmailNotUnique] = VPCErrorCategoriesEnum.InvalidEmail,
	[VPCErrorCodesEnum.LinkingIneligible] = VPCErrorCategoriesEnum.InvalidEmail,
	[VPCErrorCodesEnum.ParentAtLinkLimit] = VPCErrorCategoriesEnum.InvalidEmail,
	[VPCErrorCodesEnum.SenderFlooded] = VPCErrorCategoriesEnum.SenderFlooded,
	[VPCErrorCodesEnum.ReceiverFlooded] = VPCErrorCategoriesEnum.ReceiverFlooded,
	[VPCErrorCodesEnum.InvalidParameter] = VPCErrorCategoriesEnum.BadUserInput,
	[VPCErrorCodesEnum.UpdateUserSettingRequestInvalid] = VPCErrorCategoriesEnum.BadUserInput,
	[VPCErrorCodesEnum.AlreadyLinked] = VPCErrorCategoriesEnum.UserStateRecoursePathMismatch,
	[VPCErrorCodesEnum.ChildAtLinkLimit] = VPCErrorCategoriesEnum.UserStateRecoursePathMismatch,
	[VPCErrorCodesEnum.NoLinkedParents] = VPCErrorCategoriesEnum.UserStateRecoursePathMismatch,
	[VPCErrorCodesEnum.SenderFloodedRequestCreated] = VPCErrorCategoriesEnum.SenderFloodedRequestCreated,
	[VPCErrorCodesEnum.Unknown] = VPCErrorCategoriesEnum.InternalVPCError,
	[VPCErrorCodesEnum.ServiceUnavailable] = VPCErrorCategoriesEnum.InternalVPCError,
	[VPCErrorCodesEnum.IllegalState] = VPCErrorCategoriesEnum.InternalVPCError,
	[VPCErrorCodesEnum.InvalidUserID] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.ConsentAlreadyApplied] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.ConsentAlreadyRequestedConflictingData] = VPCErrorCategoriesEnum.ConflictingPendingConsent,
	[VPCErrorCodesEnum.ReceiverNotWhitelisted] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.InvalidComplianceFeature] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.ChildTooOld] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.UserForgotten] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.UnsupportedNotificationType] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.UnsupportedRequestType] = VPCErrorCategoriesEnum.GenericError,
	[VPCErrorCodesEnum.ChildIneligibleForConsent] = VPCErrorCategoriesEnum.GenericError
}
local config1 = {
	[VPCErrorCategoriesEnum.InternalVPCError] = VPCRetryBehaviorEnum.RetryVPC,
	[VPCErrorCategoriesEnum.InvalidEmail] = VPCRetryBehaviorEnum.RetryVPC,
	[VPCErrorCategoriesEnum.Flooded] = VPCRetryBehaviorEnum.NoRetry,
	[VPCErrorCategoriesEnum.SenderFlooded] = VPCRetryBehaviorEnum.NoRetry,
	[VPCErrorCategoriesEnum.ReceiverFlooded] = VPCRetryBehaviorEnum.NoRetry,
	[VPCErrorCategoriesEnum.BadUserInput] = VPCRetryBehaviorEnum.NoRetry,
	[VPCErrorCategoriesEnum.UserStateRecoursePathMismatch] = VPCRetryBehaviorEnum.RetryAMP,
	[VPCErrorCategoriesEnum.SenderFloodedRequestCreated] = VPCRetryBehaviorEnum.Success,
	[VPCErrorCategoriesEnum.GenericError] = VPCRetryBehaviorEnum.NoRetry,
	[VPCErrorCategoriesEnum.ConflictingPendingConsent] = VPCRetryBehaviorEnum.NoRetry
}

return {
	getStringsFromErrorCodeAndRetryNum = function(p1, p2: number)
		-- upvalues: VPCErrorCodesEnum (copy), config (copy), VPCErrorCategoriesEnum (copy), VpcErrorCategoryToMessageStrings (copy)
		if p2 >= 4 then
			p1 = VPCErrorCodesEnum.SenderFlooded
		end
		local Entry = config[p1]
		
		if Entry == nil then
			Entry = VPCErrorCategoriesEnum.GenericError
		end
		return VpcErrorCategoryToMessageStrings[Entry]
	end,
	getRetryBehaviorFromErrorCodeAndRetryNum = function(p1, p2: number)
		-- upvalues: VPCErrorCodesEnum (copy), config (copy), VPCErrorCategoriesEnum (copy), config1 (copy)
		if p2 >= 4 then
			p1 = VPCErrorCodesEnum.SenderFlooded
		end
		local Entry = config[p1]
		
		if Entry == nil then
			Entry = VPCErrorCategoriesEnum.GenericError
		end
		return config1[Entry]
	end,
	VPCErrorCategoriesEnum = VPCErrorCategoriesEnum,
	VPCRetryBehaviorEnum = VPCRetryBehaviorEnum
}