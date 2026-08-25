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
	getStringsFromErrorCodeAndRetryNum = function(p0, p1)
		-- upvalues: VPCErrorCodesEnum (ref), t (ref), VPCErrorCategoriesEnum (ref), vpcErrorCategoryToMessageStrings (ref)
		if p1 >= 4 then
			p0 = VPCErrorCodesEnum.SenderFlooded
		end
		local var4 = t[p0]
		
		if var4 == nil then
			var4 = VPCErrorCategoriesEnum.GenericError
		end
		return vpcErrorCategoryToMessageStrings[var4]
	end,
	getRetryBehaviorFromErrorCodeAndRetryNum = function(p2, p3)
		-- upvalues: VPCErrorCodesEnum (ref), t (ref), VPCErrorCategoriesEnum (ref), t_1 (ref)
		if p3 >= 4 then
			p2 = VPCErrorCodesEnum.SenderFlooded
		end
		local var5 = t[p2]
		
		if var5 == nil then
			var5 = VPCErrorCategoriesEnum.GenericError
		end
		return t_1[var5]
	end,
	VPCErrorCategoriesEnum = VPCErrorCategoriesEnum,
	VPCRetryBehaviorEnum = VPCRetryBehaviorEnum
}