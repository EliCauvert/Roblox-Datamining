local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local enumsModule = require(script.Parent.Enums)
local VPCErrorCategoriesEnum = enumsModule.VPCErrorCategoriesEnum
local VPCRetryBehaviorEnum = enumsModule.VPCRetryBehaviorEnum
local VPCErrorCodesEnum = enumsModule.VPCErrorCodesEnum
local vpcErrorCategoryToMessageStrings = require(ampUpsell.Common.LocalizationStrings).vpcErrorCategoryToMessageStrings
local t = {
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
local t_1 = {
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
	getStringsFromErrorCodeAndRetryNum = function(p1, p2)
		-- upvalues: VPCErrorCodesEnum (ref), t (ref), VPCErrorCategoriesEnum (ref), vpcErrorCategoryToMessageStrings (ref)
		if p2 >= 4 then
			p1 = VPCErrorCodesEnum.SenderFlooded
		end
		local var1 = t[p1]
		
		if var1 == nil then
			var1 = VPCErrorCategoriesEnum.GenericError
		end
		return vpcErrorCategoryToMessageStrings[var1]
	end,
	getRetryBehaviorFromErrorCodeAndRetryNum = function(p1, p2)
		-- upvalues: VPCErrorCodesEnum (ref), t (ref), VPCErrorCategoriesEnum (ref), t_1 (ref)
		if p2 >= 4 then
			p1 = VPCErrorCodesEnum.SenderFlooded
		end
		local var1 = t[p1]
		
		if var1 == nil then
			var1 = VPCErrorCategoriesEnum.GenericError
		end
		return t_1[var1]
	end,
	VPCErrorCategoriesEnum = VPCErrorCategoriesEnum,
	VPCRetryBehaviorEnum = VPCRetryBehaviorEnum
}