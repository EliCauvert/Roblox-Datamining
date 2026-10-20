local IAPExperience = script:FindFirstAncestor("IAPExperience")
local EconomicRestrictionsViolationTypeModule = require(IAPExperience.Enums.EconomicRestrictionsViolationType)
local LoggerModule = require(IAPExperience.Utility.logger)

return function(p1, ViolationType)
	-- upvalues: EconomicRestrictionsViolationTypeModule (copy), LoggerModule (copy)
	if ViolationType == EconomicRestrictionsViolationTypeModule.Chargeback then
		return p1.chargebackViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.AbuseOfAffiliateSystem then
		return p1.fraudAbuseOfAffiliateSystemViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.AttemptedUnauthorizedPaymentMethodUse then
		return p1.fraudAttemptedUnauthorizedPaymentMethodUseViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.PaymentAuthorizationAttempt then
		return p1.fraudPaymentAbuseViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.RepeatedRefundRequests then
		return p1.fraudRepeatedRefundRequestsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.SuspiciousAccountPatterns then
		return p1.fraudSuspiciousAccountPatternsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.SuspiciousRefundRequests then
		return p1.fraudSuspiciousRefundRequestsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.UnauthorizedPurchase then
		return p1.fraudUnauthorizedPurchaseViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.UseOfUnauthorizedOffPlatformTransactions then
		return p1.fraudUseOfUnauthorizedOffPlatformTransactionsViolationLabel
	elseif ViolationType == EconomicRestrictionsViolationTypeModule.VirtualEconomyAbuse then
		return p1.fraudVirtualEconomyAbuseViolationLabel
	else
		LoggerModule.error({
			message = "Invalid violation type",
			violationType = ViolationType
		})
		
		return ""
	end
end